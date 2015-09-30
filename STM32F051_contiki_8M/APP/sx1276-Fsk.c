/*
 * THE FOLLOWING FIRMWARE IS PROVIDED: (1) "AS IS" WITH NO WARRANTY; AND 
 * (2)TO ENABLE ACCESS TO CODING INFORMATION TO GUIDE AND FACILITATE CUSTOMER.
 * CONSEQUENTLY, SEMTECH SHALL NOT BE HELD LIABLE FOR ANY DIRECT, INDIRECT OR
 * CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT
 * OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION
 * CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
 * 
 * Copyright (C) SEMTECH S.A.
 */
/*! 
 * \file       sx1276.c
 * \brief      SX1276 RF chip driver
 *
 * \version    2.0.0 
 * \date       May 6 2013
 * \author     Gregory Cristian
 *
 * Last modified by Miguel Luis on Jun 19 2013
 */
#ifndef USE_LORA_MODE

#include <string.h>
#include <math.h>

#include "hal_radio.h"
#include "sx1276-Fsk.h"
#include "sx1276-FskMisc.h"
#include  "hal_led.h"

// Default settings
tFskSettings FskSettings = 
{
    492000000,      // RFFrequency
    10000,          // Bitrate
    20000,          // Fdev
    14,             // Power
    40000,          // RxBw
    150000,         // RxBwAfc
    true,           // CrcOn
    true,           // AfcOn    
    255             // PayloadLength (set payload size to the maximum for variable mode, else set the exact payload length)
};

extern struct etimer timer_rf; 

sRF_FSK g_fsk = {
                    .states = RF_STATE_IDLE,
                    .index  = 0,
                    .packetLenth = 0,
                    .rssi = 0.0,
                };

void SX1276Fsk_recrive_Packet(void);

/*!
 * SX1276 FSK registers variable
 */
tSX1276* SX1276;

extern uint8_t SX1276Regs[];

/*!
 * Local RF buffer for communication support
 */
static uint8_t RFBuffer[RF_BUFFER_SIZE];

/*!
 * Chunk size of data write in buffer 
 */
static uint8_t DataChunkSize = 32;


/*!
 * RF state machine variable
 */
static uint8_t RFState = RF_STATE_IDLE;

/*!
 * Rx management support variables
 */

/*!
 * PacketTimeout holds the RF packet timeout
 * SyncSize = [0..8]
 * VariableSize = [0;1]
 * AddressSize = [0;1]
 * PayloadSize = [0..RF_BUFFER_SIZE]
 * CrcSize = [0;2]
 * PacketTimeout = ( ( 8 * ( VariableSize + AddressSize + PayloadSize + CrcSize ) / BR ) * 1000.0 ) + 1
 * Computed timeout is in miliseconds
 */
static uint32_t PacketTimeout;

/*!
 * Preamble2SyncTimeout
 * Preamble2SyncTimeout = ( ( 8 * ( PremableSize + SyncSize ) / RFBitrate ) * 1000.0 ) + 1
 * Computed timeout is in miliseconds
 */
static uint32_t Preamble2SyncTimeout;

static bool PreambleDetected = false;
static bool SyncWordDetected = false;
static bool PacketDetected = false;
static uint16_t RxPacketSize = 0;
static uint8_t RxBytesRead = 0;
static uint8_t TxBytesSent = 0;
static double RxPacketRssiValue;
static uint32_t RxPacketAfcValue;
static uint8_t RxGain = 1;
static uint32_t RxTimeoutTimer = 0;
static uint32_t Preamble2SyncTimer = 0;


 //static bool firstReceiveByte = true;

/*!
 * Tx management support variables
 */
static uint16_t TxPacketSize = 0;
static uint32_t TxTimeoutTimer = 0;


void SX1276FskInit( void )
{
    //RFState = RF_STATE_IDLE;

    SX1276FskSetDefaults( );
    
    SX1276ReadBuffer( REG_OPMODE, SX1276Regs + 1, 0x70 - 1 );

    // Set the device in FSK mode and Sleep Mode
    SX1276->RegOpMode = RF_OPMODE_MODULATIONTYPE_FSK | RF_OPMODE_SLEEP;
    SX1276Write( REG_OPMODE, SX1276->RegOpMode );

    SX1276->RegPaRamp = RF_PARAMP_MODULATIONSHAPING_01;
    SX1276Write( REG_PARAMP, SX1276->RegPaRamp );

    SX1276->RegLna = RF_LNA_GAIN_G1;
    SX1276Write( REG_LNA, SX1276->RegLna );

    if( FskSettings.AfcOn == true )
    {
        SX1276->RegRxConfig = RF_RXCONFIG_RESTARTRXONCOLLISION_OFF | RF_RXCONFIG_AFCAUTO_ON |
                              RF_RXCONFIG_AGCAUTO_ON | RF_RXCONFIG_RXTRIGER_PREAMBLEDETECT;
    }
    else
    {
        SX1276->RegRxConfig = RF_RXCONFIG_RESTARTRXONCOLLISION_OFF | RF_RXCONFIG_AFCAUTO_OFF |
                              RF_RXCONFIG_AGCAUTO_ON | RF_RXCONFIG_RXTRIGER_PREAMBLEDETECT;
    }

    SX1276->RegPreambleLsb = 30;
    
    SX1276->RegPreambleDetect = RF_PREAMBLEDETECT_DETECTOR_ON | RF_PREAMBLEDETECT_DETECTORSIZE_3 |
                              RF_PREAMBLEDETECT_DETECTORTOL_10;
    
    SX1276->RegRssiThresh = 0xFF;

    SX1276->RegSyncConfig = RF_SYNCCONFIG_AUTORESTARTRXMODE_OFF | RF_SYNCCONFIG_PREAMBLEPOLARITY_AA |
                            RF_SYNCCONFIG_SYNC_ON |
                            RF_SYNCCONFIG_SYNCSIZE_4;

    SX1276->RegSyncValue1 = 0x69;
    SX1276->RegSyncValue2 = 0x81;
    SX1276->RegSyncValue3 = 0x7E;
    SX1276->RegSyncValue4 = 0x96;

    SX1276->RegPacketConfig1 = RF_PACKETCONFIG1_PACKETFORMAT_VARIABLE | RF_PACKETCONFIG1_DCFREE_OFF |
                               ( FskSettings.CrcOn << 4 ) | RF_PACKETCONFIG1_CRCAUTOCLEAR_OFF |
                               RF_PACKETCONFIG1_ADDRSFILTERING_OFF | RF_PACKETCONFIG1_CRCWHITENINGTYPE_CCITT;
    SX1276FskGetPacketCrcOn( ); // Update CrcOn on FskSettings

    SX1276->RegPayloadLength = FskSettings.PayloadLength;

    // we can now update the registers with our configuration
    SX1276WriteBuffer( REG_OPMODE, SX1276Regs + 1, 0x70 - 1 );

    // then we need to set the RF settings 
    SX1276FskSetRFFrequency( FskSettings.RFFrequency );
    SX1276FskSetBitrate( FskSettings.Bitrate );
    SX1276FskSetFdev( FskSettings.Fdev );

    SX1276FskSetDccBw( &SX1276->RegRxBw, 0, FskSettings.RxBw );
    SX1276FskSetDccBw( &SX1276->RegAfcBw, 0, FskSettings.RxBwAfc );
    SX1276FskSetRssiOffset( 0 );
    
    SX1276FskSetPAOutput( RF_PACONFIG_PASELECT_RFO );
    SX1276FskSetPa20dBm( false );
    SX1276FskSetRFPower( FskSettings.Power );


    SX1276FskSetOpMode( RF_OPMODE_STANDBY );

    // Calibrate the HF
    SX1276FskRxCalibrate( );
    
    g_fsk.sync_timeout = (u16)(8*8*1000/FskSettings.Bitrate) + 5;
    g_fsk.plyloadtimeout = (u16)(255*2*8*1000/FskSettings.Bitrate) + 5;
    
    SX1276Fsk_recrive_Packet();
    
}

void SX1276FskSetDefaults( void )
{
    // REMARK: See SX1276 datasheet for modified default values.

    SX1276Read( REG_VERSION, &SX1276->RegVersion );
}

void SX1276FskSetOpMode( uint8_t opMode )
{
    static uint8_t opModePrev = RF_OPMODE_STANDBY;
    static bool antennaSwitchTxOnPrev = true;
    bool antennaSwitchTxOn = false;

    opModePrev = SX1276->RegOpMode & ~RF_OPMODE_MASK;

    if( opMode != opModePrev )
    {
        if( opMode == RF_OPMODE_TRANSMITTER )
        {
            antennaSwitchTxOn = true;
        }
        else
        {
            antennaSwitchTxOn = false;
        }
        if( antennaSwitchTxOn != antennaSwitchTxOnPrev )
        {
            antennaSwitchTxOnPrev = antennaSwitchTxOn;
            //RXTX( antennaSwitchTxOn ); // Antenna switch control
        }
        SX1276->RegOpMode = ( SX1276->RegOpMode & RF_OPMODE_MASK ) | opMode;
   
        SX1276Write( REG_OPMODE, SX1276->RegOpMode );        
    }
}

uint8_t SX1276FskGetOpMode( void )
{
    SX1276Read( REG_OPMODE, &SX1276->RegOpMode );
    
    return SX1276->RegOpMode & ~RF_OPMODE_MASK;
}

int32_t SX1276FskReadFei( void )
{
    SX1276ReadBuffer( REG_FEIMSB, &SX1276->RegFeiMsb, 2 );                          // Reads the FEI value

    return ( int32_t )(( double )( ( ( uint16_t )SX1276->RegFeiMsb << 8 ) | ( uint16_t )SX1276->RegFeiLsb ) * ( double )FREQ_STEP);
}

int32_t SX1276FskReadAfc( void )
{
    SX1276ReadBuffer( REG_AFCMSB, &SX1276->RegAfcMsb, 2 );                            // Reads the AFC value
    return ( int32_t )(( double )( ( ( uint16_t )SX1276->RegAfcMsb << 8 ) | ( uint16_t )SX1276->RegAfcLsb ) * ( double )FREQ_STEP);
}

uint8_t SX1276FskReadRxGain( void )
{
    SX1276Read( REG_LNA, &SX1276->RegLna );
    return( SX1276->RegLna >> 5 ) & 0x07;
}

double SX1276FskReadRssi( void )
{
    SX1276Read( REG_RSSIVALUE, &SX1276->RegRssiValue );                               // Reads the RSSI value

    return -( double )( ( double )SX1276->RegRssiValue / 2.0 );
}

uint8_t SX1276FskGetPacketRxGain( void )
{
    return RxGain;
}

double SX1276FskGetPacketRssi( void )
{
    return RxPacketRssiValue;
}

uint32_t SX1276FskGetPacketAfc( void )
{
    return RxPacketAfcValue;
}

void SX1276FskStartRx( void )
{
    SX1276FskSetRFState( RF_STATE_RX_INIT );
}

void SX1276FskGetRxPacket( void *buffer, uint16_t *size )
{
    *size = RxPacketSize;
    RxPacketSize = 0;
    memcpy( ( void * )buffer, ( void * )RFBuffer, ( size_t )*size );
}

void SX1276FskSetTxPacket( const void *buffer, uint16_t size )
{
    TxPacketSize = size;
    memcpy( ( void * )RFBuffer, buffer, ( size_t )TxPacketSize ); 

    RFState = RF_STATE_TX_INIT;
}

// Remark: SX1276 must be fully initialized before calling this function
uint16_t SX1276FskGetPacketPayloadSize( void )
{
    uint16_t syncSize;
    uint16_t variableSize;
    uint16_t addressSize;
    uint16_t payloadSize;
    uint16_t crcSize;

    syncSize = ( SX1276->RegSyncConfig & 0x07 ) + 1;
    variableSize = ( ( SX1276->RegPacketConfig1 & 0x80 ) == 0x80 ) ? 1 : 0;
    addressSize = ( ( SX1276->RegPacketConfig1 & 0x06 ) != 0x00 ) ? 1 : 0;
    payloadSize = SX1276->RegPayloadLength;
    crcSize = ( ( SX1276->RegPacketConfig1 & 0x10 ) == 0x10 ) ? 2 : 0;
    
    return syncSize + variableSize + addressSize + payloadSize + crcSize;
}

// Remark: SX1276 must be fully initialized before calling this function
uint16_t SX1276FskGetPacketHeaderSize( void )
{
    uint16_t preambleSize;
    uint16_t syncSize;

    preambleSize = ( ( uint16_t )SX1276->RegPreambleMsb << 8 ) | ( uint16_t )SX1276->RegPreambleLsb;
    syncSize = ( SX1276->RegSyncConfig & 0x07 ) + 1;
    
    return preambleSize + syncSize;
}

uint8_t SX1276FskGetRFState( void )
{
    return RFState;
}

void SX1276FskSetRFState( uint8_t state )
{
    RFState = state;
}



void start_continuous_mode(void)
{
  //4、BitSyncOn 
  //5、continuous mode
  //6、RX
  u8 RegDioMapping[2]; 
  u8 temp;
  
  SX1276FskSetOpMode(RF_OPMODE_STANDBY); 
  
  hal_DIOx_ITConfig(all,DISABLE);

  RegDioMapping[0] = RF_DIOMAPPING1_DIO0_11 | RF_DIOMAPPING1_DIO1_00 | RF_DIOMAPPING1_DIO2_11 | RF_DIOMAPPING1_DIO3_10;
  RegDioMapping[1] = RF_DIOMAPPING2_DIO4_00 | RF_DIOMAPPING2_DIO5_11 | RF_DIOMAPPING2_MAP_PREAMBLEDETECT;
  SX1276WriteBuffer( REG_DIOMAPPING1, RegDioMapping, 2 );

  SX1276Read(REG_OOKPEAK, &temp);
  temp |= (0x20);
  SX1276Write(REG_OOKPEAK, temp);
  
  SX1276Read(REG_PACKETCONFIG2, &temp);
  temp &= (~0x40);
  SX1276Write(REG_PACKETCONFIG2, temp);
  
  SX1276FskSetOpMode(RF_OPMODE_RECEIVER);  
}

void packet_tx_data(u8 *PBuffer,u8 length)
{
  g_fsk.buffer[0] = length;
  
  memcpy( ( void * )(g_fsk.buffer+1), PBuffer, length);
  
  g_fsk.packetLenth = length + 1;
  
  g_fsk.index  = 0;
}

void fill_fifo(void)
{
  u8 sendLenth;
  
  u8 leftlength = g_fsk.packetLenth - g_fsk.index;
  
  if (g_fsk.index == 0)
  {
    if (leftlength <= 64)
    {
        SX1276WriteFifo(g_fsk.buffer, leftlength);
        g_fsk.index +=  leftlength;
        hal_fsk_eit_failing(1,DISABLE);
    }
    else
    {
        SX1276WriteFifo(g_fsk.buffer, 64);
        g_fsk.index +=  64;
    }
  }
  else if (g_fsk.index < g_fsk.packetLenth)
  {
    sendLenth = ( leftlength > (FIFO_LENGTH - TX_FIFO_THRESHOLD) ? (FIFO_LENGTH - TX_FIFO_THRESHOLD) : leftlength);
    SX1276WriteFifo(g_fsk.buffer+g_fsk.index, sendLenth);
    g_fsk.index += sendLenth;
  }
}

void contious_tx(void)
{
  SX1276FskSetOpMode( RF_OPMODE_TRANSMITTER );   
}


void read_fifo(bool rxdone)
{
  u8 leftlength;
  u8 receiveLenth;
  
  if (g_fsk.index == 0)
  {
    SX1276ReadFifo(&g_fsk.packetLenth , 1);
  }
  
  leftlength = g_fsk.packetLenth - g_fsk.index;
  
  if (rxdone)
  {
    if (leftlength <= FIFO_LENGTH)
    {
       hal_DIOx_ITConfig(all,DISABLE);
       SX1276ReadFifo(g_fsk.buffer+g_fsk.index, leftlength);
    }
  }
  else
  {
    if (g_fsk.index < (g_fsk.packetLenth -1) )
    {
      SX1276ReadFifo(g_fsk.buffer+g_fsk.index, RX_FIFO_THRESHOLD);
      g_fsk.index += RX_FIFO_THRESHOLD;
    }
    
    leftlength = g_fsk.packetLenth - g_fsk.index;
   
    if (leftlength <= FIFO_LENGTH)
    {
      hal_DIOx_ITConfig(1,DISABLE);
    }
  }
}



void SX1276Fsk_Send_Packet(u8 *PBuffer,u8 length)
{
    SX1276FskSetOpMode( RF_OPMODE_STANDBY ); 
    //                           PacketSent,               FifoLevel,              FifoFull,               TxReady
    SX1276->RegDioMapping1 = packet_DIO0_packetSend | packet_DIO1_fifoLevel | packet_DIO2_fifoFull | packet_DIO3_TxReady;
    //                           LowBat,                   Data
    SX1276->RegDioMapping2 = packet_DIO4_TimeOut | packet_DIO5_Data ;

    SX1276WriteBuffer( REG_DIOMAPPING1, &SX1276->RegDioMapping1, 2 );

    SX1276->RegFifoThresh = RF_FIFOTHRESH_TXSTARTCONDITION_FIFONOTEMPTY | TX_FIFO_THRESHOLD; // 24 bytes of data
    SX1276Write( REG_FIFOTHRESH, SX1276->RegFifoThresh );
    
    packet_tx_data(PBuffer, length);
    
    hal_DIOx_ITConfig(0,ENABLE);
    hal_fsk_eit_failing(1,ENABLE);
    
    fill_fifo();
  
    g_fsk.states = RF_STATE_TX_RUNNING;

    SX1276FskSetOpMode( RF_OPMODE_TRANSMITTER );   
}


void SX1276Fsk_recrive_Packet(void)
{
  SX1276FskSetOpMode( RF_OPMODE_STANDBY ); 
  
   hal_DIOx_ITConfig(all,DISABLE);
  
   SX1276->RegDioMapping1 = packet_DIO0_RxpayloadReady | packet_DIO1_fifoLevel | packet_DIO2_SyncAddress | packet_DIO3_fifoEmpty;
    //                           LowBat,                   Data
   SX1276->RegDioMapping2 = packet_DIO4_Rssi_PreambleDetect | packet_DIO5_Data | RF_DIOMAPPING2_MAP_PREAMBLEDETECT;
   
   SX1276WriteBuffer( REG_DIOMAPPING1, &SX1276->RegDioMapping1, 2 );
   
   SX1276->RegFifoThresh = RF_FIFOTHRESH_TXSTARTCONDITION_FIFONOTEMPTY | RX_FIFO_THRESHOLD; // 24 bytes of data
   SX1276Write( REG_FIFOTHRESH, SX1276->RegFifoThresh );
   
   EXTI_ClearITPendingBit(DIO4_IRQ);
   
   hal_DIOx_ITConfig(0,ENABLE);
   hal_DIOx_ITConfig(1,ENABLE);
   hal_DIOx_ITConfig(2,ENABLE);
   hal_DIOx_ITConfig(4,ENABLE);

   g_fsk.states = RF_STATE_RX_INIT;

   g_fsk.index  = 0; 
    
   //process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_fsk.states));
   SX1276FskSetOpMode( RF_OPMODE_RECEIVER );   
}


void EXTI4_15_IRQHandler(void)
{
  double  rssi;
  
    if(EXTI_GetITStatus(DIO3_IRQ) != RESET)
    {
       EXTI_ClearITPendingBit(DIO3_IRQ);
       hal_DIOx_ITConfig(all,DISABLE);
       SX1276FskSetOpMode( RF_OPMODE_STANDBY ); 
    } 
    
      //preamble detect
     if(EXTI_GetITStatus(DIO4_IRQ) != RESET)
     {
        EXTI_ClearITPendingBit(DIO4_IRQ);
        rssi = SX1276FskReadRssi();
        if(g_fsk.states == RF_STATE_RX_INIT)
        {
          hal_DIOx_ITConfig(4,DISABLE);
          etimer_remodify(&timer_rf, g_fsk.sync_timeout); //不执行这个的话，中断函数少点时间，执行的话，可快速判断超时
          printf("preamble det\r\n");
          g_fsk.states = RF_STATE_RX_PREAMBLE;
          process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_fsk.states));
        }
     }
    
    if(EXTI_GetITStatus(DIO2_IRQ) != RESET)
    { 
       EXTI_ClearITPendingBit(DIO2_IRQ);
       
      if(g_fsk.states == RF_STATE_TX_RUNNING)
      {
         hal_DIOx_ITConfig(all,DISABLE);
         SX1276FskSetOpMode( RF_OPMODE_STANDBY ); 
      }
       //sync detect
      if(g_fsk.states == RF_STATE_RX_PREAMBLE)
      {
         hal_DIOx_ITConfig(2,DISABLE);
         etimer_remodify(&timer_rf, g_fsk.plyloadtimeout);
         printf("sync det\r\n");
         g_fsk.states = RF_STATE_RX_SYNC;
         g_fsk.rssi = SX1276FskReadRssi( );
      }
    }
    
    if(EXTI_GetITStatus(DIO1_IRQ) != RESET)
    {
        EXTI_ClearITPendingBit(DIO1_IRQ);
        
        if(g_fsk.states == RF_STATE_TX_RUNNING)
        {
          fill_fifo();
        }
        
        if(g_fsk.states == RF_STATE_RX_SYNC)
        {
          read_fifo(false);
        }
    }
    
  
    if(EXTI_GetITStatus(DIO0_IRQ) != RESET)
    {
      EXTI_ClearITPendingBit(DIO0_IRQ);
      
      hal_DIOx_ITConfig(all,DISABLE);
      
      if(g_fsk.states == RF_STATE_TX_RUNNING)
      {
        SX1276FskSetOpMode( RF_OPMODE_STANDBY ); 
        hal_ToggleLED(0);
        g_fsk.states = RF_STATE_TX_DONE;
        process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_fsk.states));
       
      }
      
      if(g_fsk.states == RF_STATE_RX_SYNC) 
      {
        SX1276FskSetOpMode( RF_OPMODE_STANDBY ); 
        read_fifo(true);
        etimer_stop(&timer_rf);
        g_fsk.states = RF_STATE_RX_DONE;
        process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_fsk.states));
      }
    } 
}
#endif





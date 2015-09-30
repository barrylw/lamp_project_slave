#include "hal_fsk_sen.h"
#include "hal_radio.h"
#include "math.h"
//1、初始化
//2、配置DIO管脚
//3、配置PARamp
//4、BitSyncOn 
//5、continuous mode
//6、RX

#define DEFAULT_PREAMBLE_LEN                10

#if 0
typedef struct
{
  u8 longRangeMode : 1;
  u8 ModulationType : 2;
  u8 reserved : 1;
  u8 LowFrequencyModeOn : 1;
  u8 Mode : 3; 
}RegOpMode;


union RegOpMode
{
  RegOpMode regStruct;
  u8   regValue;
};
#endif

tFskSettings FskSettings = 
{
    492000000,       // RFFrequency
    10000,           // Bitrate
    20000,           // Fdev
    14,              // Power
    40000,           // RxBw
    150000,          // RxBwAfc
    true,            // CrcOn
    true,            // AfcOn    
    255              // PayloadLength (set payload size to the maximum for variable mode, else set the exact payload length)
};

static u8 RegRxBw  = 0x12;
static u8 RegAfcBw = 0x13;

sRF_FSK g_fsk = {
                    .states = RF_STATE_IDLE,
                    .index  = 0,
                    .packetLenth = 0,
                };

void SX1276FskSetRFFrequency( uint32_t freq )
{
    u8 tempFreq[3];
    FskSettings.RFFrequency = freq;

    freq = ( uint32_t )( ( double )freq / ( double )FREQ_STEP );
    tempFreq[0] = ( uint8_t )( ( freq >> 16 ) & 0xFF );
    tempFreq[1] = ( uint8_t )( ( freq >> 8 ) & 0xFF );
    tempFreq[2] = ( uint8_t )( freq & 0xFF );
    SX1276WriteBuffer( REG_FRFMSB, tempFreq, 3 );
}

void SX1276FskSetBitrate( uint32_t bitrate )
{
    uint8_t temp[2];
    FskSettings.Bitrate = bitrate;
    
    bitrate = ( uint16_t )( ( double )XTAL_FREQ / ( double )bitrate );
    temp[0]    = ( uint8_t )( bitrate >> 8 );
    temp[1]    = ( uint8_t )( bitrate & 0xFF );
    SX1276WriteBuffer( REG_BITRATEMSB, temp, 2 );    
}

void SX1276FskSetFdev( uint32_t fdev )
{
    uint8_t temp[2];
    
    FskSettings.Fdev = fdev;

    SX1276Read( REG_FDEVMSB, temp ); 

    fdev = ( uint16_t )( ( double )fdev / ( double )FREQ_STEP );
    temp[0]    = ( ( temp[0] & RF_FDEVMSB_FDEV_MASK ) | ( ( ( uint8_t )( fdev >> 8 ) ) & ~RF_FDEVMSB_FDEV_MASK ) );
    temp[1]    = ( uint8_t )( fdev & 0xFF );
    SX1276WriteBuffer( REG_FDEVMSB, temp, 2 );    
}

static void SX1276FskComputeRxBwMantExp( uint32_t rxBwValue, uint8_t* mantisse, uint8_t* exponent )
{
    uint8_t tmpExp = 0;
    uint8_t tmpMant = 0;

    double tmpRxBw = 0;
    double rxBwMin = 10e6;
    
    u8 temp;
    
    SX1276Read( REG_OPMODE, &temp );

    for( tmpExp = 0; tmpExp < 8; tmpExp++ )
    {
        for( tmpMant = 16; tmpMant <= 24; tmpMant += 4 )
        {
            if( ( temp & RF_OPMODE_MODULATIONTYPE_FSK ) == RF_OPMODE_MODULATIONTYPE_FSK )
            {
                tmpRxBw = ( double )XTAL_FREQ / ( tmpMant * ( double )pow( 2, tmpExp + 2 ) );
            }
            else
            {
                tmpRxBw = ( double )XTAL_FREQ / ( tmpMant * ( double )pow( 2, tmpExp + 3 ) );
            }
            if( fabs( tmpRxBw - rxBwValue ) < rxBwMin )
            {
                rxBwMin = fabs( tmpRxBw - rxBwValue );
                *mantisse = tmpMant;
                *exponent = tmpExp;
            }
        }
    }
}


void SX1276FskSetDccBw( uint8_t* reg, uint32_t dccValue, uint32_t rxBwValue )
{
    uint8_t mantisse = 0;
    uint8_t exponent = 0;
    
    if( *reg == REG_RXBW )
    {
        *reg = ( uint8_t )dccValue & 0x60;
    }
    else
    {
        *reg = 0;
    }

    SX1276FskComputeRxBwMantExp( rxBwValue, &mantisse, &exponent );

    switch( mantisse )
    {
        case 16:
            *reg |= ( uint8_t )( 0x00 | ( exponent & 0x07 ) );
            break;
        case 20:
            *reg |= ( uint8_t )( 0x08 | ( exponent & 0x07 ) );
            break;
        case 24:
            *reg |= ( uint8_t )( 0x10 | ( exponent & 0x07 ) );
            break;
        default:
            // Something went terribely wrong
            break;
    }

    if( *reg == REG_RXBW )
    {
        SX1276Write( REG_RXBW, *reg );
        FskSettings.RxBw = rxBwValue;
    }
    else
    {
        SX1276Write( REG_AFCBW, *reg );
        FskSettings.RxBwAfc = rxBwValue;
    }
}

void SX1276FskSetRssiOffset( int8_t offset )
{
    u8 temp;
    SX1276Read( REG_RSSICONFIG, &temp );
    if( offset < 0 )
    {
        offset = ( ~offset & 0x1F );
        offset += 1;
        offset = -offset;
    }
    temp |= ( uint8_t )( ( offset & 0x1F ) << 3 );
    SX1276Write( REG_RSSICONFIG, temp );
}

void SX1276FskSetPAOutput( uint8_t outputPin )
{
    u8 temp;
    SX1276Read( REG_PACONFIG, &temp );
    temp = (temp & RF_PACONFIG_PASELECT_MASK ) | outputPin;
    SX1276Write( REG_PACONFIG, temp );
}


void SX1276FskSetPa20dBm( bool enale )
{
    u8 tempRegPaDac;
    u8 tempRegPaConfig;
    
    SX1276Read( REG_PADAC, &tempRegPaDac);
    SX1276Read( REG_PACONFIG, &tempRegPaConfig );

    if( ( tempRegPaConfig & RF_PACONFIG_PASELECT_PABOOST ) == RF_PACONFIG_PASELECT_PABOOST )
    {    
        if( enale == true )
        {
            tempRegPaDac = 0x87;
        }
    }
    else
    {
        tempRegPaDac = 0x84;
    }
    SX1276Write( REG_PADAC, tempRegPaDac );
}

void SX1276FskSetRFPower( int8_t power )
{
    u8 tempRegPaDac;
    u8 tempRegPaConfig; 
    
    SX1276Read( REG_PACONFIG, &tempRegPaConfig );
    SX1276Read( REG_PADAC, &tempRegPaDac );
    
    if( ( tempRegPaConfig & RF_PACONFIG_PASELECT_PABOOST ) == RF_PACONFIG_PASELECT_PABOOST )
    {
        if( ( tempRegPaDac & 0x87 ) == 0x87 )
        {
            if( power < 5 )
            {
                power = 5;
            }
            if( power > 20 )
            {
                power = 20;
            }
            tempRegPaConfig = ( tempRegPaConfig & RF_PACONFIG_MAX_POWER_MASK ) | 0x70;
            tempRegPaConfig = ( tempRegPaConfig & RF_PACONFIG_OUTPUTPOWER_MASK ) | ( uint8_t )( ( uint16_t )( power - 5 ) & 0x0F );
        }
        else
        {
            if( power < 2 )
            {
                power = 2;
            }
            if( power > 17 )
            {
                power = 17;
            }
            tempRegPaConfig = ( tempRegPaConfig & RF_PACONFIG_MAX_POWER_MASK ) | 0x70;
            tempRegPaConfig = ( tempRegPaConfig & RF_PACONFIG_OUTPUTPOWER_MASK ) | ( uint8_t )( ( uint16_t )( power - 2 ) & 0x0F );
        }
    }
    else
    {
        if( power < -1 )
        {
            power = -1;
        }
        if( power > 14 )
        {
            power = 14;
        }
        tempRegPaConfig = ( tempRegPaConfig & RF_PACONFIG_MAX_POWER_MASK ) | 0x70;
        tempRegPaConfig = ( tempRegPaConfig & RF_PACONFIG_OUTPUTPOWER_MASK ) | ( uint8_t )( ( uint16_t )( power + 1 ) & 0x0F );
    }
    SX1276Write( REG_PACONFIG, tempRegPaConfig );
    FskSettings.Power = power;
}


void SX1276FskSetOpMode( u8 opMode )
{
    u8 tempValue = 0;

    tempValue = (tempValue | (1<<3) | opMode);
  
    SX1276Write( REG_OPMODE,tempValue);
}


void SX1276FskInit( void )
{
    u8 tempRegValue;
    
    /* set opration mode */
    tempRegValue = RF_OPMODE_MODULATIONTYPE_FSK | RF_OPMODE_SLEEP;
    SX1276Write( REG_OPMODE, tempRegValue );
  
    /* set  PA sharp */
    SX1276Read( REG_PARAMP, &tempRegValue );
    tempRegValue |= RF_PARAMP_MODULATIONSHAPING_10;
    SX1276Write( REG_PARAMP,  tempRegValue); 

    /* set  LNA gain */
    SX1276Write( REG_LNA, RF_LNA_GAIN_G1 );
    
    /* set Rx config  */
    SX1276Read( REG_RXCONFIG, &tempRegValue );
    if( FskSettings.AfcOn == true )
    {
        tempRegValue |= RF_RXCONFIG_RESTARTRXONCOLLISION_OFF | RF_RXCONFIG_AFCAUTO_ON |
                              RF_RXCONFIG_AGCAUTO_ON | RF_RXCONFIG_RXTRIGER_OFF;
    }
    else
    {
        tempRegValue |= RF_RXCONFIG_RESTARTRXONCOLLISION_OFF | RF_RXCONFIG_AFCAUTO_OFF |
                              RF_RXCONFIG_AGCAUTO_ON | RF_RXCONFIG_RXTRIGER_PREAMBLEDETECT;
    }
    SX1276Write( REG_RXCONFIG, tempRegValue );
    
    /* set preamble len */
    SX1276Write( REG_PREAMBLELSB , DEFAULT_PREAMBLE_LEN );
    
    /*  set preamble detect */
    SX1276Read( REG_PREAMBLEDETECT, &tempRegValue );
    tempRegValue |= RF_PREAMBLEDETECT_DETECTOR_ON | RF_PREAMBLEDETECT_DETECTORSIZE_2 |
                                RF_PREAMBLEDETECT_DETECTORTOL_10;
    SX1276Write( REG_PREAMBLEDETECT , tempRegValue );
    
    /*  set sync set */
    SX1276Read( REG_SYNCCONFIG, &tempRegValue );
    tempRegValue |= RF_SYNCCONFIG_AUTORESTARTRXMODE_WAITPLL_ON | RF_SYNCCONFIG_PREAMBLEPOLARITY_AA |
                            RF_SYNCCONFIG_SYNC_ON |
                            RF_SYNCCONFIG_SYNCSIZE_2;
    SX1276Write( REG_SYNCCONFIG , tempRegValue );
    
     /*  set sync word 1 */
    tempRegValue = 0x69;
    SX1276Write( REG_SYNCVALUE1 , tempRegValue );
    
     /*  set sync word 2 */
    tempRegValue = 0x81;
    SX1276Write( REG_SYNCVALUE2 , tempRegValue );
    
     /*  set  packetconfig1 */
    SX1276Read( REG_PACKETCONFIG1, &tempRegValue );
    tempRegValue |= RF_PACKETCONFIG1_PACKETFORMAT_VARIABLE | RF_PACKETCONFIG1_DCFREE_OFF |
                               ( FskSettings.CrcOn << 4 ) | RF_PACKETCONFIG1_CRCAUTOCLEAR_ON |
                               RF_PACKETCONFIG1_ADDRSFILTERING_OFF | RF_PACKETCONFIG1_CRCWHITENINGTYPE_CCITT;
    SX1276Write( REG_PACKETCONFIG1 , tempRegValue );
    
     /*  set  payloadLength */
    SX1276Write( REG_PAYLOADLENGTH , FskSettings.PayloadLength );
    
    // then we need to set the RF settings 
    SX1276FskSetRFFrequency( FskSettings.RFFrequency );
    SX1276FskSetBitrate( FskSettings.Bitrate );
    SX1276FskSetFdev( FskSettings.Fdev );

    SX1276FskSetDccBw( &RegRxBw, 0, FskSettings.RxBw );
    SX1276FskSetDccBw( &RegAfcBw, 0, FskSettings.RxBwAfc );
    SX1276FskSetRssiOffset( 0 );
    
    SX1276FskSetPAOutput( RF_PACONFIG_PASELECT_RFO );
    SX1276FskSetPa20dBm( false );
    SX1276FskSetRFPower( FskSettings.Power );
    SX1276FskSetOpMode( RF_OPMODE_STANDBY );
    
    
    
    // Calibrate the HF
    //SX1276FskRxCalibrate( );  /* 是否低频的时候可以不使用这个函数*/
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
  
  g_fsk.packetLenth = length;
}

void fill_fifo(void)
{
  u8 sendLenth;
  
  if (g_fsk.index <= g_fsk.packetLenth)
  {
    sendLenth = (g_fsk.packetLenth >= (FIFO_LENGTH - TX_FIFO_THRESHOLD) ? (FIFO_LENGTH - TX_FIFO_THRESHOLD) : g_fsk.packetLenth);
    SX1276WriteFifo(g_fsk.buffer+g_fsk.index, sendLenth);
    g_fsk.index += sendLenth;
  }
}

void SX1276Fsk_Send_Packet(u8 *PBuffer,u8 length)
{
      u8 RegDioMapping[2]; 
      
      SX1276FskSetOpMode( RF_OPMODE_STANDBY ); 
      
      hal_DIOx_ITConfig(all,DISABLE);
     
      //                           PacketSent,               FifoLevel,              FifoEmpty,               TxReady
      RegDioMapping[0] =   RF_DIOMAPPING1_DIO0_00 | RF_DIOMAPPING1_DIO1_00 | RF_DIOMAPPING1_DIO2_01 | RF_DIOMAPPING1_DIO3_01;
      //                           LowBat,                   Data
      RegDioMapping[1] =   RF_DIOMAPPING2_DIO4_00 | RF_DIOMAPPING2_DIO5_10;

      SX1276WriteBuffer( REG_DIOMAPPING1, RegDioMapping, 2 );
      
      SX1276Write( REG_FIFOTHRESH , RF_FIFOTHRESH_TXSTARTCONDITION_FIFONOTEMPTY | TX_FIFO_THRESHOLD );
      
      packet_tx_data(PBuffer,  length);
      
      fill_fifo();
      
      hal_DIOx_ITConfig(0,ENABLE);
      hal_DIOx_ITConfig(1,ENABLE);
      
      SX1276FskSetOpMode( RF_OPMODE_TRANSMITTER );     
}

void SX1276Fsk_Receive_Packet(void)
{
  u8 RegDioMapping[2]; 
  
  SX1276FskSetOpMode( RF_OPMODE_STANDBY ); 

  hal_DIOx_ITConfig(all,DISABLE);
  
  RegDioMapping[0] =   packet_DIO0_RxpayloadReady | packet_DIO1_fifoLevel | packet_DIO2_SyncAddress | packet_DIO3_fifoEmpty;
  RegDioMapping[1] =   packet_DIO4_Rssi_PreambleDetect | packet_DIO5_Data;
  
  SX1276WriteBuffer( REG_DIOMAPPING1, RegDioMapping, 2 );
  
  hal_DIOx_ITConfig(0,ENABLE);
  hal_DIOx_ITConfig(1,ENABLE);
  hal_DIOx_ITConfig(2,ENABLE);
  hal_DIOx_ITConfig(4,ENABLE);
  
  SX1276FskSetOpMode( RF_OPMODE_RECEIVER );  
  
  /* time out config is important */
  
  
}


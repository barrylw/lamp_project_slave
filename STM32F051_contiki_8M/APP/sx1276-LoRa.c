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
 * \file       sx1276-LoRa.c
 * \brief      SX1276 RF chip driver mode LoRa
 *
 * \version    2.0.0 
 * \date       May 6 2013
 * \author     Gregory Cristian
 *
 * Last modified by Miguel Luis on Jun 19 2013
 */
#include <string.h>
#include <math.h>
#include "radio.h"
#include "hal_radio.h"
#include "hal_uart.h"
#include "sx1276-Fsk.h"
#include "sx1276-LoRaMisc.h"
#include "sx1276-LoRa.h"
#include "hal_timer.h"
#include "etimer.h"
#include "gpio_per.h"

//#include "hal_fsk_sen.h"
/*!
 * Constant values need to compute the RSSI value
 */
#define RSSI_OFFSET_LF                              -164.0
#define RSSI_OFFSET_HF                              -157.0
               
/*!
 * Frequency hopping frequencies table
 */
#if defined (HIGH_FREQUENCY)

const int32_t HoppingFrequencies[] =
{
    916500000,
    923500000,
    906500000,
    917500000,
    917500000,
    909000000,
    903000000,
    916000000,
    912500000,
    926000000,
    925000000,
    909500000,
    913000000,
    918500000,
    918500000,
    902500000,
    911500000,
    926500000,
    902500000,
    922000000,
    924000000,
    903500000,
    913000000,
    922000000,
    926000000,
    910000000,
    920000000,
    922500000,
    911000000,
    922000000,
    909500000,
    926000000,
    922000000,
    918000000,
    925500000,
    908000000,
    917500000,
    926500000,
    908500000,
    916000000,
    905500000,
    916000000,
    903000000,
    905000000,
    915000000,
    913000000,
    907000000,
    910000000,
    926500000,
    925500000,
    911000000,
};
#else
const int32_t HoppingFrequencies[] =

{
#if 0
    476300000,
    484700000,
    471500000,
    479300000,
    471700000,
    479500000,
    471900000,
    479700000,
    472100000,
    479900000,
    472300000,
    480100000,
    472500000,
    480300000,
    472700000,
    480500000,
    472900000,
    480700000,
    473100000,
    480900000,
    473300000,
    481100000,
    473500000,
    481300000,
    473700000,
    481500000,
    473900000,
    481700000,
    474100000,
    481900000,
    474300000,
    482100000,
    474500000,
    482300000,
    474700000,
    482500000,
    474900000,
    482700000,
    475100000,
    482900000,
    475300000,
    483100000,
    475500000,
    483300000,
    475700000,
    483500000,
    475900000,
    483700000,
    476100000,
    483900000,
    476500000,
    484100000,
    476700000,
    484300000,
    476900000,
    484500000,
    477100000,
    484900000,
    477300000,
    485100000,
    477500000,
    485300000,
    477700000,
    485500000,
    477900000,
    485700000,
#endif
    492000000,
    492100000,
    492200000,
    492300000,
    492400000,
    492500000,
    492600000,
    492700000,
    492800000,
    492900000,
    493000000,
    493100000,
    493200000,
    493300000,
    493400000,
    493500000,
    493600000,
    493700000,
    493800000,
    493900000,
    494000000,
    494100000,
    494200000,
    494300000,
    494400000,
    494500000,
    494600000,
    494700000,
    494800000,
    494900000,
    495000000,
    495100000,
    495200000,
    495300000,
    495400000,
    495500000,
    495600000,
    495700000,
    495800000,
    495900000,
    496000000,
    496100000,
    496200000,
    496300000,
    496400000,
    496500000,
    496600000,
    496700000,
    496800000,
    496900000,   
};
#endif


u32 g_SignalBw[10] = { 7800, 10400, 15600, 20800, 31200, 41600, 62500, 125000, 250000, 500000,};



// Default settings
tLoRaSettings LoRaSettings =
{
    #ifdef HIGH_FREQUENCY
    920000000,                             // RFFrequency
    #else
    492000000,
    #endif
    17,                                     // Power
    6,                                      // SignalBw [0: 7.8kHz, 1: 10.4 kHz, 2: 15.6 kHz, 3: 20.8 kHz, 4: 31.2 kHz,
                                            // 5: 41.6 kHz, 6: 62.5 kHz, 7: 125 kHz, 8: 250 kHz, 9: 500 kHz, other: Reserved]
    9,                                      // SpreadingFactor [6: 64, 7: 128, 8: 256, 9: 512, 10: 1024, 11: 2048, 12: 4096  chips]
    2,                                      // ErrorCoding [1: 4/5, 2: 4/6, 3: 4/7, 4: 4/8]
    true,                                   // CrcOn [0: OFF, 1: ON]
    false,                                  // ImplicitHeaderOn [0: OFF, 1: ON]
    false,                                  // RxSingleOn [0: Continuous, 1 Single]
    true,                                   // FreqHopOn [0: OFF, 1: ON]
    7,                                      // HopPeriod Hops every frequency hopping period symbols
    800,                                    // TxPacketTimeout
    800,                                    // RxPacketTimeout
    254,                                    // PayloadLength (used for implicit header mode)
    false,                                  // LowDatarateOptimize option
    NORMALSYMBOLSLENGTH,                    // Preamble length 
};
/*!
 * SX1276 LoRa registers variable
 */
uint8_t SX1276Regs[0x70];
tSX1276LR* SX1276LR;

static uint8_t RxGain = 1;
static int8_t RxPacketSnrEstimate;
static double RxPacketRssiValue;

st_GDOx_Config g_GDOx_map_conf;
static uint32_t g_wokeUpPreambleLength;
 uint8_t g_hopChannel = 3;

#define HOP_CHANNELS           50

st_RF_LoRa_DypeDef g_RF_LoRa =    
{ 
  .rf_DataBufferValid = false,
  .rf_state           = RFLR_STATE_IDLE,
  .rf_RxPacketSize    = 0,
  .rf_TxPacketSize    = 0,
  .rf_HeaderValid     = false,
  .rf_wakeUpTx        = false,
  .spiFifo            = false,
};

extern struct etimer timer_rf; 

void SX1276FskInit();


/****************************************************************************
 Prototype    : SX1276Reset
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276Reset( void )
{  
  uint32_t startTick;

  SX1276SetReset( RADIO_RESET_ON );

  /* Wait 1ms */
  startTick = hal_GetSystickCounter( );
  while(  hal_GetSystickCounter( ) < ( startTick + 2 ));

  SX1276SetReset( RADIO_RESET_OFF );

  /* Wait 6ms */
  startTick = hal_GetSystickCounter( );
   while( hal_GetSystickCounter( ) < ( startTick + 6 ));
}

/****************************************************************************
 Prototype    : SX1276_lora_init
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276_lora_init(bool lora)
{
    SX1276Reset();
    SX1276LR = ( tSX1276LR* )SX1276Regs;
    SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );
    
    if (lora)
    {
      /* set to lora mode */
      SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_LONGRANGEMODE_MASK ) | RFLR_OPMODE_LONGRANGEMODE_ON;
      
      SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode );

      SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );

      SX1276LR->RegIrqFlagsMask |= RFLR_IRQFLAGS_ALL_MASK;
  
      SX1276Write( REG_LR_IRQFLAGS, SX1276LR->RegIrqFlagsMask);
      
      /*
      g_GDOx_map_conf.GDO0Config = DIO0_RxDone;
      g_GDOx_map_conf.GDO1Config = DIO1_RxTimeout;
      g_GDOx_map_conf.GDO2Config = DIO2_FhssCC;
      g_GDOx_map_conf.GDO3Config = DIO3_CadDone;
      g_GDOx_map_conf.GDO4Config = DIO4_CadDetected;
      g_GDOx_map_conf.GDO5Config = DIO5_ModeReady;
      config_GDOx_Map(g_GDOx_map_conf);
      SX1276ReadBuffer( REG_LR_OPMODE, SX1276Regs + 1, 0x70 - 1 );
      */
      
      SX1276LoRaInit();
    }
    else
    {
#ifndef USE_LORA_MODE
      SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_LONGRANGEMODE_MASK ) | RFLR_OPMODE_LONGRANGEMODE_OFF;
      SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode );
      
      SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );
      
      SX1276 = ( tSX1276* )SX1276Regs;
      
      SX1276FskInit();
#endif
    }
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetSymbolTs
 Description  : get symbol period,ms
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
double SX1276LoRaGetSymbolTs(uint8_t BwFlag ,uint8_t SF)
{
  double symbTs;
  double signalBw;
  double BwTable[10] =  {7.8, 10.4, 15.6, 20.8, 31.2, 41.6, 
                         62.5, 125, 250, 500};
                         
  signalBw = BwTable[BwFlag];
  symbTs   = (double)(pow(2,SF)/(signalBw));
  
  return symbTs;
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetPayloadSymbNb
 Description  : get payload symbols
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
uint32_t SX1276LoRaGetPayloadSymbNb(u8 paylod)
{
  uint16_t   PL =  (paylod + 2);
  uint8_t    SF =  LoRaSettings.SpreadingFactor;
  uint8_t    H  =  (uint8_t)LoRaSettings.ImplicitHeaderOn;
  uint8_t    DE =  (uint8_t)LoRaSettings.LowDatarateOptimize;
  uint8_t    CR =  LoRaSettings.ErrorCoding;
  uint32_t   payLoadSymbN;
  double     tempPayLoad;
  
  tempPayLoad  = ceil(((double)(8*PL - 4*SF + 44 - 20*H))/((double)(4*(SF -2*DE)))) * (CR + 4);

  payLoadSymbN =(uint32_t)(tempPayLoad);
  
  return payLoadSymbN > 0 ? (payLoadSymbN + 8):8;
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetTimeOnAir
 Description  : get precise time on air
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
double SX1276LoRaGetTimeOnAir(u8 paylod)
{
  u32      payloadSymbolNb;
  double   preambleSymbolNb;
  double   timeOnAir;       //ms
  double   symbolTs;        //ms
  
  payloadSymbolNb = SX1276LoRaGetPayloadSymbNb(paylod);
  
  preambleSymbolNb = (double)(LoRaSettings.PreambleLen + 4.25);

  symbolTs  = SX1276LoRaGetSymbolTs(LoRaSettings.SignalBw, LoRaSettings.SpreadingFactor);
  
  timeOnAir = (symbolTs * ((double)(payloadSymbolNb + preambleSymbolNb))) ;
 
  return timeOnAir;
}
  
/*****************************************************************************
Prototype	: SX1276LoRaInitHopPeriod
Description	: none
Input		: void	
Output		: None
Return Value : 
Date 		: 2014/3/15
Author		: Barry
*****************************************************************************/
u8 SX1276LoRaInitHopPeriod(void)
{
    return (u8)(SX1276LoRaGetPayloadSymbNb(255) / HOP_CHANNELS);
}

/*****************************************************************************
Prototype	: SX1276LoRaGetHopPeriod
Description	: none
Input		: void	
Output		: None
Return Value : 
Date 		: 2014/3/15
Author		: Barry
*****************************************************************************/

void SX1276LoRaSetWokeUpPreambleLenth(void)
{
  g_wokeUpPreambleLength  =  (u32)(20 + ((double)HALF_SLEEP_PERIOD / 1000 * g_SignalBw[LoRaSettings.SignalBw])/(pow(2,LoRaSettings.SpreadingFactor)) );
}

/*****************************************************************************
Prototype	: SX1276LoRaGetWokeUpPreambleLenth
Description	: none
Input		: void	
Output		: None
Return Value : 
Date 		: 2014/3/15
Author		: Barry
*****************************************************************************/
u32 SX1276LoRaGetWokeUpPreambleLenth(void)
{
  return g_wokeUpPreambleLength;
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetTxTimeOut
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/17
 Author       : Barry
*****************************************************************************/
uint32_t SX1276LoRaGetTxTimeOut(void)
{
  uint32_t timeOut = (uint32_t)(SX1276LoRaGetTimeOnAir(LoRaSettings.PayloadLength)*(1.5));
  return timeOut;
}

#if 0
/*****************************************************************************
 Prototype    : SX1276LoRaSetDefaults
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRaSetDefaults( void )
{
    /* REMARK: See SX1276 datasheet for modified default values */
    SX1276Read( REG_LR_VERSION, &SX1276LR->RegVersion );
}
#endif

/*****************************************************************************
 Prototype    : SX1276LoRaSetOpMode
 Description  : none
 Input        : uint8_t opMode  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRaSetOpMode( uint8_t opMode )
{
  SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_MASK ) | opMode;

  /* BEGIN: Added by Barry, 2014/3/14 */
  #ifdef HIGH_FREQUENCY
  SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_FREQMODE_ACCESS_MASK ) | RFLR_OPMODE_FREQMODE_ACCESS_HF; //Elvis
  #endif 
  /* END:   Added by Barry, 2014/3/14 */

  SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode ); 
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetOpMode
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
uint8_t SX1276LoRaGetOpMode( void )
{
    SX1276Read( REG_LR_OPMODE, &SX1276LR->RegOpMode );
    
    return SX1276LR->RegOpMode & ~RFLR_OPMODE_MASK;
}

/*****************************************************************************
 Prototype    : SX1276LoRaReadRxGain
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
uint8_t SX1276LoRaReadRxGain( void )
{
    SX1276Read( REG_LR_LNA, &SX1276LR->RegLna );
    return( SX1276LR->RegLna >> 5 ) & 0x07;
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetPacketRxGain
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
uint8_t SX1276LoRaGetPacketRxGain( void )
{
    return RxGain;
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetPacketSnr
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
int8_t SX1276LoRaGetPacketSnr( void )
{
    return RxPacketSnrEstimate;
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetPacketRssi
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
double SX1276LoRaGetPacketRssi( void )
{
    return RxPacketRssiValue;
}

/*****************************************************************************
 Prototype    : config_GDOx_Map
 Description  : none
 Input        : st_GDOx_Config GDOx_Map  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void config_GDOx_Map(st_GDOx_Config GDOx_Map)
{
  SX1276LR->RegDioMapping1 =  GDOx_Map.GDO0Config| 
                              GDOx_Map.GDO1Config| 
                              GDOx_Map.GDO2Config| 
                              GDOx_Map.GDO3Config;
                                   
  SX1276LR->RegDioMapping2 =  GDOx_Map.GDO4Config| 
                              GDOx_Map.GDO5Config;
                             
  SX1276WriteBuffer( REG_LR_DIOMAPPING1, &SX1276LR->RegDioMapping1, 2 );
}

/*****************************************************************************
 Prototype    : SX1276LoRaReadRssi
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
double SX1276LoRaReadRssi( void )
{
    // Reads the RSSI value
    SX1276Read( REG_LR_RSSIVALUE, &SX1276LR->RegRssiValue );

    if( LoRaSettings.RFFrequency < 860000000 )  // LF
    {
        return RSSI_OFFSET_LF + ( double )SX1276LR->RegRssiValue;
    }
    else
    {
        return RSSI_OFFSET_HF + ( double )SX1276LR->RegRssiValue;
    }
}


/*****************************************************************************
 Prototype    : getPacketSnr
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
int8_t getPacketSnr(void)
{
  uint8_t rxSnrEstimate;
  
  SX1276Read( REG_LR_PKTSNRVALUE, &rxSnrEstimate );
  
  /* The SNR sign bit is 1 */
  if( rxSnrEstimate & 0x80 ) 
  {
      /* Invert and divide by 4 */
      RxPacketSnrEstimate = ( ( ~rxSnrEstimate + 1 ) & 0xFF ) >> 2;
      RxPacketSnrEstimate = -RxPacketSnrEstimate;
  }
  else
  {
      /* Divide by 4 */
      RxPacketSnrEstimate = ( rxSnrEstimate & 0xFF ) >> 2;
  }
  return RxPacketSnrEstimate;
}

/*****************************************************************************
 Prototype    : get_RxPacketRssi
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
double get_RxPacketRssi(void)
{
    double RxPacketRssi;
    double temp_offset;

    SX1276Read( REG_LR_PKTRSSIVALUE, &SX1276LR->RegPktRssiValue );

    temp_offset = (( LoRaSettings.RFFrequency < 860000000 ) ? RSSI_OFFSET_LF : RSSI_OFFSET_HF);

    if( RxPacketSnrEstimate < 0 )
    {
        RxPacketRssi = temp_offset + ( ( double )SX1276LR->RegPktRssiValue ) + RxPacketSnrEstimate;
    }
    else
    {
        RxPacketRssi = temp_offset + ( 1.0666 * ( ( double )SX1276LR->RegPktRssiValue ) );
    }

    return RxPacketRssi;
}

/*****************************************************************************
 Prototype    : SX1276LoRaGetRFState
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
uint8_t SX1276LoRaGetRFState( void )
{
  return g_RF_LoRa.rf_state;
}

/*****************************************************************************
 Prototype    : SX1276LoRaSetRFState
 Description  : none
 Input        : tRFLRStates state  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRaSetRFState( u8 state )
{
  g_RF_LoRa.rf_state = (tRFLRStates)state;
}

/*****************************************************************************
 Prototype    : SX1276LoRaInit
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRaInit( void ) 
{
    //SX1276LoRaSetDefaults( );
    
    SX1276ReadBuffer( REG_LR_OPMODE, SX1276Regs + 1, 0x70 - 1 );
    
    SX1276LR->RegLna = RFLR_LNA_GAIN_G1;
    
    SX1276Write( REG_LR_LNA, SX1276LR->RegLna );

    //SX1276WriteBuffer( REG_LR_OPMODE, SX1276Regs + 1, 0x70 - 1 );

    /* Set the device in Sleep Mode */
    SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );

    SX1276LoRaSetRFFrequency( LoRaSettings.RFFrequency );
    SX1276LoRaSetSpreadingFactor( LoRaSettings.SpreadingFactor ); // SF6 only operates in implicit header mode.
    SX1276LoRaSetErrorCoding( LoRaSettings.ErrorCoding );
    SX1276LoRaSetPacketCrcOn( LoRaSettings.CrcOn );
    SX1276LoRaSetSignalBandwidth( LoRaSettings.SignalBw );

    SX1276LoRaSetImplicitHeaderOn( LoRaSettings.ImplicitHeaderOn );
    SX1276LoRaSetSymbTimeout( 0x3FF );
    SX1276LoRaSetPayloadLength( LoRaSettings.PayloadLength );

    SX1276LoRaSetPreambleLength(LoRaSettings.PreambleLen);
    
    /* seted  true when a symble time over 16ms */
    if (SX1276LoRaGetSymbolTs(LoRaSettings.SignalBw, LoRaSettings.SpreadingFactor) >= 16)
    {
      SX1276LoRaSetLowDatarateOptimize(true);
    }
    else
    {
      SX1276LoRaSetLowDatarateOptimize(false);
    }
    
    /* BEGIN: Added by Barry, 2014/3/5 */
    SX1276LoRaSetPAOutput( RFLR_PACONFIG_PASELECT_RFO );
    //SX1276LoRaSetPAOutput( RFLR_PACONFIG_PASELECT_PABOOST );
    /* set max power 17DBm */
    SX1276LoRaSetPa20dBm( false );
    
    /* set power */
    SX1276LoRaSetRFPower( LoRaSettings.Power );

    LoRaSettings.HopPeriod = SX1276LoRaInitHopPeriod();

    #ifdef USE_LOW_POWER_MODE
    SX1276LoRaSetWokeUpPreambleLenth();
    #endif
    
    /* END:   Added by Barry, 2014/3/5 */
    SX1276LoRaSetRFState( RFLR_OPMODE_STANDBY );
    
    SX1276LoRa_Receive_Packet(false);
}

/*****************************************************************************
 Prototype    : hal_PacketRF_TxData
 Description  : none
 Input        : tRFLRStates state  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_PacketRF_TxData(u8 *pBuffer,u8 length)
{
  memcpy( ( void * )(g_RF_LoRa.rf_DataBuffer), pBuffer, length);
  g_RF_LoRa.rf_TxPacketSize = length; 
}

/*****************************************************************************
 Prototype    : SX1276StartSleep
 Description  : none
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276StartSleep(void)
{
  hal_DIOx_ITConfig(all,DISABLE);
  SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );
}

/*****************************************************************************
 Prototype    : receiveRxData
 Description  : none
 Input        : bool spiDMA  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void receiveRxData(bool spiDMA)
{
     if( LoRaSettings.RxSingleOn == true ) // Rx single mode
     {
         SX1276LR->RegFifoAddrPtr = SX1276LR->RegFifoRxBaseAddr;
         SX1276Write( REG_LR_FIFOADDRPTR, SX1276LR->RegFifoAddrPtr );
     }
     else  // Rx continuous mode
     {
        SX1276Read( REG_LR_FIFORXCURRENTADDR, &SX1276LR->RegFifoRxCurrentAddr );
        SX1276LR->RegFifoAddrPtr = SX1276LR->RegFifoRxCurrentAddr;
     }

     if (LoRaSettings.ImplicitHeaderOn == false )
     {
        SX1276Read( REG_LR_NBRXBYTES, &SX1276LR->RegNbRxBytes );
        g_RF_LoRa.rf_RxPacketSize = SX1276LR->RegNbRxBytes;
     }
     else
     {
        g_RF_LoRa.rf_RxPacketSize = SX1276LR->RegPayloadLength;  
     }
     
    #ifdef  SPI_DMA_FIFO
    if (spiDMA))
    {
      hal_sRF_readFIFO_DMA(g_RF_LoRa.rf_DataBuffer, g_RF_LoRa.rf_RxPacketSize); 
    }
    #else 
      SX1276ReadFifo( g_RF_LoRa.rf_DataBuffer, g_RF_LoRa.rf_RxPacketSize );
      RxEndProcess(true);
    #endif
}

/*****************************************************************************
 Prototype    : RxEndProcess
 Description  : none
 Input        : bool dataValid  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void RxEndProcess(bool dataValid)
{
    g_RF_LoRa.rf_state = RFLR_STATE_RX_DONE;
    g_RF_LoRa.rf_DataBufferValid = dataValid;
    g_RF_LoRa.rf_HeaderValid = false;
    process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_RF_LoRa.rf_state));
   
  /*
  if (LoRaSettings.RxSingleOn == true )
  {
    g_RF_LoRa.rf_state = RFLR_STATE_RX_DONE; // 单次接收，完成后不设置为再接收 
  }
  else
  {
    g_RF_LoRa.rf_state = RFLR_STATE_RX_RUNNING;

    hal_DIOx_ITConfig(0,ENABLE);
    hal_DIOx_ITConfig(3,ENABLE);

    if (LoRaSettings.FreqHopOn)
    {
        // we direct set to the start hop frequncy 
        SX1276LoRaSetRFFrequency(HoppingFrequencies[g_hopChannel]);
        hal_DIOx_ITConfig(2,ENABLE);
    }
  }
  
  
  */
}



/*****************************************************************************
 Prototype    : SX1276LoRa_CAD_Scan
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRa_CAD_Scan(void)
{
  SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );

  SX1276LR->RegIrqFlagsMask |= RFLR_IRQFLAGS_ALL_MASK;
  SX1276LR->RegIrqFlagsMask &= (~(RFLR_IRQFLAGS_CADDETECTED | RFLR_IRQFLAGS_CADDONE));
  SX1276Write( REG_LR_IRQFLAGSMASK, SX1276LR->RegIrqFlagsMask );
  
  SX1276LoRaSetRFFrequency(HoppingFrequencies[0]);
  
  g_GDOx_map_conf.GDO0Config = DIO0_CadDone;
  g_GDOx_map_conf.GDO4Config = DIO4_CadDetected;
  config_GDOx_Map(g_GDOx_map_conf); 
  
  hal_DIOx_ITConfig(0,ENABLE);
  
  SX1276LoRaSetOpMode( RFLR_OPMODE_CAD );
  g_RF_LoRa.rf_state = RFLR_STATE_CAD_RUNNING;
}

/*****************************************************************************
 Prototype    : SX1276LoRa_Send_Packet
 Description  : none
 Input        : u8 *PBuffer   
                u8 length     
                bool FreqHop  
                bool spiDMA   
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRa_Send_Packet(u8 *PBuffer,u8 length)
{
  SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );
  
  SX1276LR->RegIrqFlagsMask |= RFLR_IRQFLAGS_ALL_MASK;
  
  SX1276Write( REG_LR_IRQFLAGS, RFLR_IRQFLAGS_ALL_MASK);
  
  hal_DIOx_ITConfig(all,DISABLE);
  
  if(LoRaSettings.FreqHopOn)
  {
    /* all Irq mask */
    SX1276LR->RegIrqFlagsMask &= (~(RFLR_IRQFLAGS_TXDONE |RFLR_IRQFLAGS_FHSSCHANGEDCHANNEL));

    SX1276LR->RegHopPeriod = LoRaSettings.HopPeriod;

    SX1276Read( REG_LR_HOPCHANNEL, &SX1276LR->RegHopChannel );
    SX1276LoRaSetRFFrequency( HoppingFrequencies[g_hopChannel]);
   
    //SX1276Read( REG_LR_HOPCHANNEL, &SX1276LR->RegHopChannel );
    //SX1276LoRaSetRFFrequency( HoppingFrequencies[SX1276LR->RegHopChannel & RFLR_HOPCHANNEL_CHANNEL_MASK] );
    SX1276LoRaSetOpMode( RFLR_OPMODE_SYNTHESIZER_TX );
   
    g_GDOx_map_conf.GDO0Config = DIO0_TxDone;
    g_GDOx_map_conf.GDO2Config = DIO2_FhssCC;
  }
  else
  {
    SX1276LoRaSetRFFrequency(LoRaSettings.RFFrequency);
    SX1276LR->RegIrqFlagsMask &= (~RFLR_IRQFLAGS_TXDONE);
    SX1276LR->RegHopPeriod = 0;
    g_GDOx_map_conf.GDO0Config = DIO0_TxDone;
  }

  /* RegHopChanne is auto clear when Tx Done */
  SX1276Write( REG_LR_HOPPERIOD, SX1276LR->RegHopPeriod );
  SX1276Write( REG_LR_IRQFLAGSMASK, SX1276LR->RegIrqFlagsMask );
  config_GDOx_Map(g_GDOx_map_conf);

  /* Initializes the payload size */
  SX1276LR->RegPayloadLength = length  ;
  SX1276Write( REG_LR_PAYLOADLENGTH, SX1276LR->RegPayloadLength );
  
  /* Full buffer used for Tx */
  SX1276LR->RegFifoTxBaseAddr = 0x00; 
  SX1276Write( REG_LR_FIFOTXBASEADDR, SX1276LR->RegFifoTxBaseAddr );

  SX1276LR->RegFifoAddrPtr = SX1276LR->RegFifoTxBaseAddr;
  SX1276Write( REG_LR_FIFOADDRPTR, SX1276LR->RegFifoAddrPtr );

  SX1276LoRaSetRFState( RFLR_STATE_TX_RUNNING );   
  
  hal_PacketRF_TxData(PBuffer,length);

  #ifdef SPI_DMA_FIFO
   hal_sRF_writeFIFO_DMA(g_RF_LoRa.rf_DataBuffer,length);
  #else
  SX1276WriteFifo(g_RF_LoRa.rf_DataBuffer,length); 
 
  hal_DIOx_ITConfig(0,ENABLE);

  if (LoRaSettings.FreqHopOn)
  {
    hal_DIOx_ITConfig(2,ENABLE);
  }

  SX1276LoRaSetOpMode( RFLR_OPMODE_TRANSMITTER );
  #endif
  
  process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_RF_LoRa.rf_state));
}

/*****************************************************************************
 Prototype    : SX1276LoRaStartTransmit
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
#ifdef SPI_DMA_FIFO
void SX1276LoRaStartTransmit(void)
{
  if (g_RF_LoRa.rf_state == RFLR_STATE_TX_RUNNING)
  {
    hal_sRF_InitSPI();
    hal_DIOx_ITConfig(0,ENABLE);
    if (LoRaSettings.FreqHopOn)
    {
      /* enable FHSS IRQ */
      hal_DIOx_ITConfig(2,ENABLE);
    }
    SX1276LoRaSetOpMode( RFLR_OPMODE_TRANSMITTER );
  } 
}
#endif

#if 0
/*****************************************************************************
 Prototype    : SX1276LoRa_WokeUpTx
 Description  : none
 Input        : bool FreqHop  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRa_WokeUpTx(u8 *PBuffer,u8 length)
{
  LoRaSettings.PreambleLen =  SX1276LoRaGetWokeUpPreambleLenth();
  SX1276LoRaSetPreambleLength(LoRaSettings.PreambleLen);
  g_RF_LoRa.rf_wakeUpTx = true;
  SX1276LoRa_Send_Packet(PBuffer,length);
}


/*****************************************************************************
 Prototype    : SX1276LoRa_NormalTx
 Description  : none
 Input        : bool FreqHop  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRa_NormalTx(u8 *PBuffer,u8 length)
{
  LoRaSettings.PreambleLen = NORMALSYMBOLSLENGTH;
  SX1276LoRaSetPreambleLength(NORMALSYMBOLSLENGTH);
  SX1276LoRa_Send_Packet(PBuffer,length);
}
#endif

/*****************************************************************************
 Prototype    : SX1276LoRa_Receive_Packet
 Description  : none
 Input        : bool FreqHop  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276LoRa_Receive_Packet(bool singleRx)
{
    SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );
    
    SX1276LR->RegIrqFlagsMask |= RFLR_IRQFLAGS_ALL_MASK;
    
    SX1276LR->RegIrqFlagsMask &= (~(RFLR_IRQFLAGS_RXDONE |
                                    RFLR_IRQFLAGS_PAYLOADCRCERROR|
                                    RFLR_IRQFLAGS_VALIDHEADER
                                    /*|RFLR_IRQFLAGS_RXTIMEOUT*/
                                    ));
                                    
    g_GDOx_map_conf.GDO0Config = DIO0_RxDone;
    g_GDOx_map_conf.GDO3Config = DIO3_ValidHeader;
                             
    if (LoRaSettings.FreqHopOn)
    {
      /* BEGIN: Modified by Barry, 2014/10/31 */
      SX1276LR->RegHopPeriod = LoRaSettings.HopPeriod;
      /* END:   Modified by Barry, 2014/10/31 */

      SX1276LR->RegIrqFlagsMask &= (~RFLR_IRQFLAGS_FHSSCHANGEDCHANNEL);
      //可以简化为 
      SX1276Read(REG_LR_HOPCHANNEL, &SX1276LR->RegHopChannel);
      //SX1276LoRaSetRFFrequency( HoppingFrequencies[SX1276LR->RegHopChannel & RFLR_HOPCHANNEL_CHANNEL_MASK] );
      SX1276LoRaSetRFFrequency( HoppingFrequencies[g_hopChannel] );
      g_GDOx_map_conf.GDO2Config = DIO2_FhssCC;
    }
    else
    {
      SX1276LoRaSetRFFrequency(LoRaSettings.RFFrequency);
      SX1276LR->RegHopPeriod = 0;
    }

    if (LoRaSettings.RxSingleOn == true)
    { 
      /* config single Rx timeOut GPIO interrupt */ 
      //g_GDOx_map_conf.GDO1Config = DIO1_RxTimeout;
      //SX1276LR->RegIrqFlagsMask &= (~RFLR_IRQFLAGS_RXTIMEOUT);
      SX1276Write( REG_LR_IRQFLAGSMASK, SX1276LR->RegIrqFlagsMask );
      SX1276Write( REG_LR_HOPPERIOD, SX1276LR->RegHopPeriod );
      config_GDOx_Map(g_GDOx_map_conf); 
      LoRaSettings.PreambleLen = SX1276LoRaGetWokeUpPreambleLenth();
      SX1276LoRaSetPreambleLength(LoRaSettings.PreambleLen );
      //SX1276LoRaSetSymbTimeout(NORMALSYMBOLSLENGTH*2);
      SX1276LoRaSetOpMode( RFLR_OPMODE_RECEIVER_SINGLE );
    }
    else
    {
      /* Rx continuous mode */
      SX1276LR->RegFifoAddrPtr = SX1276LR->RegFifoRxBaseAddr;
      SX1276Write( REG_LR_FIFOADDRPTR, SX1276LR->RegFifoAddrPtr );
      SX1276Write( REG_LR_IRQFLAGSMASK, SX1276LR->RegIrqFlagsMask );
      SX1276Write( REG_LR_HOPPERIOD, SX1276LR->RegHopPeriod );
      config_GDOx_Map(g_GDOx_map_conf); 
      //SX1276LoRaSetSymbTimeout(NORMALSYMBOLSLENGTH*2);
      LoRaSettings.PreambleLen = NORMALSYMBOLSLENGTH;
      SX1276LoRaSetPreambleLength(NORMALSYMBOLSLENGTH);
      SX1276LoRaSetOpMode( RFLR_OPMODE_RECEIVER );
    }
    g_RF_LoRa.rf_state = RFLR_STATE_RX_RUNNING; 

    if (LoRaSettings.FreqHopOn)
    {
       hal_DIOx_ITConfig(2,ENABLE);
    }
    hal_DIOx_ITConfig(0,ENABLE);
    hal_DIOx_ITConfig(3,ENABLE);
}



#ifdef USE_LORA_MODE
void EXTI0_1_IRQHandler()
{
   if(EXTI_GetITStatus(DIO0_IRQ) != RESET)
   {
      EXTI_ClearITPendingBit(DIO0_IRQ);
      EXTI_ClearITPendingBit(DIO2_IRQ);
      
       switch ( g_RF_LoRa.rf_state )
         {
            case  RFLR_STATE_TX_RUNNING:
            /* disable EXTI0&EXTI2, line interrupt */
            hal_DIOx_ITConfig(0,DISABLE);
            hal_DIOx_ITConfig(2,DISABLE);

            /* clear Tx done flag */
            SX1276Write( REG_LR_IRQFLAGS, RFLR_IRQFLAGS_TXDONE);
            
            //etimer_stop(&timer_rf);

            /* set RF state to tx done */
            g_RF_LoRa.rf_state = RFLR_STATE_TX_DONE;
            
             /* set to standby mode */
            SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );
        
            process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_RF_LoRa.rf_state));
            break;

            case  RFLR_STATE_RX_RECEIVEING:
            /* disable EXTI all, line interrupt */
            hal_DIOx_ITConfig(all,DISABLE);
            
            etimer_stop(&timer_rf);
            
            /* clear Rx done flag */
            SX1276Write(REG_LR_IRQFLAGS, RFLR_IRQFLAGS_RXDONE);

            /* read Rx crc flag */
            SX1276Read( REG_LR_IRQFLAGS, &SX1276LR->RegIrqFlags );

            RxPacketRssiValue   = get_RxPacketRssi();
            RxPacketSnrEstimate = getPacketSnr();
            
            //crc error
            if( ( SX1276LR->RegIrqFlags & RFLR_IRQFLAGS_PAYLOADCRCERROR ) == RFLR_IRQFLAGS_PAYLOADCRCERROR )
            {
                /* Clear playload CRC error Irq */
                SX1276Write( REG_LR_IRQFLAGS, RFLR_IRQFLAGS_PAYLOADCRCERROR  );
                RxEndProcess(false);
            }
            else// crc ok
            {
                receiveRxData(g_RF_LoRa.spiFifo);
            }
            break;

            case  RFLR_STATE_CAD_RUNNING:
            /*  clear CADdone flag */
            SX1276Write( REG_LR_IRQFLAGS, RFLR_IRQFLAGS_CADDONE);
            if (DIO4 == 1)
            {
              /* clear CAD detected falg */
              SX1276Write( REG_LR_IRQFLAGS, RFLR_IRQFLAGS_CADDETECTED);
              SX1276LoRa_Receive_Packet(false);
            }
            break;

            default:
            break;
       }
    }
}
/*****************************************************************************
 Prototype    : EXTI4_15_IRQHandler
 Description  : EXTI11 for valid header
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void EXTI4_15_IRQHandler(void)
{
  
#if 0
    /* Rx timeOut */
    if (EXTI_GetITStatus(DIO1_IRQ) != RESET)
    {
       EXTI_ClearITPendingBit(DIO1_IRQ);
       
      if (g_RF_LoRa.rf_state == RFLR_STATE_RX_RUNNING)
      {
          /*单次接收preamble超时，看怎么处理*/
      }
    }
#endif
    
     /* FHSS */
   if (EXTI_GetITStatus(DIO2_IRQ) != RESET)
   {
      #if 0
      if (g_RF_LoRa.rf_state == RFLR_STATE_RX_RUNNING)
      {
        g_RF_LoRa.rf_state = RFLR_STATE_RX_RECEIVEING;
        
        etimer_set(&timer_rf, CLOCK_CONF_SECOND*2);
        
        process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_RF_LoRa.rf_state));
        
        RxGain = SX1276LoRaReadRxGain( );
         
        /* 此处表明在单次接收时是先收到头再跳频，在连续接收模式下是先跳频再收到头，需要验证 */
        /* 在接收模式下，谁先发生就算接收开始了，并不是接收到头才算接收开始，
        也可以处理为接收到头算接收开始，连续模式下可能头也是跳频发送的*/
        
        /* 统一为接收到头才算接收开始 */
      }
      #endif
      
      EXTI_ClearITPendingBit(DIO2_IRQ);
      
      SX1276Read( REG_LR_IRQFLAGS, &SX1276LR->RegIrqFlags );

      if( ( SX1276LR->RegIrqFlags & RFLR_IRQFLAGS_FHSSCHANGEDCHANNEL ) == RFLR_IRQFLAGS_FHSSCHANGEDCHANNEL )
      {
        SX1276Write( REG_LR_IRQFLAGS, RFLR_IRQFLAGS_FHSSCHANGEDCHANNEL );
        
        RxGain = SX1276LoRaReadRxGain( );
        
        SX1276Read( REG_LR_HOPCHANNEL, &SX1276LR->RegHopChannel );
        //SX1276LoRaSetRFFrequency( HoppingFrequencies[SX1276LR->RegHopChannel & RFLR_HOPCHANNEL_CHANNEL_MASK] ); 
        
        SX1276LoRaSetRFFrequency( HoppingFrequencies[ (g_hopChannel + SX1276LR->RegHopChannel&RFLR_HOPCHANNEL_CHANNEL_MASK)%HOP_CHANNELS] ); 
      }
   }
    
    /* valid header */
    if (EXTI_GetITStatus(DIO3_IRQ) != RESET)
    {
        EXTI_ClearITPendingBit(DIO3_IRQ);
        
        hal_DIOx_ITConfig(3,DISABLE);

        SX1276Write( REG_LR_IRQFLAGS, RFLR_IRQFLAGS_VALIDHEADER);

        if (g_RF_LoRa.rf_state == RFLR_STATE_RX_RUNNING)
        {
            g_RF_LoRa.rf_state = RFLR_STATE_RX_RECEIVEING;
            
            process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_RF_LoRa.rf_state));
        }
        g_RF_LoRa.rf_HeaderValid = true;
    }
    
   if(EXTI_GetITStatus(ZERO_DETECT_LINE) != RESET)
   {
     EXTI_ClearITPendingBit(ZERO_DETECT_LINE);
   
     TIM_Cmd(POWER_DOWN_TIMER, ENABLE);
     TIM_SetCounter(POWER_DOWN_TIMER, 0 );

     //process_post(&zero_detect_process, PROCESS_EVENT_MSG, NULL); // 此处是使用事件方式处理过零中断，现在改为定时器硬件中断方式
   }
   

}

#endif  //#ifdef USE_LORA_MODE



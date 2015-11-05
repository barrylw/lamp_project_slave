/**
  ******************************************************************************
  * @file    phy.c
  * @author  William Liang
  * @version V1.0.0
  * @date    09/23/2013
  * @brief   This file contains physical layer task.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "common.h"
#include "hal_rcc.h"
#include "hal_led.h"
#include "hal_uart.h"
#include "hal_timer.h"
#include "hal_memory.h"
#include "hal_nvic.h"
#include "hal_wdg.h"
#include "hal_radio.h"
#include "phy.h"
//#include "MAC.h"
#include "hal_flash.h"


/** @addtogroup Physical Layer
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

//物理层版本
__root const Manufacturer_Version phyVersion = 
{
  {'B', 'R'},//厂商代码 
  {'2', '3'},//芯片代码
  0x19, 0x03, 0x14,//日月年
  {0x01, 0x01}//版本
};

//static u8 g_sRFCCAResult =0;
//const static u8 aMaxPHYPayloadSize =   MAXPHYPAYLOADSIZE;


PHY_Attr phy_attr = {

  .phyTransmitPower         = HIGHEST_LEVEL,//16dBm
  .phyCCAMode               = CCA_CS_ED,
  .phyCurrentChannelGroup   = 0,
  .phyRSSIThreshold         = RSSI_THRESHOLD,//-96dBm
  };


extern st_RF_LoRa_DypeDef g_RF_LoRa;



//extern ST_EVENT_METHOD UartEvents[];
//extern ST_EVENT_METHOD RFEvents[];

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Handle physical layer task in the main loop.
  * @param  None.
  * @retval None.
  */
void PHYTASK(void)
{
  //hal_RunUartEvents(UartEvents);
  //hal_RunRFEvents(RFEvents);
}

/**
  * @brief  Initialize system hardware.
  * @param  None.
  * @retval None.
  */
void InitHardware(void)
{
  hal_InitRCC();
  hal_InitNVIC();
  hal_InitLED();

  hal_InitUART();
  hal_InitTIMER();
  hal_Init_Flash();

  
  //hal_InitWDG();
  //GDflash_init();
  hal_InitRF();
  
}

/**
  * @brief  Initialize global variable in the physical layer.
  * @param  None.
  * @retval None.
  */
void InitPhyVariable(void)
{
#ifdef PRINTF_DEBUG
  hal_InitMemoryVariable();
#endif
  hal_InitUartVariable();
  hal_InitTimerVariable();
  //hal_InitRFVariable();
}

/******************************************************************************/
/*           protocol stack primitive interface                        */
/******************************************************************************/


/*****************************************************************************
 Prototype    : PD_DATA_Request
 Description  : 
 Input        : 
 Output       : None
 Return Value : None
 Date         : 2015/4/27
 Author       : Barry
*****************************************************************************/
void PD_DATA_Request(u16 psduLength, u8 *psdu, u8 channel)
{
  hal_sRF_Transmit(psdu, psduLength, channel);
}

/*****************************************************************************
 Prototype    : MAC_CCA_Request
 Description  : 
 Input        : 
 Output       : None
 Return Value : None
 Date         : 2015/4/27
 Author       : Barry
*****************************************************************************/
#if 0
void phy_cca_request(void);
{
  if (SX1276LoRaGetRFState() == RFLR_STATE_TX_RUNNING)
  {
     Mac_CCA_Confirm(PHY_TX_ON);
  }
  else
  {
    
  }
}
#endif


/*****************************************************************************
 Prototype    : get_CCA_result
 Description  : 
 Input        : 
 Output       : None
 Return Value : None
 Date         : 2015/4/27
 Author       : Barry
*****************************************************************************/
u8 get_CCA_result( u8 * ccaResult)
{
  return 0;
}

/*****************************************************************************
 Prototype    : Phy_RxData
 Description  : judge if the Rx data valid
 Input        : 
 Output       : None
 Return Value : None
 Date         : 2015/4/27
 Author       : Barry
*****************************************************************************/
bool Phy_RxData(void)
{
  if (g_RF_LoRa.rf_DataBufferValid)
  {
    g_RF_LoRa.rf_DataBufferValid = false;
    return true;
  }
  else
  {
    return false;
  }
}

/*****************************************************************************
 Prototype    : PD_DATA_Indication
 Description  : 
 Input        : 
 Output       : None
 Return Value : None
 Date         : 2015/4/27
 Author       : Barry
*****************************************************************************/
void PHY_DATA_Indication(u8 *psduLength, u8 *psdu, u8 *ppduLinkQuality)
{
    *psduLength = g_RF_LoRa.rf_RxPacketSize;

    for (u16 i = 0; i < g_RF_LoRa.rf_RxPacketSize; i++)
    {
        psdu[i] = g_RF_LoRa.rf_DataBuffer[i];
    }
}


u8 Phy_GetAttr(u8 attr,u8* val)
{   
    u8 tempPhyStatus;
 
    switch (attr)
    {
        case PHY_TRANSMITPOWER: 
         *val = phy_attr.phyTransmitPower;
         return PHY_SUCCESS;
        break;
         
        case PHYCCAMODE:     
         *val = phy_attr.phyCCAMode;
         return PHY_SUCCESS;
        break;
        
        case PHYCURRENTCHANNELGROUP: 
         *val = phy_attr.phyCurrentChannelGroup;
         return PHY_SUCCESS;
        break;
        
        case PHYRSSITHRESHOLD:    
         *val = phy_attr.phyRSSIThreshold;
         return PHY_SUCCESS;
        break;
        
        case PHYSTATUS:  
         tempPhyStatus = SX1276LoRaGetRFState();
         if (tempPhyStatus == RFLR_STATE_TX_RUNNING || tempPhyStatus == RFLR_STATE_RX_RECEIVEING)
         {
            *val = PHY_BUSY;
         }
         else
         {
            *val = PHY_IDLE;
         }
         return PHY_SUCCESS;
        break;
        
        default:
            return PHY_UNSUPPORTED_ATTRIBUTE;
        break;
    }
}

u8 Phy_SetAttr(u8 attr,u8 val)
{
    switch (attr)
    {
        case PHY_TRANSMITPOWER: 
          phy_attr.phyTransmitPower =  val ;
         return PHY_SUCCESS;
        break;
         
        case PHYCCAMODE:     
         phy_attr.phyCCAMode =   val;
         return PHY_SUCCESS;
        break;
        
        case PHYCURRENTCHANNELGROUP: 
          phy_attr.phyCurrentChannelGroup = val;
         return PHY_SUCCESS;
        break;
        
        case PHYRSSITHRESHOLD:    
          phy_attr.phyRSSIThreshold = val ;
         return PHY_SUCCESS;
        break;
        
        default:
            return PHY_UNSUPPORTED_ATTRIBUTE;
        break;
    }
}






/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

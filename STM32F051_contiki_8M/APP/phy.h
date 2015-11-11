/**
  ******************************************************************************
  * @file    phy.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    09/23/2013
  * @brief   This file contains the headers of the physical layer.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __PHY_H__
#define __PHY_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "common.h"

/* Exported constants --------------------------------------------------------*/

#define RSSI_THRESHOLD                 96u
#define MAXPHYPAYLOADSIZE              249u 
#define CSMA_CCA_TIMEOUT               2u   //ms


/* Exported macro ------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/

typedef enum
{
  HIGHEST_LEVEL = 0, //16dBm
  HIGH_LEVEL = 1,    //10dBm
  LOW_LEVEL = 2,     //4dBm
  LOWEST_LEVEL = 3,  //-2dBm
}TXPOWER_LEVEL;

typedef enum
{
  PHY_BUSY = 0,
  PHY_IDLE,
  PHY_BUSY_RX,
  PHY_BUSY_TX,
  PHY_RX_ON,
  PHY_TX_ON,
  PHY_TRX_OFF,
  PHY_FORCE_TRX_OFF,
  PHY_SUCCESS,
  PHY_INVALID_PARAMETER,
  PHY_UNSUPPORTED_ATTRIBUTE,
}PHY_STATUS;

typedef enum
{
    CCA_CS,
    CCA_ED,
    CCA_CS_ED,
}PHY_CCA_MODE;

typedef enum
{
    PHY_TRANSMITPOWER,           //phyTransmitPower;//16dBm
    PHYCCAMODE,                  //phyCCAMode;
    PHYCURRENTCHANNELGROUP,      //phyCurrentChannelGroup;
    PHYRSSITHRESHOLD,            //phyRSSIThreshold;//-96dBm
    PHYSTATUS,                   //phyStatus;
}em_PHY_Attr;

typedef struct
{
    u8 phyTransmitPower;//16dBm
    u8 phyCCAMode;
    u8 phyCurrentChannelGroup;
    u8 phyRSSIThreshold;//-96dBm
    //u8 phyStatus;
}PHY_Attr;


typedef struct
{
    void (*PLME_CCA_request)(void);                                 //������phy����MAC����
    void (*PLME_CCA_confirm)(PHY_STATUS status);                    //������mac����phy����
    void (*PLME_ED_request)(void);                                  //������phy����MAC����
    void (*PLME_ED_confirm)(PHY_STATUS status, u8 energyLevel);     //������mac����phy����
    void (*PLME_GET_request)(PHY_STATUS status);
    void (*PLME_GET_confirm)(PHY_STATUS status,  em_PHY_Attr PIBAtribute, u8 PIBAttributeValue);
}ST_PLME_SAP;

typedef struct
{
   void (*PD_DATA_request)(u8 psduLength, u8 *psduBuf);             //������phy����MAC����
   void (*PD_DATA_confirm)(PHY_STATUS status);                      //������MAC����phy����
   void (*PD_DATA_indication)(u8 psduLength, u8 *psduBuf, u8 rssi); //������MAC����phy����
}ST_PD_SAP;

typedef struct 
{
    PHY_Attr      phyAttribute;
    PHY_STATUS    phyStatus;
    ST_PLME_SAP   PLME_SAP;  
    ST_PD_SAP     PD_SAP;
}phyInterface;






/* Exported functions ------------------------------------------------------- */


void InitHardware(void);
void InitPhyVariable(void);

#if 0
void PHYTASK(void);
/*********************************
 MAC Layer Interface 
**********************************/

/* MAC�����phyֱ�ӷ���,������PHY�� */
void PD_DATA_Request(u16 psduLength, u8 *psdu, u8 channel);
void PD_DATA_Confirm(PHY_STATUS status);

/* phy��MAC�㴫������ */
void PD_DATA_Indication(u8 *psduLength, u8 *psdu, u8 *ppduLinkQuality);
//extern void PD_DATA_Respone();//MAC��ʡ�Զ�PHY�������ϴ�����Ӧ

/* MAC��CCA���� */
void PLME_CCA_Request(u8 channel);

/* PHY���MAC��Ӧ�� */
void PLME_CCA_Confirm(PHY_STATUS status);

u8 Phy_GetAttr(u8 attr,u8* val);
u8 Phy_SetAttr(u8 attr,u8  val);


/* �ӿں�����MAC���ж�phy�Ƿ�����������*/
bool Phy_RxData(void); /* �˺���Ҳ���ܲ���Ҫ*/


/////////////////////////////////////////////////////////////////////
//MAC Layer Interface
/////////////////////////////////////////////////////////////////////
void PHY_DATA_Indication(u8 *psduLength, u8 *psdu, u8 *ppduLinkQuality);

u8 get_CCA_result( u8 * ccaResult);
#endif

#endif /* __PHY_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

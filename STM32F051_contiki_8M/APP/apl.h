/**
  ******************************************************************************
  * @file    apl.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    07/26/2013
  * @brief   This file contains the headers of the application layer.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __APL_H__
#define __APL_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "hal_flash.h"

#define APL_TYPE_DATA_TRANSPARENT   0x00
#define APL_TYPE_DATA_OBJECT        0x01
#define APL_TYPE_CMD                0x02
#define APL_TYPE_CONFIRM            0x03

#define APL_TRANSPORT_SINGLE        0x00
#define APL_TRANSPORT_GROUP         0x01
#define APL_TRANSPORT_BROADCAST     0x02
#define APL_TRANSPORT_SAVED         0x03


typedef struct
{
    u8 frame_type:2;
    u8 frame_tran_mod:2;
    u8 frame_ack_mod:1;
    u8 frame_safe:1;
    u8 frame_ack_req:1;
    u8 frame_ext_head_inication:1;
}st_apl_ctrl;


typedef struct
{
   st_apl_ctrl    ctrl;
    u8            source_point;
    u8            end_point;
    u8            group_addr;
    u8            frame_number;
    u8            ext_head[3]; 
    u8            *data;
}st_APL_frame;

#if 0
/**********************************************************************************************************************************************
升级flash参数区排列：总字节数/2B(totalByte)   帧序号/1B(packetNo)  升级状态/1B(status)  版本号/1B(version) 升级包状态表/30B(packets_states)
************************************************************************************************************************************************/

/**********************************************************************************************************************************************
升级包帧结构：68 xx xx xx xx xx xx 68 C L    版本号/1B(version)  总字节数/2B(totalByte)   帧序号/1B(packetNo)   数据包长度/1B 数据包(变长) CS 16
************************************************************************************************************************************************/


#define UPDATE_FLASH_PARAMETER_DDR            FLASH_PARAMETER_ADDRESS      
#define UPDATE_FLASH_LENGTH         35
#define DEFAULT_UPDATE_PACKET_SIZE  128


#define TOTALBYTES_LENGTH           2
#define PACKETNO_LENGTH             1
#define STATUS_LENGTH               1
#define VERSION_LENGTH              1
#define PACKETSTATE_LENGTH          30


#define TOTALBYTES_OFFSET           0
#define PACKETNO_OFFSET             2
#define STATUS_OFFSET               3
#define VERSION_OFFSET              4
#define PACKETSTATE_OFFSET          5

#define TOTALBYTES_FLASH_DDR        (FLASH_PARAMETER_ADDRESS + TOTALBYTES_OFFSET)
#define PACKETNO__FLASH_DDR         (FLASH_PARAMETER_ADDRESS + PACKETNO_OFFSET)
#define STATUS__FLASH_DDR           (FLASH_PARAMETER_ADDRESS + STATUS_OFFSET)
#define VERSION_FLASH_DDR           (FLASH_PARAMETER_ADDRESS + VERSION_OFFSET)
#define PACKETSTATE__FLASH_DDR      (FLASH_PARAMETER_ADDRESS + PACKETSTATE_OFFSET)

#define UPDATE_TOTALBYTES           ((u8)(1<<0))
#define UPDATE_PACKETNO             ((u8)(1<<1))
#define UPDATE_STATUS               ((u8)(1<<2))
#define UPDATE_PACKETSTATE          ((u8)(1<<3))
#define UPDATE_VERSION              ((u8)(1<<4))
#define UPDTE_ALL                   ((u8)(((u8)(1<<0)) | ((u8)(1<<1)) | ((u8)(1<<2)) | ((u8)(1<<3))) | ((u8)(1<<4)))

#define UPDATE_TOTALBYTES_MASK      ((u8)(1<<0))
#define UPDATE_PACKETNO_MASK        ((u8)(1<<1))
#define UPDATE_STATUS_MASK          ((u8)(1<<2))
#define UPDATE_PACKETSTATE_MASK     ((u8)(1<<3))
#define UPDATE_VERSION_MASK         ((u8)(1<<4))
#define UPDATE_ALL_MASK             ((u8)(((u8)(1<<0)) | ((u8)(1<<1)) | ((u8)(1<<2)) | ((u8)(1<<3))) | ((u8)(1<<4)))



typedef struct
{
  u16 totoalBytes;
  u8  packetNo;
  u8  status;
  u8  version;
  u8  packetsState[30];
}ST_UPDATE;

typedef enum
{
  UPDATE_START,
  UPDATE_RUNNING,
  UPDATE_FINISH,
  UPDATE_END,   
  UPDATE_UNKNOW,
}EM_UPDATE_STATUS;

typedef struct
{
    u8 control;
    u8 length ; 
    u8 *data ;  
    u8 cs ;    
}
ST_FRAME_645;
#endif

/* Exported functions ------------------------------------------------------- */

void APLTASK(void);
void InitAplVariable(void);

void ReadVersion(void);
void SoftReset(void);
void init_update(void);
bool read_params_area(u32 addr);
bool find_params(u8 pos, void * val);
void read_flash(u32 addr ,u8 * str,u16 len);
u16 find_free_addr(u32 addr);
#endif /* __APL_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

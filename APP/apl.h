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
#include "process.h"

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
#endif

/**********************************************************************************************************************************************
升级flash参数区排列：版本号   总字节数(2byte)  总段数2byte  段序号2byte   升级状态/1B(status) 升级包状态表/128byte(packets_states)   CRC校验2byte
************************************************************************************************************************************************/


/**********************************************************************************************************************************************
升级包帧结构：68 xx xx xx xx xx xx(目标长地址或广播地址) 68   C  L    0x9D, 0x33, 0x33, 0x34(数据标识)  版本号2byte  总字节数2byte    总段数2byte  段序号2byte 段长度1byte 段数据 CS 16
************************************************************************************************************************************************/
#define USER_FLASH_LAST_PAGE_ADDRESS                   0x0800F800
#define USER_FLASH_END_ADDRESS                         0x0800FFFF   /* 64 KBytes */
#define FLASH_PAGE_SIZE                                0x400        /* 1 Kbytes  */


#define FLASH_API_ADDRESS                              0x08000000
#define FLASH_APPLICATION_ADDRESS                      0x08001000
    
#define FLASH_APPLICATION_BACK_ADDRESS                 0            //0x08008000      //此时用外部flash存储
#define FLASH_PARAMETER_ADDRESS                        0x0800FC00   //计量参数保存地址
#define FLASH_ELC_SAVE_ADDRESS                         0x0800F800   //电量参数保存地址
#define FLASH_UPDATE_PARAMS_ADDRESS                    0x0800F400   //升级参数保存地址
#define FLASH_LOCAL_ADDR_ADDRESS                       0x0800F000   //本地地址保存地址
    
    
#define FLASH_API_PAGES                                4
#define FLASH_APPLICATION_PAGES                        57
    
#define FLASH_PARAMETER_PAGES                          1
#define FLASH_ELC_SAVE_PAGES                           1
#define FLASH_UPDATE_PAGES                             1

#define TOTAL_UPDATE_BYTE                              137
#define UPDATE_PACKETS_STATUS_LEN                      128

#define UPDATE_VERSION_POS                             0
#define UPDATE_TOTAL_BYTE_POS                          2
#define UPDATE_TOTAL_PACKETS_POS                       4               
#define UPDATE_STATE_POS                               6
#define UPDATE_PACKET_STATES_POS                       7
#define UPDATE_CRC_POS                                 135

#define UPDATE_DEFAULT_PACKET_SIZE                     64

    
    
typedef enum
{
  IAP_start_addr        =    FLASH_API_ADDRESS,
  app_start_addr        =    FLASH_APPLICATION_ADDRESS,
  app_back_start_addr   =    FLASH_APPLICATION_BACK_ADDRESS,//location in external flash
  update_params_addr    =    FLASH_PARAMETER_ADDRESS,
}em_update_info;


typedef enum
{
    UPDATE_END = 0,
    UPDATE_RUNNING,
    UPDATE_FINISH,
    UPDATE_SUCCESS,
    UPDATE_FAILED,
}EM_UPDATE_STATUS;


typedef struct
{
  u16 totoalBytes;
  u16 total_packets;
  u16 current_packet_No;
  u16 crcValue;
  u16  version;
  u8  status;
  u8  packetsState[128];
}ST_UPDATE;

typedef struct
{
    u16 total_packets;
    u16 total_bytes;
    u16 current_packet_No;
    u16  version;
    u8  *data;
    u8  packet_length;
    
}ST_update_packet_info;



/*
#define UPDATE_FLASH_PARAMETER_DDR            FLASH_PARAMETER_ADDRESS      
#define UPDATE_FLASH_LENGTH                   35
#define DEFAULT_UPDATE_PACKET_SIZE            128


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
    u8 control;
    u8 length ; 
    u8 *data ;  
    u8 cs ;    
}
ST_FRAME_645;
*/



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
void apl_process_update(u8 * buf);
void init_update(void);
void write_finish_debug(void);
PROCESS_NAME(apl_update_process);

#endif /* __APL_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

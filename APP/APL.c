/**
  ******************************************************************************
  * @file    apl.c
  * @author  William Liang
  * @version V1.0.0
  * @date    07/26/2013
  * @brief   This file contains application layer task and the initializtion of the variable.
  ******************************************************************************
  */ 


/* Includes ------------------------------------------------------------------*/
#include "common.h"
#include "apl.h"
#include "hal_uart.h"
#include "NWK.h"
#include "hal_gdflash.h"

/** @addtogroup Application Layer
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro ------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
extern u8 g_UartRxBuffer[];
extern ST_UART_FLAG g_UartRxFlag;
extern Manufacturer_Version phyVersion;
extern const u16 CRC16_CCITT_Table[256];
//ST_FRAME_645 frame645_instance;
//ST_UPDATE update_instance;

void reset_update_params(void);
bool proceess_packet(ST_update_packet_info * current_ptr, ST_UPDATE * flash_ptr);


char calibration[]         = "calibration:";
char pstart[]              = "pstart:";
char GPQA[]                = "GPQA:";
char phsA[]                = "phsA:"; 
char qphsal[]              = "qphsal:";
char Ku[]                  = "Ku:";
char Ki[]                  = "Ki:";
char Kp[]                  = "Kp:";
char PFCont[]              = "PFCont";
char energyPulse[]         = "energyPulse:";
char enegyDegree[]         = "enegyDegree:";

char *paralist[] = {calibration,pstart,GPQA,phsA,qphsal,Ku,Ki,Kp,PFCont,energyPulse, enegyDegree};



//static st_NWK_frame apl_nwk_inf;
st_APL_frame        apl_frame;

//static u8           apl_buf[255];
ST_UPDATE st_update;


/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

//应用层版本
__root const Manufacturer_Version aplVersion = 
{
  {'B', 'R'},//厂商代码 
  {'2', '3'},//芯片代码
   0x12, 0x12, 0x15,//日月年
  {0x011, 0x00}//版本
};


/*
process_event_t PROCESS_EVENT_RECEIVED;

PROCESS(apl_process, "aplication_process");
PROCESS_THREAD(apl_process, ev, data)
{
       
    PROCESS_BEGIN();
    
    while (1)
    {
        
    }
    
    PROCESS_END();
}
*/
void write_update_flash( );
u8 update_software_check(u16 totalBytes);
void set_update_packetState(u16 packetNo);
u8 check_update_packect_state(u16 packetNo);
bool check_update_state(u16 total_packets);
u8 check_update_packect_state(u16 packetNo);
void FLASH_Write_update_page(u16 packetNo, u8 * Data, u8 length);



void get_packet_info(u8 * buf, ST_update_packet_info * packet_info)
{
    packet_info->version           =  (u16)(buf[0]*256 + buf[1]);
    packet_info->total_bytes       =  (u16)(buf[2]*256 + buf[3]);
    packet_info->total_packets     =  (u16)(buf[4]*256 + buf[5]);
    packet_info->current_packet_No =  (u16)(buf[6]*256 + buf[7]);
    packet_info->packet_length     =  buf[8];
    packet_info->data              =  buf + 9;
}


PROCESS(apl_update_process, "update_process ");
PROCESS_THREAD(apl_update_process, ev, data)
{
    static u8 * buf = NULL;
    static ST_update_packet_info st_update_packet =  {0,0,0,0};
    static u8 g_updateBuffer[144] = {0}; //缓存，用来存储数据
    static bool update_buf_full = false;
    static struct etimer update_timer;
    
    PROCESS_BEGIN();
    
    while (1)
    {
        PROCESS_WAIT_EVENT(); 

        if (ev == PROCESS_EVENT_MSG)
        {   
            buf = (u8*)data;                          
            get_packet_info(buf, &st_update_packet);

            if (st_update_packet.current_packet_No >= st_update_packet.total_packets )
            {
               #ifdef PRINTF_DEBUG
                printf("packet no error\r\n");
               #endif
                continue; //升级包序号错误
            }

            if (st_update.status == UPDATE_END)//开始升级
            {
              #ifdef PRINTF_DEBUG
                printf("update start\r\n");
              #endif
                memcpy(g_updateBuffer, buf, st_update_packet.packet_length + 9);
                GDflash_64KByte_erase();
                memset(&st_update, 0 , sizeof(st_update));
                st_update.status        = UPDATE_RUNNING;
                st_update.version       = st_update_packet.version;
                st_update.totoalBytes   = st_update_packet.total_bytes;
                st_update.total_packets = st_update_packet.total_packets;
                update_buf_full = true;
                continue;
            }
            else if (st_update.status == UPDATE_RUNNING)
            {
                while(1)
                {
                    if (st_update.version == st_update_packet.version)  //1、是否与正在升级版本相同，
                    {
                        //重复帧不处理
                        if (check_update_packect_state( st_update_packet.current_packet_No) == 1)
                        {
                           #ifdef PRINTF_DEBUG
                            printf("the same packet\r\n");
                           #endif
                            
                           //检测升级是否完成
                           if (check_update_state(st_update.total_packets) == true)
                           {
                               //升级数据正确，马上升级或者等待升级命令再升级
                               #ifdef PRINTF_DEBUG
                               printf("update data OK, start update\r\n");
                               #endif
                               etimer_set(&update_timer, 500);
                               PROCESS_WAIT_EVENT_UNTIL((ev == PROCESS_EVENT_TIMER) && ((struct etimer *)data == &update_timer));
                              
                              SoftReset();
                              break;
                           }
                           break;
                        }
                        else//save
                        {
                            //先存当前收到的帧，再判断是否有缓存的帧，有的话，再处理缓存的帧
                            if (proceess_packet(&st_update_packet, &st_update) == true)
                            {
                              //升级数据正确，马上升级或者等待升级命令再升级
                               #ifdef PRINTF_DEBUG
                               printf("update data OK, start update\r\n");
                               #endif
                               etimer_set(&update_timer, 500);
                               PROCESS_WAIT_EVENT_UNTIL((ev == PROCESS_EVENT_TIMER) && ((struct etimer *)data == &update_timer));
                              
                              SoftReset();
                              break;
                            }
                            
                            if (update_buf_full == true)
                            {
                              update_buf_full = false;
                              get_packet_info(g_updateBuffer, &st_update_packet);
                              continue;
                            }
                            else
                            {
                              break;
                            }
                        }
                    }
                    else
                    {
                        //遇到与当前升级包程序不一样版本，重新开始升级
                        #ifdef PRINTF_DEBUG
                        printf("receive higher version,update start\r\n");
                        #endif
                        memcpy(g_updateBuffer, buf, st_update_packet.packet_length + 9);
                        reset_update_params();
                        GDflash_64KByte_erase();
                        st_update.status        = UPDATE_RUNNING;
                        st_update.version       = st_update_packet.version;
                        st_update.totoalBytes   = st_update_packet.total_bytes;
                        st_update.total_packets = st_update_packet.total_packets;
                        update_buf_full = true;
                        break;
                    }
                }
            }
            else
            {
               //当升级状态为finish的时候，再本程序设计中是不存在的，
               //当为finish的时候，会自动复位，APP程序中，会把finish状态檫除
               //但是在以后的升级中，可能会存在，在升级完成后，必须要接收到升级指令，才升级，所以程序可能存在finish的升级状态
              continue;
            }
        }
    }
    
    PROCESS_END();
}

//允许接收后，判断，存储
bool proceess_packet(ST_update_packet_info * current_ptr, ST_UPDATE * flash_ptr)
{
    
    if (current_ptr->current_packet_No < (flash_ptr->total_packets) )
    {
       //收到数据包长度错误,丢弃不管
       if (current_ptr->packet_length > UPDATE_DEFAULT_PACKET_SIZE )
       {
         #ifdef PRINTF_DEBUG
         printf("packet length err\r\n");
         #endif
         return false;
       }
    }
    else
    {
       #ifdef PRINTF_DEBUG
       printf("packet number err\r\n");
       #endif
       return false;
    }

    //1、先将数据写入flash
    printf("write in flash packet number = %d \r\n", current_ptr->current_packet_No);
    FLASH_Write_update_page(current_ptr->current_packet_No, current_ptr->data, current_ptr->packet_length);
    //2、更新内存中的已收到数据包标志
    set_update_packetState(current_ptr->current_packet_No);
    //3、检测是否接收完成

    if (check_update_state(flash_ptr->total_packets) == true)
    {
        //4、完整读出flash验证 
        if (update_software_check(current_ptr->total_bytes) == 0)
        {   //5、验证正确,升级成功
            flash_ptr->status = UPDATE_FINISH;
            //6、更新升级参数
            write_update_flash(flash_ptr);

            return true;
        }
        else
        {
            //7、错误，复位升级数据
            #ifdef PRINTF_DEBUG
            printf("update crc err\r\n");
            #endif
            reset_update_params();
            return false;
        }
    }
    else
    {
        //8、升级未完成，保存升级数据
        #ifdef PRINTF_DEBUG
        printf("wait update packets\r\n");
        #endif
        write_update_flash(flash_ptr);
        return false;
    }  
}




#if 0
/*****************************************************************************
 Prototype    : read_flash
 Description  : read specifically length data from flash memory
 Input        :  
 Output       : None
 Return Value : 
 Date         : 2015/11/16
 Author       : Barry
*****************************************************************************/
void read_flash(u32 addr ,u8 * str, u16 len)
{
  for (u16 i = 0; i < len; i++)
  {
     str[i]  = *((char*)(addr +i));
  }
}

/*****************************************************************************
 Prototype    : APL_data_indication
 Description  : APL参数解析
 Input        :  
 Output       : None
 Return Value : 
 Date         : 2015/11/16
 Author       : Barry
*****************************************************************************/

void APL_data_indication(st_NWK_frame *nwk_ptr, u8 *apl_frame_ptr)
{
    //apl不开辟缓存，当前帧没有处理完，不接受下一帧
    if (apl_busy == true)
    {
      return;
    }
    
    apl_busy = true;

    //复制网络层信息，准备应答用
    memcpy(&apl_nwk_inf, nwk_ptr, sizeof(st_NWK_frame));

    //复制APL帧数据到APL层，释放下层去接收新数据
    memcpy(apl_buf, apl_frame_ptr, apl_nwk_inf.frame_data_length);

    //读取帧控制域
    *((u8 *)&apl_frame) = apl_buf[0];

    switch (apl_frame.ctrl.frame_type)
    {
        case APL_TYPE_DATA_TRANSPARENT:
        //暂时不处理
        break;
        
        case APL_TYPE_DATA_OBJECT:
         //解出端点信息，组地址信息，APS帧序号，扩展头信息，帧载荷信息
         /***************************************************************************************
          数据帧格式 
          帧控制域   目标端点  组地址（可能不存在）   源端点   APS帧序号   扩展头（可能不存在）   帧载荷
          ***************************************************************************************/
          if ( (apl_frame.ctrl.frame_tran_mod == APL_TRANSPORT_SINGLE) || (apl_frame.ctrl.frame_tran_mod == APL_TRANSPORT_BROADCAST))//单播，没有组地址
          {
            if (apl_frame.ctrl.frame_ext_head_inication == 0)//单播，没有组地址，没有扩展头
            {
                apl_frame.source_point = apl_buf[1];
                apl_frame.end_point    = apl_buf[2];
                apl_frame.frame_number = apl_buf[3];
                apl_frame.data         = &apl_buf[4];
                //process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_RF_LoRa.rf_state));
            }
            else
            {
                //单播，没有组地址，有扩展头
                return;
            }
            
          }
          else
          {
            //多播或广播，没有组地址，有扩展头
            return;
          }
        break;
        
        case APL_TYPE_CMD:
        break;
        
        case APL_TYPE_CONFIRM:
        break;
        
        default:
        break;
    }
}

#endif


/**********************************************************************************************************************************************
升级flash参数区排列：版本号1byte   总字节数(2byte)  总段数2byte  升级状态/1B(status) 升级包状态表/128byte(packets_states)   CRC校验2byte
#define UPDATE_VERSION_POS                        0   版本号
#define UPDATE_TOTAL_BYTE_POS                     2   总字节数
#define UPDATE_TOTAL_PACKETS_POS                  4   总段数               
#define UPDATE_STATE_POS                          6   升级状态
#define UPDATE_PACKET_STATES_POS                  7   升级包状态表
#define UPDATE_CRC_POS                            135 CRC
************************************************************************************************************************************************/
bool read_update_flash(ST_UPDATE *st_update_Structure)
{  
    bool retVal;
  
    memcpy(st_update_Structure, (u8*)FLASH_UPDATE_PARAMS_ADDRESS, sizeof(ST_UPDATE));
   
   retVal = ( GetCRC16((u8*)st_update_Structure,  sizeof(ST_UPDATE) - 2) == st_update_Structure->crcValue)? \
   true:false;

   return retVal;
}


void write_update_flash(ST_UPDATE *st_update_Structure )
{
    st_update_Structure->crcValue = GetCRC16((u8*)st_update_Structure, sizeof(ST_UPDATE) - 2);

    if (FLASH_ErasePage(FLASH_UPDATE_PARAMS_ADDRESS) == FLASH_COMPLETE)
    {
       FLASH_Write_chars( FLASH_UPDATE_PARAMS_ADDRESS,  (u8*)st_update_Structure, sizeof(ST_UPDATE));
    }  
    
}

void write_finish_debug(void)
{
   ST_UPDATE tempupdate;
   
   tempupdate.version = 5;
   tempupdate.current_packet_No = 719;
   tempupdate.totoalBytes  = 46038;
   tempupdate.total_packets = 720;
   tempupdate.status        = UPDATE_FINISH;
   write_update_flash(&tempupdate );
}

void printf_params(void)
{
 #ifdef PRINTF_DEBUG
  printf("apl_version = %d\r\n", st_update.version);
  printf("total_packets = %d\r\n", st_update.total_packets);
  printf("status = %d\r\n", st_update.status);
  printf("totoalBytes = %d\r\n",   st_update.totoalBytes);
  printf("apl_packetsState = ");
  
  for (u16 i = 0; i < UPDATE_PACKETS_STATUS_LEN; i++)
  {
      printf(" %d", st_update.packetsState[i]);
  }
  printf("\r\n");
  #endif
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
*****************************************************************************/
void reset_update_params(void)
{
    memset(&st_update, 0 , sizeof(st_update));
    write_update_flash(&st_update);   
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
*****************************************************************************/
u8 update_software_check(u16 totalBytes)
{
  u16 temp;
  u16 crc16 = 0xFFFF;
  u16 count = totalBytes - 2;
  u8 flash_temp;
  u32 current_flash_addr = FLASH_APPLICATION_BACK_ADDRESS;

  while (count--)
  {
    GDflash_read(current_flash_addr, &flash_temp, 1);
    current_flash_addr++;
    crc16 = (crc16 >> 8 ) ^ CRC16_CCITT_Table[(crc16 ^ flash_temp) & 0xFF];
  }
  crc16 ^= 0xFFFF;

  GDflash_read(current_flash_addr, &flash_temp, 1);
  current_flash_addr++;
  temp =  (u16)flash_temp*256;
  
  GDflash_read(current_flash_addr, &flash_temp, 1);
  current_flash_addr++;
  temp +=  flash_temp;
  
  if (crc16 == temp)
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

/*****************************************************************************
 *
验证程序CRC是否正确
 *
 *
 *
 *
 *
*****************************************************************************/
void init_update(void)
{
  GDflash_init();
  
  read_update_flash(&st_update);

  switch (st_update.status)
  {
    case UPDATE_RUNNING:
      if (st_update.totoalBytes == 0) /*  处于升级但是没有收到数据 ,错误 */
      {
        reset_update_params();
      }
    break;
    
   /*
    case UPDATE_FINISH:
      //这里在以后会出现这种情况，升级数据接收成功，但是没有接收到升级指令，就不升级，复位后升级状态表示finish
      //本次程序不会出现这种情况
    break;
    */

    case UPDATE_END:
     memset(&st_update, 0 , sizeof(st_update));
    break;
    
    case UPDATE_FAILED:
 #ifdef PRINTF_DEBUG
      printf("update failed\r\n");
 #endif
      reset_update_params();
    break;

    case UPDATE_SUCCESS:
#ifdef PRINTF_DEBUG
    printf("update successful\r\n");
 #endif
      reset_update_params();
    break;

    default:
      reset_update_params();
    break; 
  }
}

/* 这里的包序号是从1开始计算的，1~总包数，从零开始计算将  packetNo - 1，改为 packetNo*/
void set_update_packetState(u16 packetNo)
{
  st_update.packetsState[packetNo/8] |= (1<<(packetNo%8));
}

/* 这里的包序号是从1开始计算的，1~总包数， 从零开始计算将  packetNo - 1，改为 packetNo */
u8 check_update_packect_state(u16 packetNo)
{
  if (st_update.packetsState[packetNo/8] & (1<<(packetNo%8)) )
  {
    return 1;
  }
  else
  {
    return 0;
  }
  
}

/*****************************************************************************
 *
检测所有的包是否接收完成
 *
 *
 *
 *
*****************************************************************************/
bool check_update_state(u16 total_packets)
{
  for (u16 j = 0;  j < total_packets; j++)
  {
      if (check_update_packect_state(j) == 0)
      {
        printf("packet %d not have\r\n", j);
        return false;
      }
  }
  return true;
}


/*****************************************************************************
 *
将收到的数据按照包的方式，依次存入正确的位置，每个包的长度为64字节，除了最后一个包可能是变长
 *此处依然存在包计数从0开始
 *
 *
 *
 *
*****************************************************************************/
void FLASH_Write_update_page(u16 packetNo, u8 * Data, u8 length)
{
  u32 packet_start_addr = packetNo * UPDATE_DEFAULT_PACKET_SIZE;
  
  __disable_irq();
  GDflash_write(packet_start_addr, Data, length);
  __enable_irq();
}
  

/******************************************************************************
          Debug Command Function                       
******************************************************************************/

/**
  * @brief  Read each layer version.
  * @param  None.
  * @retval  None.
  */
void ReadVersion(void)
{
  u8 buf[sizeof(Manufacturer_Version)];
  
  buf[0] = aplVersion.venderID[0];
  buf[1] = aplVersion.venderID[1];
  buf[2] = aplVersion.chipID[0];
  buf[3] = aplVersion.chipID[1];
  buf[4] = aplVersion.date;
  buf[5] = aplVersion.month;
  buf[6] = aplVersion.year;
  buf[7] = aplVersion.version[0];
  buf[8] = aplVersion.version[1];
  
   #ifdef PRINTF_DEBUG
  printf("APL Version=%c%c%c%c-%02x%02x%02x-V%02x.%02x\r\n", \
     buf[1], buf[0], buf[3], buf[2], buf[6], buf[5], buf[4], buf[8], buf[7]);
   #endif
     
   buf[0] = phyVersion.venderID[0];
   buf[1] = phyVersion.venderID[1];
   buf[2] = phyVersion.chipID[0];
   buf[3] = phyVersion.chipID[1];
   buf[4] = phyVersion.date;
   buf[5] = phyVersion.month;
   buf[6] = phyVersion.year;
   buf[7] = phyVersion.version[0];
   buf[8] = phyVersion.version[1];

     #ifdef PRINTF_DEBUG
   printf("PHY Version=%c%c%c%c-%02x%02x%02x-V%02x.%02x\r\n", \
      buf[1], buf[0], buf[3], buf[2], buf[6], buf[5], buf[4], buf[8], buf[7]);
     #endif
}

/**
  * @brief  Software Reset.
  * @param  None.
  * @retval  None.
  */
void SoftReset(void)
{
  __disable_irq();;
  NVIC_SystemReset();
}


/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

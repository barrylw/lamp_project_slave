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
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
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
char g_updateBuffer[1024] = {0};
void reset_update_params(void);

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

static st_NWK_frame nwk_frame_buf;
st_NWK_frame * nwk_frame_ptr = &nwk_frame_buf;


/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

//应用层版本
__root const Manufacturer_Version aplVersion = 
{
  {'B', 'R'},//厂商代码 
  {'2', '3'},//芯片代码
  0x30, 0x01, 0x14,//日月年
  {0x00, 0x01}//版本
};

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
 Prototype    : read_params_area
 Description  : read all data from flash
 Input        :  
 Output       : None
 Return Value : 
 Date         : 2015/11/16
 Author       : Barry
*****************************************************************************/
void read_params_area(u32 addr)
{
  for (u16 i = 0; i < 1024; i++)
  {
     g_updateBuffer[i]  = *((char*)addr +i);
     
     if (g_updateBuffer[i] == 0xFF)
     {
       g_updateBuffer[i] = 0;
       break;
     }
     
  }
}

/*****************************************************************************
 Prototype    : find_params
 Description  : find caliborate param
 Input        :  
 Output       : None
 Return Value : 
 Date         : 2015/11/16
 Author       : Barry
*****************************************************************************/
bool find_params(u8 pos, void * val)
{
  char *p = NULL;
  
  char valtemp[15] = {0};
  
  p = (char*)(strstr(g_updateBuffer, paralist[pos]));
  
  if (p ==NULL)
  {
    return false;
  }
  else
  {
    for (u8 i = 0;i < 15; i++)
    {
      if (*(p + strlen(paralist[pos]) + i)  != ';') 
      {
        valtemp[i] = *(p + strlen(paralist[pos]) + i);
      }
      else
      {
        break;
      }
    }
   
    if ( (pos == 5) || (pos == 6) || (pos == 10))
    {
       *((u32*)val) = (u32)(atoi(valtemp));
    }
    else if(pos == 7)
    {
      *((float*)val) = (atof(valtemp));
    }
    else
    {
      *((u16*)val) = (u16)(atoi(valtemp));
    }
    
    return true;
  }
}

#if 0
/***********************************************************
帧解析步骤:
1、判断是上行帧还是下行帧
1、判断NID是否正确
2、判断版本是否正确
3、判断是源路由还是盲中继
3、判断是否使用缩位地址
4、解析地址域
5、获取参数，1 帧类型  
注释: 此函数定义在APL层，由NWK层调用, 
u8 * nwk_packet, u8 length 分别必须由 PHY_data_indication() 得来的数据赋值
nwk_frame_ptr是全局变量，用来传递数据
************************************************************/
void NWK_data_indication(u8 * nwk_packet, u8 length)
{
    st_addr_area  addr_area;
    ST_NWK_head * nwk_head_ptr = 0;
    u8 *          current_ptr  = 0;
    u8            addr_area_pos;
    u16 temp;
    u8            compressed_list_len;

     /* 复制到NID为止 */
     memcpy((u8*)(nwk_frame_ptr), nwk_packet, EM_NWK_VAR);

     nwk_head_ptr = &(nwk_frame_ptr->head);
     
     temp = (u16)(nwk_head_ptr->NID[0]) + nwk_head_ptr->NID[1]*256;
     
     if ( (temp != LOCAL_NID) &&  (temp != broadcast_addr) )
     {
       return ;
     }
     
     if (nwk_head_ptr->version != nwk_pib.current_version)
     {
       return ; /*发现网络中有节点版本不一致，不执行命令，上报版本错误*/
     }

     addr_area_pos = (nwk_head_ptr->direction == 0)? EM_NWK_VAR:(EM_NWK_VAR + 2);

     if (nwk_head_ptr->direction == 1)//上行帧
     {
        nwk_head_ptr->tx_RSSI = nwk_packet[EM_NWK_VAR];
        nwk_head_ptr->rx_RSSI = nwk_packet[EM_NWK_VAR+1];
        addr_area_pos = EM_NWK_VAR + 2;
     }
     else
     {
        addr_area_pos = EM_NWK_VAR;
     }
    

    if (nwk_head_ptr->route_type == ROUTE_SOURCE_MODE)//源路由
    {
        *(u8*)(&addr_area)    = nwk_packet[addr_area_pos];

        current_ptr = nwk_packet + addr_area_pos + 1;
        if (nwk_head_ptr->compression_addr_enable  == 1) //使用缩位地址
        {
            nwk_frame_ptr->addr_uint_len = 6;
            nwk_frame_ptr->addr_list_len = dempress_addr_list(current_ptr, nwk_frame_ptr->addr_list, addr_area.relay_level, &compressed_list_len); 
            current_ptr += compressed_list_len;
        }
        else
        {
            nwk_frame_ptr->addr_uint_len = (nwk_head_ptr->relay_addr_type == LONG_ADDR_TYPE)? 6:2;
            nwk_frame_ptr->addr_list_len  =  nwk_frame_ptr->addr_uint_len *  (addr_area.relay_level+2);
            memcpy(nwk_frame_ptr->addr_list, current_ptr, nwk_frame_ptr->addr_list_len );
            current_ptr += nwk_frame_ptr->addr_list_len;
        }
        
        nwk_frame_ptr->frame_data_length = length - nwk_frame_ptr->addr_list_len - (addr_area_pos + 1);
        memcpy(nwk_frame_ptr->frame_data, current_ptr, nwk_frame_ptr->frame_data_length);
    }
    else //盲中继
    {
     
        //忙中继参数
    }
}


void analyse_APS_frame(st_NWK_frame * nwk_frame_ptr, )
{
    
}

#endif

#if 0
u8 modify_update_flash_params(u8 params)
{
  u32 startADDR = UPDATE_FLASH_PARAMETER_DDR;
  u8 tempBuf[UPDATE_FLASH_LENGTH + 2];
  u16 crcValue = 0;

  if (params & UPDATE_ALL_MASK == 0)
  {
    return FLASH_PARAM_ERROR;
  }
  
  if (params & UPDATE_ALL_MASK != UPDTE_ALL)
  {
    /* 读 */
    for (u8 i = 0; i < UPDATE_FLASH_LENGTH + 2; i++)
    {
      tempBuf[i] = *((u8*)(UPDATE_FLASH_PARAMETER_DDR + i ));
    }
    

     /*  check CRC */
    crcValue = GetCRC16(tempBuf, UPDATE_FLASH_LENGTH);

    if (crcValue != (u16)(tempBuf[UPDATE_FLASH_LENGTH + 1]*256 + tempBuf[UPDATE_FLASH_LENGTH]))
    {
        reset_update_params();
        return FLASH_READ_ERROR;
    }
  }

  if (FLASH_ErasePage(UPDATE_FLASH_PARAMETER_DDR) == FLASH_COMPLETE)
  {
    if (params & UPDATE_TOTALBYTES_MASK)
    { 
      tempBuf[TOTALBYTES_OFFSET] = (u8)(update_instance.totoalBytes);
      tempBuf[TOTALBYTES_OFFSET + 1] = (u8)(update_instance.totoalBytes >> 8);
    }

    if (params & UPDATE_PACKETNO_MASK)
    {
      tempBuf[PACKETNO_OFFSET] = update_instance.packetNo;
    }
    

    if (params & UPDATE_STATUS_MASK)
    {
      tempBuf[STATUS_OFFSET] = update_instance.status;
    }

    if (params & UPDATE_VERSION_MASK)
    {
      tempBuf[VERSION_OFFSET] = update_instance.version; 
    }

    if (params & UPDATE_PACKETSTATE_MASK)
    {
      
      MemCpy( &tempBuf[PACKETSTATE_OFFSET], update_instance.packetsState,  PACKETSTATE_LENGTH);
    }
    /* 写 */
    crcValue = GetCRC16(tempBuf, UPDATE_FLASH_LENGTH);
    tempBuf[UPDATE_FLASH_LENGTH]     = (u8)(crcValue & 0xFF);
    tempBuf[UPDATE_FLASH_LENGTH + 1] = (u8)((crcValue >> 8) & 0xFF);
    
    return (FLASH_Write_chars( &startADDR,  tempBuf, UPDATE_FLASH_LENGTH + 2));
  }
  else
  {
     return FLASH_ERASE_ERROR; 
  }
}


u32 read_update_flash_params(u8 paramType, u8 *buffer)
{
    u8 tempBuf[UPDATE_FLASH_LENGTH + 2];
    u16 crcValue;

    if (paramType & UPDATE_ALL_MASK == 0)
    {
        return FLASH_PARAM_ERROR;
    }

    /* read data from flash */
    for (u8 i = 0; i < (UPDATE_FLASH_LENGTH + 2); i++)
    {
        tempBuf[i] = *((u8*)(UPDATE_FLASH_PARAMETER_DDR + i ));
    }
    

    /*  check CRC */
    crcValue = GetCRC16(tempBuf, UPDATE_FLASH_LENGTH);

    if (crcValue != (u16)(tempBuf[UPDATE_FLASH_LENGTH + 1]*256 + tempBuf[UPDATE_FLASH_LENGTH]))
    {
        return FLASH_READ_ERROR;
    }


    
    switch (paramType)
    {
      case UPDATE_TOTALBYTES:
        for (u8 i = 0; i < TOTALBYTES_LENGTH; i++)
        {
           buffer[i] = tempBuf[i];
        }
      break;
      
      case UPDATE_PACKETNO:
        buffer[0] = tempBuf[PACKETNO_OFFSET];                
      break;
      
      case UPDATE_STATUS:
        buffer[0] = tempBuf[STATUS_OFFSET];                    
      break;

      case UPDATE_VERSION:
        buffer[0] = tempBuf[VERSION_OFFSET];                    
      break;
      
      case UPDATE_PACKETSTATE:
        for (u8 i = 0; i < PACKETSTATE_LENGTH; i++)
        {
           buffer[i] =  tempBuf[PACKETSTATE_OFFSET];                   
        }
      break;

      default:
      break;
    }
    
    return FLASH_OK;
}



void reset_update_params(void)
{
    u16 crcValue;
    
    u8 tempBuf[UPDATE_FLASH_LENGTH + 2];
    
    u32 startADDR = UPDATE_FLASH_PARAMETER_DDR;
    
    update_instance.totoalBytes = 0;
    update_instance.packetNo    = 0;
    update_instance.status      = UPDATE_END;
    update_instance.version     = 0;
    MemSet( update_instance.packetsState,  0, PACKETSTATE_LENGTH);
    
    tempBuf[TOTALBYTES_OFFSET]     = (u8)(update_instance.totoalBytes);
    tempBuf[TOTALBYTES_OFFSET + 1] = (u8)(update_instance.totoalBytes >> 8);
    tempBuf[PACKETNO_OFFSET]       = update_instance.packetNo;
    tempBuf[STATUS_OFFSET]         = update_instance.status;
    tempBuf[VERSION_OFFSET]        = update_instance.version; 
    MemSet( &tempBuf[PACKETSTATE_OFFSET], 0,  PACKETSTATE_LENGTH);
    
    crcValue = GetCRC16(tempBuf, UPDATE_FLASH_LENGTH);
    tempBuf[UPDATE_FLASH_LENGTH]     = (u8)(crcValue & 0xFF);
    tempBuf[UPDATE_FLASH_LENGTH + 1] = (u8)((crcValue >> 8) & 0xFF);
     
    if (FLASH_ErasePage(UPDATE_FLASH_PARAMETER_DDR) == FLASH_COMPLETE)
    {
       FLASH_Write_chars( &startADDR,  tempBuf, UPDATE_FLASH_LENGTH + 2);
    }  
}

u8 update_software_check(u16 totalBytes)
{
  u16 temp;
  u16 crc16 = 0xFFFF;
  u16 count = totalBytes - 2;
  u8 * pbuffer = (u8*)(FLASH_APPLICATION_BACK_ADDRESS);
  
  while (count--)
  {
    crc16 = (crc16 >> 8 ) ^ CRC16_CCITT_Table[(crc16 ^ *pbuffer++) & 0xFF];
  }
  crc16 ^= 0xFFFF;
  
  temp =  (u16)(*pbuffer++);
  temp +=  (u16)(*pbuffer++) * 256;
  
  if (crc16 == temp)
  {
    return 0;
  }
  else
  {
    return 1;
  }
}



void init_update(void)
{
  u8 tempTotalByte;
  
  update_instance.status = UPDATE_UNKNOW;
  
  read_update_flash_params(UPDATE_STATUS,&(update_instance.status));

  switch (update_instance.status)
  {
    case UPDATE_RUNNING:
   
    read_update_flash_params(UPDATE_TOTALBYTES,  &tempTotalByte);
    update_instance.totoalBytes = (u16)tempTotalByte;
    read_update_flash_params(UPDATE_TOTALBYTES,  &tempTotalByte);
    update_instance.totoalBytes += (((u16)tempTotalByte) << 8);
    read_update_flash_params(UPDATE_PACKETNO,    &update_instance.packetNo );
    read_update_flash_params(UPDATE_PACKETSTATE, update_instance.packetsState);

    if (update_instance.packetNo == 0) /*  处于升级但是没有收到包 ，错误 */
    {
      
       reset_update_params();
    }
    break;

    case UPDATE_FINISH:
     // SoftReset();
      reset_update_params();
    break;

    case UPDATE_END:
      update_instance.packetNo = 0;
      MemSet( update_instance.packetsState,  0, PACKETSTATE_LENGTH);
    break;

    default:
      reset_update_params();
    break; 
  }
}

/**
  * @brief  Handle application layer task in the main loop.
  * @param  None.
  * @retval None.
  */
void APLTASK(void)
{
}

/**
  * @brief  Initialize global variable in the application layer.
  * @param  None.
  * @retval None.
  */
void InitAplVariable(void)
{
}



u8 get_update_packets(u16 totalBytes)
{
  u8 count;

  count = totalBytes / DEFAULT_UPDATE_PACKET_SIZE;

  if (totalBytes % DEFAULT_UPDATE_PACKET_SIZE)
  {
    count += 1;
  }

  return count;  
}


void set_update_packetState(u8 packetNo)
{
  update_instance.packetsState[(packetNo - 1)/8] |= (1<<((packetNo - 1)%8));
}


u8 check_update_packect_state(u8 packetNo)
{
  if (update_instance.packetsState[(packetNo - 1)/8] & (1<<((packetNo - 1)%8)))
  {
    return 1;
  }
  else
  {
    return 0;
  }
  
}

u8 check_update_state(void)
{
  u8 tempPacket = get_update_packets(update_instance.totoalBytes);
   
  for (u8 j = 0;  j < tempPacket; j++)
  {
      if (check_update_packect_state(j + 1) == 0)
      {
        return 1;
      }
  }
  
  return 0;
}

void copy_update_datas(u8 packetNo)
{
   MemCpy(&g_updateBuffer[(packetNo - 1)*DEFAULT_UPDATE_PACKET_SIZE], frame645_instance.data+4, frame645_instance.data[3]);
}

uint32_t FLASH_Write_update_page(u8 packetNo, u8 * Data, u8 length)
{
  u32 page_start_addr = ((packetNo - 1) /8)*FLASH_PAGE_SIZE + FLASH_APPLICATION_BACK_ADDRESS;
  
  if (packetNo == 129)
  {
    packetNo = 129;
  }
  
  for (u16 i = 0; i < FLASH_PAGE_SIZE; i++)
  {
    g_updateBuffer[i] = *((u8*)(page_start_addr+i));
  }

  for (u8 i = 0; i < length; i++)
  {
    g_updateBuffer[((packetNo - 1)%8)*DEFAULT_UPDATE_PACKET_SIZE+i] = Data[i];
  }
  
  
  if (FLASH_ErasePage(page_start_addr) == FLASH_COMPLETE)
  {
    return (FLASH_Write_chars(&page_start_addr,g_updateBuffer ,FLASH_PAGE_SIZE));
     
  }
  else
  {
    return 2;
  }
}


void printf_params(void)
{
  u8 tempBuf[UPDATE_FLASH_LENGTH];
  
  tempBuf[TOTALBYTES_OFFSET]     = (u8)(update_instance.totoalBytes);
  tempBuf[TOTALBYTES_OFFSET + 1] = (u8)(update_instance.totoalBytes >> 8);
  tempBuf[PACKETNO_OFFSET]       = update_instance.packetNo;
  tempBuf[STATUS_OFFSET]         = update_instance.status;
  tempBuf[VERSION_OFFSET]        = update_instance.version; 
  MemCpy( &tempBuf[PACKETSTATE_OFFSET], update_instance.packetsState,  PACKETSTATE_LENGTH);
  
  for (u8 i =  0; i < UPDATE_FLASH_LENGTH; i++)
  {
    printf("%x  ",tempBuf[i]);
  }
  printf("\n");
}

  

/**
  * @brief  Process uart command.
  * @param  None.
  * @retval  None.
  */
void apl_ProcessUartCmd(void)
{
  u16 totalByte;
  
#if 0
  printf("Uart Receive Packet:\r\n");
  for (u16 i = 0; i < g_UartRxFlag.fLen; i++)
  {
    printf("%02x ", g_UartRxBuffer[i]);
  }
  printf("\r\n");
#endif
  
  frame645_instance.control = g_UartRxBuffer[8];
  frame645_instance.length  = g_UartRxBuffer[9];
  frame645_instance.data    = &g_UartRxBuffer[10];
  frame645_instance.cs      = g_UartRxBuffer[10+g_UartRxBuffer[9]];
  
 // if (getSum(g_UartRxBuffer, 10+ g_UartRxBuffer[9]) == g_UartRxBuffer[10+g_UartRxBuffer[9]])
  if (getSum(g_UartRxBuffer, 10+ frame645_instance.length) ==  frame645_instance.cs)
  {
    
    
    switch (frame645_instance.control)
    {
        case 0x00:
        
        update_instance.packetNo    = frame645_instance.data[3];
        
        totalByte = (u16)(frame645_instance.data[1] + frame645_instance.data[2]*256);
        
            if (update_instance.packetNo > get_update_packets(totalByte))
            {
                /* 帧号错误 */
                return;
            }
          
            /* 版本号相同 */
            if (update_instance.version == frame645_instance.data[0])
            {
                /* 升级状态*/
                if (update_instance.status == UPDATE_RUNNING)
                {
                    /* 判断是否是重复帧 */
                    if (check_update_packect_state( update_instance.packetNo) == 1)
                    {
                        return;
                    }
                }
                else
                {
                    return;
                }
            }
            else
            {
                /* 初始化升级变量，重新升级 */
                update_instance.totoalBytes = totalByte;
                  
                update_instance.version = frame645_instance.data[0];

                update_instance.status  =  UPDATE_START;
            }


            if (FLASH_Write_update_page(update_instance.packetNo, frame645_instance.data+5,frame645_instance.data[4]) == 0)
            {     
                if (update_instance.status  ==  UPDATE_START)
                {
                  update_instance.status = UPDATE_RUNNING;
                }
                
                set_update_packetState(update_instance.packetNo);
                
                if (check_update_state() == 0)
                {
                       /* 完整读出flash验证 */
                  if (update_software_check(update_instance.totoalBytes) == 0)
                  {
                      update_instance.status = UPDATE_FINISH;
                      modify_update_flash_params(UPDTE_ALL);
                      SoftReset();
                  }
                  else
                  {
                      reset_update_params();
                  }
                }
                else
                {
                   modify_update_flash_params(UPDTE_ALL);
                   printf_params();
                }
          }  
      }
   }
}
#endif

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
  
  printf("APL Version=%c%c%c%c-%02x%02x%02x-V%02x.%02x\r\n", \
     buf[1], buf[0], buf[3], buf[2], buf[6], buf[5], buf[4], buf[8], buf[7]);
     
   buf[0] = phyVersion.venderID[0];
   buf[1] = phyVersion.venderID[1];
   buf[2] = phyVersion.chipID[0];
   buf[3] = phyVersion.chipID[1];
   buf[4] = phyVersion.date;
   buf[5] = phyVersion.month;
   buf[6] = phyVersion.year;
   buf[7] = phyVersion.version[0];
   buf[8] = phyVersion.version[1];
   
   printf("PHY Version=%c%c%c%c-%02x%02x%02x-V%02x.%02x\r\n", \
      buf[1], buf[0], buf[3], buf[2], buf[6], buf[5], buf[4], buf[8], buf[7]);
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

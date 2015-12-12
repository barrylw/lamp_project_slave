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
void proceess_packet(ST_update_packet_info * current_ptr, ST_UPDATE * flash_ptr);


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



static st_NWK_frame apl_nwk_inf;
st_APL_frame        apl_frame;

//static u8           apl_buf[255];
ST_UPDATE st_update;


/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

//Ӧ�ò�汾
__root const Manufacturer_Version aplVersion = 
{
  {'B', 'R'},//���̴��� 
  {'2', '3'},//оƬ����
   0x12, 0x12, 0x15,//������
  {0x00, 0x00}//�汾
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
    static u8 g_updateBuffer[144] = {0}; //���棬�����洢����
    static bool update_buf_full = false;
    
    PROCESS_BEGIN();
    
    while (1)
    {
        PROCESS_WAIT_EVENT(); 

        if (ev == PROCESS_EVENT_MSG)
        {   
            buf = (u8*)data;                          
            get_packet_info(buf, &st_update_packet);

            /*
            if (st_update_packet.version == (aplVersion.version[0] + aplVersion.version[1]*256) )
            {
                printf("the same version\r\n");
                continue; //��������Ŵ���
            }
            */
            
            if (st_update_packet.current_packet_No >= st_update_packet.total_packets )
            {
                printf("packet no error\r\n");
                continue; //��������Ŵ���
            }

            if (st_update.status == UPDATE_END)//��ʼ����
            {
                printf("update start\r\n");
                memcpy(g_updateBuffer, buf, st_update_packet.packet_length + 9);
                GDflash_64KByte_erase();
                memset(&st_update, 0 , sizeof(st_update));
                st_update.status        = UPDATE_RUNNING;
                st_update.version       = st_update_packet.version;
                st_update.totoalBytes   = st_update_packet.total_bytes;
                st_update.total_packets = st_update_packet.total_packets;
                update_buf_full = true;
                printf("update version = %d, update_totoalBytes = %d, update_totalPackets = %d\r\n",st_update.version, st_update.totoalBytes, st_update.total_packets);
                continue;
            }
            else if (st_update.status == UPDATE_RUNNING)
            {
                while(1)
                {
                    if (st_update.version == st_update_packet.version)  //1���Ƿ������������汾��ͬ��
                    {
                        //�ظ�֡������
                        if (check_update_packect_state( st_update_packet.current_packet_No) == 1)
                        {
                            printf("the same packet\r\n");
                            break;
                        }
                        else//save
                        {
                            //�ȴ浱ǰ�յ���֡�����ж��Ƿ��л����֡���еĻ����ٴ������֡
                            proceess_packet(&st_update_packet, &st_update);
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
                        //�����뵱ǰ����������һ���汾�����¿�ʼ����
                        printf("receive higher version,update start\r\n");
                        memcpy(g_updateBuffer, buf, st_update_packet.packet_length + 9);
                        reset_update_params();
                        GDflash_64KByte_erase();
                        st_update.status        = UPDATE_RUNNING;
                        st_update.version       = st_update_packet.version;
                        st_update.totoalBytes   = st_update_packet.total_bytes;
                        st_update.total_packets = st_update_packet.total_packets;
                        update_buf_full = true;
                        printf("update version = %d, update_totalPackets = %d\r\n",st_update.version, st_update.total_packets);
                        break;
                    }
                }
            }
            else
            {
               //������״̬Ϊfinish��ʱ���ٱ�����������ǲ����ڵģ�
               //��Ϊfinish��ʱ�򣬻��Զ���λ��APP�����У����finish״̬�߳�
               //�������Ժ�������У����ܻ���ڣ���������ɺ󣬱���Ҫ���յ�����ָ������������Գ�����ܴ���finish������״̬
              continue;
            }
        }
    }
    
    PROCESS_END();
}

//������պ��жϣ��洢
void proceess_packet(ST_update_packet_info * current_ptr, ST_UPDATE * flash_ptr)
{
    //�յ����ݰ����ȴ���,��������
    if (current_ptr->current_packet_No < (flash_ptr->total_packets) )
    {
       if (current_ptr->packet_length > UPDATE_DEFAULT_PACKET_SIZE )
       {
         printf("packet length err\r\n");
         return;
       }
    }
    else
    {
       printf("packet number err\r\n");
       return;
    }

    //1���Ƚ�����д��flash
    printf("write packet %d in flash\r\n", current_ptr->current_packet_No);
    FLASH_Write_update_page(current_ptr->current_packet_No, current_ptr->data, current_ptr->packet_length);
    //2�������ڴ��е����յ����ݰ���־
    set_update_packetState(current_ptr->current_packet_No);
    //3������Ƿ�������

    if (check_update_state(flash_ptr->total_packets) == true)
    {
        printf("all packet received\r\n");
        //4����������flash��֤ 
        if (update_software_check(current_ptr->total_bytes) == 0)
        {   //5����֤��ȷ,�����ɹ�
            flash_ptr->status = UPDATE_FINISH;
            //6��������������
            write_update_flash(flash_ptr);
            //�����ã���ʱ���޸�
            printf("update data OK\r\n");
            Delayms(500);
            SoftReset();
        }
        else
        {
            //7�����󣬸�λ��������
            reset_update_params();
            printf("update crc err\r\n");
        }
    }
    else
    {
        //8������δ��ɣ�������������
        write_update_flash(flash_ptr);
    }  
}





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




#if 0
/*****************************************************************************
 Prototype    : APL_data_indication
 Description  : APL��������
 Input        :  
 Output       : None
 Return Value : 
 Date         : 2015/11/16
 Author       : Barry
*****************************************************************************/

void APL_data_indication(st_NWK_frame *nwk_ptr, u8 *apl_frame_ptr)
{
    //apl�����ٻ��棬��ǰ֡û�д����꣬��������һ֡
    if (apl_busy == true)
    {
      return;
    }
    
    apl_busy = true;

    //�����������Ϣ��׼��Ӧ����
    memcpy(&apl_nwk_inf, nwk_ptr, sizeof(st_NWK_frame));

    //����APL֡���ݵ�APL�㣬�ͷ��²�ȥ����������
    memcpy(apl_buf, apl_frame_ptr, apl_nwk_inf.frame_data_length);

    //��ȡ֡������
    *((u8 *)&apl_frame) = apl_buf[0];

    switch (apl_frame.ctrl.frame_type)
    {
        case APL_TYPE_DATA_TRANSPARENT:
        //��ʱ������
        break;
        
        case APL_TYPE_DATA_OBJECT:
         //����˵���Ϣ�����ַ��Ϣ��APS֡��ţ���չͷ��Ϣ��֡�غ���Ϣ
         /***************************************************************************************
          ����֡��ʽ 
          ֡������   Ŀ��˵�  ���ַ�����ܲ����ڣ�   Դ�˵�   APS֡���   ��չͷ�����ܲ����ڣ�   ֡�غ�
          ***************************************************************************************/
          if ( (apl_frame.ctrl.frame_tran_mod == APL_TRANSPORT_SINGLE) || (apl_frame.ctrl.frame_tran_mod == APL_TRANSPORT_BROADCAST))//������û�����ַ
          {
            if (apl_frame.ctrl.frame_ext_head_inication == 0)//������û�����ַ��û����չͷ
            {
                apl_frame.source_point = apl_buf[1];
                apl_frame.end_point    = apl_buf[2];
                apl_frame.frame_number = apl_buf[3];
                apl_frame.data         = &apl_buf[4];
                //process_post(&hal_RF_process, PROCESS_EVENT_MSG, (void *)(&g_RF_LoRa.rf_state));
            }
            else
            {
                //������û�����ַ������չͷ
                return;
            }
            
          }
          else
          {
            //�ಥ��㲥��û�����ַ������չͷ
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
����flash���������У��汾��1byte   ���ֽ���(2byte)  �ܶ���2byte  ����״̬/1B(status) ������״̬��/128byte(packets_states)   CRCУ��2byte
#define UPDATE_VERSION_POS                        0   �汾��
#define UPDATE_TOTAL_BYTE_POS                     2   ���ֽ���
#define UPDATE_TOTAL_PACKETS_POS                  4   �ܶ���               
#define UPDATE_STATE_POS                          6   ����״̬
#define UPDATE_PACKET_STATES_POS                  7   ������״̬��
#define UPDATE_CRC_POS                            135 CRC
************************************************************************************************************************************************/
bool read_update_flash(ST_UPDATE *st_update_Structure)
{  
    bool retVal;
    
    u8 * update_flash_start_ptr = (u8*)FLASH_UPDATE_PARAMS_ADDRESS;
    st_update_Structure->version       = update_flash_start_ptr[UPDATE_VERSION_POS]*256 + update_flash_start_ptr[UPDATE_VERSION_POS + 1];
    st_update_Structure->totoalBytes   = update_flash_start_ptr[UPDATE_TOTAL_BYTE_POS]*256 + update_flash_start_ptr[UPDATE_TOTAL_BYTE_POS + 1];
    st_update_Structure->total_packets = update_flash_start_ptr[UPDATE_TOTAL_PACKETS_POS]*256 + update_flash_start_ptr[UPDATE_TOTAL_PACKETS_POS + 1];
    st_update_Structure->status        = update_flash_start_ptr[UPDATE_STATE_POS];
    st_update_Structure->crcValue      = update_flash_start_ptr[UPDATE_CRC_POS] *256 + update_flash_start_ptr[UPDATE_CRC_POS + 1];
    memcpy(st_update_Structure->packetsState, &update_flash_start_ptr[UPDATE_PACKET_STATES_POS], UPDATE_PACKETS_STATUS_LEN);

   retVal = ( GetCRC16((u8*)st_update_Structure, TOTAL_UPDATE_BYTE - 2) == st_update_Structure->crcValue)? \
   true:false;

   return retVal;
}


void write_update_flash(ST_UPDATE *st_update_Structure )
{ 
     u8 tempBuf[TOTAL_UPDATE_BYTE];
  
     tempBuf[UPDATE_VERSION_POS]           = (u8)(st_update_Structure->version/256);
     tempBuf[UPDATE_VERSION_POS + 1]       = (u8)(st_update_Structure->version%256);
     tempBuf[UPDATE_TOTAL_BYTE_POS]        = (u8)((st_update_Structure->totoalBytes >>8)&0xFF);
     tempBuf[UPDATE_TOTAL_BYTE_POS + 1]    = (u8)(st_update_Structure->totoalBytes & 0xFF);
     tempBuf[UPDATE_TOTAL_PACKETS_POS]     = (u8)((st_update_Structure->total_packets >>8)&0xFF);
     tempBuf[UPDATE_TOTAL_PACKETS_POS + 1] = (u8)(st_update_Structure->total_packets & 0xFF);
     tempBuf[UPDATE_STATE_POS]             =  st_update_Structure->status;
     memcpy(&tempBuf[UPDATE_PACKET_STATES_POS], st_update_Structure->packetsState, UPDATE_PACKETS_STATUS_LEN);
     
     st_update_Structure->crcValue = GetCRC16(tempBuf, TOTAL_UPDATE_BYTE - 2);
     tempBuf[UPDATE_CRC_POS]               =  (u8)((st_update_Structure->crcValue >>8)&0xFF);
     tempBuf[UPDATE_CRC_POS + 1]           =  (u8)(st_update_Structure->crcValue & 0xFF);

    if (flash_erase_page(FLASH_UPDATE_PARAMS_ADDRESS) == FLASH_COMPLETE)
    {
       FLASH_Write_chars( FLASH_UPDATE_PARAMS_ADDRESS,  tempBuf, TOTAL_UPDATE_BYTE);
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
��֤����CRC�Ƿ���ȷ
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
      if (st_update.totoalBytes == 0) /*  ������������û���յ����� ,���� */
      {
        reset_update_params();
      }
    break;

    case UPDATE_FINISH:
      //�������Ժ���������������������ݽ��ճɹ�������û�н��յ�����ָ��Ͳ���������λ������״̬��ʾfinish
      //���γ��򲻻�����������
    break;

    case UPDATE_END:
     memset(&st_update, 0 , sizeof(st_update));
    break;
    
    case UPDATE_FAILED:
      printf("update failed\r\n");
      reset_update_params();
    break;

    case UPDATE_SUCCESS:
      printf("update successful\r\n");
      reset_update_params();
    break;

    default:
      reset_update_params();
    break; 
  }
}

/* ����İ�����Ǵ�1��ʼ����ģ�1~�ܰ��������㿪ʼ���㽫  packetNo - 1����Ϊ packetNo*/
void set_update_packetState(u16 packetNo)
{
  st_update.packetsState[packetNo/8] |= (1<<(packetNo%8));
}

/* ����İ�����Ǵ�1��ʼ����ģ�1~�ܰ����� ���㿪ʼ���㽫  packetNo - 1����Ϊ packetNo */
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
������еİ��Ƿ�������
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
        return false;
      }
  }
  return true;
}


/*****************************************************************************
 *
���յ������ݰ��հ��ķ�ʽ�����δ�����ȷ��λ�ã�ÿ�����ĳ���Ϊ64�ֽڣ��������һ���������Ǳ䳤
 *�˴���Ȼ���ڰ�������0��ʼ
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
  
  
  
#if 0
/*****************************************************************************
 *
���յ������ݰ��հ��ķ�ʽ�����δ�����ȷ��λ�ã�ÿ�����ĳ���Ϊ64�ֽڣ��������һ���������Ǳ䳤
 *�˴���Ȼ���ڰ�������0���Ǵ�1��ʼ
 *
 *
 *
 *
*****************************************************************************/
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
    /* �� */
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

  if (flash_erase_page(UPDATE_FLASH_PARAMETER_DDR) == FLASH_COMPLETE)
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
    /* д */
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
     
    if (flash_erase_page(UPDATE_FLASH_PARAMETER_DDR) == FLASH_COMPLETE)
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

    if (update_instance.packetNo == 0) /*  ������������û���յ��� ������ */
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
  
  
  if (flash_erase_page(page_start_addr) == FLASH_COMPLETE)
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
                /* ֡�Ŵ��� */
                return;
            }
          
            /* �汾����ͬ */
            if (update_instance.version == frame645_instance.data[0])
            {
                /* ����״̬*/
                if (update_instance.status == UPDATE_RUNNING)
                {
                    /* �ж��Ƿ����ظ�֡ */
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
                /* ��ʼ�������������������� */
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
                       /* ��������flash��֤ */
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

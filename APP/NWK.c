#include "NWK.h"

static u8 LOCAL_NID[2] = {0x12,0x34};
static u8 broadcast_addr[2] = {0xFF,0xFF};

static NWK_PIB  nwk_pib;

static st_NWK_frame nwk_frame_buf;
st_NWK_frame * nwk_frame_ptr = &nwk_frame_buf;

st_last_info last_info = {
                          .direction = 2,
                          .frame_number  = 0xFF
      };


st_addr local_addr = {{0x01,0x02,0x03,0x04,0x05,0x06},{0x07,0x08}};


/*****************************************************************************
 Prototype    : compress_addr_list  β���ֶ��㷨
 Description  : ѹ����ַ����
 Input        : surcelist    ��6�ֽ�Ϊ����ĳ���ַ����
                destlist     ѹ����ĵ�ַ����  
 Output       : None
 Return Value : 
 Date         : 2014/11/12
 Author       : Barry
*****************************************************************************/
u8 compress_addr_list(u8 *surcelist, u8 s_len,  u8 * destlist)
{
  u8 buf[6] = {0};
    u8 * ptr =  destlist;

    memcpy(ptr, surcelist, 6);

    ptr += 6;
    
    for (u8 i = 0; i < (s_len - 6); i++)
    {
       buf[i%6] = (surcelist[i] ^ surcelist[i + 6]) << 1;
       
       if (i%6 == 5)
       {
          buf[5] += 1;  

          for (u8 j = 0; j < 6; j++)
          {
             if (buf[j] != 0)
             {
                *ptr = buf[j];
                ptr++;
             }
          }
       }
    }
    
    return (ptr - destlist);
}

/*****************************************************************************
 Prototype    : dempress_addr_list    β���ֶν�����
 Description  : ��ѹ����ַ����
 Input        : surcelist   ѹ����ĵ�ַ����  
                destlist    ��6�ֽ�Ϊ����ĳ���ַ���� 
                s_len       ��ѹ�����г���
 Output       : None
 Return Value : 
 Date         : 2014/11/12
 Author       : Barry
*****************************************************************************/
u8 dempress_addr_list(u8 *surcelist,  u8 * destlist, u8 count, u8 *s_len)
{
    u8 buf[6] = {0x00,0x00,0x00,0x00,0x00,0x00};
    u8 buf_index = 0;
    u8 last_end = 5;
    u8 *ptr = destlist;

    
    count += 1;
    
    memcpy(destlist, surcelist, 6);
    ptr += 6;

    for (u8 i = 0;; i++)
    {
        if ( (surcelist[i + 6] & 0x01) == 0x01 )
        {
            count--;

            if (count == 0)
            {
                *s_len = i + 6 +1;
                break;
            }
        }
    }
    

    for (int i = 6; i < *s_len; i++)
    {
        if ( (surcelist[i] & 0x01) == 0x01 )
        {
            buf_index = 0;
            for (u8 j = i; j > last_end; j--)
            {
                buf[6-1-buf_index] = surcelist[j];
                buf[6-1-buf_index] >>= 1;
                buf_index++;
            }

            for (u8 k = 0; k < 6; k++)
            {
                *ptr = *(ptr -6) ^ buf[k];
                ptr++;
            }
            
            last_end = i;
            memset(buf,0,6);
        }
    }
    
    return (ptr - destlist);
}


bool cmp_buf(u8 *buf1, u8 *buf2, u8 len)
{
    for (u8 i = 0; i < len; i++)
    {
        if (buf1[i] != buf2[i])
        {
            return false;
        }
    }
    return true;
}


bool cmp_addr(u8 *buf, u8 len)
{
    if (len == 2)
    {
         if (cmp_buf(buf,local_addr.short_addr,2) == false)
         {
           return (cmp_buf(buf,broadcast_addr,2) == false)? false:true;
         }
         else
         {
           return true;
         }
        
    }
    else if (len == 6)
    {
        return cmp_buf(buf,local_addr.long_addr,6);
    }
    else 
    {
        return false;
    }
}

void NWK_init(void)
{
   memset(&nwk_frame_buf, 0 ,sizeof(nwk_frame_buf));
}

/***********************************************************
֡��������:
1���ж�������֡��������֡
1���ж�NID�Ƿ���ȷ
2���жϰ汾�Ƿ���ȷ
3���ж���Դ·�ɻ���ä�м�
3���ж��Ƿ�ʹ����λ��ַ
4��������ַ��
5����ȡ������1 ֡����  
ע��: �˺���������APL�㣬��NWK�����, 
u8 * nwk_packet, u8 length �ֱ������ PHY_data_indication() ���������ݸ�ֵ
nwk_frame_ptr��ȫ�ֱ�����������������
�м̵�ַ�б�������֡��������ָ����ͬ
����㲻�ж��ظ�֡
************************************************************/
void NWK_data_indication(u8 * nwk_packet, u8 length)
{
    ST_NWK_head * nwk_head_ptr = 0;
    u8 *          current_ptr  = 0;
    u8            addr_area_pos;
    u8            compressed_list_len;

    /* ���Ƶ�NIDΪֹ */
    memcpy((u8*)(nwk_frame_ptr), nwk_packet, EM_NWK_VAR);

    nwk_head_ptr = &(nwk_frame_ptr->head);

    if ( (cmp_buf(nwk_head_ptr->NID, LOCAL_NID,2)== false) && (cmp_buf(nwk_head_ptr->NID, broadcast_addr,2)== false) )
    {
        printf("NID error \r\n");
        return;
    }

    /*
    if (nwk_head_ptr->version != nwk_pib.current_version)
    {
        return ; //�����������нڵ�汾��һ�£���ִ������ϱ��汾����
    }
    */

    last_info.frame_number = nwk_head_ptr->frame_number;
    last_info.direction    = nwk_head_ptr->direction;
     
    printf("nwk packet type = %X\r\n", nwk_head_ptr->frame_type);
    printf("nwk packet sour_addr type = %X\r\n", nwk_head_ptr->source_addr_type);
    printf("nwk packet des_addr type = %X\r\n", nwk_head_ptr->des_addr_type);
    printf("nwk packet cpre type = %X\r\n", nwk_head_ptr->compression_addr_enable);
    printf("nwk packet route type = %X\r\n", nwk_head_ptr->route_type);
    printf("nwk packet  version = %X\r\n", nwk_head_ptr->version);
    printf("nwk packet direction = %X\r\n", nwk_head_ptr->direction);
    printf("nwk packet number = %X\r\n", nwk_head_ptr->frame_number);
    printf("nwk packet NID = %X%X\r\n", nwk_head_ptr->NID[0],nwk_head_ptr->NID[1]);
    printf("nwk packet tx_RSSI = %X\r\n", nwk_head_ptr->tx_RSSI);
    printf("nwk packet rx_RSSI = %X\r\n", nwk_head_ptr->rx_RSSI);
    
    addr_area_pos = (nwk_head_ptr->direction == 0)? EM_NWK_VAR:(EM_NWK_VAR + 2);

     if (nwk_head_ptr->direction == 1)//����֡
     {
        nwk_head_ptr->tx_RSSI = nwk_packet[EM_NWK_VAR];
        nwk_head_ptr->rx_RSSI = nwk_packet[EM_NWK_VAR+1];
        addr_area_pos = EM_NWK_VAR + 2;
     }
     else
     {
        addr_area_pos = EM_NWK_VAR;
     }
    

    if (nwk_head_ptr->route_type == ROUTE_SOURCE_MODE)//Դ·��
    {
        nwk_head_ptr->addr_area.relay_level   = nwk_packet[addr_area_pos] & 0x0F;
        nwk_head_ptr->addr_area.relay_index  = (nwk_packet[addr_area_pos] >> 4) & 0x0F;

        current_ptr = nwk_packet + addr_area_pos + 1;
        if (nwk_head_ptr->compression_addr_enable  == 1) //ʹ����λ��ַ
        {
            nwk_frame_ptr->addr_uint_len = 6;
            nwk_frame_ptr->addr_list_len = dempress_addr_list(current_ptr, nwk_frame_ptr->addr_list, nwk_head_ptr->addr_area.relay_level, &compressed_list_len); 
            current_ptr += compressed_list_len; //����֡��ָ��
            nwk_frame_ptr->frame_data_length = length - compressed_list_len - (addr_area_pos + 1);//����֡�ĳ���
            
        }
        else
        {
            nwk_frame_ptr->addr_uint_len = (nwk_head_ptr->relay_addr_type == LONG_ADDR_TYPE)? 6:2;
            nwk_frame_ptr->addr_list_len  =  nwk_frame_ptr->addr_uint_len *  (nwk_head_ptr->addr_area.relay_level+2);
            memcpy(nwk_frame_ptr->addr_list, current_ptr, nwk_frame_ptr->addr_list_len ); 
            current_ptr += nwk_frame_ptr->addr_list_len; //����֡��ָ��
            nwk_frame_ptr->frame_data_length = length - nwk_frame_ptr->addr_list_len - (addr_area_pos + 1);//����֡�ĳ���
        }
        
        printf("addr list: ");
        for (u8 i = 0; i < nwk_frame_ptr->addr_list_len; i++)
        {
          printf("%X ",nwk_frame_ptr->addr_list[i]);
        }
        printf("\r\n");
        
        printf("data list: ");
        for (u8 i = 0; i < nwk_frame_ptr->frame_data_length; i++)
        {
            printf("%X ",*current_ptr);
            current_ptr++;
        }
        printf("\r\n");
        
#if 0
        //�����û�жಥ����
        //�Ƿ����м̵�ַ�����ж�����֡��λ��
        if (nwk_head_ptr->addr_area.relay_level == 0)//û���м̵�ַ
        {
            if (cmp_addr(nwk_frame_ptr->addr_list + nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))//�Ƚ�Ŀ�ĵ�ַ
            {
              //��Ŀ�ĵ�ַ�����߹㲥��ַ,�Ͻ���APS
              APL_data_indication(nwk_frame_ptr , current_ptr); 
            } 
            else
            {
              //����Ŀ�ĵ�ַ�����߹㲥��ַ,����
            }
        }
        else
        {
            if (nwk_head_ptr->direction == 0)//����
            {
                if (nwk_head_ptr->addr_area.relay_index < nwk_head_ptr->addr_area.relay_level)//��ʾ��֡����ת��״̬
                {
                    if (cmp_addr(nwk_frame_ptr->addr_list + (2 + nwk_head_ptr->addr_area.relay_index)*nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
                    {
                      //���ڵ����м̵�ַ���ϴ���APS
                      APL_data_indication(nwk_frame_ptr , current_ptr); 
                    }
                    else
                    {
                      //����
                    }
                }
                else if (nwk_head_ptr->addr_area.relay_index == nwk_head_ptr->addr_area.relay_level)//��ʾ��֡�������һ����Ӧ�ò���Ŀ���ַ
                {
                    if (cmp_addr(nwk_frame_ptr->addr_list + nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
                    {
                      //���ڵ���Ŀ���ַ���ϴ���APS
                      APL_data_indication(nwk_frame_ptr , current_ptr); 
                    } 
                    else
                    {
                      //����
                    }
                }
            }
            else//����
            {
               if (nwk_head_ptr->addr_area.relay_index  > 0)//��ʾ��֡����ת��״̬
               {
                   if (cmp_addr(nwk_frame_ptr->addr_list + (2 + nwk_head_ptr->addr_area.relay_index)*nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
                   {
                      //���ڵ����м̵�ַ���ϴ���APS
                     APL_data_indication(nwk_frame_ptr , current_ptr); 
                   }
                   else
                   {
                     //����
                   }
               }
               else if (nwk_head_ptr->addr_area.relay_index  == 0 )//��ʾ��֡�������һ����Ӧ�ò���Ŀ���ַ����ʵ�������ȥ���������Ѿ��Ƚ���Ŀ�ĵ�ַ
               {
                   if (cmp_addr(nwk_frame_ptr->addr_list + nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
                   {
                      //���ڵ���Ŀ���ַ���ϴ���APS
                     APL_data_indication(nwk_frame_ptr , current_ptr); 
                   } 
                   else
                   {
                      //����
                   }
               }
            }
          }
          #endif
        
           if (cmp_addr(nwk_frame_ptr->addr_list + nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
           {
              //���ڵ���Ŀ���ַ���ϴ���APS
             APL_data_indication(nwk_frame_ptr , current_ptr); 
           } 
           else//�ж��Ƿ����м̵�ַ
           {
               if (nwk_head_ptr->addr_area.relay_level == 0)//û���м̵�ַ
               {
                 return;//����
               }
               else//���м̵�ַ
               {
                  if (nwk_head_ptr->direction == 0)//����
                  {
                     if (nwk_head_ptr->addr_area.relay_index < nwk_head_ptr->addr_area.relay_level)//��ʾ��֡����ת��״̬
                     {
                        if (cmp_addr(nwk_frame_ptr->addr_list + (2 + nwk_head_ptr->addr_area.relay_index)*nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
                        {
                          //���ڵ����м̵�ַ���м�ת�� ������㷢�������ϴ���APS��
                          APL_data_indication(nwk_frame_ptr , current_ptr); 
                        }
                        else
                        {
                          return;//����
                        }
                     }
                     else
                     {
                       return;
                     }
                  }
                  else //����
                  {
                     if (nwk_head_ptr->addr_area.relay_index  > 0)//��ʾ��֡����ת��״̬
                     {
                         if (cmp_addr(nwk_frame_ptr->addr_list + (2 + nwk_head_ptr->addr_area.relay_index)*nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
                         {
                            //���ڵ����м̵�ַ���м�ת�� ������㷢�������ϴ���APS��
                           APL_data_indication(nwk_frame_ptr , current_ptr); 
                         }
                         else
                         {
                           return;//����
                         }
                     }
                     else
                     {
                       return;
                     }
                  }
               }
           }
        }
        else //ä�м�
        {
         
            //��ʱ������ä�м�
        }
     
}



/*
void NWK_data_request(void)
{
}
*/


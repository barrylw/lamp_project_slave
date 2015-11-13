#include "NWK.h"

static u16 LOCAL_NID = 0x3412;
static u16 broadcast_addr = 0xFF;
static NWK_PIB  nwk_pib;

static u8 * nwk_frame;
static u8   nwk_length;

static st_NWK_frame nwk_frame_buf;
st_NWK_frame * nwk_frame_ptr = &nwk_frame_buf;



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
    u8 temp;
    
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
                temp =  *(ptr -6);
                *ptr = *(ptr -6) ^ buf[k];
                ptr++;
            }
            
            last_end = i;
            memset(buf,0,6);
        }
    }
    
    return (ptr - destlist);
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
************************************************************/
void NWK_data_indication(u8 * nwk_packet, u8 length)
{
    st_addr_area  addr_area;
    ST_NWK_head * nwk_head_ptr = 0;
    u8 *          current_ptr  = 0;
    u8            addr_area_pos;
    u16 temp;
    u8            compressed_list_len;

     /* ���Ƶ�NIDΪֹ */
     memcpy((u8*)(nwk_frame_ptr), nwk_packet, EM_NWK_VAR);

     nwk_head_ptr = &(nwk_frame_ptr->head);
     
     temp = (u16)(nwk_head_ptr->NID[0]) + nwk_head_ptr->NID[1]*256;
     
     if ( (temp != LOCAL_NID) &&  (temp != broadcast_addr) )
     {
       return ;
     }
     
     if (nwk_head_ptr->version != nwk_pib.current_version)
     {
       return ; /*�����������нڵ�汾��һ�£���ִ������ϱ��汾����*/
     }

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
        *(u8*)(&addr_area)    = nwk_packet[addr_area_pos];

        current_ptr = nwk_packet + addr_area_pos + 1;
        if (nwk_head_ptr->compression_addr_enable  == 1) //ʹ����λ��ַ
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
    else //ä�м�
    {
     
        //æ�м̲���
    }
}


/**********************************
�ɲ����������ݣ�PHY_data_indication������NWK�㣬
������PHY����ã�PHY_data_indication�����б�����Ҫ��������PHY���ɲ����ṩ
*********************************/
void PHY_data_indication(u8 * buf, u16 length)
{
    nwk_frame     = buf;
    nwk_length    = length;
}


/*
void NWK_data_request(void)
{
}
*/



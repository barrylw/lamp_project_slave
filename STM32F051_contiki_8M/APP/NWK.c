#include "NWK.h"

static u16 LOCAL_NID = 0x3412;
static u16 broadcast_addr = 0xFF;
static NWK_PIB  nwk_pib;

static u8 * nwk_frame;
static u8   nwk_length;





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



#include "NWK.h"

static u16 LOCAL_NID = 0x3412;
static u16 broadcast_addr = 0xFF;
static NWK_PIB  nwk_pib;

/*****************************************************************************
 Prototype    : compress_addr_list
 Description  : ѹ����ַ����
 Input        : surcelist    ��6�ֽ�Ϊ����ĳ���ַ����
                destlist     ѹ����ĵ�ַ����  
 Output       : None
 Return Value : 
 Date         : 2014/11/12
 Author       : Barry
*****************************************************************************/
void compress_addr_list(u8 *surcelist, u8 s_len,  u8 * destlist)
{
    for (u8 i = 0; i < (s_len /6); i++)
    {
        for (u8 j = 0; j < 6; j++)
        {
            
        }
    }
}

/*****************************************************************************
 Prototype    : dempress_addr_list
 Description  : ��ѹ����ַ����
 Input        : surcelist   ѹ����ĵ�ַ����  
                destlist    ��6�ֽ�Ϊ����ĳ���ַ���� 
 Output       : None
 Return Value : 
 Date         : 2014/11/12
 Author       : Barry
*****************************************************************************/
void dempress_addr_list(u8 *surcelist, u8 * destlist)
{

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
************************************************************/
void NWK_data_indication(u8 * phy_frame, u16 length, st_NWK_frame * nwk_frame_buf)
{
    st_addr_area  addr_area;
    ST_NWK_head * nwk_head_ptr = 0;
    u8 *          current_ptr  = 0;
    u8 addr_area_pos;
    u16 temp;

     /* ���Ƶ�NIDΪֹ */
     memcpy((u8*)(nwk_frame_buf), phy_frame, EM_NWK_VAR);

     nwk_head_ptr = &(nwk_frame_buf->head);
     
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

     if (nwk_head_ptr->direction == 1)
     {
        nwk_head_ptr->tx_RSSI = phy_frame[EM_NWK_VAR];
        nwk_head_ptr->rx_RSSI = phy_frame[EM_NWK_VAR+1];
     }
    
    /*
    ��λ��ַ��ʶ���򳤶�Ϊ1λ����ʾԴ��ַ��Ŀ�ĵ�ַ���м̵�ַ�Ƿ�ʹ����λ��ʽ

    ��λ��ַ���㷨�������£�
    ��1��Դ��ַ���ֲ��䣻
    ��2���������ĵ�ַ���ֽ���ǰһ��ַ���
    ��3������ĵ����ֽ�����1λ�����������ֽڣ����ֽڲ��䣬�����1��
    ��4����λ���λΪ0���ֽڶ������ӷ�0�ֽڿ�ʼ������λ��Ľ����
    */

       if (nwk_head_ptr->compression_addr_enable  == 0)   //��ʹ����λ��ַ
       {
          nwk_frame_buf->source_addr_len = (nwk_head_ptr->source_addr_type == LONG_ADDR_TYPE)? 6:2;
         
          nwk_frame_buf->dest_addr_len   = (nwk_head_ptr->des_addr_type == LONG_ADDR_TYPE)? 6:2;

         if ( addr_area.relay_level >  0) //�м̵�ַ�б����
         {
           nwk_frame_buf->relay_addr_len  =  ((nwk_head_ptr->relay_addr_type == LONG_ADDR_TYPE)? 6:2) *  addr_area.relay_level; 
         }
         else
         {
           nwk_frame_buf->relay_addr_len = 0; 
         }

         nwk_frame_buf->frame_data_length = ;

         if (nwk_head_ptr->route_type == ROUTE_SOURCE_MODE)//Դ·��
         {
          *(u8*)(&addr_area)    = phy_frame[addr_area_pos];
          
           current_ptr = phy_frame  + addr_area_pos + 1;
           memcpy(nwk_frame_buf->source_addr, current_ptr, nwk_frame_buf->source_addr_len);
           
           current_ptr += nwk_frame_buf->source_addr_len;
           memcpy(nwk_frame_buf->dest_addr, current_ptr, nwk_frame_buf->dest_addr_len );
                       
           current_ptr +=  nwk_frame_buf->dest_addr_len;
           memcpy(nwk_frame_buf->relay_list, current_ptr,nwk_frame_buf->relay_addr_len);
          
           current_ptr += nwk_frame_buf->relay_addr_len;
           memcpy(nwk_frame_buf->frame_data_point, current_ptr,nwk_frame_buf->relay_addr_len);
         }
         else //ä�м�
         {
            current_ptr = phy_frame  + addr_area_pos + 4;
            memcpy(nwk_frame_buf->source_addr, current_ptr, nwk_frame_buf->source_addr_len);

            current_ptr += nwk_frame_buf->source_addr_len;
            memcpy(nwk_frame_buf->dest_addr, current_ptr, nwk_frame_buf->dest_addr_len );
            //æ�м̲���
         }
    //}
    
    //else//ʹ����λ��ַ
    //{
    
    //}
 
}



void NWK_data_request(void)
{
}




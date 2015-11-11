#include "NWK.h"

static u16 LOCAL_NID = 0;
static u16 broadcast_addr = 0xFF;
static NWK_PIB  nwk_pib;

st_NWK_frame  *nwk_frame_buf;
  
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
void NWK_data_indication(u8 * phy_frame, u16 length)
{
    st_addr_area  addr_area;
    st_NWK_frame  nwk_frame_buf;
    ST_NWK_head * nwk_head_ptr = 0;
    u8 *          current_ptr  = 0;
    u16 temp;


     memcpy((u8*)(&nwk_frame_buf), phy_frame, EM_NWK_ADDR_AREA_POS + 1);

     nwk_head_ptr = &nwk_frame_buf.head;
     
     temp = (u16)nwk_head_ptr->NID[0] + nwk_head_ptr->NID[1]*256;
     
     if ( (temp != LOCAL_NID) &&  (temp != broadcast_addr) )
     {
       return ;
     }
     
     if (nwk_head_ptr->version != nwk_pib.current_version)
     {
       return ; /*�����������нڵ�汾��һ�£���ִ������ϱ��汾����*/
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
         nwk_frame_buf.source_addr_len = (nwk_head_ptr->source_addr_type == LONG_ADDR_TYPE)? 6:2;
         
         nwk_frame_buf.dest_addr_len   = (nwk_head_ptr->des_addr_type == LONG_ADDR_TYPE)? 6:2;

         if (nwk_head_ptr->route_type == ROUTE_SOURCE_MODE)//Դ·��
         {
          *(u8*)(&addr_area)    = phy_frame[EM_NWK_ADDR_AREA_POS];
          
           current_ptr = phy_frame  + EM_NWK_ADDR_AREA_POS + 1;
           memcpy(nwk_frame_buf.source_addr, current_ptr, nwk_frame_buf.source_addr_len);
           
           current_ptr += nwk_frame_buf.source_addr_len;
           memcpy(nwk_frame_buf.dest_addr, current_ptr, nwk_frame_buf.dest_addr_len );
                       
           current_ptr +=  nwk_frame_buf.dest_addr_len;
           nwk_frame_buf.relay_list = current_ptr;

          
           if ( addr_area.relay_level >  0) //�м̵�ַ�б����
           {
              nwk_frame_buf.relay_addr_len =  ((nwk_head_ptr->relay_addr_type == LONG_ADDR_TYPE)? 6:2) *  addr_area.relay_level; 
           }
           else
           {
              nwk_frame_buf.relay_addr_len = 0; 
           }
           
           current_ptr += nwk_frame_buf.relay_addr_len;
           nwk_frame_buf.frame_data_point = current_ptr;
         }
         else //ä�м�
         {
            current_ptr = phy_frame  + EM_NWK_ADDR_AREA_POS +4;
            memcpy(nwk_frame_buf.source_addr, current_ptr, nwk_frame_buf.source_addr_len);

            current_ptr += nwk_frame_buf.source_addr_len;
            memcpy(nwk_frame_buf.dest_addr, current_ptr, nwk_frame_buf.dest_addr_len );

            //æ�м̲���
         }
    }
    else//ʹ����λ��ַ
    {
    
    }

    
     
    
      
     

    

     
}



void NWK_data_request(void)
{
}




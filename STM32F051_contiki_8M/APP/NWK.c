#include "NWK.h"

static u16 LOCAL_NID = 0x3412;
static u16 broadcast_addr = 0xFF;
static NWK_PIB  nwk_pib;

/*****************************************************************************
 Prototype    : compress_addr_list
 Description  : 压缩地址序列
 Input        : surcelist    以6字节为间隔的长地址序列
                destlist     压缩后的地址序列  
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
 Description  : 解压缩地址序列
 Input        : surcelist   压缩后的地址序列  
                destlist    以6字节为间隔的长地址序列 
 Output       : None
 Return Value : 
 Date         : 2014/11/12
 Author       : Barry
*****************************************************************************/
void dempress_addr_list(u8 *surcelist, u8 * destlist)
{

}

/***********************************************************
帧解析步骤:
1、判断是上行帧还是下行帧
1、判断NID是否正确
2、判断版本是否正确
3、判断是源路由还是盲中继
3、判断是否使用缩位地址
4、解析地址域
5、获取参数，1 帧类型  
************************************************************/
void NWK_data_indication(u8 * phy_frame, u16 length, st_NWK_frame * nwk_frame_buf)
{
    st_addr_area  addr_area;
    ST_NWK_head * nwk_head_ptr = 0;
    u8 *          current_ptr  = 0;
    u8 addr_area_pos;
    u16 temp;

     /* 复制到NID为止 */
     memcpy((u8*)(nwk_frame_buf), phy_frame, EM_NWK_VAR);

     nwk_head_ptr = &(nwk_frame_buf->head);
     
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

     if (nwk_head_ptr->direction == 1)
     {
        nwk_head_ptr->tx_RSSI = phy_frame[EM_NWK_VAR];
        nwk_head_ptr->rx_RSSI = phy_frame[EM_NWK_VAR+1];
     }
    
    /*
    缩位地址标识子域长度为1位，表示源地址、目的地址和中继地址是否使用缩位型式

    缩位地址的算法描述如下：
    （1）源地址保持不变；
    （2）将后续的地址按字节与前一地址异或；
    （3）异或后的单个字节左移1位，若后续有字节，本字节不变，否则加1；
    （4）移位后高位为0的字节丢弃，从非0字节开始保存缩位后的结果。
    */

       if (nwk_head_ptr->compression_addr_enable  == 0)   //不使用缩位地址
       {
          nwk_frame_buf->source_addr_len = (nwk_head_ptr->source_addr_type == LONG_ADDR_TYPE)? 6:2;
         
          nwk_frame_buf->dest_addr_len   = (nwk_head_ptr->des_addr_type == LONG_ADDR_TYPE)? 6:2;

         if ( addr_area.relay_level >  0) //中继地址列表存在
         {
           nwk_frame_buf->relay_addr_len  =  ((nwk_head_ptr->relay_addr_type == LONG_ADDR_TYPE)? 6:2) *  addr_area.relay_level; 
         }
         else
         {
           nwk_frame_buf->relay_addr_len = 0; 
         }

         nwk_frame_buf->frame_data_length = ;

         if (nwk_head_ptr->route_type == ROUTE_SOURCE_MODE)//源路由
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
         else //盲中继
         {
            current_ptr = phy_frame  + addr_area_pos + 4;
            memcpy(nwk_frame_buf->source_addr, current_ptr, nwk_frame_buf->source_addr_len);

            current_ptr += nwk_frame_buf->source_addr_len;
            memcpy(nwk_frame_buf->dest_addr, current_ptr, nwk_frame_buf->dest_addr_len );
            //忙中继参数
         }
    //}
    
    //else//使用缩位地址
    //{
    
    //}
 
}



void NWK_data_request(void)
{
}




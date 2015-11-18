#include "NWK.h"

static u8 LOCAL_NID[2] = {0x00,0x00};
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
 Prototype    : compress_addr_list  尾部分段算法
 Description  : 压缩地址序列
 Input        : surcelist    以6字节为间隔的长地址序列
                destlist     压缩后的地址序列  
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
 Prototype    : dempress_addr_list    尾部分段解析法
 Description  : 解压缩地址序列
 Input        : surcelist   压缩后的地址序列  
                destlist    以6字节为间隔的长地址序列 
                s_len       被压缩序列长度
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
        return cmp_buf(buf,local_addr.short_addr,2);
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
中继地址列表 难道中继地址列表中，上下行的顺序是一样的
************************************************************/
void NWK_data_indication(u8 * nwk_packet, u8 length)
{
    ST_NWK_head * nwk_head_ptr = 0;
    u8 *          current_ptr  = 0;
    u8            addr_area_pos;
    u8            compressed_list_len;

     /* 复制到NID为止 */
     memcpy((u8*)(nwk_frame_ptr), nwk_packet, EM_NWK_VAR);

     nwk_head_ptr = &(nwk_frame_ptr->head);

     
     if ( (cmp_buf(nwk_head_ptr->NID, LOCAL_NID,2) || cmp_buf(nwk_head_ptr->NID, broadcast_addr,2))== false )
     {
      //重复帧
       return;
     }
     
     
     if (nwk_head_ptr->version != nwk_pib.current_version)
     {
       return ; /*发现网络中有节点版本不一致，不执行命令，上报版本错误*/
     }

     if ( (nwk_head_ptr->frame_number == last_info.frame_number) && (nwk_head_ptr->direction == last_info.direction) )
     {
        return; //重复帧
     }

     last_info.frame_number = nwk_head_ptr->frame_number;
     last_info.direction    = nwk_head_ptr->direction;
     
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
        nwk_head_ptr->addr_area.relay_level   = nwk_packet[addr_area_pos] & 0x0F;
        nwk_head_ptr->addr_area.relay_search  = (nwk_packet[addr_area_pos] >> 4) & 0x0F;

        current_ptr = nwk_packet + addr_area_pos + 1;
        if (nwk_head_ptr->compression_addr_enable  == 1) //使用缩位地址
        {
            nwk_frame_ptr->addr_uint_len = 6;
            nwk_frame_ptr->addr_list_len = dempress_addr_list(current_ptr, nwk_frame_ptr->addr_list, nwk_head_ptr->addr_area.relay_level, &compressed_list_len); 
            current_ptr += compressed_list_len;
        }
        else
        {
            nwk_frame_ptr->addr_uint_len = (nwk_head_ptr->relay_addr_type == LONG_ADDR_TYPE)? 6:2;
            nwk_frame_ptr->addr_list_len  =  nwk_frame_ptr->addr_uint_len *  (nwk_head_ptr->addr_area.relay_level+2);
            memcpy(nwk_frame_ptr->addr_list, current_ptr, nwk_frame_ptr->addr_list_len ); //
            current_ptr += nwk_frame_ptr->addr_list_len;
        }

        if (nwk_head_ptr->addr_area.relay_level == 0)//没有中继地址，直接判断目的地址
        {
            if (cmp_addr(nwk_frame_ptr->addr_list + nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
            {
                 nwk_frame_ptr->frame_data_length = length - nwk_frame_ptr->addr_list_len - (addr_area_pos + 1);
                 //current_ptr
                 //APL_data_indication();
                 //memcpy(nwk_frame_ptr->frame_data, current_ptr, nwk_frame_ptr->frame_data_length);
                
            }
            else
            {
                return;//丢弃
            }
        }
        else //有中继地址
        {
            //处于中继转发
            if (nwk_head_ptr->addr_area.relay_search < nwk_head_ptr->addr_area.relay_level)
            {
                if (cmp_addr(nwk_frame_ptr->addr_list + (2 + nwk_head_ptr->addr_area.relay_search)*nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
                {
                    //修改中继索引直接转发
                    if (nwk_head_ptr->direction == 1)//上行帧
                    {
                        nwk_head_ptr->addr_area.relay_search++;

                    }
                    else //下行帧
                    {
                        nwk_head_ptr->addr_area.relay_search--;
                    }
                }
                else
                {
                    return; //丢弃
                }
            } 
            else if ( (nwk_head_ptr->addr_area.relay_search == 0) || (nwk_head_ptr->addr_area.relay_search == nwk_head_ptr->addr_area.relay_level))
            {
                if (cmp_addr(nwk_frame_ptr->addr_list + nwk_frame_ptr->addr_uint_len,  nwk_frame_ptr->addr_uint_len))
                {
                    nwk_frame_ptr->frame_data_length = length - nwk_frame_ptr->addr_list_len - (addr_area_pos + 1);
                    //current_ptr
                    //APL_data_indication();
                }
                else
                {
                    return;//丢弃
                }
            }
        }
    } 
    else //盲中继
    {
     
        //暂时不处理盲中继
    }
}



/*
void NWK_data_request(void)
{
}
*/



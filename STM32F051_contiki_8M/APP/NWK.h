#ifndef __NWK_H__
#define __NWK_H__

#include "common.h"



/*
typedef struct
{
    u8   relay_level:4;
    u8   relay_index:4;
    u8 * source_addr_ptr;
    u8 * dest_addr_ptr;
    u8 * link_group_addr_list;
}st_source_route_addr_region;

typedef struct
{
    u8 life_period:4;
}st_flood_addr_region;
*/


#define TYPE_DATA           0x00
#define TYPE_CMD            0x01

#define LONG_ADDR_TYPE      0x00
#define SHORT_ADDR_TYPE     0x01

#define COMPRE_ADDR_ENABLE  0x01
#define COMPRE_ADDR_DISABLE 0x00

#define ROUTE_SOURCE_MODE   0x00
#define ROUTE_AUTO_MODE     0x01

#define RELAY_LEVEL_MASK    0xF0
#define RELAY_SEARCH_MASK   0x0F


#define ADDR_AREA_LEN      36
#define APL_AREA_LEN       (255 - ADDR_AREA_LEN - 7)

enum
{
    EM_NWK_CONTROL_POS    = 0,
    EM_NWK_VERSION_POS    = 1,
    EM_NWK_NO_POS         = 2,
    EM_NWK_NID_POS        = 3,
    EM_NWK_VAR            = 5,
};


 typedef struct
 {
     u8   relay_level:4;
     u8   relay_index:4;
 }st_addr_area;
 
 typedef struct
 {
     u8 long_addr[6];
     u8 short_addr[2];
 }st_addr;

 typedef struct
 {
    u8 direction;
    u8 frame_number;
 }st_last_info;


 //从低地址开始填充
typedef struct
{
    u8 frame_type:2;
    u8 source_addr_type:1;
    u8 des_addr_type:1;
    u8 relay_addr_type:1;
    u8 compression_addr_enable:1;
    u8 route_type:2;
    u8 version:4;
    u8 saved:3;
    u8 direction:1;
    u8 frame_number;
    u8 NID[2];
    u8 tx_RSSI;
    u8 rx_RSSI;  
    st_addr_area   addr_area;
    //指针自动转换到这里结束
}ST_NWK_head;


typedef struct 
{
    ST_NWK_head   head;
    u8            addr_list[ADDR_AREA_LEN];              //地址列表，传送给APL
    u8            addr_uint_len;                         //地址的长度，长地址还是短地址
    u8            addr_list_len;                         //在网络帧中整个地址域的长度
    u8            frame_data_length;         
    //u8          frame_data[APL_AREA_LEN];            //255 
}st_NWK_frame;


typedef struct
{
    u8      current_version;
    u8      rx_rssi;
    u8      tx_rssi;
    
}NWK_PIB;


#endif

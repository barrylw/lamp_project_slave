#ifndef __NWK_H__
#define __NWK_H__

#include "common.h"


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


/*
//#define TYPE_MASK         0x03
#define SOURCE_ADDR_MASK  0x04
#define DEST_ADDR_MASK    0x08
#define RELAY_ADDR_MASK   0x10

#define COMPRE_ADDR_MASK  0x20

#define ROUTE_MODE_MASK   0xc0
*/


enum
{
    EM_NWK_CONTROL_POS    = 0,
    EM_NWK_VERSION_POS    = 1,
    EM_NWK_NO_POS         = 2,
    EM_NWK_NID_POS        = 3,
    EM_NWK_TX_RSSI_POS    = 5,
    EM_NWK_RX_RSSI_POS    = 6,
    EM_NWK_ADDR_AREA_POS  = 7,
};

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
    //指针自动转换到这里结束
}ST_NWK_head;


typedef struct 
{
    ST_NWK_head   head;
    u8 *          relay_list;              //中继列表地址，传送给APL
    u8 *          frame_data_point;
    u8            source_addr[6];
    u8            dest_addr[6];
    u8            source_addr_len;
    u8            dest_addr_len;
    u8            relay_addr_len; 
    u8            frame_data_length;
}st_NWK_frame;

typedef struct
{
    u8   relay_level:4;
    u8   relay_search:4;
}st_addr_area;

typedef struct
{
    u8 long_addr[6];
    u8 short_addr[2];
}st_addr;

typedef struct
{
    st_addr local_addr;
    u8      current_version;
    u8      rx_rssi;
    u8      tx_rssi;
    
}NWK_PIB;


#endif

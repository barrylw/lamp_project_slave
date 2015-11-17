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





typedef struct
{
    u8      current_version;
    u8      rx_rssi;
    u8      tx_rssi;
    
}NWK_PIB;


#endif

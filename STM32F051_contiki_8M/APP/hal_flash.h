#ifndef __HAL_FLASH_H__
#define __HAL_FLASH_H__

#include "common.h"

#define FLASH_API_ADDRESS                              0x08000000
#define FLASH_APPLICATION_ADDRESS                      0x08001000
#define FLASH_APPLICATION_BACK_ADDRESS                 0x08008000
#define FLASH_PARAMETER_ADDRESS                        0x0800FC00
#define FLASH_ELC_SAVE_ADDRESS                         0x0800F800
#define FLASH_ELC_BACK_ADDRESS                         0x0800F400


#define FLASH_API_PAGES                                4
#define FLASH_APPLICATION_PAGES                        28
#define FLASH_APPLICATION_BACK_PAGES                   31
#define FLASH_PARAMETER_PAGES                          1

#define USER_FLASH_LAST_PAGE_ADDRESS                   0x0800F800
#define USER_FLASH_END_ADDRESS                         0x0800FFFF   /* 64 KBytes */
#define FLASH_PAGE_SIZE                                0x400        /* 1 Kbytes  */
 
#define FLASH_ALL_PARAMS_AREA                          0x0800F800
#define FLASH_ALL_PARAMS_PAGES                         1

#define MAC_PARAMS_ADDR
#define MAC_PARAMS_LENGTH

typedef enum
{
  IAP_start_addr        =    FLASH_API_ADDRESS,
  app_start_addr        =    FLASH_APPLICATION_ADDRESS,
  app_back_start_addr   =    FLASH_APPLICATION_BACK_ADDRESS,
  parm_start_addr       =    FLASH_PARAMETER_ADDRESS,
}em_flash_part;
  
typedef enum
{
  FLASH_OK = 0,
  FLASH_ERASE_ERROR = 1,
  FLASH_WRITE_ERROR = 2,
  FLASH_READ_ERROR  = 3,
  FLASH_PARAM_ERROR = 4,
}em_FLASH_Status;

uint32_t FLASH_Write_chars( uint32_t FlashAddress, uint8_t* Data ,uint16_t DataLength);
uint32_t FLASH_Write_16BITS( uint32_t* FlashAddress, uint16_t* Data ,uint16_t DataLength);
//uint32_t FLASH_Write_page(__IO uint32_t* FlashAddress, uint16_t* Data);
void FLASH_Init(void);
void hal_Init_Flash(void);
#endif
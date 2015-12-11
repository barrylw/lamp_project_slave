#ifndef __HAL_FLASH_H__
#define __HAL_FLASH_H__

#include "common.h"

#define USER_FLASH_END_ADDRESS                         0x0800FFFF   /* 64 KBytes */

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
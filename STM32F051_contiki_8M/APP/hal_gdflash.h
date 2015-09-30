#ifndef __HAL_GDFLASH_H__
#define __HAL_GDFLASH_H__
#include "common.h"

#define GDFLASH_SPI                     SPI1

#define DGFLASH_SPI_PORT                GPIOA
#define GDFLASH_GPIO_CLK                RCC_AHBPeriph_GPIOA

#define GDFLASH_CS_PIN                  GPIO_Pin_4


#define GDFLASH_SCK_PIN                 GPIO_Pin_5
#define DGFLASH_SPI_SCK_SOURCE          GPIO_PinSource5
#define DGFLASH_SPI_SCK_AF              GPIO_AF_0 

#define GDFLASH_MISO_PIN                GPIO_Pin_6  
#define DGFLASH_SPI_MISO_SOURCE         GPIO_PinSource6
#define DGFLASH_SPI_MISO_AF             GPIO_AF_0

#define GDFLASH_MOSI_PIN                GPIO_Pin_7 
#define DGFLASH_SPI_MOSI_SOURCE         GPIO_PinSource7
#define DGFLASH_SPI_MOSI_AF             GPIO_AF_0

#define DGFLASH_SPI_SCK                 RCC_APB2Periph_SPI1


 /* Select sRF: Chip Select pin low */
#define DGFLASH_CS_LOW()                             GPIO_ResetBits(DGFLASH_SPI_PORT, GDFLASH_CS_PIN)
 /* Deselect sRF: Chip Select pin high */
#define DGFLASH_CS_HIGH()                            GPIO_SetBits(DGFLASH_SPI_PORT, GDFLASH_CS_PIN)

#define DGFLASH_DUMMY_BYTE                                0xAA


#define GDFLASH_WRITE_ENABLE                              0x06
#define GDFLASH_WRITE_DISABLE                             0x04
#define GDFLASH_READ_STATUS_REG                           0x05
#define GDFLASH_WRITE_STATUS_REG                          0x01
#define GDFLASH_READ_DATA                                 0x03
#define GDFLASH_FAST_READ                                 0x0b
#define GDFLASH_DUAL_OUTPUT_FAST_READ                     0x3b
#define GDFLASH_PAGE_PROGRAM_02                           0x02
#define GDFLASH_PAGE_PROGRAM_F2                           0xF2
#define GDFLASH_SECTOR_ERASE                              0x20
#define GDFLASH_BLOCK_ERASE_32                            0x52
#define GDFLASH_BLOCK_ERASE_64                            0xD8
#define GDFLASH_CHIP_ERASE                                0x60
#define GDFLASH_DEEP_POWER_DOWN                           0xB9
#define GDFLASH_RELEASE_FROM_DPD_AND_READ_DEVICE_ID       0xAB //�����������Ĳ�ͬ��ʵ�ֲ�ͬ�Ĺ���
#define GDFLASH_RELEASE_FROM_DPD                          0xAB //
#define GDFLASH_DEVICE_ID                                 0x90
#define GDFLASH_READ_IDENTIFICATION                       0x9F


typedef enum
{
  SECTOR_ERASE,
  BLOCK_ERASE_32K,
  BLOCK_ERASE_64K,
  CHIP_ERASE,
}GDFLASH_ERASE_TYPE;



void GDflash_init(void);
u8 GDflash_read_status_reg(void);
void GDflash_write_enable(bool enable);
void GDflash_test(void);
#endif
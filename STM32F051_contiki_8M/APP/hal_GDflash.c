#include "hal_gdflash.h"
#include "stm32f0xx.h"


/*****************************************************************************
 Prototype    : hal_Init_RF_pins
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_Init_gdflash_pins(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  
  RCC_AHBPeriphClockCmd( GDFLASH_GPIO_CLK , ENABLE);
                       
   /*!< Configure sRF_CS_PIN pin: sRF CS pin */
  GPIO_InitStructure.GPIO_Pin = GDFLASH_CS_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_Init(DGFLASH_SPI_PORT, &GPIO_InitStructure);
  
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;

  GPIO_InitStructure.GPIO_Pin = GDFLASH_SCK_PIN | GDFLASH_MISO_PIN | GDFLASH_MOSI_PIN;
  GPIO_Init(DGFLASH_SPI_PORT, &GPIO_InitStructure);
  
  
   /* SPI pin mappings */
  GPIO_PinAFConfig(DGFLASH_SPI_PORT, DGFLASH_SPI_SCK_SOURCE,  DGFLASH_SPI_SCK_AF);
  GPIO_PinAFConfig(DGFLASH_SPI_PORT, DGFLASH_SPI_MISO_SOURCE, DGFLASH_SPI_MISO_AF);
  GPIO_PinAFConfig(DGFLASH_SPI_PORT,DGFLASH_SPI_MOSI_SOURCE,  DGFLASH_SPI_MOSI_AF);
 
}


/*****************************************************************************
 Prototype    : hal_sRF_SPI_Config
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_gdflash_SPI_Config(void)
{
  SPI_InitTypeDef SPI_InitStructure;
 
  /*!< Deselect the RF: Chip Select high */
  DGFLASH_CS_HIGH();
  
  /* Disable sRF_SPI */
  SPI_Cmd(GDFLASH_SPI, DISABLE);
  
  /*!< SPI configuration */
  SPI_I2S_DeInit(GDFLASH_SPI);
  
    /*!< sRF_SPI Periph clock enable */
  RCC_APB2PeriphClockCmd(DGFLASH_SPI_SCK ,  ENABLE);
  
  SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
  SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
  SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
  SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8;
  SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
  SPI_InitStructure.SPI_CRCPolynomial = 7;
  SPI_Init(GDFLASH_SPI, &SPI_InitStructure);
  
  SPI_RxFIFOThresholdConfig(GDFLASH_SPI, SPI_RxFIFOThreshold_QF);
 
  /*!< Enable the sRF_SPI  */
  SPI_Cmd(GDFLASH_SPI, ENABLE);
}

void GDflash_init(void)
{
  hal_Init_gdflash_pins();
  hal_gdflash_SPI_Config();
  GDflash_write_enable(true);
}

/*****************************************************************************
 Prototype    : spiReadWriteByte
 Description  : spi basic function
 Input        : u8 data  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
u8 GDflash_ReadWriteByte(u8 data)
{
  while(SPI_I2S_GetFlagStatus(GDFLASH_SPI,SPI_I2S_FLAG_TXE)==RESET);
  SPI_SendData8(GDFLASH_SPI, data);

  while(SPI_I2S_GetFlagStatus(GDFLASH_SPI,SPI_I2S_FLAG_RXNE)==RESET);
  return (u8)(SPI_ReceiveData8(GDFLASH_SPI));
}

void GDflash_write_enable(bool enable)
{
  DGFLASH_CS_LOW();
  
  if (enable)
  {
    GDflash_ReadWriteByte(GDFLASH_WRITE_ENABLE);
  }
  else
  {
    GDflash_ReadWriteByte(GDFLASH_WRITE_DISABLE);
  }
  
  DGFLASH_CS_HIGH();
}


u8 GDflash_read_status_reg(void)
{   
   u8 status_value;
  
   DGFLASH_CS_LOW(); 
   GDflash_ReadWriteByte(GDFLASH_READ_STATUS_REG);
   status_value = GDflash_ReadWriteByte(DGFLASH_DUMMY_BYTE);
   DGFLASH_CS_HIGH(); 
   
   return status_value;
}

void GDflash_write_status_reg(u8 value)
{
  DGFLASH_CS_LOW(); 
  GDflash_ReadWriteByte(GDFLASH_WRITE_STATUS_REG);
  GDflash_ReadWriteByte(value);
  DGFLASH_CS_HIGH(); 
}

void GDflash_read_datas(u32 startAddr, u8 *buf, u32 length, bool fastRead)
{
  DGFLASH_CS_LOW(); 
  
  if (fastRead)
  {
    GDflash_ReadWriteByte(GDFLASH_FAST_READ);
  }
  else
  {
    GDflash_ReadWriteByte(GDFLASH_READ_DATA);
  }
  
  GDflash_ReadWriteByte( (u8)((startAddr>> 16) &0xFF));
  GDflash_ReadWriteByte( (u8)((startAddr>> 8) &0xFF));
  GDflash_ReadWriteByte( (u8)(startAddr &0xFF));
  
  if (fastRead)
  {
    GDflash_ReadWriteByte(DGFLASH_DUMMY_BYTE);
  }

  for (u32 i = 0; i < length; i++)
  {
    buf[i] =  GDflash_ReadWriteByte(DGFLASH_DUMMY_BYTE);
  }
  
  DGFLASH_CS_HIGH();   
}



/*****************************************************************************
 Prototype    : spiReadWriteByte
 Description  : spi basic function
 Input        : u8 data  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
当写入地址不是每页的开头时，若此页的剩余空间小于要写入的内容大小，那么数据将会重当前
地址开始填充完此页后，从此页的开始处，再继续填充，直到完成
写入内容不能超出每页的大小256字节，超出的部分自能保证最后256字节的内容被写入flash
*****************************************************************************/
void GDflash_page_program(u32 startAddr, u8 *buf, u16 length, bool fastWrite)
{
  while ((GDflash_read_status_reg() & 0x01) == 1 );
  
  GDflash_write_enable(true);
  
  
  DGFLASH_CS_LOW(); 
  
  if (fastWrite)
  {
    GDflash_ReadWriteByte(GDFLASH_PAGE_PROGRAM_F2);
  }
  else
  {
    GDflash_ReadWriteByte(GDFLASH_PAGE_PROGRAM_02);
  }

  GDflash_ReadWriteByte( (u8)((startAddr>> 16) &0xFF));
  GDflash_ReadWriteByte( (u8)((startAddr>> 8) &0xFF));
  GDflash_ReadWriteByte( (u8)(startAddr &0xFF));
  
  for (u16 i = 0; i < length; i++)
  {
    GDflash_ReadWriteByte( buf[i]);
  }
  
  DGFLASH_CS_HIGH();
}


/*
 Any address inside the sector is a valid 
address for the Sector Erase (SE) command
*/
void GDflash_erase(u32 startAddr, GDFLASH_ERASE_TYPE erase_type)
{
  while ((GDflash_read_status_reg() & 0x01) == 1 );
  
  GDflash_write_enable(true);
  
  DGFLASH_CS_LOW(); 
  
  switch (erase_type)
  {
    case SECTOR_ERASE:
     GDflash_ReadWriteByte(GDFLASH_SECTOR_ERASE); 
    break;
    
    case BLOCK_ERASE_32K:
     GDflash_ReadWriteByte(GDFLASH_BLOCK_ERASE_32); 
    break;
    
    case BLOCK_ERASE_64K:
     GDflash_ReadWriteByte(GDFLASH_BLOCK_ERASE_64); 
    break;
    
    case CHIP_ERASE:
     GDflash_ReadWriteByte(GDFLASH_CHIP_ERASE); 
    break;
    
    default:
    break;
  } 
  
  if (erase_type != CHIP_ERASE)
  {
    GDflash_ReadWriteByte( (u8)((startAddr>> 16) &0xFF));
    GDflash_ReadWriteByte( (u8)((startAddr>> 8) &0xFF));
    GDflash_ReadWriteByte( (u8)(startAddr &0xFF));
  }
  
  DGFLASH_CS_HIGH();
}


void GDfalsh_read_identification(u8 *buf)
{
  DGFLASH_CS_LOW();
  
  GDflash_ReadWriteByte(0x9F);
  
  buf[0] = GDflash_ReadWriteByte(0xAA);
  buf[1] = GDflash_ReadWriteByte(0xAA);
  buf[2] = GDflash_ReadWriteByte(0xAA);
  
 DGFLASH_CS_HIGH();
}

void GDflash_test(void)
{
   u8 buf[] = "hello,world!";
   u8 buf1[20];
   u8 buf2[20];
   
   GDflash_init();

   GDflash_erase(0x000000,SECTOR_ERASE);
   GDflash_read_datas(0x000000 , buf1, sizeof(buf), false);
   GDflash_page_program(0x000000 , buf, sizeof(buf),true);
   GDflash_read_datas(0x000000 , buf2, sizeof(buf), false);
}




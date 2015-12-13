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
#ifdef USE_HARDSPI
  GPIO_InitTypeDef GPIO_InitStructure;
  
  RCC_AHBPeriphClockCmd( GDFLASH_CS_SCK | DGFLASH_SCK_SCK , ENABLE);
                       
   /*!< Configure sRF_CS_PIN pin: sRF CS pin */
  GPIO_InitStructure.GPIO_Pin = GDFLASH_CS_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_Init(GDFLASH_CS_PORT, &GPIO_InitStructure);
  
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;

  GPIO_InitStructure.GPIO_Pin = GDFLASH_SCK_PIN | GDFLASH_MISO_PIN | GDFLASH_MOSI_PIN;
  GPIO_Init(DGFLASH_SCK_PORT, &GPIO_InitStructure);
  
   /* SPI pin mappings */
  GPIO_PinAFConfig(DGFLASH_SCK_PORT, DGFLASH_SPI_SCK_SOURCE,  DGFLASH_SPI_SCK_AF);
  GPIO_PinAFConfig(DGFLASH_MISO_PORT, DGFLASH_SPI_MISO_SOURCE, DGFLASH_SPI_MISO_AF);
  GPIO_PinAFConfig(DGFLASH_MOSI_PORT,DGFLASH_SPI_MOSI_SOURCE,  DGFLASH_SPI_MOSI_AF);
#else
    GPIO_InitTypeDef GPIO_InitStructure;

    RCC_AHBPeriphClockCmd( GDFLASH_CS_SCK | DGFLASH_SCK_SCK , ENABLE);
                   
    /*!< Configure sRF_CS_PIN pin: sRF CS pin */
    GPIO_InitStructure.GPIO_Pin   = GDFLASH_CS_PIN;
    GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_OUT;
    GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GDFLASH_CS_PORT, &GPIO_InitStructure);
    
 
    GPIO_InitStructure.GPIO_Pin   = GDFLASH_MOSI_PIN | GDFLASH_SCK_PIN;
    GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_OUT;
    GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(DGFLASH_MOSI_PORT, &GPIO_InitStructure);
    

    GPIO_InitStructure.GPIO_Pin   = GDFLASH_MISO_PIN;
    GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(DGFLASH_MISO_PORT, &GPIO_InitStructure);
    
#endif

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

void GDflash_WriteByte(u8 data)
{
    for (u8 i = 0; i < 8; i++)
    {
        if((data & 0x80) == 0x80)
        {
            DGFLASH_MOSI_High();
        }
        else
        {
            DGFLASH_MOSI_LOW();
        }

        DGFLASH_SCK_High();
        data <<= 1;
        DGFLASH_SCK_LOW();   
    }
}

u8 GDflash_ReadByte(u8 data)
{
    u8 dat = 0;
    u8 revBit = 0;
    
    for (u8 i = 0; i < 8; i++)
    {
        dat <<= 1;
        revBit = SDO();
        DGFLASH_SCK_High();
        if (revBit)
        {
            dat = dat | 0x01;
        }
        DGFLASH_SCK_LOW();
        
    }
    return dat;
}


/*****************************************************************************
 *
��flash�����߳���ʱ��Ҫ�ǵȴ�������ʹ���������
 *
 *
 *
 *
 *
*****************************************************************************/
void wait_flash_free(void)
{
    while ((GDflash_read_status_reg() & 0x01) == 1 );
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
*****************************************************************************/
void GDflash_init(void)
{
  hal_Init_gdflash_pins();
  //hal_gdflash_SPI_Config();
  GDflash_write_enable(true);
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
*****************************************************************************/
void GDflash_write_enable(bool enable)
{
  DGFLASH_CS_LOW();
  
  if (enable)
  {
    GDflash_WriteByte(GDFLASH_WRITE_ENABLE);
  }
  else
  {
    GDflash_WriteByte(GDFLASH_WRITE_DISABLE);
  }
  
  DGFLASH_CS_HIGH();
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
*****************************************************************************/
u8 GDflash_read_status_reg(void)
{   
   u8 status_value;
  
   DGFLASH_CS_LOW(); 
   GDflash_WriteByte(GDFLASH_READ_STATUS_REG);
   status_value = GDflash_ReadByte(DGFLASH_DUMMY_BYTE);
   DGFLASH_CS_HIGH(); 
   
   return status_value;
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
*****************************************************************************/
void GDflash_write_status_reg(u8 value)
{
  DGFLASH_CS_LOW(); 
  GDflash_WriteByte(GDFLASH_WRITE_STATUS_REG);
  GDflash_WriteByte(value);
  DGFLASH_CS_HIGH(); 
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
*****************************************************************************/
void GDfalsh_read_identification(u8 *buf)
{
  DGFLASH_CS_LOW();
  
  GDflash_WriteByte(0x9F);
  
  buf[0] = GDflash_ReadByte(0xAA);
  buf[1] = GDflash_ReadByte(0xAA);
  buf[2] = GDflash_ReadByte(0xAA);
  
 DGFLASH_CS_HIGH();
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
*****************************************************************************/
void GDflash_read_datas(u32 startAddr, u8 *buf, u32 length, bool fastRead)
{
  DGFLASH_CS_LOW(); 
  
  if (fastRead)
  {
    GDflash_WriteByte(GDFLASH_FAST_READ);
  }
  else
  {
    GDflash_WriteByte(GDFLASH_READ_DATA);
  }
  
  GDflash_WriteByte( (u8)((startAddr>> 16) &0xFF));
  GDflash_WriteByte( (u8)((startAddr>> 8) &0xFF));
  GDflash_WriteByte( (u8)(startAddr &0xFF));
  
  if (fastRead)
  {
    GDflash_WriteByte(DGFLASH_DUMMY_BYTE);
  }

  for (u32 i = 0; i < length; i++)
  {
    buf[i] =  GDflash_ReadByte(DGFLASH_DUMMY_BYTE);
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
��д���ַ����ÿҳ�Ŀ�ͷʱ������ҳ��ʣ��ռ�С��Ҫд������ݴ�С����ô���ݽ����ص�ǰ
��ַ��ʼ������ҳ�󣬴Ӵ�ҳ�Ŀ�ʼ�����ټ�����䣬ֱ�����
д�����ݲ��ܳ���ÿҳ�Ĵ�С256�ֽڣ������Ĳ������ܱ�֤���256�ֽڵ����ݱ�д��flash
*****************************************************************************/
void GDflash_page_program(u32 startAddr, u8 *buf, u16 length, bool fastWrite)
{
  while ((GDflash_read_status_reg() & 0x01) == 1 );
  
  GDflash_write_enable(true);
  
  DGFLASH_CS_LOW(); 
  
  if (fastWrite)
  {
    GDflash_WriteByte(GDFLASH_PAGE_PROGRAM_F2);
  }
  else
  {
    GDflash_WriteByte(GDFLASH_PAGE_PROGRAM_02);
  }

  GDflash_WriteByte( (u8)((startAddr>> 16) &0xFF));
  GDflash_WriteByte( (u8)((startAddr>> 8) &0xFF));
  GDflash_WriteByte( (u8)(startAddr &0xFF));
  
  for (u16 i = 0; i < length; i++)
  {
    GDflash_WriteByte( buf[i]);
  }
  
  DGFLASH_CS_HIGH();

  while ((GDflash_read_status_reg() & 0x01) == 1 );
}


/*****************************************************************************
 *

 *
 *
 *
 *
 * Any address inside the sector is a valid 
address for the Sector Erase (SE) command
Any address 
inside the block is a valid address for the 32KB Block Erase (BE) command
Any address 
inside the block is a valid address for the 64KB Block Erase (BE) command
*****************************************************************************/
void GDflash_erase(u32 startAddr, GDFLASH_ERASE_TYPE erase_type)
{
  while ((GDflash_read_status_reg() & 0x01) == 1 );
  
  GDflash_write_enable(true);
  
  DGFLASH_CS_LOW(); 
  
  switch (erase_type)
  {
    case SECTOR_ERASE:
     GDflash_WriteByte(GDFLASH_SECTOR_ERASE); 
    break;
    
    case BLOCK_ERASE_32K:
     GDflash_WriteByte(GDFLASH_BLOCK_ERASE_32); 
    break;
    
    case BLOCK_ERASE_64K:
     GDflash_WriteByte(GDFLASH_BLOCK_ERASE_64); 
    break;
    
    case CHIP_ERASE:
     GDflash_WriteByte(GDFLASH_CHIP_ERASE); 
    break;
    
    default:
    break;
  } 
  
  if (erase_type != CHIP_ERASE)
  {
    GDflash_WriteByte( (u8)((startAddr>> 16) &0xFF));
    GDflash_WriteByte( (u8)((startAddr>> 8) &0xFF));
    GDflash_WriteByte( (u8)(startAddr &0xFF));
  }
  
  DGFLASH_CS_HIGH();
}

/*****************************************************************************
 *

 *
 *
 *
 *
 * Any address inside the sector is a valid 
address for the Sector Erase (SE) command
*****************************************************************************/
void GDflash_read(u32 startAddr, u8 *buf, u32 length)
{
    GDflash_read_datas(startAddr, buf, length, false);
}

/*****************************************************************************
 *

 *
 *
 *
 *
 *
 ��д���ַ����ÿҳ�Ŀ�ͷʱ������ҳ��ʣ��ռ�С��Ҫд������ݴ�С����ô���ݽ����ص�ǰ
 ��ַ��ʼ������ҳ�󣬴Ӵ�ҳ�Ŀ�ʼ�����ټ�����䣬ֱ�����
 д�����ݲ��ܳ���ÿҳ�Ĵ�С256�ֽڣ������Ĳ������ܱ�֤���256�ֽڵ����ݱ�д��flash

 ����д�뷽��,ֻ��д�����ܲ������ڵ�һ����������ʱ���ȫƬ����
*****************************************************************************/
void GDflash_write(u32 startAddr, u8 *buf, u32 length)
{
   u32 current_startAddr  = startAddr;
   u8  first_page_byte    = GDFLASH_PAGE_SIZE - (startAddr % GDFLASH_PAGE_SIZE);
   u8 * current_data_ptr  = buf;
   u32 left_length        = length;
   u16 integrated_Pages; 
   u16 end_page_byte; 

   if (length > first_page_byte)
   {
       GDflash_page_program( current_startAddr, current_data_ptr, first_page_byte, false); 

       current_startAddr = current_startAddr + first_page_byte;
       current_data_ptr += first_page_byte;
       left_length       = length - first_page_byte;
       integrated_Pages  = left_length / GDFLASH_PAGE_SIZE;
       end_page_byte     = left_length % GDFLASH_PAGE_SIZE;

      
      for (u16 i = 0; i < integrated_Pages; i++)
      {
        GDflash_page_program( current_startAddr, current_data_ptr, GDFLASH_PAGE_SIZE, false); 
        current_startAddr += GDFLASH_PAGE_SIZE;
        current_data_ptr  += GDFLASH_PAGE_SIZE;
      }

      if (end_page_byte > 0)
      {
        GDflash_page_program( current_startAddr, current_data_ptr, end_page_byte, false); 
      } 
   }
   else
   {
       GDflash_page_program( current_startAddr, current_data_ptr, length, false); 
   }
}


void GDflash_64KByte_erase(void)
{
  GDflash_erase(0 , BLOCK_ERASE_64K);
  
}


/*****************************************************************************
 *

 *
 *
 *
 *
 * Any address inside the sector is a valid 
address for the Sector Erase (SE) command
*****************************************************************************/

void GDflash_test(void)
{
   u8 buf[] = "hello,world!";
   u8 buf1[20];
   u8 buf2[20];
   
   GDflash_init();
   GDfalsh_read_identification(buf1);
   GDflash_erase(0x000000,SECTOR_ERASE);
   GDflash_read_datas(0x000000 , buf1, sizeof(buf), false);
   GDflash_page_program(0x000000 , buf, sizeof(buf),false);
   GDflash_read_datas(0x000000 , buf2, sizeof(buf), false);
   GDfalsh_read_identification(buf1);
}




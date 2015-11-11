/**
  ******************************************************************************
  * @file    hal_radio.c 
  * @author  William Liang
  * @version V1.0.0
  * @date    09/10/2013
  * @brief   This file contains the initialization and handle of the radio frequency.
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <string.h>
#include <stdlib.h>
#include "hal_radio.h"
#include "hal_uart.h"

#include "sx1276-LoRaMisc.h"
#include "sx1276-LoRa.h"
#include "hal_timer.h"
#include "stm32f0xx_spi.h"
#include "phy.h"
#include "sx1276-Fsk.h"
#include "hal_led.h"
#include "gpio_per.h" 

//#include "hal_fsk_sen.h"
//#include "MAC.h"
//#include "sx1276.h"
//#include "hal_flash.h"
//#include "hal_wdg.h"
//#include "hal_eeprom.h"


typedef enum
{
  START_645_POINT       = 0,
  ADDR_645_POINT        = 1,
  CONTROL_645_POINT     = 8,
  DATA_LENGTH_645_POINT = 9,
  DATA_MARK_645_POINT   = 10,
  DATA_PACKET_645_POINT = 14
}em_645_point;


/** @addtogroup RADIO
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/


extern sRF_FSK g_fsk ;
extern st_RF_LoRa_DypeDef g_RF_LoRa;
extern RN8209C_PARAM rn8209c_papameter;
extern u8 tedtbuf[];

struct etimer timer_rf; 


u8 local_addr[6]    = {0x0b, 0x9a, 0x09, 0x03, 0x00, 0x11};
u8 bordcast_addr[6] = {0xFF,0xFF,0xFF,0xFF,0xFF,0xFF};

u8 cmd_op_light[4]  = {0x34, 0x33, 0x33, 0x93};
u8 cmd_read_data[4] = {0x42, 0x33, 0x33, 0x94};

/* 不同为0， 相同为1 */
u8 cmp(u8 * buf1, u8* buf2, u8 length)
{
  for (u8 i = 0; i < length; i++)
  {
     if ( (buf1[i] ^ buf2[i]) == 1)
     {
       /* 不同 */
       return 0;
     }
  }
    /* 相同 */
   return 1;
}








/* 尽量将etimer 绑定在事件中，在事件中定义 */
PROCESS(hal_RF_process, "radio_process ");

#ifdef USE_LORA_MODE
PROCESS_THREAD(hal_RF_process, ev, data)
{
  PROCESS_BEGIN();
  
  while(1)
  {
    PROCESS_WAIT_EVENT(); 

    if (ev == PROCESS_EVENT_MSG)
    {
        if (*((tRFLRStates*)data) == RFLR_STATE_TX_RUNNING)   
        {
            etimer_set(&timer_rf, CLOCK_CONF_SECOND*2);               //超时时间还需要调整
            printf("tx start\r\n");
        }
        else if (*((tRFLRStates*)data) == RFLR_STATE_TX_DONE)  
        {
           //etimer_stop(&timer_rf);                                  //此处如果不在中断函数中处理，就要在进程函数中处理
           SX1276LoRa_Receive_Packet(false);
           printf("tx done\r\n");
        }
        else  if (*((tRFLRStates*)data) == RFLR_STATE_RX_RECEIVEING) 
        {
           etimer_set(&timer_rf, CLOCK_CONF_SECOND*2);                  //超时时间还需要调整
           printf("rx start\r\n");
        } 
        else if (*((tRFLRStates*)data) == RFLR_STATE_RX_DONE) 
        {
           printf("rssi = %f  snr = %d\r\n",SX1276LoRaGetPacketRssi(), SX1276LoRaGetPacketSnr());
         
          if (g_RF_LoRa.rf_DataBufferValid)
          {
             //etimer_stop(&timer_rf);                                 //此处如果不在中断函数中处理，就要在进程函数中处理
              hal_ToggleLED(TXD_LED);
              g_RF_LoRa.rf_DataBufferValid = false;
              //hal_DebugDMATx(g_RF_LoRa.rf_DataBuffer, g_RF_LoRa.rf_RxPacketSize);
             #ifdef PRINTF_DEBUG
              //apl_ProcessRadioCmd();                                 //解析帧，传给应用层 
             #endif
          }
          else
          {
              printf("CRC error\r\n");
          }
          SX1276LoRa_Receive_Packet(false);
        }
    }
    else if (ev == PROCESS_EVENT_TIMER)
    {
       if ((struct etimer *)data == &timer_rf)
       {
         if (SX1276LoRaGetRFState() == RFLR_STATE_TX_RUNNING)   
         {
            printf("tx time out\r\n");
         }
         if (SX1276LoRaGetRFState() ==  RFLR_STATE_RX_RECEIVEING)
         {
            printf("rx time out\r\n");
         }  
         hal_sRF_InitSPI();
         SX1276LoRa_Receive_Packet(false);
       }
    }
 }
 PROCESS_END();
}
#else
  
PROCESS_THREAD(hal_RF_process, ev, data)
{
  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_WAIT_EVENT(); 

    if (ev == PROCESS_EVENT_MSG)
    {
        if (*((tRFStates*)data) == RF_STATE_TX_RUNNING)   
        {
            printf("tx start\r\n");
        }
        else if (*((tRFStates*)data) == RF_STATE_TX_DONE)  
        {
           printf("tx done\r\n");
           SX1276Fsk_recrive_Packet();
        }
        else  if (*((tRFStates*)data) == RF_STATE_RX_PREAMBLE) 
        {
            printf("rx start\r\n");
            etimer_set(&timer_rf, CLOCK_CONF_SECOND*3);
        }
        else if (*((tRFStates*)data) == RF_STATE_RX_DONE) 
        {
           printf("rx done\r\n");
           printf("rssi = %f\r\n",g_fsk.rssi);
           for (u8 i = 0; i < g_fsk.packetLenth; i++ )
           {
              printf("%d ",g_fsk.buffer[i]);
           }
           printf("\r\n");
           SX1276Fsk_recrive_Packet();
        }
    }
    else if (ev == PROCESS_EVENT_TIMER)
    {
         if ((struct etimer *)data == &timer_rf)
         {
           if (g_fsk.states == RF_STATE_TX_RUNNING)   
           {
              printf("tx time out\r\n");
           }
           else
           {
              hal_sRF_InitSPI();
              SX1276Fsk_recrive_Packet();
              printf("rx time out\r\n");
           }  
         }
       
    }
 }
 PROCESS_END();
}
#endif



/*****************************************************************************
 Prototype    : spiReadWriteByte
 Description  : spi basic function
 Input        : u8 data  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
u8 spiReadWriteByte(u8 data)
{
  while(SPI_I2S_GetFlagStatus(sRF_SPI,SPI_I2S_FLAG_TXE)==RESET);
  SPI_SendData8(sRF_SPI, data);

  while(SPI_I2S_GetFlagStatus(sRF_SPI,SPI_I2S_FLAG_RXNE)==RESET);
  return (u8)(SPI_ReceiveData8(sRF_SPI));
}

/*****************************************************************************
 Prototype    : SX1276WriteBuffer
 Description  : spi write buffer
 Input        : uint8_t addr     
                uint8_t *buffer  
                uint8_t size     
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276WriteBuffer( uint8_t addr, uint8_t *buffer, uint8_t size )
{
    sRF_CS_LOW();
    spiReadWriteByte(addr|0x80);

    for(u8 i = 0;i < size; i++)
    {
      spiReadWriteByte(buffer[i]);
    }
    sRF_CS_HIGH();  
}

/*****************************************************************************
 Prototype    : SX1276ReadBuffer
 Description  : none
 Input        : uint8_t addr     
                uint8_t *buffer  
                uint8_t size     
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276ReadBuffer( uint8_t addr, uint8_t *buffer, uint8_t size )
{
  sRF_CS_LOW();
   
  spiReadWriteByte(addr);

  for(u8 i = 0;i < size; i++)
  {
    buffer[i] = spiReadWriteByte(0xFF);
  }
  sRF_CS_HIGH();
}

/*****************************************************************************
 Prototype    : SX1276Write
 Description  : 1276 write Reg
 Input        : uint8_t addr  
                uint8_t data  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276Write( uint8_t addr, uint8_t data )
{
    SX1276WriteBuffer( addr, &data, 1 );
}

/*****************************************************************************
 Prototype    : SX1276Read
 Description  : 1276 read Reg
 Input        : uint8_t addr   
                uint8_t *data  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276Read( uint8_t addr, uint8_t *data )
{
    SX1276ReadBuffer( addr, data, 1 );
}

/*****************************************************************************
 Prototype    : SX1276WriteFifo
 Description  : none
 Input        : uint8_t *buffer  
                uint8_t size     
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276WriteFifo( uint8_t *buffer, uint8_t size )
{
    SX1276WriteBuffer( sRF_FIFO_ARRD, buffer, size );
}

/*****************************************************************************
 Prototype    : SX1276ReadFifo
 Description  : none
 Input        : uint8_t *buffer  
                uint8_t size     
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276ReadFifo( uint8_t *buffer, uint8_t size )
{
    SX1276ReadBuffer( sRF_FIFO_ARRD, buffer, size );
}


/*****************************************************************************
 Prototype    : SX1276SetReset
 Description  : none
 Input        : uint8_t state  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276SetReset( uint8_t state )
{
  if( state == RADIO_RESET_ON )
  {
    // Set RESET pin to 0
    GPIO_WriteBit( sRF_RESET_PORT, sRF_RESET_PIN, Bit_RESET );
  }
  else
  {
     // Set RESET pin to 1
    GPIO_WriteBit( sRF_RESET_PORT, sRF_RESET_PIN, Bit_SET );
  
  }
}

/*****************************************************************************
 Prototype    : hal_sRF_ITConfig
 Description  : none
 Input        : en_GDOx_IrqLine irqLine   
                FunctionalState NewState  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_sRF_ITConfig(uint32_t irqLine, FunctionalState NewState)
{
  EXTI_InitTypeDef EXTI_InitStructure;
  
  EXTI_InitStructure.EXTI_Line = irqLine;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
  EXTI_InitStructure.EXTI_LineCmd = NewState;
  EXTI_Init(&EXTI_InitStructure); 
}

void hal_sRF_FSK_ITConfig( uint32_t irqLine, FunctionalState NewState)
{
  EXTI_InitTypeDef EXTI_InitStructure;
  
  EXTI_InitStructure.EXTI_Line = irqLine;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
  EXTI_InitStructure.EXTI_LineCmd = NewState;
  EXTI_Init(&EXTI_InitStructure); 
}

/*****************************************************************************
 Prototype    : hal_sRF_ClearAllRF_IT
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
#if 0
void hal_sRF_ClearAllRF_IT( void )
{
  EXTI_ClearITPendingBit(sRF_DIO0_IRQ_LINE | sRF_DIO1_IRQ_LINE | sRF_DIO2_IRQ_LINE | sRF_DIO3_IRQ_LINE);
}
#endif
/*****************************************************************************
 Prototype    : hal_Init_RF_pins
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_Init_RF_pins(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  
 RCC_AHBPeriphClockCmd(sRF_CS_GPIO_CLK | sRF_SPI_SCK_GPIO_CLK | sRF_SPI_MOSI_GPIO_CLK | sRF_SPI_MISO_GPIO_CLK |
                       sRF_DIOx_SCK | sRF_RESET_SCK, ENABLE);

  hal_DIOx_ITConfig(all,DISABLE);
 
   /*!< Configure sRF_CS_PIN pin: sRF CS pin */
  GPIO_InitStructure.GPIO_Pin = sRF_CS_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_Init(sRF_CS_GPIO_PORT, &GPIO_InitStructure);
  
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;

  GPIO_InitStructure.GPIO_Pin = sRF_SPI_SCK_PIN | sRF_SPI_MISO_PIN | sRF_SPI_MOSI_PIN;
  GPIO_Init(sRF_SPI_MOSI_GPIO_PORT, &GPIO_InitStructure);
  
  
   /* SPI pin mappings */
  GPIO_PinAFConfig(sRF_SPI_SCK_GPIO_PORT, sRF_SPI_SCK_SOURCE, sRF_SPI_SCK_AF);
  GPIO_PinAFConfig(sRF_SPI_MISO_GPIO_PORT, sRF_SPI_MISO_SOURCE, sRF_SPI_MISO_AF);
  GPIO_PinAFConfig(sRF_SPI_MOSI_GPIO_PORT, sRF_SPI_MOSI_SOURCE, sRF_SPI_MOSI_AF);
  
  /* RF reset pin */
  GPIO_InitStructure.GPIO_Pin = sRF_RESET_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_Init(sRF_RESET_PORT, &GPIO_InitStructure);
  GPIO_WriteBit( sRF_RESET_PORT, sRF_RESET_PIN, Bit_SET );
  

   /*!< Configure sRF_IRQ_PINs pin: DDO0~GDO4 */
  GPIO_InitStructure.GPIO_Pin = sRF_DIO0_PIN | sRF_DIO1_PIN | sRF_DIO2_PIN
                                             | sRF_DIO3_PIN | sRF_DIO4_PIN ;
  
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_DOWN;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(sRF_DIOx_PORT, &GPIO_InitStructure);
}

/*****************************************************************************
 Prototype    : GPIO_int_Config
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void GPIO_int_Config(void)
{
  /* Enable AFIO clock */
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);
  
  EXTI_ClearITPendingBit(DIO0_IRQ | DIO1_IRQ | DIO2_IRQ | DIO3_IRQ);
  
  /* Connect EXTI0 Line to PB.0 pin */
  SYSCFG_EXTILineConfig(sRF_DIOx_PORT_SOURCE, sRF_DIO0_PIN_SOURCE);
  /* Connect EXTI1 Line to PB.1 pin */
  SYSCFG_EXTILineConfig(sRF_DIOx_PORT_SOURCE, sRF_DIO1_PIN_SOURCE);
  /* Connect EXTI2 Line to PB.2 pin */
  SYSCFG_EXTILineConfig(sRF_DIOx_PORT_SOURCE, sRF_DIO2_PIN_SOURCE);
  /* Connect EXTI3 Line to PB.11 pin */
  SYSCFG_EXTILineConfig(sRF_DIOx_PORT_SOURCE, sRF_DIO3_PIN_SOURCE);
  
  hal_DIOx_ITConfig(all,DISABLE);
  //hal_DIOx_ITConfig(all,ENABLE);
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
void hal_sRF_SPI_Config(void)
{
  SPI_InitTypeDef SPI_InitStructure;
 
  /*!< Deselect the RF: Chip Select high */
  sRF_CS_HIGH();
  
  /* Disable sRF_SPI */
  SPI_Cmd(sRF_SPI, DISABLE);
  
  /*!< SPI configuration */
  //SPI_I2S_DeInit(sRF_SPI);
  
    /*!< sRF_SPI Periph clock enable */
  //RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);
  
  RCC_APB2PeriphClockCmd(sRF_SPI_CLK, ENABLE);
  
  SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
  SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
  SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
  SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8;
  SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
  SPI_InitStructure.SPI_CRCPolynomial = 7;
  SPI_Init(sRF_SPI, &SPI_InitStructure);
  
  SPI_RxFIFOThresholdConfig(sRF_SPI, SPI_RxFIFOThreshold_QF);
 
  /*!< Enable the sRF_SPI  */
  SPI_Cmd(sRF_SPI, ENABLE);
}

/*****************************************************************************
 Prototype    : init_SPI_DMA
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
#ifdef SPI_DMA_FIFO
void init_SPI_DMA(void)
{   
  DMA_InitTypeDef DMA_InitStructure;
  
  /* Enable sRF SPI DMA clock */
  RCC_AHBPeriphClockCmd(sRF_SPI_DMA_CLK, ENABLE);

  /* Enable SPI Rx and Tx request */
  SPI_I2S_DMACmd(sRF_SPI, SPI_I2S_DMAReq_Rx | SPI_I2S_DMAReq_Tx, ENABLE);

  /* sRF_SPI_DMA_RX_Channel configuration ---------------------------------------------*/
  DMA_DeInit(sRF_SPI_DMA_RX_Channel);
  DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)sRF_SPI_DR_Base;
  DMA_InitStructure.DMA_MemoryBaseAddr = (u32)0;
  DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
  DMA_InitStructure.DMA_BufferSize = 0;
  DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
  DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
  DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
  DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
  DMA_Init(sRF_SPI_DMA_RX_Channel, &DMA_InitStructure);

  /* sRF_SPI_DMA_TX_Channel configuration ---------------------------------------------*/
  DMA_DeInit(sRF_SPI_DMA_TX_Channel);
  DMA_InitStructure.DMA_PeripheralBaseAddr = (u32)sRF_SPI_DR_Base;
  DMA_InitStructure.DMA_MemoryBaseAddr = (u32)0;
  DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
  DMA_InitStructure.DMA_BufferSize = 0;
  DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
  DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
  DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
  DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
  DMA_Init(sRF_SPI_DMA_TX_Channel, &DMA_InitStructure);
}
#endif

/*****************************************************************************
 Prototype    : hal_sRF_InitSPI
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_sRF_InitSPI(void)
{
   hal_Init_RF_pins();
   hal_sRF_SPI_Config();
   
   #ifdef SPI_DMA_FIFO
   init_SPI_DMA();
   #endif
}

#if 0
/*****************************************************************************
 Prototype    : hal_sRF_ReadRegister
 Description  : none
 Input        : u8 reg  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
u8 hal_sRF_ReadRegister(u8 reg)
{
  if (reg > TOTAL_REGISTER_NUMBER)
  {
    printf("regsiter input error\r\n");
    return 0;
  }
  
  /*!< Deselect the Radio: Chip Select high */
  sRF_CS_HIGH();
  
  /*!< Select the radio by pulling low the nSEL pin */
  sRF_CS_LOW();
  
  /*!< Loop while DR register in not emplty */
  while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_TXE) == RESET);

  /*!< Send byte through the SPI1 peripheral */
  SPI_SendData8(sRF_SPI, reg);

  /*!< Wait to receive a byte */
  while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_RXNE) == RESET);

  /* read from the SPI bus */
  SPI_ReceiveData8(sRF_SPI);

  /*!< Loop while DR register in not emplty */
  while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_TXE) == RESET);

  /*!< Send byte through the SPI1 peripheral */
  SPI_SendData8(sRF_SPI, sRF_DUMMY_BYTE);
  
  /*!< Wait to receive a byte */
  while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_RXNE) == RESET);

  /*!< Return the byte read from the SPI bus */
  reg = SPI_ReceiveData8(sRF_SPI);

  /*!< Deselect the radio by pulling high the nSEL pin */
  sRF_CS_HIGH();
  
  return reg;
}

/*****************************************************************************
 Prototype    : hal_sRF_WriteRegister
 Description  : none
 Input        : u8 reg  
                u8 val  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_sRF_WriteRegister(u8 reg, u8 val)
{
  reg |= 0x80;
  
  /*!< Deselect the Radio: Chip Select high */
  sRF_CS_HIGH();
  
  /*!< Select the radio by pulling low the nSEL pin */
  sRF_CS_LOW();
  
  /*!< Loop while DR register in not emplty */
  while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_TXE) == RESET);

  /*!< Send byte through the SPI1 peripheral */
  SPI_SendData8(sRF_SPI, reg);

  /*!< Wait to receive a byte */
  while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_RXNE) == RESET);

  /* read from the SPI bus */
  SPI_ReceiveData8(sRF_SPI);

  /*!< Loop while DR register in not emplty */
  while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_TXE) == RESET);

  /*!< Send byte through the SPI1 peripheral */
  SPI_SendData8(sRF_SPI, val);
  
  /*!< Wait to receive a byte */
  while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_RXNE) == RESET);

  /* read from the SPI bus */
  SPI_ReceiveData8(sRF_SPI);

  /*!< Deselect the radio by pulling high the nSEL pin */
  sRF_CS_HIGH();
}
#endif


#ifdef SPI_DMA_FIFO
/*****************************************************************************
 Prototype    : hal_sRF_DMA_Read
 Description  : none
 Input        : u8 startReg  
                u8 *pBuffer  
                u8 length    
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_sRF_DMA_Read(u8 startReg, u8 *pBuffer, u8 length)
{
  /* Allocate storage for CPU status register      */
#if OS_CRITICAL_METHOD == 3u
  OS_CPU_SR cpu_sr = 0u;
#endif
  
  if (startReg > TOTAL_REGISTER_NUMBER)
  {
    return;
  }

  if (length > 0)
  {
    /*!< Deselect the Radio: Chip Select high */
    sRF_CS_HIGH();
    
    /*!< Select the radio by pulling low the nSEL pin */
    sRF_CS_LOW();
    
    /*!< Loop while DR register in not emplty */
    while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_TXE) == RESET);

    /*!< Send byte through the SPI1 peripheral */
    SPI_SendData8(sRF_SPI, startReg);

    /*!< Wait to receive a byte */
    while (SPI_I2S_GetFlagStatus(sRF_SPI, SPI_I2S_FLAG_RXNE) == RESET);

    /* read from the SPI bus */
    SPI_ReceiveData8(sRF_SPI);

    OS_ENTER_CRITICAL();
    
    sRF_SPI->CR1 |= SPI_Direction_2Lines_RxOnly;
    
    /* sRF_SPI_DMA_RX_Channel configuration ---------------------------------------------*/
    sRF_SPI_DMA_RX_Channel->CMAR = (u32)pBuffer;
    sRF_SPI_DMA_RX_Channel->CNDTR = (u32)length;
    
    /* Enable sRF_SPI_DMA_RX_Channel and TC interrupt*/
    sRF_SPI_DMA_RX_Channel->CCR |= DMA_CCR_EN | DMA_CCR_TCIE;

    OS_EXIT_CRITICAL();
  }
}

/*****************************************************************************
 Prototype    : hal_sRF_DMA_Write
 Description  : none
 Input        : u8 *pBuffer  
                u8 length    
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_sRF_DMA_Write(u8 *pBuffer, u8 length)
{
  if (length > 0)
  {
    /*!< Deselect the Radio: Chip Select high */
    sRF_CS_HIGH();
    
    /*!< Select the radio by pulling low the nSEL pin */
    sRF_CS_LOW();
    
    /* sRF_SPI_DMA_TX_Channel configuration ---------------------------------------------*/
    sRF_SPI_DMA_TX_Channel->CMAR = (u32)pBuffer;
    sRF_SPI_DMA_TX_Channel->CNDTR = (u32)length;
    
    /* Enable sRF_SPI_DMA_TX_Channel */
    sRF_SPI_DMA_TX_Channel->CCR |= DMA_CCR_EN | DMA_CCR_TCIE;
  }
  else
  {
    printf("length input error\r\n");
  }
}

/*****************************************************************************
 Prototype    : hal_sRF_Config
 Description  : none 
 Input        : u8 startReg  
                u8 *pBuffer  
                u8 length    
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_sRF_Config(u8 startReg, u8 *pBuffer, u8 length)
{

  if (startReg >= TOTAL_REGISTER_NUMBER)
  {
    printf("startReg input error\r\n");
    return;
  }
  if (length > 0)
  {
    hal_sRF_InitSPI();
    *pBuffer = startReg | 0x80;
    hal_sRF_DMA_Write(pBuffer, length + 1);
  }
}

/*****************************************************************************
 Prototype    : hal_sRF_Read
 Description  : DMA read FIFO
 Input        : u8 startReg  
                u8 *pBuffer  
                u8 length    
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_sRF_Read(u8 startReg, u8 *pBuffer, u8 length)
{
 
  if (length > 0)
  {
    hal_sRF_InitSPI();
    hal_sRF_DMA_Read(startReg,pBuffer,length);
  }
}

/*****************************************************************************
 Prototype    : hal_sRF_readFIFO_DMA
 Description  : none
 Input        : u8 * pBuffer指向接收数组
                u8 length     
 Output       : None
 Return Value : 
 Date         : 2014/3/21
 Author       : Barry
*****************************************************************************/
void hal_sRF_readFIFO_DMA(u8 * pBuffer, u8 length)
{

  hal_sRF_DMA_Read(0,pBuffer,length);

}

/*****************************************************************************
 Prototype    : hal_sRF_writeFIFO_DMA
 Description  : none
 Input        : u8 * pBuffer 指向开始发送的数组
                u8   length  实际发送的字节数   
 Output       : None
 Return Value : 
 Date         : 2014/3/21
 Author       : Barry
*****************************************************************************/
void hal_sRF_writeFIFO_DMA(u8 * pBuffer, u8 length)
{
  hal_sRF_Config(0,pBuffer,length);
}



/******************************************************************************
*      STM32F10x Peripherals Interrupt Handlers   
*
/*****************************************************************************/


/*****************************************************************************
 Prototype    : sRF_SPI_DMA_IRQHandler
 Description  :  
 Input        : void 
 Output       : None 
  History        :
  1.Date         :
    Author       : liwei
    Modification : Created function
*****************************************************************************/
void sRF_SPI_DMA_IRQHandler(void)
{
  if (DMA_GetITStatus(sRF_SPI_DMA_RX_COMPLETE) != RESET)
  {
    /* hal_sRF_InitSPI();初始化放在主循环中去 */
    RxEndProcess(true);
    
    /* Clear the DMA1 interrupt pending bits */
    DMA1->IFCR = sRF_SPI_DMA_RX_COMPLETE;
 
    /* Disable the selected DMA1_Channel2 */
    sRF_SPI_DMA_RX_Channel->CCR &= (u16)(~DMA_CCR_EN);
  }
  else if (DMA_GetITStatus(sRF_SPI_DMA_TX_COMPLETE) != RESET)
  {
     SX1276LoRaStartTransmit();
    
     /* Clear the DMA1 interrupt pending bits */
    DMA1->IFCR = sRF_SPI_DMA_TX_COMPLETE;
    
    /* Disable the selected DMA1_Channel3 */
    sRF_SPI_DMA_TX_Channel->CCR &= (u16)(~DMA_CCR_EN);
  }
  else if (DMA_GetITStatus(sRF_SPI_DMA_RX_ERROR) != RESET)
  {
     /* Disable sRF_SPI */
    sRF_SPI->CR1 &= (u16)~((u16)SPI_CR1_SPE);

    /* Clear the DMA1 interrupt pending bits */
    DMA1->IFCR = sRF_SPI_DMA_RX_ERROR;
    
    /* Disable the selected DMA1_Channel2 */
    sRF_SPI_DMA_RX_Channel->CCR &= (u16)(~DMA_CCR_EN);
  }
  else if (DMA_GetITStatus(sRF_SPI_DMA_TX_ERROR) != RESET)
  {
    /* Clear the DMA1 interrupt pending bits */
    DMA1->IFCR = sRF_SPI_DMA_TX_ERROR;
    
    /* Disable the selected DMA1_Channel3 */
    sRF_SPI_DMA_TX_Channel->CCR &= (u16)(~DMA_CCR_EN);
  }
  else
  {
    /* Clear the DMA1 interrupt pending bits */
    DMA1->IFCR = sRF_SPI_DMA_RX_HALF | sRF_SPI_DMA_TX_HALF;
  }
}
#endif
/*****************************************************************************
 Prototype    : hal_sRF_Transmit
 Description  : PHY send
 Input        : u8 *pBuffer  
                u8 length    
                u8 channel   
 Output       : None
 Return Value : 
 Calls        : 
 Called By    : 
 
  History        :
  1.Date         : 2014/10/29
    Author       : liwei
    Modification : Created function

*****************************************************************************/
void hal_sRF_Transmit(u8 *pBuffer, u8 length, u8 channel)
{
  SX1276LoRa_Send_Packet(pBuffer,length);
}

/*****************************************************************************
 Prototype    : hal_InitRF
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void hal_InitRF(void)
{ 
  etimer_stop(&timer_rf);
  hal_sRF_InitSPI();
  GPIO_int_Config();
#ifdef USE_LORA_MODE
  SX1276_lora_init(true);
#else
  SX1276_lora_init(false);
#endif
  printf("reset RF\r\n");
}

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/


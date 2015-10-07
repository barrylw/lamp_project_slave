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
//#include "hal_fsk_sen.h"
//#include "MAC.h"
//#include "sx1276.h"
//#include "hal_flash.h"
//#include "hal_wdg.h"
//#include "hal_eeprom.h"
#include "hal_led.h"


/** @addtogroup RADIO
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

extern sRF_FSK g_fsk ;
extern st_RF_LoRa_DypeDef g_RF_LoRa;
extern u8 tedtbuf[];
bool g_slaveMode = false;
static u16 txcount = 0;
static u16 rxCount = 0;

char oledPrintf[50];


struct etimer timer_rf; 
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
            etimer_set(&timer_rf, CLOCK_CONF_SECOND*2);
            //printf("tx start\r\n");
        }
        else if (*((tRFLRStates*)data) == RFLR_STATE_TX_DONE)  
        {
           //printf("tx done\r\n");
           SX1276LoRa_Receive_Packet(false); 
        }
        else  if (*((tRFLRStates*)data) == RFLR_STATE_RX_RECEIVEING) 
        {
           etimer_set(&timer_rf, CLOCK_CONF_SECOND*2);
           printf("rx start\r\n");
        } 
        else if (*((tRFLRStates*)data) == RFLR_STATE_RX_RUNNING) 
        {
          if (g_RF_LoRa.rf_DataBufferValid)
          {
              hal_ToggleLED(1);
              g_RF_LoRa.rf_DataBufferValid = false;
              
              rxCount++;
              
              printf("rssi = %f\r\n", SX1276LoRaGetPacketRssi());
              printf("snr = %d\r\n",SX1276LoRaGetPacketSnr());
              
            #if 0
              memset(oledPrintf,0,sizeof(oledPrintf));
              sprintf(oledPrintf,"rssi = %f",SX1276LoRaGetPacketRssi());
              OLED_ShowString(0,0,oledPrintf);
              memset(oledPrintf,0,sizeof(oledPrintf));
              sprintf(oledPrintf,"tx%d,rx%d",txcount, rxCount);
              OLED_ShowString(0,2,oledPrintf);
              Delayms(10);
            #endif
              
              printf("%x %x %x %x ", txcount/256, txcount%256, rxCount/256, rxCount%256);
              
              for (u8 i = 0; i < g_RF_LoRa.rf_RxPacketSize; i++ )
              {
                printf("%x ",g_RF_LoRa.rf_DataBuffer[i] );
              }
              
              printf("\r\n");

              if (g_slaveMode)
              {
                tedtbuf[0] = (u8)(rxCount>>8);
                tedtbuf[1] = (u8)(rxCount & 0xFF);

                #ifndef USE_LORA_MODE
                SX1276Fsk_Send_Packet(tedtbuf, g_RF_LoRa.rf_RxPacketSize);
                #else
                SX1276LoRa_Send_Packet(tedtbuf, g_RF_LoRa.rf_RxPacketSize);
                #endif
              }
          }
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
            //printf("rx start\r\n");
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


struct etimer test_send_timer; 
PROCESS(hal_long_send, "long_send_process ");

PROCESS_THREAD(hal_long_send, ev, data)
{
  static u8 length = 50;
  static bool first = true;
  
  PROCESS_BEGIN();
  
  if (ev == PROCESS_EVENT_INIT)
  {
    if (data != NULL)
    {
      length = *((u8*)data);
    }
  }
  
  while(1)
  {
    if (first)
    {
      printf("start the tx timer!\r\n");
      first = false;
      etimer_set(&test_send_timer, CLOCK_CONF_SECOND*2);
    }
    PROCESS_WAIT_EVENT();
    
    if (ev == PROCESS_EVENT_TIMER)
    {
      txcount++;
      tedtbuf[0] = (u8)(txcount>>8);
      tedtbuf[1] = (u8)(txcount & 0xFF);
      
      #ifndef USE_LORA_MODE
        SX1276Fsk_Send_Packet(tedtbuf, length);
      #else
        SX1276LoRa_Send_Packet(tedtbuf, length);
      #endif
        etimer_set(&test_send_timer, CLOCK_CONF_SECOND*2);
      
    }
  }
  PROCESS_END();
}


#if 0
#define FREQUENCY_TABEL_COUNT              10
#define MAX_CHANNEL_COUNT                  20
#define FREQUENCY_TABEL_START_F            490000000
#define FREQUENCY_STEP                     80000
#define hop_frequency(channel,count)      ((FREQUENCY_TABEL_START_F + FREQUENCY_STEP*channel) + FREQUENCY_STEP*FREQUENCY_TABEL_COUNT*count)
u8 g_RF_channel = 0;


/*must be 0 */
//const static u8 g_publicGroupNo = 0;

/*must be 0~19 */
//static u8 g_workGroupNo = 0;

//static FREQUENCY_GROUP_TYPE g_currentGroupType = PUBLIC_GROUP;

//static u32 g_HoppingFrequenciesTable[2][FREQUENCY_TABEL_COUNT];


/*****************************************************************************
 Prototype    : hal_set_frequency_table
 Description  : None
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void hal_set_frequency_table(u8 groupN0)
{
    u8 groupType;

    if (groupN0 == 0)
    {
        groupType = 0;
    }
    else
    {
        groupType = 1;
    }
    
    for (u8 i = 0; i < FREQUENCY_TABEL_COUNT; i++)
    {
        g_HoppingFrequenciesTable[groupType][i] = (FREQUENCY_TABEL_START_F + FREQUENCY_STEP*groupN0) + FREQUENCY_STEP*FREQUENCY_TABEL_COUNT*i;
    }

}

/*****************************************************************************
 Prototype    : hal_set_frequency_table
 Description  : None
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void hal_init_frequency_table(void)
{
    hal_set_frequency_table(0);
    #if 0
    if (是否组网成功)
    {
        g_workGroupNo = flashRead(addrNetState);

        hal_set_frequency_table(g_workGroupNo);
    }
    else
    {
        
    }
    #endif
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
  //GPIO_InitTypeDef GPIO_InitStructure;

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
  
  EXTI_ClearITPendingBit(DIO0_IRQ);
  EXTI_ClearITPendingBit(DIO1_IRQ);
  EXTI_ClearITPendingBit(DIO2_IRQ);
  EXTI_ClearITPendingBit(DIO3_IRQ);
  
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
  SPI_I2S_DeInit(sRF_SPI);
  
    /*!< sRF_SPI Periph clock enable */
   RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);
  
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
#ifdef SPI_DMA_FIFO
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
#endif
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
#ifdef SPI_DMA_FIFO
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
#endif

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
#ifdef SPI_DMA_FIFO
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
#endif

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
#ifdef SPI_DMA_FIFO
void hal_sRF_Read(u8 startReg, u8 *pBuffer, u8 length)
{
 
  if (length > 0)
  {
    hal_sRF_InitSPI();
    hal_sRF_DMA_Read(startReg,pBuffer,length);
  }
}
#endif

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
#ifdef SPI_DMA_FIFO
void hal_sRF_readFIFO_DMA(u8 * pBuffer, u8 length)
{

  hal_sRF_DMA_Read(0,pBuffer,length);

}
#endif
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
#ifdef SPI_DMA_FIFO
void hal_sRF_writeFIFO_DMA(u8 * pBuffer, u8 length)
{
  hal_sRF_Config(0,pBuffer,length);
}
  #endif
/******************************************************************************/
/*            STM32F10x Peripherals Interrupt Handlers                        */
/******************************************************************************/


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
#ifdef SPI_DMA_FIFO
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


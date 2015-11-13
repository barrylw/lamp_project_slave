/**
  ******************************************************************************
  * @file    hal_radio.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    09/10/2013
  * @brief   This file contains the headers of the radio frequency handlers.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HAL_sRF_H__
#define __HAL_sRF_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "common.h"
#include "sx1276-LoRa.h"
#include "process.h"
#include "etimer.h"
//#include "Basedefine.h"


/* Exported constants --------------------------------------------------------*/

/**
  * @brief  SPI sRF Frequency Chip Interface pins
  */

#if 0
#define sRF_SPI                                  SPI2
#define sRF_SPI_CLK                              RCC_APB1Periph_SPI2
    
#define sRF_CS_PIN                               GPIO_Pin_12                  /* PA.4 */
#define sRF_CS_GPIO_PORT                         GPIOB                       /* GPIOA */
#define sRF_CS_GPIO_CLK                          RCC_AHBPeriph_GPIOB
    
#define sRF_SPI_SCK_PIN                          GPIO_Pin_13                  /* PA.5 */
#define sRF_SPI_SCK_GPIO_PORT                    GPIOB                       /* GPIOA */
#define sRF_SPI_SCK_GPIO_CLK                     RCC_AHBPeriph_GPIOB
#define sRF_SPI_SCK_AF                           GPIO_AF_0   
#define sRF_SPI_SCK_SOURCE                       GPIO_PinSource13
    
#define sRF_SPI_MISO_PIN                         GPIO_Pin_14                 /* PA.6 */
#define sRF_SPI_MISO_GPIO_PORT                   GPIOB                       /* GPIOB */
#define sRF_SPI_MISO_GPIO_CLK                    RCC_AHBPeriph_GPIOB
#define sRF_SPI_MISO_AF                          GPIO_AF_0 
#define sRF_SPI_MISO_SOURCE                      GPIO_PinSource14
    
#define sRF_SPI_MOSI_PIN                         GPIO_Pin_15                 /* PA.7 */
#define sRF_SPI_MOSI_GPIO_PORT                   GPIOB                       /* GPIOB */
#define sRF_SPI_MOSI_GPIO_CLK                    RCC_AHBPeriph_GPIOB
#define sRF_SPI_MOSI_AF                          GPIO_AF_0
#define sRF_SPI_MOSI_SOURCE                      GPIO_PinSource15
   
#define sRF_SPI_DR_Base                          (SPI2_BASE + 0x0C)
#define sRF_SPI_DMA                              DMA1
#define sRF_SPI_DMA_CLK                          RCC_AHBPeriph_DMA1
#define sRF_SPI_DMA_RX_Channel                   DMA1_Channel4
#define sRF_SPI_DMA_TX_Channel                   DMA1_Channel5
    
#define sRF_SPI_DMA_RX_COMPLETE                  DMA1_IT_TC4
#define sRF_SPI_DMA_RX_ERROR                     DMA1_IT_TE4
#define sRF_SPI_DMA_RX_HALF                      DMA1_IT_HT4
#define sRF_SPI_DMA_TX_COMPLETE                  DMA1_IT_TC5
#define sRF_SPI_DMA_TX_ERROR                     DMA1_IT_TE5
#define sRF_SPI_DMA_TX_HALF                      DMA1_IT_HT5
#define sRF_SPI_DMA_IRQHandler                   DMA1_Channel4_5_IRQHandler   
#endif

#define sRF_SPI                                  SPI1
#define sRF_SPI_CLK                              RCC_APB2Periph_SPI1                           //RCC_APB1Periph_SPI2
    
#define sRF_CS_PIN                               GPIO_Pin_4                  /* PA.4 */
#define sRF_CS_GPIO_PORT                         GPIOA                       
#define sRF_CS_GPIO_CLK                          RCC_AHBPeriph_GPIOA
    
#define sRF_SPI_SCK_PIN                          GPIO_Pin_5                  /* PA.5 */
#define sRF_SPI_SCK_GPIO_PORT                    GPIOA                      
#define sRF_SPI_SCK_GPIO_CLK                     RCC_AHBPeriph_GPIOA
#define sRF_SPI_SCK_AF                           GPIO_AF_0   
#define sRF_SPI_SCK_SOURCE                       GPIO_PinSource5
    
#define sRF_SPI_MISO_PIN                         GPIO_Pin_6                 /* PA.6 */
#define sRF_SPI_MISO_GPIO_PORT                   GPIOA                       
#define sRF_SPI_MISO_GPIO_CLK                    RCC_AHBPeriph_GPIOA
#define sRF_SPI_MISO_AF                          GPIO_AF_0 
#define sRF_SPI_MISO_SOURCE                      GPIO_PinSource6
    
#define sRF_SPI_MOSI_PIN                         GPIO_Pin_7                 /* PA.7 */
#define sRF_SPI_MOSI_GPIO_PORT                   GPIOA                      
#define sRF_SPI_MOSI_GPIO_CLK                    RCC_AHBPeriph_GPIOA
#define sRF_SPI_MOSI_AF                          GPIO_AF_0
#define sRF_SPI_MOSI_SOURCE                      GPIO_PinSource7
   
#define sRF_SPI_DR_Base                          (SPI1_BASE + 0x0C)
#define sRF_SPI_DMA                              DMA1
#define sRF_SPI_DMA_CLK                          RCC_AHBPeriph_DMA1
#define sRF_SPI_DMA_RX_Channel                   DMA1_Channel2
#define sRF_SPI_DMA_TX_Channel                   DMA1_Channel3
    
#define sRF_SPI_DMA_RX_COMPLETE                  DMA1_IT_TC2
#define sRF_SPI_DMA_RX_ERROR                     DMA1_IT_TE2
#define sRF_SPI_DMA_RX_HALF                      DMA1_IT_HT2
#define sRF_SPI_DMA_TX_COMPLETE                  DMA1_IT_TC3
#define sRF_SPI_DMA_TX_ERROR                     DMA1_IT_TE3
#define sRF_SPI_DMA_TX_HALF                      DMA1_IT_HT3
#define sRF_SPI_DMA_IRQHandler                   DMA1_Channel2_3_IRQHandler   


/* BEGIN: Added by Barry, 2014/3/4 */
#define sRF_RESET_PORT                          GPIOC
#define sRF_RESET_PIN                           GPIO_Pin_13
#define sRF_RESET_SCK                           RCC_AHBPeriph_GPIOC

#define sRF_DIOx_PORT                           GPIOA
#define sRF_DIOx_SCK                            RCC_AHBPeriph_GPIOA
#define sRF_DIO0_PIN                            GPIO_Pin_1
#define sRF_DIO1_PIN                            GPIO_Pin_9
#define sRF_DIO2_PIN                            GPIO_Pin_10
#define sRF_DIO3_PIN                            GPIO_Pin_11
#define sRF_DIO4_PIN                            GPIO_Pin_12

#define sRF_DIOx_PORT_SOURCE                    EXTI_PortSourceGPIOA

#define sRF_DIO0_PIN_SOURCE                     EXTI_PinSource1    //GPIO_PinSource0
#define sRF_DIO1_PIN_SOURCE                     EXTI_PinSource9    //GPIO_PinSource1
#define sRF_DIO2_PIN_SOURCE                     EXTI_PinSource10   //GPIO_PinSource2
#define sRF_DIO3_PIN_SOURCE                     EXTI_PinSource11   //GPIO_PinSource11
#define sRF_DIO4_PIN_SOURCE                     EXTI_PinSource12   //GPIO_PinSource10
    
#define  DIO0_IRQ                               EXTI_Line1
#define  DIO1_IRQ                               EXTI_Line9
#define  DIO2_IRQ                               EXTI_Line10
#define  DIO3_IRQ                               EXTI_Line11
#define  DIO4_IRQ                               EXTI_Line12
#define  DIOall_IRQ                             (DIO0_IRQ | DIO1_IRQ | DIO2_IRQ | DIO3_IRQ | DIO4_IRQ)
#define  hal_DIOx_ITConfig(n,NewState)          hal_sRF_ITConfig(DIO##n##_IRQ,NewState)
#define hal_fsk_eit_failing(n,NewState)         hal_sRF_FSK_ITConfig(DIO##n##_IRQ,NewState)
    
#define sRF_FIFO_ARRD                           0
/* END:   Added by Barry, 2014/3/4 */
  

 /* Select sRF: Chip Select pin low */
#define sRF_CS_LOW()                             GPIO_ResetBits(sRF_CS_GPIO_PORT, sRF_CS_PIN)
 /* Deselect sRF: Chip Select pin high */
#define sRF_CS_HIGH()                            GPIO_SetBits(sRF_CS_GPIO_PORT, sRF_CS_PIN)

#if 0
/* Disable PA */
#define sRF_PA_DISABLE()                         GPIO_ResetBits(sRF_PA_CTRL_PORT, sRF_PA_CTRL_PIN)
/* Enable PA */
#define sRF_PA_ENABLE()                          GPIO_SetBits(sRF_PA_CTRL_PORT, sRF_PA_CTRL_PIN)
#endif

#define sRF_DUMMY_BYTE                           0xAA
#define TOTAL_REGISTER_NUMBER                    0x70
#define FIFO_SIZE                                255u

#define RF_TIMEOUT                               3000
#define TEST_TIMEOUT                             2000
#define CCA_ED_THREASHOLD                        120


//#define RXTX( txEnable )                            SX1276WriteRxTx( txEnable )
#define TICK_RATE_MS( ms )                       ( ms )
    
/* BEGIN: Added by Barry, 2014/3/1 */


typedef enum
{
  RADIO_RESET_OFF = 0,
  RADIO_RESET_ON,
}tRadioResetState;

typedef enum
{
  PUBLIC_GROUP = 0,
  WORK_GROUP,
}FREQUENCY_GROUP_TYPE;

//#define PUBLIC_GROUP_NO                           0

/* END:   Added by Barry, 2014/3/1 */

#endif

/* Exported macro ------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/



/* Exported functions ------------------------------------------------------- */
//void hal_RunRFEvents(ST_EVENT_METHOD *pEvents);
//void hal_InitRFVariable(void);
void hal_sRF_InitSPI(void);
void hal_sRF_ITConfig(uint32_t irqLine, FunctionalState NewState);
u8 hal_sRF_ReadRegister(u8 reg);
void hal_sRF_WriteRegister(u8 reg, u8 val);
void hal_sRF_DMA_Read(u8 startReg, u8 *pBuffer, u8 length);
void hal_sRF_DMA_Write(u8 *pBuffer, u8 length);
void hal_sRF_Config(u8 startReg, u8 *pBuffer, u8 length);
void hal_sRF_Read(u8 startReg, u8 *pBuffer, u8 length);

u8 spiReadWriteByte(u8 data);
void SX1276WriteBuffer( uint8_t addr, uint8_t *buffer, uint8_t size );
void SX1276ReadBuffer( uint8_t addr, uint8_t *buffer, uint8_t size );
void SX1276Write( uint8_t addr, uint8_t data );
void SX1276Read( uint8_t addr, uint8_t *data );
void SX1276WriteFifo( uint8_t *buffer, uint8_t size );
void SX1276ReadFifo( uint8_t *buffer, uint8_t size );
void SX1276SetReset( uint8_t state );

void hal_sRF_SPI_Config(void);
void GPIO_int_Config(void);
void hal_sRF_writeFIFO_DMA(u8 * pBuffer, u8 length);
void hal_sRF_readFIFO_DMA(u8 * pBuffer, u8 length);
void hal_sRF_Transmit(u8 *pBuffer, u8 length, u8 channel);


void SX1276LoRa_Send_Packet(u8 *PBuffer,u8 length);
void SX1276LoRa_NormalTx(u8 *PBuffer,u8 length);
void SX1276LoRa_WokeUpTx(u8 *PBuffer,u8 length);
void receiveRxData(bool spiDMA);
void RxEndProcess(bool dataValid);
void SX1276LoRa_Receive_Packet(bool singleRx);
void SX1276LoRa_CAD_Scan(void);
uint8_t SX1276LoRaGetRFState( void );
void SX1276LoRaSetRFState( u8 state );
void hal_InitRF(void);
void SX1276StartSleep(void);
void hal_init_frequency_table(void);
void hal_san_channel(void);
void hal_start_CSMA(void);

void hal_sRF_readFIFO_DMA(u8 * pBuffer, u8 length);
u8 * get_phy_ptr(void);

/*!
 * DIO state read functions mapping
 */
#define DIO(n)                            GPIO_ReadInputDataBit( sRF_DIOx_PORT, sRF_DIO##n##_PIN )
 

#define DIO0          DIO(0)                              
#define DIO1          DIO(1)                             
#define DIO2          DIO(2)                              
#define DIO3          DIO(3)                              
#define DIO4          DIO(4)                              
#define DIO5          DIO(5)                              



PROCESS_NAME(hal_RF_process);
PROCESS_NAME(hal_long_send);


/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

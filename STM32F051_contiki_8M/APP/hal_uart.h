
/**
  ******************************************************************************
  * @file    hal_uart.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    07/22/2013
  * @brief   This file contains the headers of the uart handlers.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HAL_UART_H__
#define __HAL_UART_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "common.h"
#include "hal_memory.h"
#include "sys/process.h"
#include "etimer.h"
/** @addtogroup Low Level Uart Driver
  * @{
  */
/* Exported constants --------------------------------------------------------*/

#define COMn          2

#define DEBUG_COM    COM2

#define SWAP_UART     1u
#if SWAP_UART
/**
 * @brief Definition for COM1, connected to USART2
 */ 
#define RBL_COM1                         USART2
#define RBL_COM1_BAUD                    2400
#define RBL_COM1_CLK                     RCC_APB1Periph_USART2
#define RBL_COM1_TX_PIN                  GPIO_Pin_2
#define RBL_COM1_TX_GPIO_PORT            GPIOA
#define RBL_COM1_TX_GPIO_CLK             RCC_AHBPeriph_GPIOA
#define RBL_COM1_TX_SOURCE               GPIO_PinSource2
#define RBL_COM1_TX_AF                   GPIO_AF_1

#define RBL_COM1_RX_PIN                  GPIO_Pin_3
#define RBL_COM1_RX_GPIO_PORT            GPIOA
#define RBL_COM1_RX_GPIO_CLK             RCC_AHBPeriph_GPIOA
#define RBL_COM1_RX_SOURCE               GPIO_PinSource3
#define RBL_COM1_RX_AF                   GPIO_AF_1

#define RBL_COM1_IRQn                    USART2_IRQn
#define RBL_COM1_IRQHandler              USART2_IRQHandler

/**
 * @brief Definition for COM2, connected to USART1
 */ 
#define RBL_COM2                         USART1
#define RBL_COM2_BAUD                    115200
#define RBL_COM2_CLK                     RCC_APB2Periph_USART1
#define RBL_COM2_TX_PIN                  GPIO_Pin_6
#define RBL_COM2_TX_GPIO_PORT            GPIOB
#define RBL_COM2_TX_GPIO_CLK             RCC_AHBPeriph_GPIOB
#define RBL_COM2_TX_SOURCE               GPIO_PinSource6
#define RBL_COM2_TX_AF                   GPIO_AF_0

#define RBL_COM2_RX_PIN                  GPIO_Pin_7
#define RBL_COM2_RX_GPIO_PORT            GPIOB
#define RBL_COM2_RX_GPIO_CLK             RCC_AHBPeriph_GPIOB
#define RBL_COM2_RX_SOURCE               GPIO_PinSource7
#define RBL_COM2_RX_AF                   GPIO_AF_0

#define RBL_COM2_IRQn                    USART1_IRQn
#define RBL_COM2_IRQHandler              USART1_IRQHandler

#define RBL_COM2_DMA_CLK                 RCC_AHBPeriph_DMA1
#define RBL_COM2_TX_DMA_CHANNEL          DMA1_Channel2
#define RBL_COM2_TX_DMA_COMPLETE         DMA1_IT_TC2
#define RBL_COM2_TX_DMA_ERROR            DMA1_IT_TE2
#define RBL_COM2_TDR_BASE                (USART1_BASE + 0x28)
#define RBL_COM2_DMA_IRQHandler          DMA1_Channel2_3_IRQHandler

#else
/**
 * @brief Definition for COM port1, connected to USART1
 */ 
#define RBL_COM1                         USART1
#define RBL_COM1_BAUD                    2400
#define RBL_COM1_CLK                     RCC_APB2Periph_USART1
#define RBL_COM1_TX_PIN                  GPIO_Pin_9
#define RBL_COM1_TX_GPIO_PORT            GPIOA
#define RBL_COM1_TX_GPIO_CLK             RCC_AHBPeriph_GPIOA
#define RBL_COM1_TX_SOURCE               GPIO_PinSource9
#define RBL_COM1_TX_AF                   GPIO_AF_1

#define RBL_COM1_RX_PIN                  GPIO_Pin_10
#define RBL_COM1_RX_GPIO_PORT            GPIOA
#define RBL_COM1_RX_GPIO_CLK             RCC_AHBPeriph_GPIOA
#define RBL_COM1_RX_SOURCE               GPIO_PinSource10
#define RBL_COM1_RX_AF                   GPIO_AF_1

#define RBL_COM1_IRQn                    USART1_IRQn
#define RBL_COM1_IRQHandler              USART1_IRQHandler

/**
 * @brief Definition for COM port2, connected to USART2
 */ 
#define RBL_COM2                         USART2
#define RBL_COM2_BAUD                    115200
#define RBL_COM2_CLK                     RCC_APB1Periph_USART2
#define RBL_COM2_TX_PIN                  GPIO_Pin_2
#define RBL_COM2_TX_GPIO_PORT            GPIOA
#define RBL_COM2_TX_GPIO_CLK             RCC_AHBPeriph_GPIOA
#define RBL_COM2_TX_SOURCE               GPIO_PinSource2
#define RBL_COM2_TX_AF                   GPIO_AF_1

#define RBL_COM2_RX_PIN                  GPIO_Pin_3
#define RBL_COM2_RX_GPIO_PORT            GPIOA
#define RBL_COM2_RX_GPIO_CLK             RCC_AHBPeriph_GPIOA
#define RBL_COM2_RX_SOURCE               GPIO_PinSource3
#define RBL_COM2_RX_AF                   GPIO_AF_1

#define RBL_COM2_IRQn                    USART2_IRQn
#define RBL_COM2_IRQHandler              USART2_IRQHandler

#define RBL_COM2_DMA_CLK                 RCC_AHBPeriph_DMA1
#define RBL_COM2_TX_DMA_CHANNEL          DMA1_Channel4
#define RBL_COM2_TX_DMA_COMPLETE         DMA1_IT_TC4
#define RBL_COM2_TX_DMA_ERROR            DMA1_IT_TE4
#define RBL_COM2_TDR_BASE                (USART2_BASE + 0x28)
#define RBL_COM2_DMA_IRQHandler          DMA1_Channel4_5_IRQHandler
#endif
   
#define UART_BUFFER_SIZE   255
#define RBL_COM1_TX_SIZE                 UART_BUFFER_SIZE
#define RBL_COM1_RX_SIZE                 UART_BUFFER_SIZE
#define RBL_COM2_RX_SIZE                 DEBUG_BUFFER_SIZE
#define UART_BAUD_COFF                  ((11 * 1000) / RBL_COM1_BAUD)

   
#ifdef PRINTF_DEBUG
#define DEBUG_BUFFER_SIZE  30
#define PRINT_BUFFER_SIZE  200
#define PRINT_BLOCK_NUMBER 50
#define PRINT_BLOCK_SIZE   16
#define PRINT_BLOCK_DATA (PRINT_BLOCK_SIZE - sizeof(void *))
#define PRINT_TOTAL_TIMEOUT ((PRINT_BLOCK_NUMBER * PRINT_BLOCK_DATA * 11000) / RBL_COM2_BAUD) + 100 //ms
#define PRINT_BLOCK_TIMEOUT ((PRINT_BLOCK_DATA * 11000) / RBL_COM2_BAUD) + 100 //ms
#define PRINT_TIMEOUT_ERROR ("print timeout error!\r\n")
#define PRINT_LENGTH_ERROR ("print length error!\r\n")
#define UART_TXD_TIMEOUT_ERROR ("uart send timeout!\r\n")
#define UART_RXD_TIMEOUT_ERROR ("uart receive timeout!\r\n")
#endif
/* Exported macro ------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/

typedef enum 
{
  COM1 = 0,
  COM2 = 1,
}COM_TypeDef;   

#pragma pack(1)

typedef struct
{
  u16 index;
  u16 fLen;
}ST_UART_FLAG;

typedef enum
{ 
  BUFF_EMPTY = 0,
  BUFF_HAS_DATA,
  BUFF_FULL
}EN_BUFF_STATUS;

#ifdef PRINTF_DEBUG
typedef struct
{
  u16 length;
  u8 buf[DEBUG_BUFFER_SIZE];
}ST_DEBUG_CMD;
    
typedef struct
{
  u8 *pblk;
  u8 len;
}ST_PRINT_BLOCK;  
   
typedef struct
{
  u8 head;
  u8 tail;
  ST_PRINT_BLOCK block[PRINT_BLOCK_NUMBER];
  u8 buf[PRINT_BLOCK_NUMBER][PRINT_BLOCK_SIZE];
  OS_MEM *part;            /* Pointer to printf function of memory partitions       */
}ST_PRINT_CTRL;
#endif




/* Exported functions ------------------------------------------------------- */

//void hal_RunUartEvents(ST_EVENT_METHOD *pEvents);
void hal_InitUartVariable(void);
void hal_InitPrintVariable(void);
void hal_InitUART(void);
void hal_InitCOM(COM_TypeDef COM);
void hal_DebugDMATx(u8 *pBuf, u16 length);
void hal_UartINTTx(u8 *pBuf, u16 length);
int printf(const char *format ,... );
void SendUart(void);

PROCESS_NAME(hal_urat_process);

#endif /* __HAL_UART_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

/**
  ************************************************************************************
  * @file    hal_uart.c
  * @author  William Liang
  * @version V1.0.0
  * @date    07/22/2013
  * @brief   This file contains the initialization & interrupt handlers of the uarts.
  ************************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "common.h"
#include "hal_uart.h"
#include "hal_timer.h"
#include "hal_wdg.h"
#include "hal_led.h"
#include "apl_debug.h"
#include "apl.h"

/** @addtogroup USART
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
USART_TypeDef *COM_USART[COMn] = {RBL_COM1, RBL_COM2}; 
const uint32_t COM_BAUD[COMn] = {RBL_COM1_BAUD, RBL_COM2_BAUD};
GPIO_TypeDef *COM_TX_PORT[COMn] = {RBL_COM1_TX_GPIO_PORT, RBL_COM2_TX_GPIO_PORT};
GPIO_TypeDef *COM_RX_PORT[COMn] = {RBL_COM1_RX_GPIO_PORT, RBL_COM2_RX_GPIO_PORT};
const uint32_t COM_USART_CLK[COMn] = {RBL_COM1_CLK, RBL_COM2_CLK};
const uint32_t COM_TX_PORT_CLK[COMn] = {RBL_COM1_TX_GPIO_CLK, RBL_COM2_TX_GPIO_CLK};
const uint32_t COM_RX_PORT_CLK[COMn] = {RBL_COM1_RX_GPIO_CLK, RBL_COM2_RX_GPIO_CLK};
const uint16_t COM_TX_PIN[COMn] = {RBL_COM1_TX_PIN, RBL_COM2_TX_PIN};
const uint16_t COM_RX_PIN[COMn] = {RBL_COM1_RX_PIN, RBL_COM2_RX_PIN};
const uint8_t COM_TX_PIN_SOURCE[COMn] = {RBL_COM1_TX_SOURCE, RBL_COM2_TX_SOURCE};
const uint8_t COM_RX_PIN_SOURCE[COMn] = {RBL_COM1_RX_SOURCE, RBL_COM2_RX_SOURCE};
const uint8_t COM_TX_AF[COMn] = {RBL_COM1_TX_AF, RBL_COM2_TX_AF};
const uint8_t COM_RX_AF[COMn] = {RBL_COM1_RX_AF, RBL_COM2_RX_AF};


/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

#ifdef PRINTF_DEBUG
const uint16_t COM_RX_BUFFER_SIZE[COMn] = {RBL_COM1_RX_SIZE, RBL_COM2_RX_SIZE};
ST_PRINT_CTRL g_Print;
u8 g_DebugRxBuffer[RBL_COM2_RX_SIZE];
struct etimer timer_debug_uart_tx; 
#endif

typedef enum
{
  UART_TX_START,
  UART_TX_FINISH,
  UART_TX_END,
  UART_TX_TIMEOUT,
  UART_RX_START,
  UART_RX_FINISH,
  UART_RX_END,
  UART_DEBUG_TX_START,
  UART_DEBUG_TX_RUNNING,
  UART_DEBUG_TX_FINISH,
  UART_DEBUG_TX_END,
  UART_DEBUG_RX_START,
  UART_DEBUG_RX_FINISH,
  UART_DEBUG_RX_END,
  
}em_UART_state;

u8 g_UartTxBuffer[RBL_COM1_TX_SIZE];
u8 g_UartRxBuffer[RBL_COM1_RX_SIZE];

ST_UART_FLAG g_UartTxFlag;
ST_UART_FLAG g_UartRxFlag;
ST_UART_FLAG g_DebugRxFlag;

em_UART_state g_UartTx_state  = UART_TX_END;
em_UART_state g_UartRx_state  = UART_RX_END;
em_UART_state g_DebugTx_state = UART_DEBUG_TX_END;
em_UART_state g_DebugRx_state = UART_DEBUG_RX_END;

struct etimer timer_uart_tx; 
struct etimer timer_uart_rx; 
struct etimer timer_debug_uart_tx;

PROCESS(hal_urat_process, "uart_process");
PROCESS_THREAD(hal_urat_process, ev, data)
{
  PROCESS_BEGIN();

  while(1)
  {
    PROCESS_WAIT_EVENT(); 

    if (ev == PROCESS_EVENT_MSG)
    {
         if (*(em_UART_state*)data == UART_TX_START)
         {
           etimer_set(&timer_uart_tx, (u16)(g_UartTxFlag.fLen * UART_BAUD_COFF + 10));
         }
         else if (*((em_UART_state*)data) == UART_TX_FINISH)
         {
           //printf("uart tx finish\r\n");
         }
         else if (*((em_UART_state*)data) == UART_RX_START)
         {
           etimer_set(&timer_uart_rx, (u32)UART_BAUD_COFF + 300);
         }
         else if (*((em_UART_state*)data) == UART_RX_FINISH)
         {
           apl_ProcessUartCmd();
         }
         #ifdef PRINTF_DEBUG
         else if ((*(em_UART_state*)data) ==  UART_DEBUG_TX_RUNNING)
         {
           etimer_set(&timer_debug_uart_tx, PRINT_TOTAL_TIMEOUT);
         }
        #endif
        else if ((*(em_UART_state*)data) == UART_DEBUG_TX_FINISH)
        {
           etimer_stop(&timer_debug_uart_tx);
        }
        
       else if ((*(em_UART_state*)data) == UART_DEBUG_RX_FINISH)
       {
    #ifdef PRINTF_DEBUG
         g_DebugRx_state = UART_DEBUG_RX_END;
         apl_ProcessDebugCmd();
    #endif
       }
    }
    else if (ev == PROCESS_EVENT_TIMER)
    {
       if ((struct etimer *)data == &timer_uart_tx)
       {    
            /* uart tx start */
            g_UartTx_state = UART_TX_END;
            printf("uart tx timeout\r\n");
            hal_BlindLED(TXD_LED);
            hal_InitCOM(COM1);
      #ifdef PRINTF_DEBUG
            hal_DebugDMATx(UART_TXD_TIMEOUT_ERROR, strlen(UART_TXD_TIMEOUT_ERROR));
      #endif
       }
       if ((struct etimer *)data == &timer_uart_rx)
       {
            g_UartRxFlag.index = 0;
            g_UartRx_state = UART_RX_END;
            hal_BlindLED(RXD_LED);
            hal_InitCOM(COM1);
       #ifdef PRINTF_DEBUG
            hal_DebugDMATx(UART_RXD_TIMEOUT_ERROR, strlen(UART_RXD_TIMEOUT_ERROR));
       #endif
       }
       
       #ifdef PRINTF_DEBUG
       if ((struct etimer *)data == &timer_debug_uart_tx)
       {
            g_DebugTx_state = UART_DEBUG_TX_END;
            hal_InitCOM(DEBUG_COM);
            hal_DebugDMATx(PRINT_TIMEOUT_ERROR, strlen(PRINT_TIMEOUT_ERROR));
       }
       #endif
       
    }
 }
 PROCESS_END();
}



/**
  * @brief  Initialize UART global variable
  * @param  None.
  * @retval None.
  */
void hal_InitUartVariable(void)
{
#ifdef PRINTF_DEBUG
  hal_InitPrintVariable();
#endif
}

/**
  * @brief  Initialize Print global variable
  * @param  None.
  * @retval None.
  */

#ifdef PRINTF_DEBUG
void hal_InitPrintVariable(void)
{
 
  u8 err = 0;

  OS_MemClr((u8 *)g_Print.buf, sizeof(g_Print.buf));
  OS_MemClr((u8 *) g_Print.block, sizeof(g_Print.block));
  g_Print.head = 0;
  g_Print.tail = 0;
  do
  {
    g_Print.part = OSMemCreate(g_Print.buf, PRINT_BLOCK_NUMBER, PRINT_BLOCK_SIZE, &err);
    if (err != OS_ERR_NONE)
    {
      hal_InitMemoryVariable();
    }
  } while (err != OS_ERR_NONE);

}
#endif

/**
  * @brief  Initialize All UART
  * @param  None.
  * @retval None.
  */
void hal_InitUART(void)
{
  hal_InitCOM(COM1);
#ifdef PRINTF_DEBUG
  hal_InitCOM(COM2);
#endif
}

/**
  * @brief  Initialize COM port, include RCC, GPIO, Uart and DMA, exclude NVIC.
  * @param  COM: Specifies the COM port to be configured.
  *   This parameter can be one of following parameters:    
  *     @arg COM1
  *     @arg COM2  
  * @retval None.
  */
void hal_InitCOM(COM_TypeDef COM)
{
  GPIO_InitTypeDef GPIO_InitStructure;
  USART_InitTypeDef USART_InitStructure;

  /* Enable GPIO clock */
  RCC_AHBPeriphClockCmd(COM_TX_PORT_CLK[COM] | COM_RX_PORT_CLK[COM], ENABLE);

  /* Enable SYSCFG clock */
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

  
#if SWAP_UART  //COM1:USART2表串口，COM2:USART1调试串口，
  SYSCFG_DMAChannelRemapConfig(SYSCFG_DMARemap_USART1Rx | SYSCFG_DMARemap_USART1Tx, ENABLE);
  
  /* Enable UART clock */
  if (COM == COM1)
  {
    RCC_APB1PeriphClockCmd(COM_USART_CLK[COM], ENABLE);
  }
  else
  {
    RCC_APB2PeriphClockCmd(COM_USART_CLK[COM], ENABLE);
  }
#else
  SYSCFG_DMAChannelRemapConfig(SYSCFG_DMARemap_USART1Rx | SYSCFG_DMARemap_USART1Tx, DISABLE);
  
  /* Enable UART clock */
  if (COM == COM1)
  {
    RCC_APB2PeriphClockCmd(COM_USART_CLK[COM], ENABLE);
  }
  else
  {
    RCC_APB1PeriphClockCmd(COM_USART_CLK[COM], ENABLE);
  }
#endif

  /* Connect PXx to USARTx_Tx */
  GPIO_PinAFConfig(COM_TX_PORT[COM], COM_TX_PIN_SOURCE[COM], COM_TX_AF[COM]);

  /* Connect PXx to USARTx_Rx */
  GPIO_PinAFConfig(COM_RX_PORT[COM], COM_RX_PIN_SOURCE[COM], COM_RX_AF[COM]);
  
  /* Configure USART Tx as alternate function push-pull */
  GPIO_InitStructure.GPIO_Pin = COM_TX_PIN[COM];
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  GPIO_Init(COM_TX_PORT[COM], &GPIO_InitStructure);
    
  /* Configure USART Rx as alternate function push-pull */
  GPIO_InitStructure.GPIO_Pin = COM_RX_PIN[COM];
  GPIO_Init(COM_RX_PORT[COM], &GPIO_InitStructure);

  /* USART1 configured as follow:
        - BaudRate = 2400 baud  
        - Word Length = 9 Bits
        - One Stop Bit
        - Even parity
        - Hardware flow control disabled (RTS and CTS signals)
        - Receive and transmit enabled
        
        USART2 configured as follow:
        - BaudRate = 115200 baud  
        - Word Length = 9 Bits
        - One Stop Bit
        - Even parity
        - Hardware flow control disabled (RTS and CTS signals)
        - Receive and transmit enabled
    */
  USART_InitStructure.USART_BaudRate = COM_BAUD[COM];
  USART_InitStructure.USART_WordLength = USART_WordLength_9b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_Even;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

  /* USART configuration */
  USART_Init(COM_USART[COM], &USART_InitStructure);
  
  /* Enable the USART RXNE Interrupt */
  USART_ITConfig(COM_USART[COM], USART_IT_RXNE , ENABLE);
    
  /* Enable USART */
  USART_Cmd(COM_USART[COM], ENABLE);

  if (COM == COM2)
  {
#if SWAP_UART
    SYSCFG_DMAChannelRemapConfig( SYSCFG_DMARemap_USART1Tx,  DISABLE);
#endif
      
#ifdef PRINTF_DEBUG
    /* Enable USART DMA TX request */
    USART_DMACmd(COM_USART[COM], USART_DMAReq_Tx, ENABLE);

    /* Enable DMA Clock */
    RCC_AHBPeriphClockCmd(RBL_COM2_DMA_CLK, ENABLE);
#endif
  }

}

/**
  * @brief  Retargets the C library printf function to the DEBUG_COM.
  * @param  None.
  * @retval None.
  */
int printf(const char *format ,... )
{ 
  u16 receData = 0;
  
#ifdef PRINTF_DEBUG
  va_list arg;
  u16 receNum = 0;
  u8 blockNum = 0;
  u8 blockCnt = 0;
  u8 buffer[PRINT_BUFFER_SIZE];
  u8 *pbuf = buffer;
  u8 err = 0;
  u32 time = 0;
  OS_MEM_DATA memData;
  
  va_start(arg, format);
  receNum = (u16)vsnprintf((char *)(buffer), sizeof(buffer), format, arg);
  va_end(arg);

  receData = receNum;
  if ((receNum > 0) && (receNum <= sizeof(buffer)))
  {
    if (receNum % PRINT_BLOCK_DATA)
    {
      blockNum = receNum / PRINT_BLOCK_DATA + 1;
    }
    else
    {
      blockNum = receNum / PRINT_BLOCK_DATA;
    }

    blockCnt = 0;
    time = hal_GetSystickCounter();
    while ((blockCnt < blockNum) && (hal_GetSystickCounter() - time < PRINT_BLOCK_TIMEOUT))
    {
      FEED_WDG;
      err = OSMemQuery(g_Print.part, &memData);
      if ((err == OS_ERR_NONE) && (memData.OSNFree > 0))
      {
        g_Print.block[g_Print.head].pblk = (u8 *)OSMemGet(g_Print.part, &err) + sizeof(void *);
        if (err == OS_ERR_NONE)
        {
          if (receNum > PRINT_BLOCK_DATA)
          {
            OS_MemCopy(g_Print.block[g_Print.head].pblk, pbuf, PRINT_BLOCK_DATA);
            g_Print.block[g_Print.head].len = PRINT_BLOCK_DATA;
            receNum -= PRINT_BLOCK_DATA;
            pbuf += PRINT_BLOCK_DATA;
          }
          else
          {
            OS_MemCopy(g_Print.block[g_Print.head].pblk, pbuf, receNum);
            g_Print.block[g_Print.head].len = receNum;
          }
          
          time = hal_GetSystickCounter();
          blockCnt++;
          g_Print.head++;
          if (g_Print.head >= PRINT_BLOCK_NUMBER)
          {
            g_Print.head = 0;
          }
        }
      }
    }
    
    if (g_DebugTx_state != UART_DEBUG_TX_RUNNING)
    {    
      //PrintEvent.timeToExecute = hal_GetSystickCounter() + PRINT_TOTAL_TIMEOUT;
      //PrintEvent_state = WAIT;
      g_DebugTx_state = UART_DEBUG_TX_RUNNING;
      hal_DebugDMATx(g_Print.block[g_Print.tail].pblk, g_Print.block[g_Print.tail].len);
      process_post(&hal_urat_process, PROCESS_EVENT_MSG, &g_DebugTx_state);
      
    }
  }
#endif
  return receData;
}

/**
  * @brief  Start Debug Uart send data in DMA mode.
  * @param  pBuf: Send data pointer.
  * @param  length: Send data length.
  * @retval None.
  */
#ifdef PRINTF_DEBUG
void hal_DebugDMATx(u8 *pBuf, u16 length)
{
  DMA_InitTypeDef DMA_InitStructure;
  
  if (length > 0)
  {
    if(length > PRINT_BUFFER_SIZE)
    {
      length = PRINT_BUFFER_SIZE;
    }
    
    /* USART_Tx_DMA_Channel (triggered by USART Tx event) Config */
    DMA_DeInit(RBL_COM2_TX_DMA_CHANNEL);
    DMA_InitStructure.DMA_PeripheralBaseAddr = RBL_COM2_TDR_BASE;
    DMA_InitStructure.DMA_MemoryBaseAddr = (u32) pBuf;
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
    DMA_InitStructure.DMA_BufferSize = (u32)length;
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
    DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
    DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
    DMA_Init(RBL_COM2_TX_DMA_CHANNEL, &DMA_InitStructure);
  
    /* Enable DMA Channel Transfer Complete interrupt and Transfer Error interrupt */
    DMA_ITConfig(RBL_COM2_TX_DMA_CHANNEL, DMA_IT_TC | DMA_IT_TE, ENABLE);
    
    /* Enable RBL_COM2 DMA TX Channel */
    DMA_Cmd(RBL_COM2_TX_DMA_CHANNEL, ENABLE);
  }
}
#endif

/**
  * @brief  Start Main Uart send data in interrupt mode.
  * @param  pBuf: Send data pointer.
  * @param  length: Send data length.
  * @retval None.
  */
void hal_UartINTTx(u8 *pBuf, u16 length)
{
  if (length > 0)
  {
    if(length > RBL_COM1_TX_SIZE)
    {
      length = RBL_COM1_TX_SIZE;
    }
    
    g_UartTxFlag.index = 0;
    g_UartTxFlag.fLen = length;
    if (pBuf != g_UartTxBuffer)
    {
      OS_MemCopy(g_UartTxBuffer, pBuf, length);
    }
    //UartTxEvent.startoption = WAIT;
    //UartTxEvent.timeToExecute = hal_GetSystickCounter() + (u16)((float)length * UART_BAUD_COFF) + 10;
    //etimer_set(&timer_uart_tx, (u16)((float)length * UART_BAUD_COFF) + 10);
    
    /* uart tx start */
    g_UartTx_state = UART_TX_START;
    process_post(&hal_urat_process, PROCESS_EVENT_MSG, &g_UartTx_state);
    hal_LightLED(TXD_LED);
    
    /* Enable RBL_COM1 Transmit interrupt */
    USART_ITConfig(RBL_COM1, USART_IT_TXE, ENABLE);
  }
}

/******************************************************************************/
/*            STM32F10x Peripherals Interrupt Handlers                        */
/******************************************************************************/

/**
  * @brief  This function handles COM1 global interrupt request.
  * @param  None.
  * @retval None.
  */
void RBL_COM1_IRQHandler(void)
{
  if (USART_GetITStatus(RBL_COM1, USART_IT_RXNE) != RESET)
  {
    hal_LightLED(RXD_LED);

    if (g_UartRxFlag.index >= RBL_COM1_RX_SIZE)
    {
      g_UartRxFlag.index = 0;
    }
    g_UartRxBuffer[g_UartRxFlag.index] = USART_ReceiveData(RBL_COM1);

    //UartRxEvent.startoption = WAIT;
    //UartRxEvent.timeToExecute = hal_GetSystickCounter() + (u32)UART_BAUD_COFF + 300;
    //etimer_set(&timer_uart_rx, (u32)UART_BAUD_COFF + 300);
    
    /* UART rx start */
    if (g_UartRxFlag.index == 0)
    {
      g_UartRx_state = UART_RX_START;
      process_post(&hal_urat_process, PROCESS_EVENT_MSG, &g_UartRx_state);
    }
    else
    {
      etimer_remodify(&timer_uart_rx, (u32)UART_BAUD_COFF + 300);
    }
    
    switch (g_UartRxFlag.index)
    {
      case 0:
      case 7:
      {
        if(g_UartRxBuffer[g_UartRxFlag.index] != 0x68)
        {
          g_UartRxFlag.index = 0;
        }
        else
        {
          g_UartRxFlag.index++;
        }
        break;
      }
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 8:
      case 9:
      {
        g_UartRxFlag.index++;
        break;
      }
      default:
      {
        if (g_UartRxFlag.index >= g_UartRxBuffer[9] + 11)
        {
          if (g_UartRxBuffer[g_UartRxFlag.index] == 0x16)
          {
            //UartRxEvent.startoption = FINISH;
            g_UartRx_state = UART_RX_FINISH;
            etimer_stop(&timer_uart_rx);
            process_post(&hal_urat_process, PROCESS_EVENT_MSG, &g_UartRx_state);
            g_UartRxFlag.fLen = g_UartRxFlag.index + 1;
          }
          g_UartRxFlag.index = 0;
          hal_BlindLED(RXD_LED);
        }
        else
        {
          g_UartRxFlag.index++;
        }
        break;
      }
    }
  }

  if (USART_GetITStatus(RBL_COM1, USART_IT_TXE) != RESET)
  {
    /* Write one byte to the transmit data register */
    USART_SendData(RBL_COM1, g_UartTxBuffer[g_UartTxFlag.index++]);
    if (g_UartTxFlag.index >= g_UartTxFlag.fLen)
    {
      //UartTxEvent.startoption = FINISH;
      //etimer_stop(&timer_uart_tx);
      
      /* uart tx start */
      etimer_stop(&timer_uart_tx);
      g_UartTx_state = UART_TX_FINISH;
      //process_post(&hal_urat_process, PROCESS_EVENT_MSG, &g_UartTx_state);
    
      hal_BlindLED(TXD_LED);
      
      /* Disable RBL_COM1 Transmit interrupt */
      USART_ITConfig(RBL_COM1, USART_IT_TXE, DISABLE);
    }
  }
}

/**
  * @brief  This function handles COM2 global interrupt request.
  * @param  None.
  * @retval None.
  */
#ifdef PRINTF_DEBUG
void RBL_COM2_IRQHandler(void)
{
  if (USART_GetITStatus(RBL_COM2, USART_IT_RXNE) != RESET)
  {
    u8 receivedByte = USART_ReceiveData(RBL_COM2);
    
    if (g_DebugRxFlag.index >= RBL_COM2_RX_SIZE)
    {
      g_DebugRxFlag.index = 0;
    }

    if (receivedByte == '\b')//Backspace
    {
      if (g_DebugRxFlag.index > 0)
      {
        g_DebugRxFlag.index--;
      }
    }
    else
    {
      g_DebugRxBuffer[g_DebugRxFlag.index++] = receivedByte;
      if ((receivedByte == '\r') || (receivedByte == '\n'))//Enter
      {
        g_DebugRx_state = UART_DEBUG_RX_FINISH;
        process_post(&hal_urat_process, PROCESS_EVENT_MSG, &g_DebugRx_state);
        g_DebugRxFlag.fLen = g_DebugRxFlag.index;
        g_DebugRxFlag.index = 0;
      }
    }
  }
}
#endif
/**
  * @brief  This function handles USART2 DMA TX Transfer Complete interrupt and Transfer Error interrupt.
  * @param  None.
  * @retval None.
  */
#ifdef PRINTF_DEBUG
void RBL_COM2_DMA_IRQHandler(void)
{

  u8 err = 0;
  
  if (DMA_GetITStatus(RBL_COM2_TX_DMA_COMPLETE) != RESET)
  {
    DMA_ClearITPendingBit(RBL_COM2_TX_DMA_COMPLETE);
    
    err = OSMemPut(g_Print.part, g_Print.block[g_Print.tail].pblk - sizeof(void *));
    if (err == OS_ERR_NONE)
    {
      g_Print.tail++;
      if (g_Print.tail >= PRINT_BLOCK_NUMBER)
      {
        g_Print.tail = 0;
      }

      if (g_Print.tail != g_Print.head)
      {
        //PrintEvent.timeToExecute = hal_GetSystickCounter() + PRINT_TOTAL_TIMEOUT;
        //PrintEvent_state = WAIT;
        /* 继续发送，修改超时时间 */
        g_DebugTx_state = UART_DEBUG_TX_RUNNING;
        hal_DebugDMATx(g_Print.block[g_Print.tail].pblk, g_Print.block[g_Print.tail].len);
        etimer_remodify(&timer_debug_uart_tx, PRINT_TOTAL_TIMEOUT);
       
      }
      else
      {
         /* printf 调试打印完成 */
         g_DebugTx_state = UART_DEBUG_TX_FINISH;
         process_post(&hal_urat_process, PROCESS_EVENT_MSG, &g_DebugTx_state);
      }
    }
  }

  if (DMA_GetITStatus(RBL_COM2_TX_DMA_ERROR) != RESET)
  {
    DMA_ClearITPendingBit(RBL_COM2_TX_DMA_ERROR);
    g_DebugTx_state = UART_DEBUG_TX_END;
    etimer_stop(&timer_debug_uart_tx);
  }
}
#endif

/******************************************************************************/
/*            Debug Command Function                        */
/******************************************************************************/

/**
  * @brief Send data from uart1.
  * @param  None.
  * @retval  None.
  */
void SendUart(void)
{
  u16 length = 0;
  
  Getu16Parameter(&length, 1);

  if (length > 0 & length < RBL_COM1_TX_SIZE)
  {
    for (u16 i = 0; i < length; i++)
    {
      g_UartTxBuffer[i] = i + 1;
    }
    hal_UartINTTx(g_UartTxBuffer, length);
  }
  else
  {
    HALLST(printf("length input error\r\n"););
  }
}

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

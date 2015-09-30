/**
  ******************************************************************************
  * @file    hal_nvic.c
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   This file contains the initialization of the nvic handlers.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "hal_nvic.h"

/** @addtogroup NVIC
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Configures the nested vectored interrupt controller.
  * @param  None.
  * @retval None.
  */
void hal_InitNVIC(void)
{
  NVIC_InitTypeDef NVIC_InitStructure;

  //NVIC_SetVectorTable(NVIC_VectTab_FLASH, 0x2000);
  
  NVIC_SetPriority(SysTick_IRQn, 0);

  /* Enable and configure RCC global IRQ channel, will be used to manage HSE ready and PLL ready interrupts. */
  NVIC_InitStructure.NVIC_IRQChannel = RCC_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  
#if 0
  /* Enable EXTI Line1 Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = EXTI0_1_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
  //NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  
  /* Enable  EXTI2_3_IRQn Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = EXTI2_3_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
  //NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  
    /* Enable  EXTI4_15_IRQn Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = EXTI4_15_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
  //NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
#endif
  
  NVIC_InitStructure.NVIC_IRQChannel =  EXTI4_15_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 1;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  
  
  /*Enable DMA1 Channel2 & 3 (SPI1 RX & TX) Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = DMA1_Channel2_3_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 2;
  //NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  
  /* Enable USART1 Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 3;
  //NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  
  /* Enable USART2 Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 4;
  //NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  
  /*Enable DMA1 Channel4 (USART2 TX) Interrupt */
  NVIC_InitStructure.NVIC_IRQChannel = DMA1_Channel4_5_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPriority = 5;
  //NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
}

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

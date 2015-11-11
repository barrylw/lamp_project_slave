/**
  ******************************************************************************
  * @file    hal_rcc.c
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   This file contains the initialization of the rcc handlers.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "hal_rcc.h"

/** @addtogroup RCC
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Configures the different system clocks.
  * @param  None.
  * @retval None.
  */
void hal_InitRCC(void)
{
  /* Initialize the Embedded Flash Interface, the PLL and update the  SystemCoreClock variable */
  //SystemInit();
  SystemCoreClockUpdate();
  
  /* Enable Clock Security System(CSS): this will generate an NMI exception  when HSE clock fails */
  RCC_ClockSecuritySystemCmd(ENABLE);
}

/******************************************************************************/
/*            STM32F10x Peripherals Interrupt Handlers                        */
/******************************************************************************/

/**
  * @brief  This function handles RCC interrupt request. 
  * @param  None.
  * @retval None.
  */

void RCC_IRQHandler(void)
{
  if(RCC_GetITStatus(RCC_IT_HSERDY) != RESET)
  { 
    /* Clear HSERDY interrupt pending bit */
    RCC_ClearITPendingBit(RCC_IT_HSERDY);

    /* Check if the HSE clock is still available */
    if (RCC_GetFlagStatus(RCC_FLAG_HSERDY) != RESET)
    { 
      /* Enable PLL: once the PLL is ready the PLLRDY interrupt is generated */ 
      RCC_PLLCmd(ENABLE);     
    }
  }

  if(RCC_GetITStatus(RCC_IT_PLLRDY) != RESET)
  { 
    /* Clear PLLRDY interrupt pending bit */
    RCC_ClearITPendingBit(RCC_IT_PLLRDY);

    /* Check if the PLL is still locked */
    if (RCC_GetFlagStatus(RCC_FLAG_PLLRDY) != RESET)
    { 
      /* Select PLL as system clock source */
      RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
    }
  }
}

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

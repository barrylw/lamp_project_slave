/**
  ******************************************************************************
  * @file    hal_wdg.c
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   This file contains the initialization of the wdg handlers.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "hal_wdg.h"
#include "common.h"

/** @addtogroup WDG
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Configures All WDG.
  * @param  None.
  * @retval None.
  */
void hal_InitWDG(void)
{
  hal_InitIwdg();
  hal_InitWwdg();
}

/**
  * @brief  Configures IWDG.
  * @param  None.
  * @retval None.
  */
void hal_InitIwdg(void)
{
  /* Enable   LSI oscillator */
  //RCC_LSICmd(ENABLE);
  
  //DBGMCU_APB1PeriphConfig(DBGMCU_IWDG_STOP,  ENABLE);
  
  /* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);

  /* IWDG counter clock: 40KHz(LSI) / 2^(IWDG_PRESCALER+2) */
  IWDG_SetPrescaler(IWDG_PRESCALER);

  /* Set counter reload value to IWDG_COUNTER */
  IWDG_SetReload(IWDG_COUNTER);

  /* Reload IWDG counter */
  IWDG_ReloadCounter();

  /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG_Enable();
}

/**
  * @brief  Configures WWDG.
  * @param  None.
  * @retval None.
  */
void hal_InitWwdg(void)
{
  //DBGMCU_APB1PeriphConfig(DBGMCU_WWDG_STOP,  ENABLE);
  
  /* Deinitializes the WWDG */
  WWDG_DeInit();
  
  /* Enable WWDG clock */
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_WWDG, ENABLE);

  /* WWDG clock counter = (PCLK1 (48MHz)/4096)/8 = 1464Hz (~683 us)  */
  WWDG_SetPrescaler(WWDG_Prescaler_8);

  /* Set Window value to WWDG_WINDOW; WWDG counter should be refreshed only when the counter  
      is below WWDG_WINDOW (and greater than 64) otherwise a reset will be generated */
  WWDG_SetWindowValue(WWDG_WINDOW);

  /* Enable WWDG and set counter value to 127, WWDG timeout = ~683 us * 64 = 43.7 ms 
     In this case the refresh window is: ~683 * (127-80)= 32.1ms < refresh window < ~683 * 64 = 43.7ms
     */
  WWDG_Enable(WWDG_INIT);
}

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

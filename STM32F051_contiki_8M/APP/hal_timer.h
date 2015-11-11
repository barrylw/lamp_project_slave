/**
  ******************************************************************************
  * @file    hal_timer.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   This file contains the headers of the timer handlers.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HAL_TIMER_H__
#define __HAL_TIMER_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "common.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
#define RTC_VALID_REG RTC_BKP_DR0
#define RTC_VALID_FLAG 0xA5A5

/* Exported macro ------------------------------------------------------------*/
extern u32 g_SystickCounter;

/* Exported functions ------------------------------------------------------- */
void hal_InitTimerVariable(void);
void hal_InitTIMER(void);
void hal_InitSystickTimer(void);
void hal_InitRTC(void);
void hal_SetCurrentTime(u8 year, u8 month, u8 day, u8 hour, u8 min, u8 sec);
void hal_GetCurrentTime(void);

/**
  * @brief  Get the Systick Timer Counter.
  * @param  None.
  * @retval g_SystickCounter: Systick Timer Counter Value.
  */
__STATIC_INLINE u32 hal_GetSystickCounter(void)
{
  return g_SystickCounter;
}

void SetTime(void);
void GetTime(void);

#endif /* __HAL_TIMER_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

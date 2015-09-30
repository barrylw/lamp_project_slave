/**
  ******************************************************************************
  * @file    hal_wdg.h
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   This file contains the headers of the iwdg and wwdg handlers.
  ******************************************************************************
  */

#ifndef __HAL_WDG_H__
#define __HAL_WDG_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
#define WWDG_INIT 0x7F
#define WWDG_WINDOW 0x7F
#define IWDG_PRESCALER IWDG_Prescaler_32 // 3
#define IWDG_TIMEOUT 250 // ms

/* Exported macro ------------------------------------------------------------*/
#define IWDG_COUNTER ((u16)(IWDG_TIMEOUT) * 40 / ((u16) 1 << (IWDG_PRESCALER + 2)))
#define FEED_IWDG IWDG_ReloadCounter()
#define FEED_WWDG WWDG_SetCounter(WWDG_INIT)
#define FEED_WDG do {FEED_IWDG; FEED_WWDG;} while (0)

/* Exported functions ------------------------------------------------------- */

void hal_InitWDG(void);
void hal_InitIwdg(void);
void hal_InitWwdg(void);

#endif /* __HAL_WDG_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

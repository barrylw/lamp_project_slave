/**
  ******************************************************************************
  * @file    hal_led.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   This file contains the headers of the LED handlers.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HAL_LED_H__
#define __HAL_LED_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "common.h"

/* Exported constants --------------------------------------------------------*/
//LED GPIO
#define LEDn 2

/*
#define RXD_LED_PIN            GPIO_Pin_13 //PA12 Left_Red
#define RXD_LED_PORT           GPIOC
#define RXD_LED_CLK            RCC_AHBPeriph_GPIOC

#define TXD_LED_PIN            GPIO_Pin_14 //PA11 Right_Green
#define TXD_LED_PORT           GPIOC
#define TXD_LED_CLK            RCC_AHBPeriph_GPIOC
*/


#define RXD_LED_PIN            GPIO_Pin_14 
#define RXD_LED_PORT           GPIOC
#define RXD_LED_CLK            RCC_AHBPeriph_GPIOC

#define TXD_LED_PIN            GPIO_Pin_15  
#define TXD_LED_PORT           GPIOC
#define TXD_LED_CLK            RCC_AHBPeriph_GPIOC


/* Exported macro ------------------------------------------------------------*/

/* Exported types ------------------------------------------------------------*/
typedef enum 
{
  RXD_LED = 0,
  TXD_LED = 1,
}Led_TypeDef;

extern const u16 LED_PIN[LEDn];
extern GPIO_TypeDef* LED_PORT[LEDn];

/* Exported functions ------------------------------------------------------- */
void hal_InitLED(void);

/**
  * @brief  Light the selected LED.
  * @param  Led: Specifies the Led to be set on. 
  *   This parameter can be one of following parameters:
  *     @arg RXD_LED
  *     @arg TXD_LED
  * @retval None.
  */
__STATIC_INLINE void hal_LightLED(Led_TypeDef Led)
{
  LED_PORT[Led]->BRR = LED_PIN[Led];
}

/**
  * @brief  Blind the selected LED.
  * @param  Led: Specifies the Led to be set off. 
  *   This parameter can be one of following parameters:
  *     @arg RXD_LED
  *     @arg TXD_LED
  * @retval None.
  */
__STATIC_INLINE void hal_BlindLED(Led_TypeDef Led)
{
  LED_PORT[Led]->BSRR = LED_PIN[Led];
}

/**
  * @brief  Toggle the selected LED.
  * @param  Led: Specifies the Led to be toggled. 
  *   This parameter can be one of following parameters:
  *     @arg RXD_LED
  *     @arg TXD_LED
  * @retval None.
  */
__STATIC_INLINE void hal_ToggleLED(Led_TypeDef Led)
{
  LED_PORT[Led]->ODR ^= LED_PIN[Led];
}

#endif /* __HAL_LED_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/
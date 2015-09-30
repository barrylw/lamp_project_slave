/**
  ******************************************************************************
  * @file    hal_led.c
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   This file contains the initializtion & handlers of the LED.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "hal_led.h"
#include "common.h"

/** @addtogroup LED
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
const u16 LED_PIN[LEDn] = {RXD_LED_PIN, TXD_LED_PIN};
GPIO_TypeDef* LED_PORT[LEDn] = {RXD_LED_PORT, TXD_LED_PORT};
const u32 LED_CLK[LEDn] = {RXD_LED_CLK, TXD_LED_CLK};

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Configures LED.
  * @param  None.
  * @retval None.
  */
void hal_InitLED(void)
{
  for (u8 Led = 0; Led < LEDn; Led++)
  {
    GPIO_InitTypeDef GPIO_InitStructure;
    
    /* Enable the GPIO_LED Clock */
    RCC_AHBPeriphClockCmd(LED_CLK[Led], ENABLE);

    /* Configure the GPIO_LED pin */
    GPIO_InitStructure.GPIO_Pin = LED_PIN[Led];
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(LED_PORT[Led], &GPIO_InitStructure);
  
    //hal_BlindLED((Led_TypeDef)Led);
    hal_LightLED((Led_TypeDef)Led);
  }
}

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

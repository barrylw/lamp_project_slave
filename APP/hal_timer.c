/**
  ******************************************************************************
  * @file    hal_timer.c
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   This file contains the initialization and handle of the timer.
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "hal_timer.h"
#include "hal_uart.h"
#include "apl_debug.h"

/** @addtogroup Timer
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
u32 g_SystickCounter = 0;

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Initialize Timer global variable.
  * @param  None.
  * @retval None.
  */
void hal_InitTimerVariable(void)
{
  g_SystickCounter = 0;
}

/**
  * @brief  Initialize All Timer.
  * @param  None.
  * @retval None.
  */
void hal_InitTIMER(void)
{
  hal_InitSystickTimer();
  hal_InitRTC();
}

/**
  * @brief  Initialize the Systick Timer.
  * @param  None.
  * @retval None.
  */
void hal_InitSystickTimer(void)
{
  /* Setup SysTick Timer for 1 msec interrupts.
     ------------------------------------------
    1. The SysTick_Config() function is a CMSIS function which configure:
       - The SysTick Reload register with value passed as function parameter.
       - Configure the SysTick IRQ priority to the lowest value (0x0F).
       - Reset the SysTick Counter register.
       - Configure the SysTick Counter clock source to be Core Clock Source (HCLK).
       - Enable the SysTick Interrupt.
       - Start the SysTick Counter.
    
    2. You can change the SysTick Clock source to be HCLK_Div8 by calling the
       SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK_Div8) just after the
       SysTick_Config() function call. The SysTick_CLKSourceConfig() is defined
       inside the misc.c file.

    3. You can change the SysTick IRQ priority by calling the
       NVIC_SetPriority(SysTick_IRQn,...) just after the SysTick_Config() function 
       call. The NVIC_SetPriority() is defined inside the core_cm3.h file.

    4. To adjust the SysTick time base, use the following formula:
                            
         Reload Value = SysTick Counter Clock (Hz) x  Desired Time base (s)
    
       - Reload Value is the parameter to be passed for SysTick_Config() function
       - Reload Value should not exceed 0xFFFFFF
   */
  if (SysTick_Config(SystemCoreClock / 1000))
  { 
    /* Capture error */ 
    while (1);
  }
}

/**
  * @brief  Initialize the RTC.
  * @param  None.
  * @retval None.
  */
void hal_InitRTC(void)
{
  RTC_InitTypeDef RTC_InitStructure;

  /* Enable the PWR clock */
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR, ENABLE);

  /* Allow access to RTC */
  PWR_BackupAccessCmd(ENABLE);

  /* Select the RTC Clock Source */
  RCC_RTCCLKConfig(RCC_RTCCLKSource_HSE_Div32);

  if (RTC_ReadBackupRegister(RTC_VALID_REG) != RTC_VALID_FLAG)
  {
    /* Enable the RTC Clock */
    RCC_RTCCLKCmd(ENABLE);

    /* Wait for RTC APB registers synchronisation */
    RTC_WaitForSynchro();
    
    /* Configure the RTC data register and RTC prescaler */ 
    /* PREDIV_A = 124, PREDIV_S = 3999, 
       ck_spre = RTCCLK / ((PREDIV_A + 1) ¡Á(PREDIV_S + 1))  = (16000000/32) / (125¡Á4000) = 1Hz */
    RTC_InitStructure.RTC_AsynchPrediv = 124;
    RTC_InitStructure.RTC_SynchPrediv = 3999;
    RTC_InitStructure.RTC_HourFormat = RTC_HourFormat_24;
    
    /* Check on RTC init */
    if (RTC_Init(&RTC_InitStructure) == ERROR)
    {
      printf("RTC init failed\r\n");
    }
    else
    {
      /* Request initialize current time */
      printf("\r\nCurrent time is Invalid\r\n");

      /* Initialize current time to 2010/1/1 00:00:00 */
      hal_SetCurrentTime(10, 1, 1, 0, 0, 0);
    }
  }
  else
  {
    /* Wait for RTC APB registers synchronisation */
    RTC_WaitForSynchro();
    
    /* Get the current time */
    hal_GetCurrentTime();
  }
}

/**
  * @brief  Set current time.
  * @param  year: input variable, the year of current time.
  * @param  month: input variable, the month of current time.
  * @param  day: input variable, the day of current time.
  * @param  hour: input variable, the hour of current time.
  * @param  min: input variable, the minute of current time.
  * @param  sec: input variable, the second of current time.
  * @retval None.
  */
void hal_SetCurrentTime(u8 year, u8 month, u8 day, u8 hour, u8 min, u8 sec)
{
  RTC_DateTypeDef RTC_DateStructure;
  RTC_TimeTypeDef RTC_TimeStructure;

  RTC_DateStructInit(&RTC_DateStructure);
  RTC_TimeStructInit(&RTC_TimeStructure);

  if ((IS_RTC_YEAR(year)) && (IS_RTC_MONTH(month)) && (IS_RTC_DATE(day)))
  {
    RTC_DateStructure.RTC_Year = year;
    RTC_DateStructure.RTC_Month = month;
    RTC_DateStructure.RTC_Date = day;
  }
  else
  {
    printf("Date Format Error\r\n");
    return;
  }

  if ((IS_RTC_HOUR24(hour)) && (IS_RTC_MINUTES(min)) && (IS_RTC_SECONDS(sec)))
  {
    RTC_TimeStructure.RTC_Hours = hour;
    RTC_TimeStructure.RTC_Minutes = min;
    RTC_TimeStructure.RTC_Seconds = sec;
  }
  else
  {
    printf("Time Format Error\r\n");
    return;
  }

  /* Configure the RTC time register */
  if (RTC_SetTime(RTC_Format_BIN, &RTC_TimeStructure) == ERROR)
  {
    printf("RTC set time failed\r\n");
  } 
  else
  {
    /* Unfreeze the RTC DR Register */
    (void)RTC->DR;

    /* Configure the RTC Date register */
    if (RTC_SetDate(RTC_Format_BIN, &RTC_DateStructure) == ERROR)
    {
      printf("RTC set date failed\r\n");
    } 
    else
    {
      printf("Set current time=%02d-%02d-%02d %02d:%02d:%02d\r\n", year, month, day, hour, min, sec);
      
      /* Indicator for the RTC configuration */
      RTC_WriteBackupRegister(RTC_VALID_REG, RTC_VALID_FLAG);
    }
  }
}

/**
  * @brief  Get the current time.
  * @param  None.
  * @retval None.
  */
void hal_GetCurrentTime(void)
{
  RTC_DateTypeDef RTC_DateStructure;
  RTC_TimeTypeDef RTC_TimeStructure;

  /* Get the RTC current date */
  RTC_GetDate(RTC_Format_BIN, &RTC_DateStructure);
  
  /* Get the RTC current time */
  RTC_GetTime(RTC_Format_BIN, &RTC_TimeStructure);

  printf("Current time=%02d-%02d-%02d %02d:%02d:%02d\r\n",
                RTC_DateStructure.RTC_Year,
                RTC_DateStructure.RTC_Month,
                RTC_DateStructure.RTC_Date,
                RTC_TimeStructure.RTC_Hours,
                RTC_TimeStructure.RTC_Minutes,
                RTC_TimeStructure.RTC_Seconds);
}

void hal_GetCurrentTimeString(char * str)
{
  
}

/******************************************************************************/
/*            Debug Command Function                        */
/******************************************************************************/

/**
  * @brief  Set current time.
  * @param  None.
  * @retval  None.
  */
void SetTime(void)
{
  u8 year = 10;
  u8 month = 1;
  u8 day = 1;
  u8 hour = 0;
  u8 minute = 0;
  u8 second = 0;
  
  Getu8Parameter(&year, 1);
  Getu8Parameter(&month, 2);
  Getu8Parameter(&day, 3);
  Getu8Parameter(&hour, 4);
  Getu8Parameter(&minute, 5);
  Getu8Parameter(&second, 6);
  
  hal_SetCurrentTime(year, month, day, hour, minute, second);
}

/**
  * @brief Get current time.
  * @param  None.
  * @retval  None.
  */
void GetTime(void)
{
  hal_GetCurrentTime();
}



/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

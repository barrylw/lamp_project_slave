/**
  ******************************************************************************
  * @file    main.c 
  * @author  William Liang
  * @version V1.0.0
  * @date    07/18/2013
  * @brief   Main program body
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "phy.h"
#include "apl.h"
#include "hal_wdg.h"
#include "hal_led.h"

u8 testBuf[32] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32};
u16 outBuf[32];
u16 crc16;
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/

/**
  * @brief  Main program
  * @param  None.
  * @retval None.
  */

#define APPLICATION_ADDRESS     (uint32_t)(FLASH_APPLICATION_ADDRESS)

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
#if   (defined ( __CC_ARM ))
  __IO uint32_t VectorTable[48] __attribute__((at(0x20000000)));
#elif (defined (__ICCARM__))
#pragma location = 0x20000000
  __no_init __IO uint32_t VectorTable[48];
#elif defined   (  __GNUC__  )
  __IO uint32_t VectorTable[48] __attribute__((section(".RAMVectorTable")));
#elif defined ( __TASKING__ )
  __IO uint32_t VectorTable[48] __at(0x20000000);
#endif




void main(void)
{
  for(uint32_t i = 0; i < 48; i++)
  {
    VectorTable[i] = *(__IO uint32_t*)(APPLICATION_ADDRESS + (i<<2));
  }

  /* Enable the SYSCFG peripheral clock*/
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE); 
 
  /* Remap SRAM at 0x00000000 */
  SYSCFG_MemoryRemapConfig(SYSCFG_MemoryRemap_SRAM);
  
  
  InitVariable();
  InitHardware();
  init_update();
  
  printf("hello");
  
  while (1)
  {
    //FEED_WDG;
    PHYTASK();
    APLTASK();
  }
}

/**
  * @brief Initialize global variable.
  * @param None.
  * @retval None.
  */
void InitVariable(void)
{
  InitPhyVariable();
  InitAplVariable();
}





#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

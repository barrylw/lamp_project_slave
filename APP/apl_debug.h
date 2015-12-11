/**
  ******************************************************************************
  * @file    apl_debug.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    07/26/2013
  * @brief   This file contains the headers of the debug command handlers.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __APL_DEBUG_H__
#define __APL_DEBUG_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
/** @addtogroup APL Debug Command
  * @{
  */
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/

#define PRINT(CODE)   do\
                      {\
                        RTC_TimeTypeDef RTC_TimeStructure;\
                        RTC_GetTime(RTC_Format_BIN, &RTC_TimeStructure);\
                        printf("%02d:%02d:%02d->", RTC_TimeStructure.RTC_Hours, RTC_TimeStructure.RTC_Minutes, RTC_TimeStructure.RTC_Seconds);\
                        CODE\
                      } while (0)

//#define __DISPLAY
#ifdef __DISPLAY
#define DISP(CODE) PRINT(CODE)
#define LIST(CODE) do {CODE} while (0)
#else
#define DISP(CODE)
#define LIST(CODE)
#endif

//#define __APLDEBUG
#ifdef __APLDEBUG
#define APLDBG(CODE) PRINT(CODE)
#define APLLST(CODE) do {CODE} while (0)
#else
#define APLDBG(CODE)
#define APLLST(CODE)
#endif

//#define __HALDEBUG
#ifdef __HALDEBUG
#define HALDBG(CODE) PRINT(CODE)
#define HALLST(CODE) do {CODE} while (0)
#else
#define HALDBG(CODE)
#define HALLST(CODE)
#endif

/* Exported types ------------------------------------------------------------*/

typedef struct 
{
  const u8 *cmd;
  void (*action)(void);
}ST_DEBUG_COMMAND;

/* Exported functions ------------------------------------------------------- */

void apl_ProcessDebugCmd(void);
void apl_ProcessCmdLine(void);

void Getu8Parameter(u8 *parameter, u8 index);
void Getu16Parameter(u16 *parameter, u8 index);
u8 GetStringParameter(u8 *parameter, u8 index);
u8 HexCharToInt8u(u8 hexChar);
void ReadUpdateData(void);
void set_power(void);
void get_reg(void);
void read_reg_all(void);
void send_packet(void);
void receive_packet(void);
void contious_mode_rx(void);
void radio_reset(void);
void read_8209c_reg(void);
void set_8209c_hfconst(void);
void set_8209c_Reg(void);
void cal_power_gain(void);
void cal_power_angle(void);
void set_8209c_Kx(void);
void read_param_all(void);
void reset_8029c(void);
#endif /* __APL_DEBUG_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

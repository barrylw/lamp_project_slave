/**
  ******************************************************************************
  * @file    common.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    09/24/2013
  * @brief   This file contains the headers of some common program.
  ******************************************************************************
  */ 

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __COMMON_H__
#define __COMMON_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"

//#pragma pack(1)

//#pragma pack(show)

/* Exported constants --------------------------------------------------------*/
#define GOOD_CRC  0x0F47

/* Exported macro ------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/

/*!< STM32F0xx Standard Peripheral Library old types (maintained for legacy purpose) */
typedef int32_t  s32;
typedef int16_t s16;
typedef int8_t  s8;

typedef const int32_t sc32;  /*!< Read Only */
typedef const int16_t sc16;  /*!< Read Only */
typedef const int8_t sc8;   /*!< Read Only */

typedef __IO int32_t  vs32;
typedef __IO int16_t  vs16;
typedef __IO int8_t   vs8;

typedef __I int32_t vsc32;  /*!< Read Only */
typedef __I int16_t vsc16;  /*!< Read Only */
typedef __I int8_t vsc8;   /*!< Read Only */

typedef uint32_t  u32;
typedef uint16_t u16;
typedef uint8_t  u8;

typedef const uint32_t uc32;  /*!< Read Only */
typedef const uint16_t uc16;  /*!< Read Only */
typedef const uint8_t uc8;   /*!< Read Only */

typedef __IO uint32_t  vu32;
typedef __IO uint16_t vu16;
typedef __IO uint8_t  vu8;

typedef __I uint32_t vuc32;  /*!< Read Only */
typedef __I uint16_t vuc16;  /*!< Read Only */
typedef __I uint8_t vuc8;   /*!< Read Only */

typedef enum
{
  false = 0,
  true = !false
}bool;

#if 0
typedef struct
{
  u8 status : 3;
  u8 startoption : 3;
  u8 retrytimes : 2;
  u32 timeToExecute;
}ST_EVENT_CONTROL;


typedef struct
{
  ST_EVENT_CONTROL *control;
  void (*handler)(void);
}ST_EVENT_METHOD;
#endif

typedef enum
{
  END = 0,
  START,
  WAIT,
  FINISH,
}EN_EVENT_STARTOPTION;


//模式
typedef enum 
{
  MODE_ENHANCE = 7,    //ENHANCE模式
  MODE_ROBUST = 8      //鲁棒模式
}eMode;

//设备类型
typedef enum
{
  TYPE_MASTER,      //主节点
  TYPE_METER_SINGLE,    //单相载波表节点
  TYPE_UNKNOWN      //未知设备类型
}eType;





typedef struct
{
  u8 venderID[2];//const 厂商代码 
  u8 chipID[2];//const 芯片代码
  u8 date;//const 日
  u8 month;//const 月
  u8 year;//const 年
  u8 version[2];//const 版本
}Manufacturer_Version;

void * w_memcpy( void *out, const void *in, unsigned int n);
void *w_memset(void *out, int value, unsigned int n);

#define memcpy(dest, src, count)   w_memcpy(dest, src, count)
#define memset(dest, value, count) w_memset(dest, value, count)


/* Exported functions ------------------------------------------------------- */

u16 GetCRC16(u8 *pbuffer, u16 length);
void Delayms(u16 cnt);
void Delayus(u8 cnt);
//void hal_set_event(ST_EVENT_CONTROL * event, EN_EVENT_STARTOPTION state, u32 value);
u8 *MemCpy(void *pDsc, void*pSrc, u16 len);
void MemSet(void *pAddr, u8 value, u16 len);
u8 getSum(u8 * buffer, u8 length);
u8 cmp(u8 * buf1, u8* buf2, u8 length);
#endif /* __COMMON_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

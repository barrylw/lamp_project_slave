/**
  ******************************************************************************
  * @file    common.c
  * @author  William Liang
  * @version V1.0.0
  * @date    09/24/2013
  * @brief   This file contains some common program.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "common.h"
#include "hal_timer.h"
#include "hal_wdg.h"
#include "stdio.h"
/** @addtogroup Common_Program
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

const u16 CRC16_CCITT_Table[256] =
{

  0x0000, 0x1189, 0x2312, 0x329B, 0x4624, 0x57AD, 0x6536, 0x74BF,
  0x8C48, 0x9DC1, 0xAF5A, 0xBED3, 0xCA6C, 0xDBE5, 0xE97E, 0xF8F7,
  0x1081, 0x0108, 0x3393, 0x221A, 0x56A5, 0x472C, 0x75B7, 0x643E,
  0x9CC9, 0x8D40, 0xBFDB, 0xAE52, 0xDAED, 0xCB64, 0xF9FF, 0xE876,
  0x2102, 0x308B, 0x0210, 0x1399, 0x6726, 0x76AF, 0x4434, 0x55BD,
  0xAD4A, 0xBCC3, 0x8E58, 0x9FD1, 0xEB6E, 0xFAE7, 0xC87C, 0xD9F5,
  0x3183, 0x200A, 0x1291, 0x0318, 0x77A7, 0x662E, 0x54B5, 0x453C,
  0xBDCB, 0xAC42, 0x9ED9, 0x8F50, 0xFBEF, 0xEA66, 0xD8FD, 0xC974,
  0x4204, 0x538D, 0x6116, 0x709F, 0x0420, 0x15A9, 0x2732, 0x36BB,
  0xCE4C, 0xDFC5, 0xED5E, 0xFCD7, 0x8868, 0x99E1, 0xAB7A, 0xBAF3,
  0x5285, 0x430C, 0x7197, 0x601E, 0x14A1, 0x0528, 0x37B3, 0x263A,
  0xDECD, 0xCF44, 0xFDDF, 0xEC56, 0x98E9, 0x8960, 0xBBFB, 0xAA72,
  0x6306, 0x728F, 0x4014, 0x519D, 0x2522, 0x34AB, 0x0630, 0x17B9,
  0xEF4E, 0xFEC7, 0xCC5C, 0xDDD5, 0xA96A, 0xB8E3, 0x8A78, 0x9BF1,
  0x7387, 0x620E, 0x5095, 0x411C, 0x35A3, 0x242A, 0x16B1, 0x0738,
  0xFFCF, 0xEE46, 0xDCDD, 0xCD54, 0xB9EB, 0xA862, 0x9AF9, 0x8B70,
  0x8408, 0x9581, 0xA71A, 0xB693, 0xC22C, 0xD3A5, 0xE13E, 0xF0B7,
  0x0840, 0x19C9, 0x2B52, 0x3ADB, 0x4E64, 0x5FED, 0x6D76, 0x7CFF,
  0x9489, 0x8500, 0xB79B, 0xA612, 0xD2AD, 0xC324, 0xF1BF, 0xE036,
  0x18C1, 0x0948, 0x3BD3, 0x2A5A, 0x5EE5, 0x4F6C, 0x7DF7, 0x6C7E,
  0xA50A, 0xB483, 0x8618, 0x9791, 0xE32E, 0xF2A7, 0xC03C, 0xD1B5,
  0x2942, 0x38CB, 0x0A50, 0x1BD9, 0x6F66, 0x7EEF, 0x4C74, 0x5DFD,
  0xB58B, 0xA402, 0x9699, 0x8710, 0xF3AF, 0xE226, 0xD0BD, 0xC134,
  0x39C3, 0x284A, 0x1AD1, 0x0B58, 0x7FE7, 0x6E6E, 0x5CF5, 0x4D7C,
  0xC60C, 0xD785, 0xE51E, 0xF497, 0x8028, 0x91A1, 0xA33A, 0xB2B3,
  0x4A44, 0x5BCD, 0x6956, 0x78DF, 0x0C60, 0x1DE9, 0x2F72, 0x3EFB,
  0xD68D, 0xC704, 0xF59F, 0xE416, 0x90A9, 0x8120, 0xB3BB, 0xA232,
  0x5AC5, 0x4B4C, 0x79D7, 0x685E, 0x1CE1, 0x0D68, 0x3FF3, 0x2E7A,
  0xE70E, 0xF687, 0xC41C, 0xD595, 0xA12A, 0xB0A3, 0x8238, 0x93B1,
  0x6B46, 0x7ACF, 0x4854, 0x59DD, 0x2D62, 0x3CEB, 0x0E70, 0x1FF9,
  0xF78F, 0xE606, 0xD49D, 0xC514, 0xB1AB, 0xA022, 0x92B9, 0x8330,
  0x7BC7, 0x6A4E, 0x58D5, 0x495C, 0x3DE3, 0x2C6A, 0x1EF1, 0x0F78,

};

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Calculate the CRC16-CCITT of the buffer.
  * @param  pBuffer: pointer to the buffer.
  * @param  length: number of bytes the buffer.
  * @retval CRC16-CCITT calculate result.
  */
u16 GetCRC16(u8 *pbuffer, u16 length)
{
  u16 crc16 = 0xFFFF;

  while (length--)
  {
    crc16 = (crc16 >> 8 ) ^ CRC16_CCITT_Table[(crc16 ^ *pbuffer++) & 0xFF];
  }
  crc16 ^= 0xFFFF;
  return crc16;
}

/**
  * @brief Delay special millisecond.
  * @param  cnt: the num of millisecond.
  * @retval None.
  */
void Delayms(u16 cnt)
{
  u32 time = 0;

  time = hal_GetSystickCounter();
  while (hal_GetSystickCounter() - time < cnt)
  {
    FEED_WDG;
  }
}

/**
  * @brief Delay special microsecond.
  * @param  cnt: the num of microsecond.
  * @retval None.
  */
void Delayus(u8 cnt)
{
  u8 i = 0;
  
  while (cnt--)
  {
    for (i = 0; i < 8; i++);
  }
}

/************* 函数声明 *************/
/*——————————————————————————
* 函 数 名：MemCpy
* 输入参数：pSrc	源内存指针		
len		数据长度 
* 输出参数：pDsc	目的内在指针
* 返 回 值：拷贝后的目的偏移地址
* 功能说明：拷贝一段内存内容
*——————————————————————————*/
u8 *MemCpy(void *pDsc, void*pSrc, u16 len)
{
  u8 *pAddr1 = (u8 *)pDsc;
  u8 *pAddr2 = (u8 *)pSrc;

  while(len--)
  {
    *pAddr1++ = *pAddr2++;
  }

  return pAddr1;
}

/*——————————————————————————
* 函 数 名：MemSet
* 输入参数：pAddr	内存指针		
value	需要设置的值
len		数据长度 
* 输出参数：None
* 返 回 值：None
* 功能说明：设置某一段内容为某值
*——————————————————————————*/
void MemSet(void *pAddr, u8 value, u16 len)
{
  u8 *pTmp = (u8 *)pAddr;

  while(len--)
  {
    *pTmp++ = value;
  }
}


void * w_memcpy( void *out, const void *in, size_t n)
{
  uint8_t *src, *dest;
  src = (uint8_t *) in;
  dest = (uint8_t *) out;
  while(n-- > 0) {
    *dest++ = *src++;
  }
  return out;
}

void *w_memset(void *out, int value, size_t n)
{
  uint8_t *dest;
  dest = (uint8_t *) out;
  while(n-- > 0) {
    *dest++ = value & 0xff;
  }
  return out;
}

u8 getSum(u8 * buffer, u8 length)
{
  u8 sum = 0;
  
  for (u8 i = 0; i < length; i++)
  {
    sum += buffer[i];
  }

  return sum;
}

/* 不同为0， 相同为1 */
u8 cmp(u8 * buf1, u8* buf2, u8 length)
{
  for (u8 i = 0; i < length; i++)
  {
     if ( buf1[i] != buf2[i] )
     {
       /* 不同 */
       return 0;
     }
  }
    /* 相同 */
   return 1;
}
/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

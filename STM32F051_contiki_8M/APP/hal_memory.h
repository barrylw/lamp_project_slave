/**
  ******************************************************************************
  * @file    hal_memory.h 
  * @author  William Liang
  * @version V1.0.0
  * @date    08/13/2013
  * @brief   This file contains the headers of the memory management.
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HAL_MEMORY_H__
#define __HAL_MEMORY_H__

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"
#include "common.h"

/* Exported constants --------------------------------------------------------*/

#define OS_MAX_MEM_PART                5u  /* Max. number of memory partitions */
#define OS_ARG_CHK_EN                  0u  /* Enable (1) or Disable (0) argument checking */
#define OS_ERR_NONE                    0u
#define OS_ERR_MEM_INVALID_PART        90u
#define OS_ERR_MEM_INVALID_BLKS        91u
#define OS_ERR_MEM_INVALID_SIZE        92u
#define OS_ERR_MEM_NO_FREE_BLKS        93u
#define OS_ERR_MEM_FULL                94u
#define OS_ERR_MEM_INVALID_PBLK        95u
#define OS_ERR_MEM_INVALID_PMEM        96u
#define OS_ERR_MEM_INVALID_PDATA       97u
#define OS_ERR_MEM_INVALID_ADDR        98u

/* Exported macro ------------------------------------------------------------*/
#define  OS_CRITICAL_METHOD   3

#if OS_CRITICAL_METHOD == 3
#define  OS_ENTER_CRITICAL()  {cpu_sr = OS_CPU_SR_Save();}
#define  OS_EXIT_CRITICAL()   {OS_CPU_SR_Restore(cpu_sr);}
#endif

/* Exported types ------------------------------------------------------------*/

typedef unsigned int   OS_CPU_SR;                /* Define size of CPU status register (PSR = 32 bits) */

typedef struct         /* MEMORY CONTROL BLOCK */
{
  void *OSMemAddr;      /* Pointer to beginning of memory partition  */
  void *OSMemFreeList;  /* Pointer to list of free memory blocks  */
  u32 OSMemBlkSize;     /* Size (in bytes) of each block of memory */
  u32 OSMemNBlks;       /* Total number of blocks in this partition */
  u32 OSMemNFree;       /* Number of memory blocks remaining in this partition */
}OS_MEM;

typedef struct
{
  void *OSAddr;         /* Pointer to the beginning address of the memory partition     */
  void *OSFreeList;     /* Pointer to the beginning of the free list of memory blocks   */
  u32 OSBlkSize;        /* Size (in bytes) of each memory block                         */
  u32 OSNBlks;          /* Total number of blocks in the partition                      */
  u32 OSNFree;          /* Number of memory blocks free                                 */
  u32 OSNUsed;          /* Number of memory blocks used                                 */
}OS_MEM_DATA;

/* Exported functions ------------------------------------------------------- */
void hal_InitMemoryVariable(void);
static void OS_MemInit(void);
OS_MEM *OSMemCreate(void *addr, u32 nblks, u32 blksize, u8 *perr);
void *OSMemGet(OS_MEM *pmem, u8 *perr);
u8 OSMemPut(OS_MEM *pmem, void *pblk);
u8 OSMemQuery(OS_MEM *pmem, OS_MEM_DATA *p_mem_data);
void OS_MemCopy (u8 *pdest, u8 *psrc, u16 size);
void OS_MemClr(u8 *pdest, u16 size);

#if OS_CRITICAL_METHOD == 3                       /* See OS_CPU_A.ASM */
OS_CPU_SR OS_CPU_SR_Save(void);
void OS_CPU_SR_Restore(OS_CPU_SR cpu_sr);
#endif

#endif /* __HAL_MEMORY_H__ */

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

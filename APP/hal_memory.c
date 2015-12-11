/**
  ******************************************************************************
  * @file    hal_memory.c
  * @author  William Liang
  * @version V1.0.0
  * @date    08/13/2013
  * @brief   This file contains the Memory Management refer to uC/OS-II V2.91
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#ifdef PRINTF_DEBUG

#include "hal_memory.h"
#include "hal_uart.h"


    
/** @addtogroup Memory_Management
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
OS_MEM *OSMemFreeList;            /* Pointer to free list of memory partitions       */
OS_MEM OSMemTbl[OS_MAX_MEM_PART]; /* Storage for memory partition manager          */

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief Initialize the Memory Management.
  * @param None.
  * @retval None.
  */
void hal_InitMemoryVariable(void)
{
  OS_MemInit();
}

/**
  * @brief Initialize the memory partition manager.
  * @param  None.
  * @retval None.
  */
static void OS_MemInit (void)
{
#if OS_MAX_MEM_PART == 1u
  OS_MemClr((u8 *)&OSMemTbl[0], sizeof(OSMemTbl));   /* Clear the memory partition table    */
  OSMemFreeList = (OS_MEM *)&OSMemTbl[0];             /* Point to beginning of free list           */
#endif

#if OS_MAX_MEM_PART >= 2u
  OS_MEM  *pmem;
  u16 i;

  OS_MemClr((u8 *)&OSMemTbl[0], sizeof(OSMemTbl)); /* Clear the memory partition table   */
  for (i = 0u; i < (OS_MAX_MEM_PART - 1u); i++)          /* Init. list of free memory partitions      */
  {
    pmem = &OSMemTbl[i];                             /* Point to memory control block (MCB)       */
    pmem->OSMemFreeList = (void *)&OSMemTbl[i + 1u];  /* Chain list of free partitions             */
  }
  pmem = &OSMemTbl[i];
  pmem->OSMemFreeList = (void *)0;                      /* Initialize last node                      */

  OSMemFreeList = &OSMemTbl[0];                    /* Point to beginning of free list           */
#endif
}

/**
  * @brief Create a fixed-sized memory partition.
  * @param  addr:  the starting address of the memory partition.
  * @param  nblks: the number of memory blocks to create from the partition.
  * @param  blksize: the size (in bytes) of each block in the memory partition.
  * @param  perr: a pointer to a variable containing an error message.
  *   This parameter can be one of the following values:
  *     @arg OS_ERR_NONE:  if the memory partition has been created correctly.
  *     @arg OS_ERR_MEM_INVALID_ADDR: if you are specifying an invalid address for the memory
  *                                 storage of the partition or, the block does not align on a pointer boundary.
  *     @arg OS_ERR_MEM_INVALID_PART: no free partitions available.
  *     @arg OS_ERR_MEM_INVALID_BLKS  user specified an invalid number of blocks (must be >= 2)
  *     @arg OS_ERR_MEM_INVALID_SIZE  user specified an invalid block size
  *                                 - must be greater than the size of a pointer
  *                                 - must be able to hold an integral number of pointers
  * @retval (OS_MEM *)0:  the partition was not created because of invalid arguments or, no
  *                              free partition is available.
  *             != (OS_MEM *)0: the partition was created
  */
OS_MEM *OSMemCreate (void *addr, u32 nblks, u32 blksize, u8 *perr)
{
  OS_MEM *pmem;
  u8 *pblk;
  void **plink;
  u32 loops;
  u32 i;
  
#if OS_CRITICAL_METHOD == 3u                          /* Allocate storage for CPU status register      */
  OS_CPU_SR cpu_sr = 0u;
#endif

#ifdef OS_SAFETY_CRITICAL
  if (perr == (u8 *)0)
  {
    OS_SAFETY_CRITICAL_EXCEPTION();
  }
#endif

#ifdef OS_SAFETY_CRITICAL_IEC61508
  if (OSSafetyCriticalStartFlag == OS_TRUE)
  {
    OS_SAFETY_CRITICAL_EXCEPTION();
  }
#endif

#if OS_ARG_CHK_EN > 0u
  if (addr == (void *)0)                           /* Must pass a valid address for the memory part.*/
  {
    *perr = OS_ERR_MEM_INVALID_ADDR;
    return ((OS_MEM *)0);
  }
  if (((u32)addr & (sizeof(void *) - 1u)) != 0u)  /* Must be pointer size aligned                */
  {
    *perr = OS_ERR_MEM_INVALID_ADDR;
    return ((OS_MEM *)0);
  }
  if (nblks < 2u)                                  /* Must have at least 2 blocks per partition     */
  {
    *perr = OS_ERR_MEM_INVALID_BLKS;
    return ((OS_MEM *)0);
  }
  if (blksize < sizeof(void *))                    /* Must contain space for at least a pointer */
  {
    *perr = OS_ERR_MEM_INVALID_SIZE;
    return ((OS_MEM *)0);
  }
#endif

  OS_ENTER_CRITICAL();
  pmem = OSMemFreeList;                       /* Get next free memory partition */
  if (OSMemFreeList != (OS_MEM *)0)          /* See if pool of free partitions was empty */
  {               
    OSMemFreeList = (OS_MEM *)OSMemFreeList->OSMemFreeList;
  }
  OS_EXIT_CRITICAL();

  if (pmem == (OS_MEM *)0)                     /* See if we have a memory partition */
  {
    *perr = OS_ERR_MEM_INVALID_PART;
    return ((OS_MEM *)0);
  }
  plink = (void **)addr;                       /* Create linked list of free memory blocks */
  pblk  = (u8 *)addr;
  loops  = nblks - 1u;
  for (i = 0u; i < loops; i++)
  {
    pblk +=  blksize;                          /* Point to the FOLLOWING block */
    *plink = (void  *)pblk;                     /* Save pointer to NEXT block in CURRENT block */
    plink = (void **)pblk;                      /* Position to  NEXT block */
  }
  *plink = (void *)0;                           /* Last memory block points to NULL */
  pmem->OSMemAddr = addr;                      /* Store start address of memory partition */
  pmem->OSMemFreeList = addr;                  /* Initialize pointer to pool of free blocks  */
  pmem->OSMemNFree = nblks;                    /* Store number of free blocks in MCB */
  pmem->OSMemNBlks = nblks;
  pmem->OSMemBlkSize = blksize;                /* Store block size of each memory blocks */
  *perr = OS_ERR_NONE;
  return (pmem);
}

/**
  * @brief Get a memory block from a partition.
  * @param  pmem:  a pointer to the memory partition control block.
  * @param  perr: a pointer to a variable containing an error message.
  *   This parameter can be one of the following values:
  *     @arg OS_ERR_NONE:  if the memory partition has been created correctly.
  *     @arg OS_ERR_MEM_NO_FREE_BLKS:  if there are no more free memory blocks to allocate to caller.
  *     @arg OS_ERR_MEM_INVALID_PMEM: if you passed a NULL pointer for 'pmem'.
  * @retval A pointer to a memory block if no error is detected.
  *              A pointer to NULL if an error is detected.
  */
void *OSMemGet (OS_MEM *pmem, u8 *perr)
{
  void *pblk;

#if OS_CRITICAL_METHOD == 3u                          /* Allocate storage for CPU status register */
  OS_CPU_SR cpu_sr = 0u;
#endif
  
#ifdef OS_SAFETY_CRITICAL
  if (perr == (u8 *)0)
  {
    OS_SAFETY_CRITICAL_EXCEPTION();
  }
#endif
  
#if OS_ARG_CHK_EN > 0u
  if (pmem == (OS_MEM *)0)                        /* Must point to a valid memory partition */
  {
    *perr = OS_ERR_MEM_INVALID_PMEM;
    return ((void *)0);
  }
#endif

  OS_ENTER_CRITICAL();
  if (pmem->OSMemNFree > 0u)                      /* See if there are any free memory blocks       */
  {
    pblk = pmem->OSMemFreeList;                   /* Yes, point to next free memory block          */
    pmem->OSMemFreeList = *(void **)pblk;         /*      Adjust pointer to new free list          */
    pmem->OSMemNFree--;                           /*      One less memory block in this partition  */
    OS_EXIT_CRITICAL();
    *perr = OS_ERR_NONE;                          /*      No error                                 */
    return (pblk);                                /*      Return memory block to caller            */
  }
  OS_EXIT_CRITICAL();
  
  *perr = OS_ERR_MEM_NO_FREE_BLKS;                /* No,  Notify caller of empty memory partition  */
  return ((void *)0);                               /*      Return NULL pointer to caller            */
}

/**
  * @brief  Release a memory block to a partition.
  * @param  pmem:  a pointer to the memory partition control block.
  * @param  pblk:  a pointer to the memory block being released.
  * @retval an error message can be one of the following values:
  *     @arg OS_ERR_NONE:  if the memory block was inserted into the partition.
  *     @arg OS_ERR_MEM_FULL: if you are returning a memory block to an already FULL memory partition 
  *                                                (You freed more blocks than you allocated!)
  *     @arg OS_ERR_MEM_INVALID_PMEM: if you passed a NULL pointer for 'pmem'.
  *     @arg OS_ERR_MEM_INVALID_PBLK:  if you passed a NULL pointer for the block to release.
  */
u8 OSMemPut (OS_MEM *pmem, void *pblk)
{
#if OS_CRITICAL_METHOD == 3u                     /* Allocate storage for CPU status register           */
  OS_CPU_SR  cpu_sr = 0u;
#endif
  
#if OS_ARG_CHK_EN > 0u
  if (pmem == (OS_MEM *)0)                    /* Must point to a valid memory partition             */
  {
    return (OS_ERR_MEM_INVALID_PMEM);
  }
  
  if (pblk == (void *)0)                      /* Must release a valid block                         */
  {
    return (OS_ERR_MEM_INVALID_PBLK);
  }
#endif

  OS_ENTER_CRITICAL();
  if (pmem->OSMemNFree >= pmem->OSMemNBlks)   /* Make sure all blocks not already returned          */
  {
    OS_EXIT_CRITICAL();
    return (OS_ERR_MEM_FULL);
  }
  
  *(void **)pblk = pmem->OSMemFreeList;       /* Insert released block into free block list         */
  pmem->OSMemFreeList = pblk;
  pmem->OSMemNFree++;                          /* One more memory block in this partition            */
  OS_EXIT_CRITICAL();
  
  return (OS_ERR_NONE);                        /* Notify caller that memory block was released       */
}

/**
  * @brief  Query a memory partition.
  * @param  pmem:  a pointer to the memory partition control block.
  * @param  p_mem_data:   a pointer to a structure that will contain information about the memory partition.
  * @retval an error message can be one of the following values:
  *     @arg OS_ERR_NONE:  if no errors were found.
  *     @arg OS_ERR_MEM_INVALID_PMEM: if you passed a NULL pointer for 'pmem'.
  *     @arg OS_ERR_MEM_INVALID_PDATA: if you passed a NULL pointer to the data recipient.
  */
u8 OSMemQuery (OS_MEM *pmem, OS_MEM_DATA *p_mem_data)
{
#if OS_CRITICAL_METHOD == 3u                     /* Allocate storage for CPU status register           */
  OS_CPU_SR  cpu_sr = 0u;
#endif

#if OS_ARG_CHK_EN > 0u
  if (pmem == (OS_MEM *)0)                     /* Must point to a valid memory partition             */
  {
    return (OS_ERR_MEM_INVALID_PMEM);
  }
  if (p_mem_data == (OS_MEM_DATA *)0)         /* Must release a valid storage area for the data     */
  {
    return (OS_ERR_MEM_INVALID_PDATA);
  }
#endif

  OS_ENTER_CRITICAL();
  p_mem_data->OSAddr     = pmem->OSMemAddr;
  p_mem_data->OSFreeList = pmem->OSMemFreeList;
  p_mem_data->OSBlkSize  = pmem->OSMemBlkSize;
  p_mem_data->OSNBlks    = pmem->OSMemNBlks;
  p_mem_data->OSNFree    = pmem->OSMemNFree;
  OS_EXIT_CRITICAL();
  p_mem_data->OSNUsed    = p_mem_data->OSNBlks - p_mem_data->OSNFree;
  return (OS_ERR_NONE);
}

/**
  * @brief  Copy a block of memory.
  * @param  pdest:  a pointer to the 'destination' memory block.
  * @param  psrc:  a pointer to the 'source' memory block.
  * @param  size:  the number of bytes to copy.
  * @retval None.
  */
void OS_MemCopy (u8 *pdest, u8 *psrc, u16 size)
{
  while (size > 0u)
  {
    *pdest++ = *psrc++;
    size--;
  }
}

/**
  * @brief  Clear a block of memory.
  * @param  pdest:  the start of the RAM to clear (i.e. write 0x00 to).
  * @param  size:  the number of bytes to clear.
  * @retval None.
  */
void OS_MemClr (u8 *pdest, u16 size)
{
  while (size > 0u) 
  {
    *pdest++ = (u8)0;
    size--;
  }
}

#endif
/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

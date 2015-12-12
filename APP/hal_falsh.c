#include "hal_flash.h"
#include "stm32f0xx_flash.h"

/**
  * @brief  Unlocks Flash for write access
  * @param  None
  * @retval None
  */
void FLASH_Init(void)
{ 
  /* Unlock the Program memory */
  FLASH_Unlock();

  /* Clear all FLASH flags */  
  FLASH_ClearFlag(FLASH_FLAG_EOP|FLASH_FLAG_WRPERR | FLASH_FLAG_PGERR | FLASH_FLAG_BSY);   
}


void hal_Init_Flash(void)
{
  FLASH_Init();
}



uint32_t FLASH_Write_chars( uint32_t FlashAddress, uint8_t* Data ,uint16_t DataLength)
{
  uint16_t temp;
  
  __disable_irq();
  
    for (u16 i = 0; i < (DataLength/2); i++)
    {
       temp = (u16)(Data[i*2] + Data[i*2+1] *256);

       if (FLASH_ProgramHalfWord(FlashAddress, temp) == FLASH_COMPLETE)
       {
           /* Check the written value */
          if (*(u16*)FlashAddress != temp)
          {
             /* Flash content doesn't match SRAM content */
             //return(2);
              __enable_irq();
             return FLASH_WRITE_ERROR;
          }
       }
       else
       {
          __enable_irq();
         return FLASH_ERASE_ERROR;
       }

       FlashAddress += 2;
    }

    if (DataLength % 2 == 0)
    {
        __enable_irq();
        return FLASH_OK;
    }
    else
    {
        temp = (u16)(Data[DataLength -1]);

        if (FLASH_ProgramHalfWord(FlashAddress, temp) == FLASH_COMPLETE)
        {
            /* Check the written value */
            if (*(u16*)FlashAddress != temp)
            {
                /* Flash content doesn't match SRAM content */
                 __enable_irq();
                return FLASH_WRITE_ERROR;
            }
            else
            {
                 __enable_irq();
                return FLASH_OK;
            }
        }
        else
        {
             __enable_irq();
            return FLASH_ERASE_ERROR;
        }
    }
 
}

#if 0
uint32_t FLASH_Write_16BITS( uint32_t* FlashAddress, uint16_t* Data ,uint16_t DataLength)
{
    __disable_irq();
    
    for (u16 i = 0; i < (DataLength); i++)
    {
        if (FLASH_ProgramHalfWord(*FlashAddress, Data[i]) == FLASH_COMPLETE)
        {
            /* Check the written value */
            if (*(u16*)*FlashAddress != Data[i])
            {
               /* Flash content doesn't match SRAM content */
               return FLASH_WRITE_ERROR;
            }
         }
         else
         {
           return FLASH_ERASE_ERROR;
         }
         *FlashAddress += 2;
    }
    
      __enable_irq();
    
     return FLASH_OK;
}


/**
  * @brief  This function writes a data buffer in flash (data are 32-bit aligned).
  * @note   After writing data buffer, the flash content is checked.
  * @param  FlashAddress: start address for writing data buffer
  * @param  Data: pointer on data buffer
  * @param  DataLength: length of data buffer (unit is 32-bit word)   
  * @retval 0: Data successfully written to Flash memory
  *         1: Error occurred while writing data in Flash memory
  *         2: Written Data in flash memory is different from expected one
  */
uint32_t FLASH_If_Write(__IO uint32_t* FlashAddress, uint32_t* Data ,uint16_t DataLength)
{
  uint32_t i = 0;

  for (i = 0; (i < DataLength) && (*FlashAddress <= (USER_FLASH_END_ADDRESS-4)); i++)
  {
    /* the operation will be done by word */ 
    if (FLASH_ProgramWord(*FlashAddress, *(uint32_t*)(Data+i)) == FLASH_COMPLETE)
    {
     /* Check the written value */
      if (*(uint32_t*)*FlashAddress != *(uint32_t*)(Data+i))
      {
        /* Flash content doesn't match SRAM content */
        return(2);
      }
      /* Increment FLASH destination address */
      *FlashAddress += 4;
    }
    else
    {
      /* Error occurred while writing data in Flash memory */
      return (1);
    }
  }

  return (0);
}

#endif





/**
  ******************************************************************************
  * @file    apl_debug.c
  * @author  William Liang
  * @version V1.0.0
  * @date    07/26/2013
  * @brief   This file contains debug command handlers.
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#ifdef PRINTF_DEBUG

#include "common.h"
#include "apl_debug.h"
#include "apl.h"
#include "phy.h"
#include "hal_led.h"
#include "hal_timer.h"
#include "hal_uart.h"
#include "hal_radio.h"
#include "hal_wdg.h"
#include "sx1276-LoRaMisc.h"
#include "sx1276-Fsk.h"

extern u8 tedtbuf[];
void set_reg(void);
void start_longSend(void);
void changeHopChannel(void);
/** @addtogroup  APL Debug Command
  * @{
  */ 

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

static const ST_DEBUG_COMMAND CmdList[] = 
{
  {"version", ReadVersion},
  {"reset", SoftReset},
  {"settime", SetTime},
  {"gettime", GetTime},
  
  {"senduart", SendUart},
  {"setpow",set_power},
  {"readupdate", ReadUpdateData},
  {"readreg",get_reg},
  {"writereg",set_reg},
  {"readft",read_reg_all},
  {"tx",send_packet},
  {"rx",receive_packet},
  {"contious",contious_mode_rx},
  {"radioreset",radio_reset},
  {"longsend",start_longSend},
  {"hopchannel",changeHopChannel}
};

extern u8 g_DebugRxBuffer[RBL_COM2_RX_SIZE];
extern ST_UART_FLAG g_DebugRxFlag;
extern uint8_t g_hopChannel;

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Process debug command input in the main loop.
  * @param  None.
  * @retval  None.
  */
void apl_ProcessDebugCmd(void)
{
  if (g_DebugRxFlag.fLen > 0)
  {
    apl_ProcessCmdLine();
    printf("C>");
  }
  else
  {
    printf("\r\ncommand length error!\r\n");
  }
  
  OS_MemClr(g_DebugRxBuffer, sizeof(g_DebugRxBuffer));
  g_DebugRxFlag.fLen = 0;
}

/**
  * @brief  Process debug command line.
  * @param  None.
  * @retval  None.
  */
void apl_ProcessCmdLine(void)
{
  u32 time_t = 0;
  u8 commandLength = 0;
  u8 commandByte = 0;
  u8 cmdListLen = sizeof(CmdList) / sizeof(ST_DEBUG_COMMAND);
  const u8 *command;
  bool match = true;

  // go through each command
  for (u8 i = 0; i < cmdListLen; i++)
  {
    // get the command
    command = CmdList[i].cmd;
    
    // get the length of the cmd
    commandLength = 0;
    commandByte = CmdList[i].cmd[0];
    while (commandByte != 0)
    {
      commandLength++;
      commandByte = CmdList[i].cmd[commandLength];
    }

    match = true;
    // check for differences in the command and what was entered
    for (u8 j = 0; j < commandLength; j++)
    {
      if (command[j] != g_DebugRxBuffer[j])
      {
        match = false;
        break;
      }
    }
    // commands with 0 length are invalid
    if (commandLength < 1)
    {
      match = false;
    }
    // if command matches command entered call the callback
    if (match)
    {
      time_t = hal_GetSystickCounter();
      printf("\r\n");
      (CmdList[i].action)();
      printf("it has taken %d ms\r\n", hal_GetSystickCounter() - time_t);
      break;
    }
  }
  
  if (!match) 
  {
    if((g_DebugRxBuffer[0] != '\r') && (g_DebugRxBuffer[0] != '\n'))
    {
      printf("\r\ncommand not recognized\r\n");
    }
    else
    {
      printf("\r\n");
    }
  }  
}

/**
  * @brief  Get u8 parameter from command line.
  * @param  parameter: the pointer of input parameter.
  * @param  index: the index of input parameter.
  * @retval None.
  */
void Getu8Parameter(u8 *parameter, u8 index)
{
  u16 j = 0;
  u8 i = 0;

  for (j = 0; j < sizeof(g_DebugRxBuffer); j++)
  {
    if (g_DebugRxBuffer[j] == ' ')
    {
      i++;
      if (i == index)
      {
        if ((g_DebugRxBuffer[j + 2] == ' ') \
          || (g_DebugRxBuffer[j + 2] == '\r') \
          || (g_DebugRxBuffer[j + 2] == '\n'))
        {
          (*parameter) = HexCharToInt8u(g_DebugRxBuffer[j + 1]);
        }
        else if ((g_DebugRxBuffer[j + 3] == ' ') \
          || (g_DebugRxBuffer[j + 3] == '\r') \
          || (g_DebugRxBuffer[j + 3] == '\n'))
        {
          u8 temp1, temp2;
          temp1 = HexCharToInt8u(g_DebugRxBuffer[j + 1]);
          temp1 *= 10;
          temp2 = HexCharToInt8u(g_DebugRxBuffer[j + 2]);
          temp2 += temp1;
          (*parameter) = temp2;
        }
        else
        {
          u8 temp1, temp2, temp3;
          temp1 = HexCharToInt8u(g_DebugRxBuffer[j + 1]);
          temp1 *= 100;
          temp2 = HexCharToInt8u(g_DebugRxBuffer[j + 2]);
          temp2 *= 10;
          temp3 = HexCharToInt8u(g_DebugRxBuffer[j + 3]);
          temp3 += temp1 + temp2;
          (*parameter) = temp3;
        }
        return;
      } 
    }
  }
  *parameter = 0;
}

/**
  * @brief  Get u16 parameter from command line.
  * @param  parameter: the pointer of input parameter.
  * @param  index: the index of input parameter.
  * @retval  None.
  */
void Getu16Parameter(u16 *parameter, u8 index)
{
  u16 j = 0;
  u8 i = 0;
  u8 length = 0;
  u16 value = 0;
  u16 digitMod = 1;
  u8 placeVal = 0;
  u8 startPos = 0;
  
  for (j = 0; j < sizeof(g_DebugRxBuffer); j++)
  {
    if (g_DebugRxBuffer[j] == ' ')
    {
      i++;
      if (i == index)
      {
        u8 *finger = &g_DebugRxBuffer[j + 1];
        u8 *header = &g_DebugRxBuffer[j + 1];

        while ((*finger) != ' ')
        {
          finger++;
          if (((*finger) == '\r' || (*finger) == '\n'))
          {
            break;
          }
          if (finger - header > 5)
          {
            break;
          }
        }
        length = finger - header;

        if ((*header) == '-')
        {
          startPos = 1;
        }
        
        for (i = length; i > startPos; i--)
        {
          finger--;
          placeVal = (*finger) - 48;
          value = value + (digitMod * placeVal);
          digitMod = digitMod * 10;
        }
        
        if (startPos == 1)
        {
          value = 65536 - value;
        }
        length = 0;
        break;
      }
    }
  }
  *parameter = value;
}


/**
  * @brief  Get string parameter from command line.
  * @param  parameter: the pointer of input parameter.
  * @param  index: the index of input parameter.
  * @retval None.
  */
u8 GetStringParameter(u8 *parameter, u8 index)
{
  u16 j = 0;
  u8 i = 0;
  u8 len = 0; 
  u8 *buf = parameter;

  for (j = 0; j < sizeof(g_DebugRxBuffer); j++)
  {
    if (g_DebugRxBuffer[j] == ' ')
    {
      i++;
      if (i == index)
      {
        while (g_DebugRxBuffer[j + 1] != ' ' \
            & (g_DebugRxBuffer[j + 1] != '\r')\
            & (g_DebugRxBuffer[j + 1] != '\n'))
        {
          *buf = g_DebugRxBuffer[j + 1];
          buf++;
          j++;
          len++;
        }
        return len;
      } 
    }
  }
  return len;
}


/**
  * @brief  Convert input char to u8.
  * @param  hexChar: the input char.
  * @retval u8 convert result.
  */
static u8 HexCharToInt8u(u8 hexChar)
{
  if ('0' <= hexChar && hexChar <= '9')
  {
    return hexChar - '0';
  }
  else if ('a' <= hexChar && hexChar <= 'f')
  {
    return hexChar - 'a' + 10;
  }
  else if ('A' <= hexChar && hexChar <= 'F')
  {
    return hexChar - 'A' + 10;
  }
  else
  {
    return 0;
  }
}

void ReadUpdateData(void)
{
  u8 tempBuf[UPDATE_FLASH_LENGTH+2];
  
  for (u8 i = 0; i < UPDATE_FLASH_LENGTH + 2; i++)
  {
    tempBuf[i] = *((u8*)(UPDATE_FLASH_PARAMETER_DDR + i ));
  }
  for (u8 i = 0; i < UPDATE_FLASH_LENGTH + 2; i++)
  {
    printf("%x ",  tempBuf[i]);
  }
}

void set_power(void)
{
  u8 temp = 0;
  Getu8Parameter(&temp, 1);
  
  SX1276LoRaSetRFPower(temp);
}

void get_reg(void)
{
  u8 reg = 0;
  u8 temp = 0;
  
  Getu8Parameter(&reg, 1);
  
  SX1276Read(reg, &temp);
  
  printf("reg %x = %x\r\n",reg,temp);
}

void set_reg(void)
{
  u8 reg = 0;
  u8 value = 0;
  u8 temp = 0;
  Getu8Parameter(&reg, 1);
  Getu8Parameter(&value, 2);
  SX1276Write(reg, value);
  
  SX1276Read(reg, &temp);
  
  printf("reg %x = %x\r\n",reg,temp);
  
  
}

void read_reg_all(void)
{
  u8 startReg = 0;
  u8 endReg = 0;
  u8 tempValue;
  
  Getu8Parameter(&startReg, 1);
  Getu8Parameter(&endReg, 2);
  
  for (u8 i = startReg; i<= endReg; i++)
  {
    if ((i % 10 == 0) && (i > 0))
    {
      printf("\r\n");
    }
    SX1276Read(i, &tempValue);
    printf("%x  ", tempValue);
  }
  printf("\r\n");
}


void send_packet(void)
{
  u8 length;
  Getu8Parameter(&length, 1);
  #ifndef USE_LORA_MODE
  SX1276Fsk_Send_Packet(tedtbuf, length); 
#else
  SX1276LoRa_Send_Packet(tedtbuf, length);
  #endif
}

void receive_packet(void)
{
  #ifndef USE_LORA_MODE
  SX1276Fsk_recrive_Packet();
#else
  SX1276LoRa_Receive_Packet(false);
  #endif
}

void contious_mode_rx(void)
{
  #ifndef USE_LORA_MODE
  start_continuous_mode();
  #endif
}


void radio_reset(void)
{
  hal_InitRF();
}

void start_longSend(void)
{
  u8 length = 0;
 
  Getu8Parameter(&length, 1);
 
  process_start(&hal_long_send, (char*)(&length));
}

void changeHopChannel(void)
{
  u8 hopChannel = 0;
  
  Getu8Parameter(&hopChannel, 1);
  
  g_hopChannel = hopChannel;
  
  hal_InitRF();
}



#endif //PRINTF_DEBUG

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

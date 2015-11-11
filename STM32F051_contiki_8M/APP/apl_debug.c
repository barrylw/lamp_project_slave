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

#include "math.h"
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
#include "gpio_per.h"  
#include "stdlib.h"

extern u8 tedtbuf[];
void set_reg(void);
void start_longSend(void);
void changeHopChannel(void);
void read_params_flash(void);


extern RN8209C_PARAM rn8209c_papameter;
extern char *paralist[];
extern char g_updateBuffer[];
void Relay_close(void);
void Relay_open(void);
void debug_set_pwm(void);

void read_volt(void);
void read_current(void);
void read_pow(void);
void read_energy(void);
void read_factor(void);
void debug_save(void);
void read_u_i_p(void);
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
  {"hopchannel",changeHopChannel},
  {"read8209c",read_8209c_reg},
  {"sethfconst",set_8209c_hfconst},
  {"set8209c",set_8209c_Reg},
  {"setgain",cal_power_gain},
  {"setangle",cal_power_angle},
  {"setkx",set_8209c_Kx},
  {"readuip",read_u_i_p},
  {"readw",read_energy},
  {"reada",read_param_all},
  {"8209creset",reset_8029c},
  {"flashread",read_params_flash},
  {"relayclose",Relay_close},
  {"relayopen",Relay_open},
  {"pwm",debug_set_pwm},
  {"factor",read_factor},
  {"dbsave",debug_save}
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

void changeHopChannel(void)
{
  u8 hopChannel = 0;
  
  Getu8Parameter(&hopChannel, 1);
  
  g_hopChannel = hopChannel;
  
  hal_InitRF();
}



void read_8209c_reg(void)
{
  u8 reg;
  u32 dat = 0;
  u8 buf[10] = {0};
  
  GetStringParameter((u8*)buf, 1);
  
  if ( (buf[0] == '0') && (buf[1] == 'x'))
  {
    reg = strtol((char*)buf,NULL,16);
  }
  else
  {
    reg = atoi((char*)buf);
  }
 
  read_8209c_regs( reg , &dat);
#if 0
   printf("reg %x = ",reg);
   for (u8 i = 0; i < length; i++)
   {
      printf("%x ",(dat>>(8*(length -i-1)))&0xFF);
   }
   printf("\r\n");
#endif 
  printf("reg %x = 0x%x\r\n",reg, dat);
}

void set_8209c_Reg(void)
{
  u8 reg;
  u8 buf[12];
  u8 regbuf[10];
  u32 dat;
  
  GetStringParameter(regbuf,    1);
  GetStringParameter(buf,       2);
  
  if ( (regbuf[0] == '0') && (regbuf[1] == 'x'))
  {
    reg = strtol((char*)regbuf,NULL,16);
  }
  else
  {
    reg = atoi((char*)regbuf);
  }
  
  if ( (buf[0] == '0') && (buf[1] == 'x'))
  {
    dat = strtol((char*)buf,NULL,16);
  }
  else
  {
   dat = atoi((char*)buf);
  }
  
  config_8209c_reg(reg, dat);
}

void set_8209c_hfconst(void)
{
  u8 buf[2];
  
   u16 dat;
 
  Getu16Parameter(&dat, 1);
  
  buf[0] = (u8)((dat>>8)&0xFF);
  buf[1] = (u8)(dat & 0xFF);
  
  rn8209c_write_byte(CMDREG, WRITE_ENABLE);
  
  rn8209c_write(ADHFConst, buf, 2);
  
  rn8209c_write_byte(CMDREG, WRITE_DISABLE);
  
  rn8209c_papameter.HFConst = dat;
}

void cal_power_gain(void)
{
  u8 str[8];
  float val;
  int   valint;
  GetStringParameter(str, 1);
  val = atof((char*)str)/100;
  val = (- val/(1 + val));
  
  if (val)
  {
    valint = (u16)(val*32768);
  }
  else
  {
    valint = (u16)(65536 + val*32768);
  }
  
  str[0] = (valint >> 8) & 0xFF;
  str[1] = valint & 0xFF;
  
  rn8209c_write_byte(CMDREG, WRITE_ENABLE);
  
  rn8209c_write(ADGPQA, str, 2);
  
  rn8209c_write_byte(CMDREG, WRITE_DISABLE);
  
  rn8209c_papameter.GPQA = valint;
  
}

void cal_power_angle(void)
{
  u8 str[8];
  float val;
  float vals;
  u8  valint;
  GetStringParameter(str, 1);
  val = atof((char*)str)/100;
  vals = (asin(-val/1.732));
  vals = vals/0.02*180/3.1415926;
  
  if (vals > 0)
  {
    valint = (u8)vals;
  }
  else
  {
    valint = (u8)(vals + 256);
  }
  
  rn8209c_write_byte(CMDREG, WRITE_ENABLE);
  
  rn8209c_write_byte(ADPhsA, valint);
  
  rn8209c_write_byte(CMDREG, WRITE_DISABLE);
  
  rn8209c_papameter.PhsA = valint;
}

void set_8209c_Kx(void)
{
    u32 intVal;

    read_8209c_regs(ADURMS,&intVal);
    rn8209c_papameter.Ku  =  intVal;
   
    read_8209c_regs(ADIARMS,&intVal);
    rn8209c_papameter.KIa =  intVal;
    
   // rn8209c_papameter.Kp = (float)(3221550000000*1000000/(4294967296*rn8209c_papameter.HFConst*rn8209c_papameter.EC));
   
    rn8209c_papameter.Kp  = 14.55530;
    rn8209c_papameter.energyAPulse = 0;
    rn8209c_papameter.energyA      = 0;
    rn8209c_papameter.PFcount      = 0;
    rn8209c_papameter.calibration  = 1;
    
    read_8209c_regs(ADPowerPA,&intVal);
    if (intVal & 0x80000000)
    {
      intVal = (~intVal + 1);
    }
    rn8209c_papameter.PStart = (u16)(intVal*4.0/1000)/256;
    config_8209c_reg(ADPStart, rn8209c_papameter.PStart);
    
    save_8209c_params();
    power_down_protect();
}

void read_param_all(void)
{
  printf("hfconst %d\r\n,pstart %d\r\n,GPQA %d\r\n,phsAs %d\r\n,qphsal %d\r\n,Ku %d\r\n,Ki %d\r\n,Kp %f\r\n,PFCont %d\r\n,energyPulse %d\r\n,enegyDegree %d\r\n",
          rn8209c_papameter.HFConst,
          rn8209c_papameter.PStart,
          rn8209c_papameter.GPQA,
          rn8209c_papameter.PhsA,
          rn8209c_papameter.QPhsCal,
          rn8209c_papameter.Ku,
          rn8209c_papameter.KIa,
          rn8209c_papameter.Kp,
          rn8209c_papameter.PFcount,
          rn8209c_papameter.energyAPulse,
          rn8209c_papameter.energyA
          );
}

void reset_8029c(void)
{
  rn8209c_init();
  config_8209c_reg(ADHFConst, rn8209c_papameter.HFConst);
  
  rn8209c_papameter.PStart =0;
  rn8209c_papameter.GPQA = 0;
  rn8209c_papameter.PhsA = 0;
  rn8209c_papameter.QPhsCal = 0;
  rn8209c_papameter.Ku = 0;
  rn8209c_papameter.KIa = 0;
  rn8209c_papameter.Kp = 0.0;
  rn8209c_papameter.PFcount = 0;
  rn8209c_papameter.energyAPulse =0;
  rn8209c_papameter.energyA = 0;
}

void read_params_flash(void)
{
  read_params_area(FLASH_PARAMETER_ADDRESS);
 
  printf("%s\r\n",g_updateBuffer);
}

void Relay_close(void)
{
  relay_close();
}

void Relay_open(void)
{
   relay_open();
}

void debug_set_pwm(void)
{
  u8 light;
  Getu8Parameter(&light , 1);
  
  if (light == 0)
  {
     relay_open();
  }
  else
  {
    relay_close();
    set_PWM(light);
  }
  printf("pwm =%d% \r\n", light);
 
}


/*
void read_pow(void)
{
  u32 lightTime;
  read_8209c_Pa();
  lightTime = get_light_time();
  printf("light_time = %d", lightTime);
}
*/

void read_energy(void)
{
  u32 lightTime;
  read_8209c_energyP();
  lightTime = get_light_time();
  printf("light_time = %d", lightTime);
}

void read_factor(void)
{
  u8 fact = read_pow_factor();
  
  printf("factor = %d%",fact);
}

void debug_save(void)
{
  save_elc_datas();
  printf("ok");
}

void read_u_i_p(void)
{
  read_UIP();
  printf("U = %d I = %d P = %d",rn8209c_papameter.Uv,rn8209c_papameter.Ia,rn8209c_papameter.Pa);
}
#endif //PRINTF_DEBUG

/******************* (C) COPYRIGHT 2013 Robulink Technology Ltd.*****END OF FILE****/

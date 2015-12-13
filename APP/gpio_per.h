#ifndef __GPIO_PER_H__
#define __GPIO_PER_H__

#include "common.h"
#include "sys/process.h"
#include "etimer.h"

/* 继电器控制 */
#define RELAY_CONTROL_PIN                     GPIO_Pin_1   
#define RELAY_CONTROL_PORT                    GPIOB
#define RELAY_CONTROL_SCK                     RCC_AHBPeriph_GPIOB

#define relay_open()                          GPIO_SetBits(RELAY_CONTROL_PORT, RELAY_CONTROL_PIN)
#define relay_close()                         GPIO_ResetBits(RELAY_CONTROL_PORT, RELAY_CONTROL_PIN)

#define open_light()                          relay_close()
#define close_light()                         relay_open()


/* 继电器检测 (检测有无过零脉冲) */
#define RELAY_DETECT_PIN                      GPIO_Pin_0
#define RELAY_DETECT_PORT                     GPIOB
#define RELAY_DETECT_SCK                      RCC_AHBPeriph_GPIOB

#define RELAY_DETECT_PORT_SOURCE              EXTI_PortSourceGPIOB
#define RELAY_DETECT_PIN_SOURCE               EXTI_PinSource0
#define RELAY_DETECT_LINE                     EXTI_Line0


/* 过零检测 (检测有无过零脉冲) */
#define ZERO_DETECT_PIN                       GPIO_Pin_8
#define ZERO_DETECT_PORT                      GPIOA
#define ZERO_DETECT_SCK                       RCC_AHBPeriph_GPIOA

#define ZERO_DETECT_PORT_SOURCE               EXTI_PortSourceGPIOA
#define ZERO_DETECT_PIN_SOURCE                EXTI_PinSource8
#define ZERO_DETECT_LINE                      EXTI_Line8


/* led 调光电压ADC测量 */
#define LED_ADC                               ADC1
#define LED_ADC_CLK                           RCC_APB2Periph_ADC1

#define LED_ADC_PIN                           GPIO_Pin_0                     
#define LED_ADC_PORT                          GPIOA
#define LED_ADC_PORT_SCK                      RCC_AHBPeriph_GPIOA
#define LED_ADC_CHANNEL                       ADC_Channel_0


/* led PWM 调光输出 */
#define PWM1_TIMER                             TIM17
#define PWM1_TIMER_SCK                         RCC_APB2Periph_TIM17

#define PWM2_TIMER                             TIM16
#define PWM2_TIMER_SCK                         RCC_APB2Periph_TIM16

#define LED_PWM1_PIN                          GPIO_Pin_9
#define LED_PWM2_PIN                          GPIO_Pin_8
#define LED_PWM_PORT                          GPIOB
#define LED_PWM_PORT_SCK                      RCC_AHBPeriph_GPIOB

#define LED_PWM_PORT_SCK                      RCC_AHBPeriph_GPIOB

#define LED_PWM1_PIN_SOURCE                   GPIO_PinSource9
#define LED_PWM2_PIN_SOURCE                   GPIO_PinSource8

#define LED_PWM1_PIN_AF                       GPIO_AF_2
#define LED_PWM2_PIN_AF                       GPIO_AF_2

#define SYSTEM_FREQENCY                       48000000
#define LED_PWM_DIV                           48
#define LED_PWM_FREQENCY                      1000
#define LED_PWM_PERIOD_COUNT                  (SYSTEM_FREQENCY/LED_PWM_DIV/LED_PWM_FREQENCY)                  
#define LED_PWM_PROPORTION                    0.5


/* 掉电检测定时器 */
#define POWER_DOWN_TIMER                     TIM14
#define POWER_DOWN_TIMER_SCK                 RCC_APB1Periph_TIM14


/*掉电存储文件结构*/
#define ELC_FLIE_LEN                         18
#define ELC_FILE_TAIL_LEN                    16   //（1024%17）

/*************************************************************************
flash file struct  file length = 17
年 月 日 时 分 电量(pulse)（4byte） PFcount(2byte) 亮灯时长（4byte） CRC(2byte)
  0              5            9              11               15
**************************************************************************/

typedef enum
{
  FLASH_TIME_POINT    = 0,
  FLASH_ENERGY_POINT  = 5,
  FLASH_PFCOUNT_POINT = 9,
  FLASH_LIGHT_POINT   = 11,
  FLASH_CRC_PINT      = 15,
  FLASH_END_POINT     = 17
}em_flash_st;


//----------------------start RN8209  地址定义---------------------------------------------------// 
#define ADSYSCON    0x00 
#define ADEMUCON    0x01 
#define ADHFConst   0x02 
#define ADPStart    0x03 
#define ADDStart    0x04 
#define ADGPQA      0x05 
#define ADGPQB      0x06 
#define ADPhsA      0x07 
#define ADPhsB      0x08 
#define ADQPHSCAL   0x09 
#define ADAPOSA     0x0a 
#define ADAPOSB     0x0b 
#define ADRPOSA     0x0c 
#define ADRPOSB     0x0d 
#define ADIARMSOS   0x0e 
#define ADIBRMSOS   0x0f 
#define ADIBGain    0x10 
#define ADD2FPL     0x11 
#define ADD2FPH     0x12 
#define ADDCIAH     0x13 
#define ADDCIBH     0x14 
#define ADDCUH      0x15 
#define ADDCL       0x16 
#define ADEMUCON2   0x17 
#define ADPFCnt     0x20 
#define ADDFcnt     0x21 
#define ADIARMS     0x22 
#define ADIBRMS     0x23 
#define ADURMS      0x24 
#define ADUFreq     0x25 
#define ADPowerPA   0x26 
#define ADPowerPB   0x27 
#define powerQ      0x28
#define ADEnergyP   0x29 
#define ADEnergyP2  0x2a 
#define ADEnergyD   0x2b 
#define ADEnergyD2  0x2c 
#define ADEMUStatus 0x2d 
#define ADSPL_IA    0x30 
#define ADSPL_IB    0x31 
#define ADSPL_U     0x32 
#define ADIE        0x40 
#define ADIF        0x41 
#define ADRIF       0x42 
#define ADSysStatus 0x43 
#define ADRData     0x44 
#define ADWData     0x45 
#define ADDeviceID  0x7f 

//----------------------end RN8209  地址定义-----------------------------------------------//
#define         CMDREG          0xEA
#define         WRITE_ENABLE    0xE5
#define         WRITE_DISABLE   0xDC
#define         SELECT_CHA      0x5A
#define         SELECT_CHB      0xA5
#define         CMD_RESET       0xFA


/*Ku,KIa 只保留寄存器值，计算电压时 直接计算 220/Ku*REG  计算电流 0.5/KIa*REG ,Kp以微瓦为单位，或者以NW 为单位*/

//---start 校表参数文件-------（可根据计量芯片更改） 

typedef struct 
{      
      u32     Ku;                //电压系数 
      u32     KIa;               //电流A系数
      float   Kp;                //功率系数
      u32     ChkSum;            //校验和
      u32     energyA;           //有功电量，单位度  
      u16     HFConst;           
      u16     EC;                //表常数项设置
      u16     PStart ;           //启动设置
      u16     GPQA;              //A有功增益校正 
      u8      PhsA;              //A有功角度校正 
      u8      calibration;       //是否校正
      u16     QPhsCal;           //无功角度校正
      u16     PFcount;           //保存的能量积分，掉电时保存
      u16     energyAPulse;      //电量余数，脉冲数
      u32     lightTime;
      u8      pwmValue;
      u8      reserved;
      u16     crcValue;  
}RN8209C_PARAM;

typedef struct
{
  u32 Uv;
  u32 Ia;
  u32 Pa;
}st_CurUIP;



void init_zero_detect(void);
void relay_gpio_init(void);

void read_UIP(void);
u32 read_8209c_energyP(void);
bool rn8209c_read(u8 reg, u8 *buf, u8 length);
void rn8209c_write_byte(u8 reg, u8 dat);
void rn8209c_write(u8 reg, u8 *buf, u8 length);
u8 read_8209c_regs(u8 reg , void* dat);
void save_8209c_params(void);

void rn8209c_init(void);
void config_8209c_reg(u8 reg, u32 dat);
void power_down_protect(void);
void init_8209c_params(void);
void hal_ADC_Init(void);
void get_ADC_value(void);
void set_PWM(u8 PWMdiv);
u8 read_pow_factor(void);
void format_elc_data(void);

bool read_LED_state(void);
u32 get_light_time(void);
void save_elc_datas(void);
bool read_LED_state(void);
void rn8209c_reset(void);
u16 read_PWM_volt(void);
void gpio_per_init(void);
PROCESS_NAME(start_time_detect_process);
#endif
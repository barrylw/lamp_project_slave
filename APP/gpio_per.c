#include "gpio_per.h"   
#include "hal_uart.h"
#include "hal_flash.h"
#include "math.h"
#include "stdio.h"
#include "apl.h"
#include "string.h"
#include "hal_led.h"
#include "hal_timer.h"
#include "stm32f0xx_adc.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/clock.h>

#define UI_220    220.0
#define IB_05     0.5

#define SAFE_START_TIME      30000       //30S
#define SAVE_DATA_PERIOD     30000      //1����


char g_cal_Buf[1024] = {0};

extern char *paralist[];
static bool  flash_ok        = true;
void hal_init_PWM(void);


RN8209C_PARAM rn8209c_papameter = 
{
      .HFConst      = 4968,              //����������
      .PStart       = 0,                 //��������
      .GPQA         = 0,                 //A�й�����У��
      .PhsA         = 0,                 //A�й��Ƕ�У�� 
      .QPhsCal      = 0,                 //�޹��Ƕ�У��
      .PFcount      = 0,                 //������������֣�����ʱ����
      .energyAPulse = 0,                 //�й�����������С��һ�ȵ磬����������ʾ   
      .Ku           = 0,                 //��ѹϵ��   mv                              
      .KIa          = 0,                 //����Aϵ��  ma
      .Kp           = 0.0,               //����ϵ��   uW ,�ֶ������������޸Ĳ����������ֶ��޸�
      .Uv           = 0,                 //��ѹ��Чֵ
      .Ia           = 0,                 //������Чֵ
      .Pa           = 0,                 //������Чֵ
      .ChkSum       = 0,                 //У���
      .calibration  = 0,                 //����Ƿ�У׼
      .EC           = 6400,
      .pwmValue     = 100,
      .lightTime    = 0,
 };

/*
�ص�
define relay_open()  
����
define relay_close()
��ȡ����
read_8209c_energyP()
����ѹ
read_8209c_U()
������
read_8209c_Ia()
������
read_8209c_Pa()
����
set_PWM(u8 PWMx, u8 PWMdiv)
�������ѹ
read_PWM_volt()
����״̬
read_LED_state()
*/



/***************
������Ҫ����Ĳ���
0��calibration     �Ƿ�ɹ�У׼  1byte
1��PStart          ��������      2byte
2��GPQA            �й�����У׼  2byte
3��PhsA            �й��Ƕ�У׼  1byte 
4��QPhsCal         �޹�У׼      2byte
5��Ku              ��ѹϵ��      3byte                                                   
6��KIa             ����ϵ��      3byte                     
7��CRC16           У��          2byte
���ֽ����ݵ�λ�ڵص�ַ����λ�ڸߵ�ַ
***************/
#define PARAM_CAL                0
#define PARAM_PSTART             1
#define PARAM_GPQA               2
#define PARAM_PHSA               3
#define PARAM_QPHCAL             4
#define PARAM_KU                 5
#define PARAM_KI                 6
#define PARAM_CRC16              7

#if 0
#define CAL_LENGTH               1
#define PSTART_LENGTH            2
#define GPQA_LENGTH              2
#define PHSA_LENGTH              1
#define QPHCAL_LENGTH            2
#define KU_LENGTH                3
#define KI_LENGTH                3
#define CRC16_LENGTH             2
#define PARAM_LENGTH             (CAL_LENGTH + PSTART_LENGTH + GPQA_LENGTH + PHSA_LENGTH + QPHCAL_LENGTH + KU_LENGTH + KI_LENGTH + CRC16_LENGTH)


#define CAL_STRAT_POS           0
#define PSTART_START_POS        (CAL_STRAT_POS    + CAL_LENGTH)
#define GPQA_START_POS          (PSTART_START_POS + PSTART_LENGTH)
#define PHSA_START_POS          (GPQA_START_POS   + GPQA_LENGTH)
#define QPHCAL_START_POS        (PHSA_START_POS   + PHSA_LENGTH)
#define KU_START_POS            (QPHCAL_START_POS + QPHCAL_LENGTH)
#define KI_START_POS            (KU_START_POS     + KU_START_POS)
#define CRC16_START_POS         (KI_START_POS     + KI_LENGTH)

u8 cal_param_index[8][2] = {
                                {CAL_STRAT_POS,CAL_LENGTH},      {PSTART_START_POS,PSTART_LENGTH},
                                {GPQA_START_POS,GPQA_LENGTH},    {PHSA_START_POS,PHSA_LENGTH},
                                {QPHCAL_START_POS,QPHCAL_LENGTH},{KU_START_POS,KU_LENGTH},
                                {CRC16_START_POS,KI_LENGTH},     {CRC16_START_POS,CRC16_LENGTH}
                          };



bool find_params(u8 pos, void * val)
{
    u8 param_pos;
    u8 param_len;
    u16 crcval;
    
    read_flash(FLASH_PARAMETER_ADDRESS, g_updateBuffer, PARAM_LENGTH);

    crcval = GetCRC16(g_updateBuffer, PARAM_LENGTH - 2);

    if (crcval != (g_updateBuffer[PARAM_LENGTH - 1])*256 + g_updateBuffer[PARAM_LENGTH - 2])
    {
        return false;
    }

  
    if (pos > 7)
    {
        return false;
    }

    param_pos = cal_param_index[pos][0];
    param_len = cal_param_index[pos][1];

    if ((param_len != 1) || (param_len != 2) || (param_len != 3))
    {
        return false;
    }

    switch (param_len)
    {
        case 1:
           *(u8*)val =  g_updateBuffer[param_pos];
        break;

        case 2:
            *(u16*)val = (u16)g_updateBuffer[param_pos]  + (u16)g_updateBuffer[param_pos + 1]<<8;
            
        break;

        case 3:
            *(u32*)val = (u32)g_updateBuffer[param_pos]  + (u32)g_updateBuffer[param_pos + 1]<<8 + (u32)g_updateBuffer[param_pos + 2] <<16;
        break;

        default:
        break;
    } 

    return true;
}
#endif


void gpio_per_init(void)
{
    relay_gpio_init(); //�̵������ƣ����
    hal_init_PWM();    //����
    init_zero_detect();//������
    hal_ADC_Init();    //ADC���
}



/*****************************************************************************
 Prototype    : read_params_area
 Description  : read all data from flash
 Input        :  
 Output       : None
 Return Value : 
 Date         : 2015/11/16
 Author       : Barry
*****************************************************************************/
bool read_params_area(u32 addr)
{
#if 0
  for (u16 i = 0; i < 1024; i++)
  {
     g_updateBuffer[i]  = *((char*)addr +i);
     
     if (g_updateBuffer[i] == 0xFF)
     {
       g_updateBuffer[i] = 0;
       break;
     }
     
  }
#endif
  //У�����ݴ洢�ĳ���һ�㲻����100�ֽڣ����Զ���200�ֽ�Ӧ���㹻����ʡʱ�䣬���߲��ý�ʡʱ��
  
  char end[4] = "end";
  
  char * p = NULL;
  
  u16 len;
  
  u16 crcVal;
  
  MemCpy(g_cal_Buf, (char*)addr,  1024);
  
  p = strstr(g_cal_Buf,end);
  
  if (p != NULL)
  {
    len = p - g_cal_Buf + 3;
    crcVal = *(p+3)*256 + *(p+4);
    if ( GetCRC16((u8*)g_cal_Buf,len) == crcVal)
    {
      return true;
    }
    else
    {
      return false;
    }
    
  }
  else
  {
    return false;
  }
  
  
}

/*****************************************************************************
 Prototype    : find_params
 Description  : find caliborate param
 Input        :  
 Output       : None
 Return Value : 
 Date         : 2015/11/16
 Author       : Barry
*****************************************************************************/
bool find_params(u8 pos, void * val)
{
  char *p = NULL;
  
  char valtemp[15] = {0};
  
  p = (char*)(strstr(g_cal_Buf, paralist[pos]));
  
  if (p ==NULL)
  {
    return false;
  }
  else
  {
    for (u8 i = 0;i < 15; i++)
    {
      if (*(p + strlen(paralist[pos]) + i)  != ';') 
      {
        valtemp[i] = *(p + strlen(paralist[pos]) + i);
      }
      else
      {
        break;
      }
    }
   
    if ( (pos == 5) || (pos == 6) || (pos == 10))
    {
       *((u32*)val) = (u32)(atoi(valtemp));
    }
    else if(pos == 7)
    {
      *((float*)val) = (atof(valtemp));
    }
    else
    {
      *((u16*)val) = (u16)(atoi(valtemp));
    }
    
    return true;
  }
}


/*****************************************************************************
 Prototype    : drop_down_timer_init
 Description  : ��ʼ�������ⶨʱ������ʱ����ʱ����ʾ����ʱ�䷢����
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry

���ڵ������ϻָ�����Ƭ��û�и�λ����������ߵ��������Ĵ���
������ɹ���kill ��flash������̣�������ȫʱ������̣������̼��ɹ�����ʹ��flash���������⹦��
contiki ��һ�����̽�����һ������
*****************************************************************************/
void drop_down_timer_init(void)
{
  TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStruct;
  
  RCC_APB1PeriphClockCmd(POWER_DOWN_TIMER_SCK, ENABLE);
  
  TIM_TimeBaseInitStruct.TIM_ClockDivision      =  TIM_CKD_DIV4;
  TIM_TimeBaseInitStruct.TIM_CounterMode        =  TIM_CounterMode_Up; 
  TIM_TimeBaseInitStruct.TIM_Prescaler          =   48000;              // ��ʱ����1ms
  TIM_TimeBaseInitStruct.TIM_Period             =   40;                 // ��ʱ40ms
  TIM_TimeBaseInitStruct.TIM_RepetitionCounter  =   0;
  TIM_TimeBaseInit(POWER_DOWN_TIMER, &TIM_TimeBaseInitStruct);
  
  TIM_ClearFlag(POWER_DOWN_TIMER,  TIM_FLAG_Update);
  TIM_ITConfig(POWER_DOWN_TIMER, TIM_IT_Update,  ENABLE);
}

/*****************************************************************************
 Prototype    : period_save_data_process
 Description  : ��ʱ�������������ʱ��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
PROCESS(period_save_data_process, " ");
PROCESS_THREAD(period_save_data_process, ev, data)
{
    static u32 tempPulse;
    static struct etimer save_timer; 
    PROCESS_BEGIN();
    
    if (ev == PROCESS_EVENT_INIT)
    {
      printf("period save process start\r\n");
      tempPulse = rn8209c_papameter.energyAPulse;  //���浱ǰ������
      printf("power on pulse = %d\r\n",tempPulse);
    }

    while(1)
    {
       etimer_set(&save_timer, SAVE_DATA_PERIOD);
       PROCESS_WAIT_EVENT_UNTIL( (ev == PROCESS_EVENT_TIMER) && ((struct etimer *)data == &save_timer));
       
       get_light_time();
       
       read_8209c_energyP();
 
       if ( (rn8209c_papameter.energyAPulse - tempPulse) >= (rn8209c_papameter.EC/100) )
       {
          save_elc_datas();
          tempPulse = rn8209c_papameter.energyAPulse;
          printf("save elc data finish\r\n");
       } 
       else
       {
         printf("not full the save condition\r\n");
       }
    }

    PROCESS_END();
}

/*****************************************************************************
 Prototype    : start_time_detect_process
 Description  : �ϵ籣�����̣��ϵ���ڱ���ʱ�� SAFE_START_TIME �ڣ����������flash���Լ�ִ�е��籣������
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
PROCESS(start_time_detect_process, "safe_start");
PROCESS_THREAD(start_time_detect_process, ev, data)
{
    static struct etimer start_etimer; 
    
    static u16 length;
    
    PROCESS_BEGIN();
    
    rn8209c_init();
    
    etimer_set(&start_etimer, SAFE_START_TIME);
   
   PROCESS_WAIT_EVENT_UNTIL( (ev == PROCESS_EVENT_TIMER) && ((struct etimer *)data == &start_etimer));
   printf("protected time end\r\n");
   
   if (rn8209c_papameter.calibration == 1)
   {
       if (flash_ok == true)
       {
            printf("flash data ok\r\n");
            
            length =   find_free_addr(FLASH_ELC_SAVE_ADDRESS);

            if(  (length >= (1024 - ELC_FILE_TAIL_LEN))  )
            {
                printf("flash  full  erase and write\r\n");
                read_8209c_energyP();
                format_elc_data();

                if (FLASH_ErasePage(FLASH_ELC_SAVE_ADDRESS) == FLASH_COMPLETE)
                {
                    FLASH_Write_chars( FLASH_ELC_SAVE_ADDRESS, (u8*)g_cal_Buf , ELC_FLIE_LEN);
                }  
             }
             else if (length == 0)
             {
                printf("flash  not full, write\r\n");
                read_8209c_energyP();
                format_elc_data();
                FLASH_Write_chars( FLASH_ELC_SAVE_ADDRESS, (u8*)g_cal_Buf , ELC_FLIE_LEN);
             }
       }
       else
       {
            printf("flash data err, erase and write new data\r\n");
            read_8209c_energyP();
            format_elc_data();

            if (FLASH_ErasePage(FLASH_ELC_SAVE_ADDRESS) == FLASH_COMPLETE)
            {
                FLASH_Write_chars( FLASH_ELC_SAVE_ADDRESS, (u8*)g_cal_Buf , ELC_FLIE_LEN);
                flash_ok = true;
            }  
       }
       process_start(&period_save_data_process, NULL);// ����ʱ�䵽�󣬿�����ʱ�������洢����
       drop_down_timer_init();                        // ����ʱ�䵽�󣬿������籣������
   }
   else
   {
     printf("\r\n");
   }
    
   PROCESS_END();
}



/*****************************************************************************
 Prototype    : save_8209c_params
 Description  : ����У�����ݣ�һ��ֻ��У��ʱ����һ�Σ��Ժ����޸�
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void BCD_code(u8 * str, u8 length)
{
  for (u8 i = 0; i < length; i++)
  {
    str[i] = (str[i] / 10) * 16 + (str[i] % 10);
  }
}

/*****************************************************************************
 Prototype    : save_8209c_params
 Description  : ����У�����ݣ�һ��ֻ��У��ʱ����һ�Σ��Ժ����޸�
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void BCD_decode(u8 * str, u8 length)
{
   for (u8 i = 0; i < length; i++)
  {
    str[i] = (str[i] >> 4)* 10 + (str[i] & 0x0F);
  }
}

/*****************************************************************************
 Prototype    : TIM14_IRQHandler
 Description  : �����ⶨʱ���жϺ��������������ڴ˴�����
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void TIM14_IRQHandler(void)
{
   if (  TIM_GetITStatus(POWER_DOWN_TIMER,  TIM_IT_Update) != RESET)
   {
      TIM_ClearFlag(POWER_DOWN_TIMER,  TIM_FLAG_Update);
     
      //�����⵽����Ҫ��
      //1������RFΪsleep;
      //2���ж��Ƿ񵽴����ݱ��汣��ʱ��
      //3�����ý�ֹ���г������ݱ��棬��Ϊ�п������У��ڹ����ж���ʹ��
      //4�����ý�ֹ������timer����Ϊ�п������У��ڹ����ж���ʹ��
      power_down_protect();
      printf("drop down, save ok\r\n");
      TIM_Cmd(POWER_DOWN_TIMER, DISABLE);
      process_post(&period_save_data_process, PROCESS_EVENT_EXIT, NULL);
      process_start(&start_time_detect_process, NULL);
   }
}

/*****************************************************************************
 Prototype    : hal_ADC_Init
 Description  : ��ʼ��ADC���ܣ�������ڵ�ѹ
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void hal_ADC_Init(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;
    ADC_InitTypeDef adcConfigInitStruct;
    
    RCC_AHBPeriphClockCmd(LED_ADC_PORT_SCK, ENABLE);
    
    RCC_APB2PeriphClockCmd( LED_ADC_CLK, ENABLE );
    
    RCC_ADCCLKConfig(RCC_ADCCLK_HSI14);
    
    ADC_GetCalibrationFactor(LED_ADC);
    
    GPIO_InitStructure.GPIO_Pin = LED_ADC_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(LED_ADC_PORT, &GPIO_InitStructure);
    
    ADC_Cmd(LED_ADC,  ENABLE);
    
    adcConfigInitStruct.ADC_Resolution = ADC_Resolution_10b;                 
    adcConfigInitStruct.ADC_ContinuousConvMode = DISABLE;   
    adcConfigInitStruct.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;   
    adcConfigInitStruct.ADC_ExternalTrigConv = 0;    
    adcConfigInitStruct.ADC_DataAlign = ADC_DataAlign_Right;                  
    adcConfigInitStruct.ADC_ScanDirection = ADC_ScanDirection_Upward;   
    ADC_Init(LED_ADC, &adcConfigInitStruct);
    ADC_ChannelConfig(LED_ADC,LED_ADC_CHANNEL,  ADC_SampleTime_41_5Cycles);
    LED_ADC->CFGR1 |= ADC_CFGR1_AUTOFF; /* (2) */
}

/*****************************************************************************
 Prototype    : init_zero_detect
 Description  : ��ʼ�������⹦��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void init_zero_detect(void)
{
   GPIO_InitTypeDef GPIO_InitStructure;
   
   EXTI_InitTypeDef EXTI_InitStructure;
   
   RCC_AHBPeriphClockCmd(ZERO_DETECT_SCK, ENABLE);

   /*!< Configure zero pin */
  GPIO_InitStructure.GPIO_Pin = ZERO_DETECT_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(ZERO_DETECT_PORT, &GPIO_InitStructure);
 
  EXTI_ClearITPendingBit(ZERO_DETECT_PIN_SOURCE);
  
  SYSCFG_EXTILineConfig(ZERO_DETECT_PORT_SOURCE, ZERO_DETECT_PIN_SOURCE);
  
  EXTI_InitStructure.EXTI_Line = ZERO_DETECT_LINE;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
  EXTI_InitStructure.EXTI_LineCmd = ENABLE;
  EXTI_Init(&EXTI_InitStructure); 
}


/*****************************************************************************
 Prototype    : hal_init_PWM
 Description  : ��ʼ��PWM����
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void hal_init_PWM(void)
{
  /* TIM16 channel 1 */
  /* TIM17 channel 1 */
  GPIO_InitTypeDef GPIO_InitStructure;

  TIM_OCInitTypeDef pwmConfigStructure;

  TIM_TimeBaseInitTypeDef TIM_TimeBaseInitStruct;
  
  RCC_AHBPeriphClockCmd(LED_PWM_PORT_SCK , ENABLE);
  
  RCC_APB2PeriphClockCmd(PWM1_TIMER_SCK | PWM2_TIMER_SCK, ENABLE);

  GPIO_InitStructure.GPIO_Pin   = LED_PWM1_PIN | LED_PWM2_PIN;
  GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
  GPIO_Init(LED_PWM_PORT, &GPIO_InitStructure);
  
  GPIO_PinAFConfig(LED_PWM_PORT, LED_PWM1_PIN_SOURCE, LED_PWM1_PIN_AF);
  GPIO_PinAFConfig(LED_PWM_PORT, LED_PWM2_PIN_SOURCE, LED_PWM2_PIN_AF);
  
  TIM_TimeBaseInitStruct.TIM_ClockDivision      =  TIM_CKD_DIV4;
  TIM_TimeBaseInitStruct.TIM_CounterMode        =  TIM_CounterMode_Up;
  TIM_TimeBaseInitStruct.TIM_RepetitionCounter  =  0;
  TIM_TimeBaseInitStruct.TIM_Prescaler          =  LED_PWM_DIV;
  TIM_TimeBaseInitStruct.TIM_Period             =  LED_PWM_PERIOD_COUNT;  
  TIM_TimeBaseInit(PWM1_TIMER, &TIM_TimeBaseInitStruct);
  TIM_TimeBaseInit(PWM2_TIMER, &TIM_TimeBaseInitStruct);
  
  
  pwmConfigStructure.TIM_OCMode          =  TIM_OCMode_PWM1;
  pwmConfigStructure.TIM_OCPolarity      =  TIM_OCPolarity_High;
  pwmConfigStructure.TIM_OutputState     =  TIM_OutputState_Enable;
  pwmConfigStructure.TIM_OutputNState    = TIM_OutputNState_Enable;
  pwmConfigStructure.TIM_OCNPolarity     = TIM_OCNPolarity_High;
  pwmConfigStructure.TIM_OCIdleState     = TIM_OCIdleState_Set;
  pwmConfigStructure.TIM_OCNIdleState    = TIM_OCIdleState_Reset;
  pwmConfigStructure.TIM_Pulse           = LED_PWM_PERIOD_COUNT;
  
  TIM_OC1Init(PWM1_TIMER, &pwmConfigStructure);
  TIM_OC1Init(PWM2_TIMER, &pwmConfigStructure);
  
  TIM_OC1PreloadConfig(PWM1_TIMER, TIM_OCPreload_Enable);
  TIM_OC1PreloadConfig(PWM2_TIMER, TIM_OCPreload_Enable);
  TIM_ARRPreloadConfig(PWM1_TIMER, ENABLE);
  TIM_ARRPreloadConfig(PWM2_TIMER, ENABLE);

  
  TIM_Cmd(PWM1_TIMER, ENABLE);
  TIM_Cmd(PWM2_TIMER, ENABLE);
  TIM_CtrlPWMOutputs(PWM1_TIMER, ENABLE);
  TIM_CtrlPWMOutputs(PWM2_TIMER, ENABLE);
  
}


/*****************************************************************************
 Prototype    : hal_init_PWM
 Description  : ����PWMռ�ձ�
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void set_PWM(u8 PWMdiv)
{
    u32 TIM_Pulse;
    
    rn8209c_papameter.pwmValue = (PWMdiv >100) ? 100: PWMdiv;
    
    TIM_Pulse =  (u32)(LED_PWM_PERIOD_COUNT* PWMdiv/100);

    PWM1_TIMER->CCR1 = TIM_Pulse;
    PWM2_TIMER->CCR1 = TIM_Pulse;
}

/*****************************************************************************
 Prototype    : hal_ADC_Init
 Description  : ������ڵ�ѹ
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
u16 read_PWM_volt(void)
{
    u16 val;
    
    ADC_ClearFlag( ADC1,  ADC_FLAG_EOC);
    
    ADC_StartOfConversion(ADC1);
    while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
    ADC_StopOfConversion(ADC1);

    val = ADC_GetConversionValue(ADC1);
    
    val = (u16)(3.3*val*1000/1024);
    
    return val;
}

/*****************************************************************************
 Prototype    : relay_gpio_init
 Description  : ��ʼ���̵������ƣ��̵�����⹦��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void relay_gpio_init(void)
{
  GPIO_InitTypeDef GPIO_InitStructure;
   
  RCC_AHBPeriphClockCmd(RELAY_DETECT_SCK | RELAY_CONTROL_SCK, ENABLE);

  /* relay detecet pin */
  GPIO_InitStructure.GPIO_Pin = RELAY_DETECT_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(RELAY_DETECT_PORT, &GPIO_InitStructure);
  
  /* relay control pin */
  GPIO_InitStructure.GPIO_Pin = RELAY_CONTROL_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_Init(RELAY_CONTROL_PORT, &GPIO_InitStructure);
  

  EXTI_InitTypeDef EXTI_InitStructure;
  EXTI_ClearITPendingBit(RELAY_DETECT_LINE);
  SYSCFG_EXTILineConfig(RELAY_DETECT_PORT_SOURCE, RELAY_DETECT_PIN_SOURCE);

  EXTI_InitStructure.EXTI_Line = RELAY_DETECT_LINE;
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
  EXTI_InitStructure.EXTI_LineCmd = ENABLE;
  EXTI_Init(&EXTI_InitStructure); 
}

/*****************************************************************************
 Prototype    : rn8209c_write_byte
 Description  : д���ֽڼĴ�����д����
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void rn8209c_write_byte(u8 reg, u8 dat)
{
   u8 temp = reg |0x80;
   
    while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_TC) == RESET);
    USART_SendData(RBL_COM1, temp);
    
    while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_TC) == RESET);
    USART_SendData(RBL_COM1, dat);
    
    temp = ~(temp+dat);
    
    while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_TC) == RESET);
    USART_SendData(RBL_COM1, temp);
}

/*****************************************************************************
 Prototype    : rn8209c_write
 Description  : None
 Input        :  reg     Ҫд��ļĴ�����ַ
                 buf     Ҫд��ļĴ�������
                 length  �Ĵ����ĳ��ȣ��Ĵ����ĳ����ǲ���ȵ�
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void rn8209c_write(u8 reg, u8 *buf, u8 length)
{
    u8 temp;
    u8 checkSum;
    
    temp = reg|0x80;
    checkSum = temp;

    /* ��ʾ���ڷ��ͻ���Ϊ�� */
    while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_TC) == RESET);
    USART_SendData(RBL_COM1, temp);

    for (u8 i = 0; i < length; i++)
    {
      while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_TC) == RESET);
      USART_SendData(RBL_COM1, buf[i]);
      checkSum += buf[i];
    }
    
    checkSum = ~checkSum;
    
    while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_TC) == RESET);
    USART_SendData(RBL_COM1, checkSum);
}

/*****************************************************************************
 Prototype    : rn8209c_read
 Description  : ����8209C���Ĵ�������
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
bool rn8209c_read(u8 reg, u8 *buf, u8 length)
{
  u8 checkSum = reg;
  
  u8 checkAck;
  
   while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_TC) == RESET);
   USART_SendData(RBL_COM1, reg);


   /* length ��ʾ�Ĵ������ȣ���һ��ʾУ��λ */
   for (u8 i = 0; i < length; i++)
   {
     while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_RXNE) == RESET);
     buf[i] = USART_ReceiveData(RBL_COM1);
     checkSum += buf[i];
   }
   
   while(USART_GetFlagStatus(RBL_COM1, USART_FLAG_RXNE) == RESET);
   checkAck = USART_ReceiveData(RBL_COM1);
   
   checkSum = ~checkSum; 

   return ((checkAck == checkSum) ? true:false);

}


void rn8209c_reset(void)
{
    USART_Cmd(RBL_COM1, DISABLE);

    GPIO_ResetBits(RBL_COM1_RX_GPIO_PORT, RBL_COM1_TX_PIN);
    Delayms(25);
    GPIO_SetBits(RBL_COM1_RX_GPIO_PORT, RBL_COM1_TX_PIN);
    Delayms(20);

    hal_InitUART();
}
/*****************************************************************************
 Prototype    : rn8209c_init
 Description  : 8209c��ʼ��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void rn8209c_init(void)
{
   rn8209c_reset();
  
  init_8209c_params();
}

/*****************************************************************************
 Prototype    : select_length
 Description  : �ɼĴ������жϼĴ�������
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
u8 select_length(u8 reg)
{
  u8 length; 
   
  switch (reg)
  {
    case 0x07:
    case 0x08:
    case 0x40:  
    case 0x41:
    case 0x42:
    case 0x43:
      length = 1;
    break;

    case 0x22:
    case 0x23:
    case 0x24:
    case 0x29:
    case 0x2a:
    case 0x2b:
    case 0x2c: 
    case 0x2d:
    case 0x30:
    case 0x31:
    case 0x32:
    case 0x35:
    case 0x7f:
      length = 3;
      break;
      
    case 0x26: 
    case 0x27:
    case 0x28:
    case 0x44:
      length = 4;
      break;
      
    default:
      length = 2;
       break;
  }
  
  return length;
}

/*****************************************************************************
 Prototype    : config_8209c_reg
 Description  : д�����Ĵ���
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void config_8209c_reg(u8 reg, u32 dat)
{
  u8 buf[4] = {0};
  u8 length;
  
  buf[0]= (u8)((dat >> 24)&0xFF);
  buf[1]= (u8)((dat >> 16)&0xFF);
  buf[2]= (u8)((dat >> 8)&0xFF);
  buf[3]= (u8)((dat)&0xFF);
  
 length = select_length(reg);
 
  rn8209c_write_byte(CMDREG, WRITE_ENABLE);
  
  rn8209c_write(reg, &buf[4-length], length);
  
  rn8209c_write_byte(CMDREG, WRITE_DISABLE);
}

/*****************************************************************************
 Prototype    : read_8209c_regs
 Description  : �������Ĵ���
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
u8 read_8209c_regs(u8 reg , void* dat)
{
  u8 length;
  u8 buf[5] = {0};
  
  if (reg > 0x7f)
  {
    return false;
  }
  
  length = select_length(reg);
  
  if (rn8209c_read(reg, buf, length) == true)
  {
      if (length == 1)
      {
        *((u8*)dat) = buf[0];
      }
      else if (length == 2)
      {
        *((u16*)dat) = (u32)(buf[0]*256 +buf[1]);
      }
      else if (length == 3)
      {
        *((u32*)dat) = (u32)(buf[0]*65536 +buf[1]*256 + buf[2]);
      }
      else if (length == 4)
      {
        *((u32*)dat) = (u32)(buf[0]*16777216 +buf[1]*65536 + buf[2]*256 + buf[3]);
      }
      
      return length;
  }
  else
  {
    return 0;
   
  }
  
}

/*****************************************************************************
 Prototype    : rn8209c_checkSum
 Description  : 8209c�Ƿ񽻱����ú�У��ͼ���
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
u16 rn8209c_checkSum(void)
{
  /* �˴���ʾ�� 0x00~0x17�Ĵ�����У�飬˫�ֽ��ۼӺ�ȡ��*/
  u16 sum = 0;
  u32 tempVal = 0;
  
  for (u8 i =0; i < 0x18; i ++)
  {
      read_8209c_regs(i ,&tempVal);
      
      sum += tempVal;
  }
  return (~sum);
}

/*****************************************************************************
 Prototype    : find_free_addr
 Description  : ����flash�п��п�д��λ��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
u16 find_free_addr(u32 addr)
{
  u8 temp;
  
  u16 i;
  
   for ( i = 0; i < (1024 / ELC_FLIE_LEN); i++)
  {
     temp  = *((char*)(addr +i*ELC_FLIE_LEN));
     
     if (temp == 0xFF)
     {
       break;
     }
  }
  
  return i*ELC_FLIE_LEN;
}

/*****************************************************************************
 Prototype    : save_8209c_params
 Description  : ����У�����ݣ�һ��ֻ��У��ʱ����һ�Σ��Ժ����޸�
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void save_8209c_params(void)
{
  u16 len;
  u16 crcVal;
  
  MemSet(g_cal_Buf, 0, 200);
  
  /* sprintf Ӧ�û��Զ���ĩβ��� 0 */
  sprintf(g_cal_Buf,"%s%d;%s%d;%s%d;%s%d;%s%d;%s%d;%s%d;%s%.3f;end",             
          paralist[0],rn8209c_papameter.calibration,
          paralist[1],rn8209c_papameter.PStart,
          paralist[2],rn8209c_papameter.GPQA,
          paralist[3],rn8209c_papameter.PhsA,
          paralist[4],rn8209c_papameter.QPhsCal,
          paralist[5],rn8209c_papameter.Ku,
          paralist[6],rn8209c_papameter.KIa,
          paralist[7],rn8209c_papameter.Kp
          );
  
   len = strlen(g_cal_Buf);
   
   crcVal = GetCRC16((u8*)g_cal_Buf,len);
   
   g_cal_Buf[len]       = (u8)((crcVal >> 8) &0xFF);
   g_cal_Buf[len + 1 ]  = (u8)(crcVal & 0xFF);
   g_cal_Buf[len + 2 ]  = 0;
    

   if (FLASH_ErasePage(FLASH_PARAMETER_ADDRESS) == FLASH_COMPLETE)
   {
      if ( FLASH_Write_chars( FLASH_PARAMETER_ADDRESS, (u8*)g_cal_Buf ,  len + 3 ) != FLASH_OK)
      {
        printf("save calibration data error\r\n");
      }
   }
   else
   {
     printf("save calibration data error\r\n");
   }
}

/*****************************************************************************
 Prototype    : set_8209c_params
 Description  : ��У�����д��Ĵ�����һ�����ϵ��ʼ��ʱʹ��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void set_8209c_params(void)
{
  u32 status;
  
  config_8209c_reg(ADHFConst, rn8209c_papameter.HFConst);
  config_8209c_reg(ADPStart, rn8209c_papameter.PStart);
  config_8209c_reg(ADGPQA, rn8209c_papameter.GPQA);
  config_8209c_reg(ADPhsA, rn8209c_papameter.PhsA);
  config_8209c_reg(ADPFCnt, rn8209c_papameter.PFcount);
  
  //Delayms(1);
  
  read_8209c_regs(ADEMUStatus , &status);
  
  rn8209c_papameter.ChkSum = rn8209c_checkSum();
  
  if ( (status & 0x10000) == 0)
  {
    if (rn8209c_papameter.ChkSum  == (status & 0xFFFF))
    {
       /* ����״̬���� */
       status = 1;
    }
  }
}

/*****************************************************************************
 Prototype    : find_old_data
 Description  : Ѱ�Ҿɵ��е�Э��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
bool find_old_data(u16 length)
{
   int tempi;
   u16 crcval;
   
   /* �������У�������ع�ȥ����ǰ������ */
   for ( tempi = length; tempi >= 0 ; )
   {
       read_flash(FLASH_ELC_SAVE_ADDRESS + length - ELC_FLIE_LEN, (u8*)g_cal_Buf, ELC_FLIE_LEN);

       crcval = (u16)((u16)g_cal_Buf[FLASH_CRC_PINT]*256 + g_cal_Buf[FLASH_CRC_PINT + 1]);

       if (GetCRC16((u8*)g_cal_Buf,FLASH_CRC_PINT) == crcval)
       {
           rn8209c_papameter.PFcount       = (u16)(g_cal_Buf[FLASH_PFCOUNT_POINT]*256 +g_cal_Buf[FLASH_PFCOUNT_POINT + 1]);
           rn8209c_papameter.energyAPulse  = (u32)(g_cal_Buf[FLASH_ENERGY_POINT]*16777216 +g_cal_Buf[FLASH_ENERGY_POINT+1]*65536 + g_cal_Buf[FLASH_ENERGY_POINT+2]*256 + g_cal_Buf[FLASH_ENERGY_POINT+3]);
           rn8209c_papameter.lightTime     = (u32)(g_cal_Buf[FLASH_LIGHT_POINT]*16777216 +g_cal_Buf[FLASH_LIGHT_POINT+1]*65536 + g_cal_Buf[FLASH_LIGHT_POINT+2]*256 + g_cal_Buf[FLASH_LIGHT_POINT+3]);
           return true;
       }

       tempi -= ELC_FLIE_LEN;
       /* ����ʱ�䵽���Ժ���ȥ�߳������� */
   }
   
   return false;
}

/*****************************************************************************
 Prototype    : init_8209c_params
 Description  : ��flash�ж�ȡ���ݣ���ʼ������
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void init_8209c_params(void)
{
  
  /*************************************************************************
    flash file struct  file length = 17
    �� �� �� ʱ �� ������4byte�� PFcount(2byte) ����ʱ����4byte�� CRC(2byte)
    0              5            9              11               15
  
    FLASH_TIME_POINT,
    FLASH_ENERGY_POINT,
    FLASH_PFCOUNT_POINT,
    FLASH_LIGHT_POINT,
    FLASH_CRC_PINT,
    **************************************************************************/
  
  u16 length;
  u16 crcval;
  
  if (read_params_area(FLASH_PARAMETER_ADDRESS) == true)
  {
      if (find_params(PARAM_CAL, & rn8209c_papameter.calibration) )
      {
            /* ����У׼������ȡ���� */
            if (rn8209c_papameter.calibration == 1)
            {
                find_params(PARAM_PSTART, &rn8209c_papameter.PStart);
                find_params(PARAM_GPQA, &rn8209c_papameter.GPQA);
                find_params(PARAM_PHSA, &rn8209c_papameter.PhsA);
                find_params(PARAM_KU, &rn8209c_papameter.Ku);
                find_params(PARAM_KI, & rn8209c_papameter.KIa);
                find_params(7, & rn8209c_papameter.Kp);
                //find_params(PARAM_QPHCAL, &rn8209c_papameter.QPhsCal);
            

                /*read from flashA */
                length =   find_free_addr(FLASH_ELC_SAVE_ADDRESS);

                /* �洢������ȷ */
                if(  (length < (1024 - ELC_FILE_TAIL_LEN)) &&  (length > 0) )
                {
                    read_flash(FLASH_ELC_SAVE_ADDRESS + length - ELC_FLIE_LEN, (u8*)g_cal_Buf, ELC_FLIE_LEN);

                    crcval = (u16)((u16)g_cal_Buf[FLASH_CRC_PINT]*256 + g_cal_Buf[FLASH_CRC_PINT + 1]);

                    if (GetCRC16((u8*)g_cal_Buf,FLASH_CRC_PINT) == crcval)
                    {
                        flash_ok = true;
                        rn8209c_papameter.PFcount       = (u16)(g_cal_Buf[FLASH_PFCOUNT_POINT]*256 +g_cal_Buf[FLASH_PFCOUNT_POINT + 1]);
                        rn8209c_papameter.energyAPulse  = (u32)(g_cal_Buf[FLASH_ENERGY_POINT]*16777216 +g_cal_Buf[FLASH_ENERGY_POINT+1]*65536 + g_cal_Buf[FLASH_ENERGY_POINT+2]*256 + g_cal_Buf[FLASH_ENERGY_POINT+3]);
                        rn8209c_papameter.lightTime     = (u32)(g_cal_Buf[FLASH_LIGHT_POINT]*16777216 +g_cal_Buf[FLASH_LIGHT_POINT+1]*65536 + g_cal_Buf[FLASH_LIGHT_POINT+2]*256 + g_cal_Buf[FLASH_LIGHT_POINT+3]);
                    }
                    else
                    {   
                        /* ��ȡ�ɵ�flash���ݣ����ɹ����ڱ���ʱ�䵽�󣬽������ݱ��棬����ȡʧ�ܣ��򱣻�ʱ�䵽��ֱ��д�������� */
                      (find_old_data(length) == true)? (flash_ok = true):(flash_ok = false);
                    }
                } 
                else
                {
                    /* �洢����ʧ�ܣ���ֱ���߳�flash */
                    /* �Ƿ���һ����ѯflash�ĺ���������ֱ����ѯflash */
                    flash_ok = false;
                }
            }  
      }
      else
      {
         rn8209c_papameter.calibration = 0;
      } 
  }
  else
  {
     rn8209c_papameter.calibration = 0;
  }
 
  set_8209c_params();
}

/*****************************************************************************
 Prototype    : format_elc_data
 Description  : ��ϵ�����������
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void format_elc_data(void)
{
  
    /*************************************************************************
    flash file struct  file length = 17
    �� �� �� ʱ �� ������4byte�� PFcount(2byte) ����ʱ����4byte�� CRC(2byte)
    **************************************************************************/
  
    u16 crc;
    
    RTC_DateTypeDef RTC_DateStructure;
    RTC_TimeTypeDef RTC_TimeStructure;

    /* Get the RTC current date */
    RTC_GetDate(RTC_Format_BIN, &RTC_DateStructure);

    /* Get the RTC current time */
    RTC_GetTime(RTC_Format_BIN, &RTC_TimeStructure);

    g_cal_Buf[0] = RTC_DateStructure.RTC_Year;
    g_cal_Buf[1] = RTC_DateStructure.RTC_Month;
    g_cal_Buf[2] = RTC_DateStructure.RTC_Date;
    g_cal_Buf[3] = RTC_TimeStructure.RTC_Hours;
    g_cal_Buf[4] = RTC_TimeStructure.RTC_Minutes;

    g_cal_Buf[5] = (u8)((rn8209c_papameter.energyAPulse >> 24) &0xFF);
    g_cal_Buf[6] = (u8)((rn8209c_papameter.energyAPulse >> 16) &0xFF);
    g_cal_Buf[7] = (u8)((rn8209c_papameter.energyAPulse >> 8) &0xFF);
    g_cal_Buf[8] = (u8)(rn8209c_papameter.energyAPulse & 0xFF);

    g_cal_Buf[9] = (u8)((rn8209c_papameter.PFcount >> 8) &0xFF);
    g_cal_Buf[10] = (u8)(rn8209c_papameter.PFcount & 0xFF);
    
    g_cal_Buf[11] = (u8)((rn8209c_papameter.lightTime >> 24) &0xFF);
    g_cal_Buf[12] = (u8)((rn8209c_papameter.lightTime >> 16) &0xFF);
    g_cal_Buf[13] = (u8)((rn8209c_papameter.lightTime >> 8) &0xFF);
    g_cal_Buf[14] = (u8)(rn8209c_papameter.lightTime & 0xFF);

    crc = GetCRC16((u8*)g_cal_Buf, 15);

    g_cal_Buf[15] = (u8)((crc >> 8) &0xFF);
    g_cal_Buf[16] = (u8)(crc & 0xFF);
    g_cal_Buf[17] = 0;
}

/*****************************************************************************
 Prototype    : save_elc_datas
 Description  : ƽʱ����������ݺ���
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void save_elc_datas(void)
{
    u16 length;

    format_elc_data();

    length = find_free_addr(FLASH_ELC_SAVE_ADDRESS );

    /*  ֱ�Ӵ�,��֤����һ���洢�ռ��������籣�� */
    if ( length >= (1024 - ELC_FILE_TAIL_LEN - ELC_FLIE_LEN) )
    {
    FLASH_ErasePage(FLASH_ELC_SAVE_ADDRESS);
    length = 0;
    }

    FLASH_Write_chars( FLASH_ELC_SAVE_ADDRESS + length, (u8*)g_cal_Buf ,ELC_FLIE_LEN); 
    
}

/*****************************************************************************
 Prototype    : power_down_protect
 Description  : ���籣��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void power_down_protect(void)
{
    u32 temp;
    
    u16 length = find_free_addr(FLASH_ELC_SAVE_ADDRESS );
    
    rn8209c_papameter.PFcount = read_8209c_regs(ADPFCnt,&temp); 

    read_8209c_energyP();

    format_elc_data();
   
    temp = FLASH_ELC_SAVE_ADDRESS + length;
    
    FLASH_Write_chars(temp, (u8*)g_cal_Buf ,ELC_FLIE_LEN);
}

/*****************************************************************************
 Prototype    : read_UIP
 Description  : ��ȡ��ѹ������������
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
void read_UIP(void)
{
    u32 temp;
    
    read_8209c_regs(ADURMS,&temp);
    rn8209c_papameter.Uv  =   ((temp & 0x800000) > 0) ? 0:(u16)(220.0*10/rn8209c_papameter.Ku*temp);
    read_8209c_regs(ADIARMS,&temp);
    rn8209c_papameter.Ia  =   ((temp & 0x800000) > 0) ? 0: (u32)(IB_05/rn8209c_papameter.KIa*temp*1000.0); 
    
    read_8209c_regs(ADPowerPA,&temp);
    if (temp & 0x80000000)
    {
      temp = (~temp + 1);
    }
    rn8209c_papameter.Pa = (u16)(rn8209c_papameter.Kp*temp/1000000.0);
}


/*****************************************************************************
 Prototype    : read_8209c_energyP
 Description  : ��ȡ��������
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
u32 read_8209c_energyP(void)
{
    u32 temp;

    read_8209c_regs(ADPFCnt,&temp);

    rn8209c_papameter.PFcount = temp;

    read_8209c_regs(ADEnergyP2,&temp);

    rn8209c_papameter.energyAPulse += temp;

    rn8209c_papameter.energyA = (u32)( (float)rn8209c_papameter.energyAPulse* 1000.0/rn8209c_papameter.EC );

    return  rn8209c_papameter.energyA;
   
}

/*****************************************************************************
 Prototype    : read_pow_factor
 Description  : ��ȡ��������
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
u8 read_pow_factor(void)
{
  u32 powP;
  u32 npowP;
  u8  factor;
  
  read_8209c_regs(ADPowerPA,&powP);
  read_8209c_regs(powerQ,&npowP);
  
  if (powP & 0x80000000)
  {
    powP = (~powP + 1);
  }
  powP = (u32)(rn8209c_papameter.Kp*powP /1000000.0);

  if (npowP & 0x80000000)
  {
    npowP = (~powP + 1);
  }
  
  npowP = (u32)(rn8209c_papameter.Kp*npowP /1000000.0);
  
  factor = (u8)( powP * 100.0 / sqrt(npowP*npowP + powP*powP));
  
  return factor;
}


/*****************************************************************************
 Prototype    : get_light_time
 Description  : ��ȡ����ʱ��
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
u32 get_light_time(void)
{
   if ((read_light_time() /60000) > 0)
   {
     rn8209c_papameter.lightTime += (read_light_time() /60000); 
     clear_light_time();
   }
   
   return rn8209c_papameter.lightTime;
}

/*****************************************************************************
 Prototype    : read_LED_state
 Description  : �жϵ�״̬
 Input        : None 
 Output       : None
 Return Value : 
 Date         : 
 Author       : Barry
*****************************************************************************/
bool read_LED_state(void)
{
  /* 1 ���̵�����*/
  /* 2 ���̵����Ͽ����ƹر�*/
  /* 3 �̵������պϣ��ټ��ʵʱ����*/
  /* 4 ���������״̬�뿪��״̬һ�£��򷵻�״̬����״̬��һ�£��򱨴� */
  if (rn8209c_papameter.pwmValue == 0)
  {
    return false;
  }
  else
  {
    return true;
  }
}











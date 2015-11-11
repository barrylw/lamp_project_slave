#include "common.h"
#include "sx1276-LoRa.h"

#define DB2FILTER_LENGTH     4

double LD[4] = {-0.1294  ,  0.2241  ,  0.8365 ,   0.4830};


double HD[4] = { -0.4830 ,  0.8365 ,  -0.2241,   -0.1294};


double LR[4] = { 0.4830 ,   0.8365 ,   0.2241,   -0.1294};


double HR[4] = {-0.1294,   -0.2241 ,   0.8365,   -0.4830};



void init_plc_debug_timer(TIM_TypeDef* TIMx)
{

    GPIO_InitTypeDef GPIO_InitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;
#if 0
    TIM_DeInit(TIMx);

    TIM_TimeBaseInitTypeDef TimHandle;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM1, ENABLE);

    TimHandle.TIM_Period             = 65535;
    TimHandle.TIM_Prescaler          = 0;//;SystemCoreClock/1000000 -1;
    TimHandle.TIM_ClockDivision      = TIM_CKD_DIV1;
    TimHandle.TIM_CounterMode        = TIM_CounterMode_Up;
    TimHandle.TIM_RepetitionCounter = 0;

    TIM_TimeBaseInit(TIMx,&TimHandle);
    
    //TIM_ITConfig(TIMx, TIM_IT_CC1,  ENABLE);
#endif

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    NVIC_InitStructure.NVIC_IRQChannel = TIM1_CC_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPriority = 2;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    TIM_Cmd(TIMx, ENABLE);
}

 




void wdtDec(double *s, int sLEN, double *h, int filterLEN, double *dec)
{
    double data;
    int n;
    int k;
    int p;
    int decLEN;
        
    decLEN = (sLEN + filterLEN - 1)/2;

	for (n = 1; n <= decLEN; n++)
	{
		dec[n-1] = 0.0;

		for (k = 0; k <filterLEN; k++)
		{
p = 2*n -k -1;

/* 信号边沿对称延拓 */
if ((p < 0) && (p >= -filterLEN + 1))
{
	data = s[-p-1];
}
else
{
	if ((p > sLEN -1) && (p <= sLEN + filterLEN-2))
	{
		data = s[2*sLEN - p - 1];
	}
	else
	{
		if ((p >= 0) && (p <= sLEN - 1))
		{
			data = s[p];
		}
		else
		{
			data = 0;
		}
	}
}
/* 小波分解 */
dec[n-1] += h[k]*data;
		}
	}
} 


//void inputDwt(double *s, int sLEN, double *output)
void inputDwt(void)
{

  init_plc_debug_timer(TIM1);
  
  GPIO_SetBits(GPIOA, GPIO_Pin_1);
  GPIO_ResetBits(GPIOA, GPIO_Pin_1);
  
  for (u8 i = 0; i < 100; i++)
  {
    
    SX1276LoRaReadRssi();
  }
  
 // wdtDec( s, sLEN, LD, DB2FILTER_LENGTH, output);
  GPIO_SetBits(GPIOA, GPIO_Pin_1);
}



void TIM1_CC_IRQHandler(void)
{
  static bool count = false;
  
 if ( TIM_GetITStatus(TIM1,TIM_IT_CC1) != RESET)
 {
  
    TIM_ClearITPendingBit(TIM1, TIM_IT_CC1);

    TIM_SetCounter(TIM1, 0);
    
    if (count)
    {
        GPIO_ResetBits(GPIOA, GPIO_Pin_1);
        count = false;
    }
    else
    {
        GPIO_SetBits(GPIOA, GPIO_Pin_1);
        count = true;
    }
 }
  
}











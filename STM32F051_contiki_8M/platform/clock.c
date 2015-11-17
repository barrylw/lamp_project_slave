#include "common.h"
#include <sys/clock.h>
#include <sys/cc.h>
#include <sys/etimer.h>
#include "gpio_per.h"   
//#include <debug-uart.h>

static volatile clock_time_t current_clock = 0;
static volatile unsigned long current_seconds = 0;
static unsigned int second_countdown = CLOCK_SECOND;
extern u32 g_SystickCounter;
static unsigned int  light_time = 0;

void SysTick_Handler(void)
{
  g_SystickCounter++;
  current_clock++;  
  if (read_LED_state())
  {
    light_time++;
  }
  if(etimer_pending()&& etimer_next_expiration_time()<= current_clock) 
  {  
    etimer_request_poll();  
   // printf("%d,%d\n",clock_time(),etimer_next_expiration_time());   
  }  
  if (--second_countdown== 0) 
  {  
    current_seconds++;  
    second_countdown = CLOCK_SECOND;  
  }  
}


void clock_init()
{
  
  if (SysTick_Config(SystemCoreClock / 1000))
  { 
    /* Capture error */ 
    while (1);
  }
   //NVIC_SetPriority(SysTick_IRQn, 0);
}

clock_time_t clock_time(void)
{
  return current_clock;
}

u32 read_light_time(void)
{
  return light_time;
}

#if 0
/* The inner loop takes 4 cycles. The outer 5+SPIN_COUNT*4. */

#define SPIN_TIME 2 /* us */
#define SPIN_COUNT (((MCK*SPIN_TIME/1000000)-5)/4)

#ifndef __MAKING_DEPS__

void
clock_delay(unsigned int t)
{
#ifdef __THUMBEL__ 
  asm volatile("1: mov r1,%2\n2:\tsub r1,#1\n\tbne 2b\n\tsub %0,#1\n\tbne 1b\n":"=l"(t):"0"(t),"l"(SPIN_COUNT));
#else
#error Must be compiled in thumb mode
#endif
}
#endif
#endif /* __MAKING_DEPS__ */

unsigned long clock_seconds(void)
{
  return current_seconds;
}

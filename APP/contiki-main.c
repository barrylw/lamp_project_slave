
#include <stdint.h>  
#include <stdio.h>   
#include <clock.h>  
#include <sys/process.h> 
#include <sys/procinit.h> 
#include <etimer.h>   
#include <sys/autostart.h>   
#include "common.h"
#include "hal_led.h"
#include "phy.h"
#include "oled.h"
#include "cfs/cfs.h"
#include "hal_radio.h"
//#include "cfs/cfs-coffee.h"
//#include "cfs-coffee-arch.h"
#include "hal_uart.h"
#include "hal_gdflash.h"
#include "stm32f0xx_tim.h"
//#include "NWK.h"
#include "gpio_per.h"
#include "apl.h"
#include "sx1276-Fsk.h"


u8 tedtbuf[150];

void InitAplVariable(void);

void InitVariable(void)
{
  InitPhyVariable();
  //InitAplVariable();
}


#if 0
static process_event_t event_data_ready;

/*������������*/
PROCESS(print_hello_process, "Hello");
PROCESS(print_world_process, "world");

AUTOSTART_PROCESSES(&print_hello_process, &print_world_process);  //�ø�������������

/*�������print_hello_process*/
PROCESS_THREAD(print_hello_process, ev, data)
{
  PROCESS_BEGIN();
  
  static struct etimer timer; 

  etimer_set(&timer, CLOCK_CONF_SECOND); //#define CLOCK_CONF_SECOND 10��timer��interval��Ϊ1 �����4.1

  printf("***print hello process start***\n");

  event_data_ready = process_alloc_event(); //return lastevent++; �½�һ���¼�����ʵ������һ��unsigned charֵ����ʶ��ͬ�¼�

  while (1)
  {
    PROCESS_WAIT_EVENT_UNTIL(ev == PROCESS_EVENT_TIMER); //�����4.2����etimer���ڼ���ִ����������

    printf("Hello\n");

    process_post(&print_world_process, event_data_ready, NULL); //�����첽�¼���print_world_process��ֱ���ں˵��ȸý��̲Ŵ�����¼��������4.3

    etimer_reset(&timer); //���ö�ʱ���������4.4
  }

  PROCESS_END();
}

/*�������print_world_process*/
PROCESS_THREAD(print_world_process, ev, data)
{
  PROCESS_BEGIN();

  printf("***print world process start***\n");

  while (1)
  {
    PROCESS_WAIT_EVENT_UNTIL(ev == event_data_ready);
    printf("world\n");
  }

  PROCESS_END();
}
#endif



#if 0
PROCESS(hello_world_process, "Hello world");
PROCESS(post_event_process, "Post event");

AUTOSTART_PROCESSES(&hello_world_process, &post_event_process);

 static process_event_t event_post; 

PROCESS_THREAD(hello_world_process, ev, data) 
{
  PROCESS_BEGIN(); 
  printf("Hello, world!\n");
  
  while(1) 
  { 
    //usart_puts("while.Before wait event!\n");
    PROCESS_WAIT_EVENT(); 
    if (ev == event_post)
    {
      printf("Have been posted an event!\n");
    }
    else if (PROCESS_EVENT_EXITED)
    {
       if (data == &post_event_process)
       {
         printf("post_event_process,exited!\n");
       }
    }
  }
  
  PROCESS_END(); 
}


PROCESS_THREAD(post_event_process, ev, data) 
{
  PROCESS_BEGIN(); 
  printf("Post event!\n");
  
  event_post = process_alloc_event();
 
  process_post(&hello_world_process, event_post, NULL);
  
  PROCESS_END(); 
}

PROCESS(cfs_test_process, "cfs test");
AUTOSTART_PROCESSES(&cfs_test_process);

PROCESS_THREAD(cfs_test_process, ev, data)
{
  PROCESS_BEGIN();
  printf("***cfs test process start***\r\n");

  if(cfs_coffee_format() == - 1)
  {
    printf("coffee format error.");
    return - 1;
  }

  int fd = cfs_open("CoffeeTest", CFS_WRITE | CFS_READ);
  if(fd == - 1)
  {
    printf("First time open error.");
    return - 1;
  }

  char buf1[]   = "Hello, World!\r\n";
  char buf2[32] = "aaaaa\r\n";
  char buf[100];
  
  printf("The orignal buf1 and buf2 is \r\n: ");
  printf(buf1);
  printf(buf2);

  cfs_write(fd, buf1, sizeof(buf1));
  cfs_seek(fd, 0, CFS_SEEK_SET);
  cfs_read( fd, buf, sizeof(buf1));
  printf(buf);
  cfs_remove("CoffeeTest");
  
  
  fd = cfs_open("CoffeeTest", CFS_WRITE | CFS_READ);
  cfs_write(fd, buf2, sizeof(buf2));
  cfs_seek(fd, 0, CFS_SEEK_SET);
  cfs_read( fd, buf, sizeof(buf2));
  printf(buf); 
   
  //cfs_seek(fd, 0, CFS_SEEK_SET);
  //cfs_write(fd, buf2, sizeof(buf2));
 
  cfs_close(fd);

  PROCESS_END();
}
#endif


u8 test_phy_packet[] = {
0x00, 
0x00,
0x25,
0x12,0x34,
0x03,
0x0b,0x91,0x00,0x00,0x00,0x01,
0x0b,0x91,0x00,0x00,0x00,0x02,
0x0b,0x91,0x00,0x00,0x00,0x03,
0x0b,0x91,0x00,0x00,0x00,0x04,
0x0b,0x91,0x00,0x00,0x00,0x05,
0x01,0x02,0x03};

u8 commpress_buf[18] = {0x00,0x01,0x02,0x03,0x04,0x05,0x00,0x01,0x02,0x03,0x14,0x15,0x00,0x01,0x02,0x03,0x24,0x25};
u8 decommpress_buf[18] = {0x00,0x01,0x02,0x03,0x04,0x05,0x20,0x21,0x60,0x61};
u8 result_buf[18];  

u8 len;
u16 currentADC = 0;

#define APPLICATION_ADDRESS     (uint32_t)(FLASH_APPLICATION_ADDRESS)
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
#if   (defined ( __CC_ARM ))
  __IO uint32_t VectorTable[48] __attribute__((at(0x20000000)));
#elif (defined (__ICCARM__))
#pragma location = 0x20000000
  __no_init __IO uint32_t VectorTable[48];
#elif defined   (  __GNUC__  )
  __IO uint32_t VectorTable[48] __attribute__((section(".RAMVectorTable")));
#elif defined ( __TASKING__ )
  __IO uint32_t VectorTable[48] __at(0x20000000);
#endif


  
#if 0
#pragma pack(push) //�������״̬
#pragma pack(1)//�趨Ϊ1�ֽڶ���
#pragma pack(pop)//�ָ�����״̬
//��Э�������ʱ������
#endif

int main()
{


    for(uint32_t i = 0; i < 48; i++)
    {
        VectorTable[i] = *(__IO uint32_t*)(APPLICATION_ADDRESS + (i<<2));
    }

    /* Enable the SYSCFG peripheral clock*/
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE); 

    /* Remap SRAM at 0x00000000 */
    SYSCFG_MemoryRemapConfig(SYSCFG_MemoryRemap_SRAM);

  
    for (u8 i = 0; i < 150; i++)
    {
    tedtbuf[i] = i+1;
    }

  
    

 
   
    InitVariable();
    InitHardware(); 

    gpio_per_init();
    init_update();
    
     
    //NWK_data_indication(test_phy_packet, sizeof(test_phy_packet));
    //len = compress_addr_list(commpress_buf, 18,  result_buf);
    //len = dempress_addr_list(decommpress_buf,result_buf, 1);

    printf("start app\r\n");
    process_init();
    process_start(&etimer_process, NULL);
    process_start(&hal_urat_process, NULL);

    process_start(&hal_RF_process, NULL);
    process_start(&hal_RF_reset, NULL);
    process_start(&start_time_detect_process, NULL);
    process_start(&apl_update_process, NULL);

    
    //SX1276Fsk_long_send_no_Packet();
    //SX1276Fsk_long_send_no_Packet();
    //�˴�Ҫ���RF��ʱ��λ�¼�
    //process_start(&zero_detect_process, NULL);
    //process_start(&hal_long_send, NULL);
    //autostart_start(autostart_processes); 
    //start_continuous_mode();
    //SX1276Fsk_long_send_no_Packet();
    
  while (1)
  {
    /*ִ��������needspollΪ1�Ľ��̼����������ж��У������3.2*/
    do
    {
    }
    while (process_run() > 0);
  }
}








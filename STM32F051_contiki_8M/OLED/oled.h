//////////////////////////////////////////////////////////////////////////////////	 
//������ֻ��ѧϰʹ�ã�δ��������ɣ��������������κ���;
//�о�԰����
//���̵�ַ��http://shop73023976.taobao.com/?spm=2013.1.0.0.M4PqC2
//
//  �� �� ��   : main.c
//  �� �� ��   : v2.0
//  ��    ��   : HuangKai
//  ��������   : 2014-0101
//  ����޸�   : 
//  ��������   : OLED 4�ӿ���ʾ����(51ϵ��)
//              ˵��: 
//              ----------------------------------------------------------------
//              GND    ��Դ��
//              VCC  ��5V��3.3v��Դ
//              D0   ��PD6��SCL��
//              D1   ��PD7��SDA��
//              RES  ��PD4
//              DC   ��PD5
//              CS   ��PD3               
//              ----------------------------------------------------------------
// �޸���ʷ   :
// ��    ��   : 
// ��    ��   : HuangKai
// �޸�����   : �����ļ�
//��Ȩ���У�����ؾ���
//Copyright(C) �о�԰����2014/3/16
//All rights reserved
//******************************************************************************/
#ifndef __OLED_H
#define __OLED_H			  	 

#include "stdlib.h"	
#include "common.h"
//OLEDģʽ����
//0:4�ߴ���ģʽ
//1:����8080ģʽ
#define OLED_MODE       0
#define SIZE 16
#define XLevelL		0x00
#define XLevelH		0x10
#define Max_Column	128
#define Max_Row		64
#define	Brightness	0xFF 
#define X_WIDTH 	128
#define Y_WIDTH 	64	    						  
//-----------------OLED�˿ڶ���---------------- 

#define SPI_CLK_PIN     GPIO_Pin_0                                       //D0
#define SPI_D1_PIN      GPIO_Pin_1                                     //MOSI
#define SPI_RESET_PIN   GPIO_Pin_2
#define SPI_DC_PIN      GPIO_Pin_3                                     //cmd,data
#define SPI_CS_PIN      GPIO_Pin_4

#define SPI_CLK_PORT    GPIOA                                        
#define SPI_D1_PORT     GPIOA                                       
#define SPI_RESET_PORT  GPIOA 
#define SPI_DC_PORT     GPIOA                                    
#define SPI_CS_PORT     GPIOA

#define OLED_CLK_CLK                           RCC_AHBPeriph_GPIOA
#define OLED_D1_CLK                            RCC_AHBPeriph_GPIOA
#define OLED_RESET_CLK                         RCC_AHBPeriph_GPIOA
#define OLED_DC_CLK                            RCC_AHBPeriph_GPIOA
#define OLED_CS_CLK                            RCC_AHBPeriph_GPIOA



#define OLED_CS_Clr()   GPIO_WriteBit( SPI_CS_PORT, SPI_CS_PIN, Bit_RESET )
#define OLED_CS_Set()   GPIO_WriteBit( SPI_CS_PORT, SPI_CS_PIN, Bit_SET )

#define OLED_RST_Clr()  GPIO_WriteBit( SPI_RESET_PORT, SPI_RESET_PIN, Bit_RESET )
#define OLED_RST_Set()  GPIO_WriteBit( SPI_RESET_PORT, SPI_RESET_PIN, Bit_SET )

#define OLED_DC_Clr()  GPIO_WriteBit( SPI_DC_PORT, SPI_DC_PIN, Bit_RESET )
#define OLED_DC_Set()  GPIO_WriteBit( SPI_DC_PORT, SPI_DC_PIN, Bit_SET )

#if 0
#define OLED_WR_Clr()  GPIO_WriteBit( SPI_CLK_PORT, SPI_CLK_PIN, Bit_RESET )
#define OLED_WR_Set()  GPIO_WriteBit( SPI_CLK_PORT, SPI_CLK_PIN, Bit_SET )

#define OLED_RD_Clr()  GPIO_WriteBit( SPI_D1_PORT, SPI_D1_PIN, Bit_RESET )
#define OLED_RD_Set()  GPIO_WriteBit( SPI_D1_PORT, SPI_D1_PIN, Bit_SET )
#endif

//ʹ��4�ߴ��нӿ�ʱʹ�� 

#define OLED_SCLK_Clr()  GPIO_WriteBit( SPI_CLK_PORT, SPI_CLK_PIN, Bit_RESET )
#define OLED_SCLK_Set()  GPIO_WriteBit( SPI_CLK_PORT, SPI_CLK_PIN, Bit_SET )

#define OLED_SDIN_Clr()  GPIO_WriteBit( SPI_D1_PORT, SPI_D1_PIN, Bit_RESET )
#define OLED_SDIN_Set()  GPIO_WriteBit( SPI_D1_PORT, SPI_D1_PIN, Bit_SET )

 		     
#define OLED_CMD  0	//д����
#define OLED_DATA 1	//д����


//OLED�����ú���
void OLED_WR_Byte(u8 dat,u8 cmd);	    
void OLED_Display_On(void);
void OLED_Display_Off(void);	   							   		    
void OLED_Init(void);
void OLED_Clear(void);
void OLED_DrawPoint(u8 x,u8 y,u8 t);
void OLED_Fill(u8 x1,u8 y1,u8 x2,u8 y2,u8 dot);
void OLED_ShowChar(u8 x,u8 y,u8 chr);
void OLED_ShowNum(u8 x,u8 y,u32 num,u8 len,u8 size);
void OLED_ShowString(u8 x,u8 y, u8 *p);	 
void OLED_Set_Pos(unsigned char x, unsigned char y);
void OLED_ShowCHinese(u8 x,u8 y,u8 no);
void OLED_DrawBMP(unsigned char x0, unsigned char y0,unsigned char x1, unsigned char y1,unsigned char BMP[]);

#endif	 




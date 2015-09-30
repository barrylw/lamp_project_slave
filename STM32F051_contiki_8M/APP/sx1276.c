/*
 * THE FOLLOWING FIRMWARE IS PROVIDED: (1) "AS IS" WITH NO WARRANTY; AND 
 * (2)TO ENABLE ACCESS TO CODING INFORMATION TO GUIDE AND FACILITATE CUSTOMER.
 * CONSEQUENTLY, SEMTECH SHALL NOT BE HELD LIABLE FOR ANY DIRECT, INDIRECT OR
 * CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE CONTENT
 * OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING INFORMATION
 * CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
 * 
 * Copyright (C) SEMTECH S.A.
 */
/*! 
 * \file       sx1276.c
 * \brief      SX1276 RF chip driver
 *
 * \version    2.0.0 
 * \date       May 6 2013
 * \author     Gregory Cristian
 *
 * Last modified by Miguel Luis on Jun 19 2013
 */
#include "platform.h"
#include "radio.h"
#include "sx1276.h"
#include "sx1276-LoRa.h"
#include "hal_radio.h"
#include "hal_timer.h"
//#include "sx1276-Fsk.h"
#include <stdio.h>   


/*!
 * SX1276 registers variable
 */
uint8_t SX1276Regs[0x70];

//static bool LoRaOn = false;
//static bool LoRaOnState = false;

/* REMARK: After radio reset the default modem is FSK */
//bool LORA = true;
//tRadioDriver *radio = NULL;
//extern tLoRaSettings LoRaSettings;

extern st_GDOx_Config g_GDOx_map_conf;


/****************************************************************************
 Prototype    : SX1276Reset
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276Reset( void )
{  
  uint32_t startTick;

  SX1276SetReset( RADIO_RESET_ON );

  /* Wait 1ms */
  startTick = hal_GetSystickCounter( );
  while(  hal_GetSystickCounter( ) < ( startTick + 2 ));

  SX1276SetReset( RADIO_RESET_OFF );

  /* Wait 6ms */
  startTick = hal_GetSystickCounter( );
   while( hal_GetSystickCounter( ) < ( startTick + 6 ));
}



void SX1276_lora_init(void)
{
    SX1276LR = ( tSX1276LR* )SX1276Regs;

    SX1276Reset( );

    SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );
    /* set to lora mode */
    SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_LONGRANGEMODE_MASK ) | RFLR_OPMODE_LONGRANGEMODE_ON;
    SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode );

    SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );

    g_GDOx_map_conf.GDO0Config = DIO0_RxDone;
    g_GDOx_map_conf.GDO1Config = DIO1_RxTimeout;
    g_GDOx_map_conf.GDO2Config = DIO2_FhssCC;
    g_GDOx_map_conf.GDO3Config = DIO3_CadDone;
    g_GDOx_map_conf.GDO4Config = DIO4_CadDetected;
    g_GDOx_map_conf.GDO5Config = DIO5_ModeReady;
    config_GDOx_Map(g_GDOx_map_conf);

    SX1276ReadBuffer( REG_LR_OPMODE, SX1276Regs + 1, 0x70 - 1 );
}

void SX1276_FSK_init(void)
{
    #if defined(SX1276_FSK)
    SX1276 = ( tSX1276* )SX1276Regs;

    SX1276Reset( );

    SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );

    SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_LONGRANGEMODE_MASK ) | RFLR_OPMODE_LONGRANGEMODE_OFF;
    SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode );

    SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );

    SX1276ReadBuffer( REG_OPMODE, SX1276Regs + 1, 0x70 - 1 );
    #endif
}




#if 0

/*****************************************************************************
 Prototype    : SX1276Init
 Description  : none
 Input        : void  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276Init( void )
{
  /* Initialize FSK and LoRa registers structure */
  /* 这是一个很好的初始化结构体的技巧，把数组名强制转化为指向结构体的指针 */
  #if defined(SX1276_FSK)
  SX1276 = ( tSX1276* )SX1276Regs;
  #endif

  #if defined(SX1276_LORA)
  SX1276LR = ( tSX1276LR* )SX1276Regs;
  #endif
  
  SX1276Reset( );
  /* in order to compatible FSK,change LORA to bool variable */
  if (LORA)
  {
	#if defined(SX1276_LORA)
	LoRaOn = true;
	LoRaOnState = false;
	SX1276SetLoRaOn( LoRaOn );
	/* Initialize LoRa modem */
	SX1276LoRaInit();
	#endif
  }
  else
  {
	#if defined(SX1276_FSK)
	LoRaOn = false;
	LoRaOnState = true;
	SX1276SetLoRaOn( LoRaOn );
	/* Initialize FSK modem */
	SX1276FskInit( );
	#endif
  }
}


/*****************************************************************************
 Prototype    : SX1276SetLoRaOn
 Description  : none
 Input        : bool enable  
 Output       : None
 Return Value : 
 Date         : 2014/3/15
 Author       : Barry
*****************************************************************************/
void SX1276SetLoRaOn( bool enable )
{
    /* if current state is the same of wanted state,return */
    if( LoRaOnState == enable )
    {
        return;
    }
    LoRaOnState = enable;
    LoRaOn = enable;

    if( LoRaOn == true )
    {
     #if defined(SX1276_LORA)
        SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );
        /* set to lora mode */
        SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_LONGRANGEMODE_MASK ) | RFLR_OPMODE_LONGRANGEMODE_ON;
        SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode );
        
        SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );

        g_GDOx_map_conf.GDO0Config = DIO0_RxDone;
        g_GDOx_map_conf.GDO1Config = DIO1_RxTimeout;
        g_GDOx_map_conf.GDO2Config = DIO2_FhssCC;
        g_GDOx_map_conf.GDO3Config = DIO3_CadDone;
        g_GDOx_map_conf.GDO4Config = DIO4_CadDetected;
        g_GDOx_map_conf.GDO5Config = DIO5_ModeReady;
        config_GDOx_Map(g_GDOx_map_conf);
        
        SX1276ReadBuffer( REG_LR_OPMODE, SX1276Regs + 1, 0x70 - 1 );
#endif
    }
    else 
    {
   #if defined(SX1276_FSK)
        SX1276LoRaSetOpMode( RFLR_OPMODE_SLEEP );
        
        SX1276LR->RegOpMode = ( SX1276LR->RegOpMode & RFLR_OPMODE_LONGRANGEMODE_MASK ) | RFLR_OPMODE_LONGRANGEMODE_OFF;
        SX1276Write( REG_LR_OPMODE, SX1276LR->RegOpMode );
        
        SX1276LoRaSetOpMode( RFLR_OPMODE_STANDBY );
        
        SX1276ReadBuffer( REG_OPMODE, SX1276Regs + 1, 0x70 - 1 );
   #endif
    }
}
#endif

//#endif // USE_SX1276_RADIO

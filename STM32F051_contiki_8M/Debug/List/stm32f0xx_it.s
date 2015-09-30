///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:48:17
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\APP\stm32f0xx_it.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\stm32f0xx_it.c -D
//        USE_STDPERIPH_DRIVER -D STM32F051X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -D USE_LORA_MODE -lb
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\ --diag_suppress
//        Pa050 -o F:\meterModuleFSK\STM32F051_contiki_8M\Debug\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\LIB\STM32F0xx_StdPeriph_Driver\inc\
//        -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I F:\meterModuleFSK\STM32F051_contiki_8M\LIB\CMSIS\CM0\CoreSupport\
//        -I F:\meterModuleFSK\STM32F051_contiki_8M\core\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\platform\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\lib\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\tools\wpcapslip\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\cfs\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\OLED\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\coffee_arch\ -On --vla -I
//        "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\stm32f0xx_it.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_ClearITPendingBit
        EXTERN RCC_GetITStatus
        EXTERN RCC_HSEConfig
        EXTERN RCC_ITConfig

        PUBLIC HardFault_Handler
        PUBLIC NMI_Handler
        PUBLIC PendSV_Handler
        PUBLIC SVC_Handler


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NMI_Handler:
        PUSH     {R7,LR}
        MOVS     R0,#+128
        BL       RCC_GetITStatus
        CMP      R0,#+0
        BEQ      ??NMI_Handler_0
        MOVS     R0,#+1
        BL       RCC_HSEConfig
        MOVS     R1,#+1
        MOVS     R0,#+24
        BL       RCC_ITConfig
        MOVS     R0,#+128
        BL       RCC_ClearITPendingBit
??NMI_Handler_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HardFault_Handler:
        PUSH     {LR}
??HardFault_Handler_0:
        B        ??HardFault_Handler_0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SVC_Handler:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PendSV_Handler:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 42 bytes in section .text
// 
// 42 bytes of CODE memory
//
//Errors: none
//Warnings: none

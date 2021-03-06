///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:21
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\gitclone\lamp_project_slave\APP\stm32f0xx_it.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\APP\stm32f0xx_it.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
//        G:\gitclone\lamp_project_slave\Debug\List\ --diag_suppress Pa050 -o
//        G:\gitclone\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        G:\gitclone\lamp_project_slave\APP\ -I
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\CoreSupport\ -I
//        G:\gitclone\lamp_project_slave\core\ -I
//        G:\gitclone\lamp_project_slave\core\sys\ -I
//        G:\gitclone\lamp_project_slave\platform\ -I
//        G:\gitclone\lamp_project_slave\core\lib\ -I
//        G:\gitclone\lamp_project_slave\tools\wpcapslip\ -I
//        G:\gitclone\lamp_project_slave\core\cfs\ -I
//        G:\gitclone\lamp_project_slave\OLED\ -I
//        G:\gitclone\lamp_project_slave\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\gitclone\lamp_project_slave\Debug\List\stm32f0xx_it.s
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

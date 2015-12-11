///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:20
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\hal_rcc.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\hal_rcc.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -lb
//        E:\svnProject\street_lamp_new\Debug\List\ --diag_suppress Pa050 -o
//        E:\svnProject\street_lamp_new\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        E:\svnProject\street_lamp_new\APP\ -I
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        E:\svnProject\street_lamp_new\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I E:\svnProject\street_lamp_new\LIB\CMSIS\CM0\CoreSupport\ -I
//        E:\svnProject\street_lamp_new\core\ -I
//        E:\svnProject\street_lamp_new\core\sys\ -I
//        E:\svnProject\street_lamp_new\platform\ -I
//        E:\svnProject\street_lamp_new\core\lib\ -I
//        E:\svnProject\street_lamp_new\tools\wpcapslip\ -I
//        E:\svnProject\street_lamp_new\core\cfs\ -I
//        E:\svnProject\street_lamp_new\OLED\ -I
//        E:\svnProject\street_lamp_new\coffee_arch\ -Ol -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\hal_rcc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_ClearITPendingBit
        EXTERN RCC_ClockSecuritySystemCmd
        EXTERN RCC_GetFlagStatus
        EXTERN RCC_GetITStatus
        EXTERN RCC_PLLCmd
        EXTERN RCC_SYSCLKConfig
        EXTERN SystemCoreClockUpdate

        PUBLIC RCC_IRQHandler
        PUBLIC hal_InitRCC


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitRCC:
        PUSH     {R7,LR}
        BL       SystemCoreClockUpdate
        MOVS     R0,#+1
        BL       RCC_ClockSecuritySystemCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R0,#+8
        BL       RCC_GetITStatus
        CMP      R0,#+0
        BEQ      ??RCC_IRQHandler_0
        MOVS     R0,#+8
        BL       RCC_ClearITPendingBit
        MOVS     R0,#+17
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??RCC_IRQHandler_0
        MOVS     R0,#+1
        BL       RCC_PLLCmd
??RCC_IRQHandler_0:
        MOVS     R0,#+16
        BL       RCC_GetITStatus
        CMP      R0,#+0
        BEQ      ??RCC_IRQHandler_1
        MOVS     R0,#+16
        BL       RCC_ClearITPendingBit
        MOVS     R0,#+25
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??RCC_IRQHandler_1
        MOVS     R0,#+2
        BL       RCC_SYSCLKConfig
??RCC_IRQHandler_1:
        POP      {R0,PC}          ;; return

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
// 82 bytes in section .text
// 
// 82 bytes of CODE memory
//
//Errors: none
//Warnings: none

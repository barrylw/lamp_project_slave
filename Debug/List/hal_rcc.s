///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  14:25:46
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\APP\hal_rcc.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\APP\hal_rcc.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
//        F:\cloneSlave\lamp_project_slave\Debug\List\ --diag_suppress Pa050 -o
//        F:\cloneSlave\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\cloneSlave\lamp_project_slave\APP\ -I
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\inc\
//        -I
//        F:\cloneSlave\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I F:\cloneSlave\lamp_project_slave\LIB\CMSIS\CM0\CoreSupport\ -I
//        F:\cloneSlave\lamp_project_slave\core\ -I
//        F:\cloneSlave\lamp_project_slave\core\sys\ -I
//        F:\cloneSlave\lamp_project_slave\platform\ -I
//        F:\cloneSlave\lamp_project_slave\core\lib\ -I
//        F:\cloneSlave\lamp_project_slave\tools\wpcapslip\ -I
//        F:\cloneSlave\lamp_project_slave\core\cfs\ -I
//        F:\cloneSlave\lamp_project_slave\OLED\ -I
//        F:\cloneSlave\lamp_project_slave\coffee_arch\ -On -I "F:\Program
//        Files (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\hal_rcc.s
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

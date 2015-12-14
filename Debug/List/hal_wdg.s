///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:11
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\APP\hal_wdg.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\APP\hal_wdg.c -D
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
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\hal_wdg.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN IWDG_Enable
        EXTERN IWDG_ReloadCounter
        EXTERN IWDG_SetPrescaler
        EXTERN IWDG_SetReload
        EXTERN IWDG_WriteAccessCmd
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN WWDG_DeInit
        EXTERN WWDG_Enable
        EXTERN WWDG_SetPrescaler
        EXTERN WWDG_SetWindowValue

        PUBLIC hal_InitIwdg
        PUBLIC hal_InitWDG
        PUBLIC hal_InitWwdg


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitWDG:
        PUSH     {R7,LR}
        BL       hal_InitIwdg
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitIwdg:
        PUSH     {R7,LR}
        LDR      R0,??DataTable0  ;; 0x5555
        BL       IWDG_WriteAccessCmd
        MOVS     R0,#+3
        BL       IWDG_SetPrescaler
        LDR      R0,??DataTable0_1  ;; 0x4e2
        BL       IWDG_SetReload
        BL       IWDG_ReloadCounter
        BL       IWDG_Enable
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x5555

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x4e2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitWwdg:
        PUSH     {R7,LR}
        BL       WWDG_DeInit
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       RCC_APB1PeriphClockCmd
        MOVS     R0,#+192
        LSLS     R0,R0,#+1        ;; #+384
        BL       WWDG_SetPrescaler
        MOVS     R0,#+127
        BL       WWDG_SetWindowValue
        MOVS     R0,#+127
        BL       WWDG_Enable
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
// 84 bytes in section .text
// 
// 84 bytes of CODE memory
//
//Errors: none
//Warnings: none

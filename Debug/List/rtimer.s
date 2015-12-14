///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  14:25:50
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\core\sys\rtimer.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\core\sys\rtimer.c -D
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
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\rtimer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN rtimer_arch_init
        EXTERN rtimer_arch_schedule

        PUBLIC rtimer_init
        PUBLIC rtimer_run_next
        PUBLIC rtimer_set


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
next_rtimer:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtimer_init:
        PUSH     {R7,LR}
        BL       rtimer_arch_init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtimer_set:
        PUSH     {R0-R2,R4-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R3
        LDR      R5,[SP, #+32]
        MOVS     R6,#+0
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??rtimer_set_0
        MOVS     R0,#+1
        MOVS     R6,R0
??rtimer_set_0:
        STR      R7,[R4, #+4]
        STR      R5,[R4, #+8]
        MOV      R0,SP
        LDRH     R0,[R0, #+4]
        STRH     R0,[R4, #+0]
        LDR      R0,??DataTable1
        STR      R4,[R0, #+0]
        CMP      R6,#+1
        BNE      ??rtimer_set_1
        MOV      R0,SP
        LDRH     R0,[R0, #+4]
        BL       rtimer_arch_schedule
??rtimer_set_1:
        MOVS     R0,#+0
        POP      {R1-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtimer_run_next:
        PUSH     {R4,LR}
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??rtimer_run_next_0
??rtimer_run_next_1:
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        MOVS     R4,R0
        MOVS     R0,#+0
        LDR      R1,??DataTable1
        STR      R0,[R1, #+0]
        LDR      R1,[R4, #+8]
        MOVS     R0,R4
        LDR      R2,[R4, #+4]
        BLX      R2
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??rtimer_run_next_2
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        LDRH     R0,[R0, #+0]
        BL       rtimer_arch_schedule
??rtimer_run_next_2:
??rtimer_run_next_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     next_rtimer

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
//   4 bytes in section .bss
// 114 bytes in section .text
// 
// 114 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none

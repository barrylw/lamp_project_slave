///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:27
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\core\sys\rtimer.c
//    Command line =  
//        E:\svnProject\street_lamp_new\core\sys\rtimer.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -lb E:\svnProject\street_lamp_new\Debug\List\
//        --diag_suppress Pa050 -o E:\svnProject\street_lamp_new\Debug\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0 -e --fpu=None --dlib_config "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\rtimer.s
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
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R0,R1
        MOVS     R1,#+0
        LDR      R4,??DataTable1
        LDR      R4,[R4, #+0]
        CMP      R4,#+0
        BNE      ??rtimer_set_0
        MOVS     R1,#+1
??rtimer_set_0:
        STR      R3,[R2, #+4]
        LDR      R3,[SP, #+8]
        STR      R3,[R2, #+8]
        STRH     R0,[R2, #+0]
        LDR      R3,??DataTable1
        STR      R2,[R3, #+0]
        CMP      R1,#+1
        BNE      ??rtimer_set_1
        UXTH     R0,R0
        BL       rtimer_arch_schedule
??rtimer_set_1:
        MOVS     R0,#+0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rtimer_run_next:
        PUSH     {R7,LR}
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??rtimer_run_next_0
??rtimer_run_next_1:
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        LDR      R2,??DataTable1
        STR      R1,[R2, #+0]
        LDR      R1,[R0, #+8]
        LDR      R2,[R0, #+4]
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
        POP      {R0,PC}          ;; return

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
// 102 bytes in section .text
// 
// 102 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:29:35
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\core\sys\stimer.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\core\sys\stimer.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -lb G:\git_hub_lamp\lamp_slave_git\Debug\List\
//        --diag_suppress Pa050 -o G:\git_hub_lamp\lamp_slave_git\Debug\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0 -e --fpu=None --dlib_config "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        G:\git_hub_lamp\lamp_slave_git\APP\ -I
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        G:\git_hub_lamp\lamp_slave_git\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I G:\git_hub_lamp\lamp_slave_git\LIB\CMSIS\CM0\CoreSupport\ -I
//        G:\git_hub_lamp\lamp_slave_git\core\ -I
//        G:\git_hub_lamp\lamp_slave_git\core\sys\ -I
//        G:\git_hub_lamp\lamp_slave_git\platform\ -I
//        G:\git_hub_lamp\lamp_slave_git\core\lib\ -I
//        G:\git_hub_lamp\lamp_slave_git\tools\wpcapslip\ -I
//        G:\git_hub_lamp\lamp_slave_git\core\cfs\ -I
//        G:\git_hub_lamp\lamp_slave_git\OLED\ -I
//        G:\git_hub_lamp\lamp_slave_git\coffee_arch\ -Ol -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\stimer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN clock_seconds

        PUBLIC stimer_elapsed
        PUBLIC stimer_expired
        PUBLIC stimer_remaining
        PUBLIC stimer_reset
        PUBLIC stimer_restart
        PUBLIC stimer_set


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
stimer_set:
        PUSH     {R4,LR}
        MOVS     R4,R0
        STR      R1,[R4, #+4]
        BL       clock_seconds
        STR      R0,[R4, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
stimer_reset:
        LDR      R1,[R0, #+0]
        LDR      R2,[R0, #+4]
        ADDS     R1,R1,R2
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
stimer_restart:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       clock_seconds
        STR      R0,[R4, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
stimer_expired:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       clock_seconds
        LDR      R1,[R4, #+0]
        SUBS     R0,R0,R1
        LDR      R1,[R4, #+4]
        SUBS     R0,R0,R1
        LDR      R1,??DataTable0  ;; 0x7fffffff
        CMP      R0,R1
        BCS      ??stimer_expired_0
        MOVS     R0,#+1
        B        ??stimer_expired_1
??stimer_expired_0:
        MOVS     R0,#+0
??stimer_expired_1:
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x7fffffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
stimer_remaining:
        PUSH     {R4,LR}
        LDR      R1,[R0, #+0]
        LDR      R0,[R0, #+4]
        ADDS     R4,R1,R0
        BL       clock_seconds
        SUBS     R0,R4,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
stimer_elapsed:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       clock_seconds
        LDR      R1,[R4, #+0]
        SUBS     R0,R0,R1
        POP      {R4,PC}          ;; return

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
// 102 bytes in section .text
// 
// 102 bytes of CODE memory
//
//Errors: none
//Warnings: none

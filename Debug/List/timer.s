///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:27
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\gitclone\lamp_project_slave\core\sys\timer.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\core\sys\timer.c -D
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
//    List file    =  G:\gitclone\lamp_project_slave\Debug\List\timer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN clock_time

        PUBLIC timer_expired
        PUBLIC timer_remaining
        PUBLIC timer_reset
        PUBLIC timer_restart
        PUBLIC timer_set


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_set:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        STR      R4,[R5, #+4]
        BL       clock_time
        STR      R0,[R5, #+0]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_reset:
        LDR      R1,[R0, #+0]
        LDR      R2,[R0, #+4]
        ADDS     R1,R1,R2
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_restart:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       clock_time
        STR      R0,[R4, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_expired:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       clock_time
        LDR      R1,[R4, #+0]
        SUBS     R0,R0,R1
        ADDS     R0,R0,#+1
        LDR      R1,[R4, #+4]
        CMP      R1,R0
        BCS      ??timer_expired_0
        MOVS     R0,#+1
        B        ??timer_expired_1
??timer_expired_0:
        MOVS     R0,#+0
??timer_expired_1:
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_remaining:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+0]
        LDR      R1,[R4, #+4]
        ADDS     R5,R0,R1
        BL       clock_time
        SUBS     R0,R5,R0
        POP      {R1,R4,R5,PC}    ;; return

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
// 86 bytes in section .text
// 
// 86 bytes of CODE memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:31:02
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\autostart.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\autostart.c -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\autostart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN process_exit
        EXTERN process_start

        PUBLIC autostart_exit
        PUBLIC autostart_start


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
autostart_start:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R0,#+0
        MOVS     R5,R0
??autostart_start_0:
        MOVS     R0,#+4
        MULS     R0,R5,R0
        LDR      R0,[R4, R0]
        CMP      R0,#+0
        BEQ      ??autostart_start_1
        MOVS     R1,#+0
        MOVS     R0,#+4
        MULS     R0,R5,R0
        LDR      R0,[R4, R0]
        BL       process_start
        ADDS     R5,R5,#+1
        B        ??autostart_start_0
??autostart_start_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
autostart_exit:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R0,#+0
        MOVS     R5,R0
??autostart_exit_0:
        MOVS     R0,#+4
        MULS     R0,R5,R0
        LDR      R0,[R4, R0]
        CMP      R0,#+0
        BEQ      ??autostart_exit_1
        MOVS     R0,#+4
        MULS     R0,R5,R0
        LDR      R0,[R4, R0]
        BL       process_exit
        ADDS     R5,R5,#+1
        B        ??autostart_exit_0
??autostart_exit_1:
        POP      {R0,R4,R5,PC}    ;; return

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
// 70 bytes in section .text
// 
// 70 bytes of CODE memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:31:09
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\procinit.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\procinit.c -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\procinit.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN process_start
        EXTERN procinit

        PUBLIC procinit_init


        SECTION `.text`:CODE:NOROOT(2)
        THUMB
procinit_init:
        PUSH     {R4,LR}
        MOVS     R0,#+0
        MOVS     R4,R0
??procinit_init_0:
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R1,??procinit_init_1
        LDR      R0,[R1, R0]
        CMP      R0,#+0
        BEQ      ??procinit_init_2
        MOVS     R1,#+0
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??procinit_init_1
        LDR      R0,[R2, R0]
        BL       process_start
        ADDS     R4,R4,#+1
        B        ??procinit_init_0
??procinit_init_2:
        POP      {R4,PC}          ;; return
        Nop      
        DATA
??procinit_init_1:
        DC32     procinit

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
// 44 bytes in section .text
// 
// 44 bytes of CODE memory
//
//Errors: none
//Warnings: none

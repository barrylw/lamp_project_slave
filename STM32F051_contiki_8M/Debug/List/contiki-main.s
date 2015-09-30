///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:48:14
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\APP\contiki-main.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\contiki-main.c -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\contiki-main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN InitHardware
        EXTERN InitPhyVariable
        EXTERN etimer_process
        EXTERN hal_RF_process
        EXTERN hal_long_send
        EXTERN hal_urat_process
        EXTERN printf
        EXTERN process_init
        EXTERN process_run
        EXTERN process_start

        PUBLIC BMP1
        PUBLIC BMP2
        PUBLIC InitVariable
        PUBLIC main
        PUBLIC tedtbuf


        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute unsigned char BMP1[1024]
BMP1:
        DATA
        DC8 0, 3, 5, 9, 17, 255, 17, 137, 5, 195, 0, 224, 0, 240, 0, 248, 0, 0
        DC8 0, 0, 0, 0, 0, 68, 40, 255, 17, 170, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 131, 1, 56, 68, 130, 146, 146, 116, 1, 131, 0, 0
        DC8 0, 0, 0, 0, 0, 124, 68, 255, 1, 125, 125, 125, 1, 125, 125, 125
        DC8 125, 1, 125, 125, 125, 125, 125, 1, 255, 0, 0, 0, 0, 0, 0, 1, 0, 1
        DC8 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
        DC8 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 63, 3, 3, 243, 19, 17, 17, 17, 17
        DC8 17, 17, 1, 241, 17, 97, 129, 1, 1, 1, 129, 97, 17, 241, 1, 1, 1, 1
        DC8 65, 65, 241, 1, 1, 1, 1, 1, 193, 33, 17, 17, 17, 17, 33, 193, 1, 1
        DC8 1, 1, 65, 65, 241, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 17, 17, 17, 17, 17
        DC8 211, 51, 3, 3, 63, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 224, 0
        DC8 0, 127, 1, 1, 1, 1, 1, 1, 0, 0, 127, 0, 0, 1, 6, 24, 6, 1, 0, 0
        DC8 127, 0, 0, 0, 0, 64, 64, 127, 64, 64, 0, 0, 0, 31, 32, 64, 64, 64
        DC8 64, 32, 31, 0, 0, 0, 0, 64, 64, 127, 64, 64, 0, 0, 0, 0, 96, 0, 0
        DC8 0, 0, 64, 48, 12, 3, 0, 0, 0, 0, 224, 224, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 7, 7, 6, 6, 6, 6, 4, 4, 4, 132, 68, 68, 68, 132, 4, 4, 132
        DC8 68, 68, 68, 132, 4, 4, 4, 132, 196, 4, 4, 4, 4, 132, 68, 68, 68
        DC8 132, 4, 4, 4, 4, 4, 132, 68, 68, 68, 132, 4, 4, 4, 4, 4, 132, 68
        DC8 68, 68, 132, 4, 4, 132, 68, 68, 68, 132, 4, 4, 4, 4, 6, 6, 6, 6, 7
        DC8 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 24
        DC8 20, 18, 17, 0, 0, 15, 16, 16, 16, 15, 0, 0, 0, 16, 31, 16, 0, 0, 0
        DC8 8, 16, 18, 18, 13, 0, 0, 24, 0, 0, 13, 18, 18, 18, 13, 0, 0, 24, 0
        DC8 0, 16, 24, 20, 18, 17, 0, 0, 16, 24, 20, 18, 17, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 128, 128, 128, 128, 128, 128, 128, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 127, 3, 12, 48, 12, 3, 127, 0, 0, 56, 84, 84, 88
        DC8 0, 0, 124, 4, 4, 120, 0, 0, 60, 64, 64, 124, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 255, 170, 170, 170, 40, 8, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 127, 3, 12, 48, 12, 3, 127, 0, 0, 38, 73, 73, 73
        DC8 50, 0, 0, 127, 2, 4, 8, 16, 127, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute unsigned char BMP2[1024]
BMP2:
        DATA
        DC8 0, 3, 5, 9, 17, 255, 17, 137, 5, 195, 0, 224, 0, 240, 0, 248, 0, 0
        DC8 0, 0, 0, 0, 0, 68, 40, 255, 17, 170, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 131, 1, 56, 68, 130, 146, 146, 116, 1, 131, 0, 0
        DC8 0, 0, 0, 0, 0, 124, 68, 255, 1, 125, 125, 125, 125, 1, 125, 125
        DC8 125, 125, 1, 125, 125, 125, 125, 1, 255, 0, 0, 0, 0, 0, 0, 1, 0, 1
        DC8 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
        DC8 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 8, 8, 8, 8, 8, 8, 8, 0
        DC8 248, 24, 96, 128, 0, 0, 0, 128, 96, 24, 248, 0, 0, 0, 32, 32, 248
        DC8 0, 0, 0, 0, 0, 0, 224, 16, 8, 8, 8, 8, 16, 224, 0, 0, 0, 32, 32
        DC8 248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 8, 8, 136, 104
        DC8 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 1, 1, 1
        DC8 1, 1, 1, 0, 0, 127, 0, 0, 1, 6, 24, 6, 1, 0, 0, 127, 0, 0, 0, 64
        DC8 64, 127, 64, 64, 0, 0, 0, 0, 31, 32, 64, 64, 64, 64, 32, 31, 0, 0
        DC8 0, 64, 64, 127, 64, 64, 0, 0, 0, 0, 0, 96, 0, 0, 0, 0, 0, 0, 96, 24
        DC8 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 64, 32, 32, 32, 192, 0, 0, 224, 32, 32, 32, 224, 0, 0, 0
        DC8 64, 224, 0, 0, 0, 0, 96, 32, 32, 32, 224, 0, 0, 0, 0, 0, 224, 32
        DC8 32, 32, 224, 0, 0, 0, 0, 0, 64, 32, 32, 32, 192, 0, 0, 64, 32, 32
        DC8 32, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 10, 10, 9, 12, 0, 0, 15, 8, 8, 8, 15
        DC8 0, 0, 0, 8, 15, 8, 0, 0, 0, 12, 8, 9, 9, 14, 0, 0, 12, 0, 0, 15, 9
        DC8 9, 9, 15, 0, 0, 12, 0, 0, 12, 10, 10, 9, 12, 0, 0, 12, 10, 10, 9
        DC8 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128, 128, 128, 128, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 3, 12, 48, 12, 3
        DC8 127, 0, 0, 56, 84, 84, 88, 0, 0, 124, 4, 4, 120, 0, 0, 60, 64, 64
        DC8 124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 170, 170, 170, 40, 8, 0
        DC8 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 127, 3, 12, 48, 12
        DC8 3, 127, 0, 0, 38, 73, 73, 73, 50, 0, 0, 127, 2, 4, 8, 16, 127, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
tedtbuf:
        DS8 152

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InitVariable:
        PUSH     {R7,LR}
        BL       InitPhyVariable
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
main:
        PUSH     {R7,LR}
        MOVS     R0,#+0
??main_0:
        UXTB     R0,R0
        CMP      R0,#+150
        BGE      ??main_1
        MOVS     R1,R0
        ADDS     R1,R1,#+1
        UXTB     R0,R0
        LDR      R2,??DataTable0
        STRB     R1,[R2, R0]
        ADDS     R0,R0,#+1
        B        ??main_0
??main_1:
        BL       InitVariable
        BL       InitHardware
        LDR      R0,??DataTable0_1
        BL       printf
        BL       process_init
        MOVS     R1,#+0
        LDR      R0,??DataTable0_2
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_3
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_4
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_5
        BL       process_start
??main_2:
??main_3:
        BL       process_run
        CMP      R0,#+1
        BGE      ??main_3
        B        ??main_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     tedtbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     `?<Constant "start app\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     etimer_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     hal_urat_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     hal_RF_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     hal_long_send

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "start app\\r\\n">`:
        DATA
        DC8 "start app\015\012"

        END
// 
//   152 bytes in section .bss
// 2 048 bytes in section .data
//    12 bytes in section .rodata
//   116 bytes in section .text
// 
//   116 bytes of CODE  memory
//    12 bytes of CONST memory
// 2 200 bytes of DATA  memory
//
//Errors: none
//Warnings: 2

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:48:13
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\platform\clock.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\platform\clock.c -D
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
//    List file    =  F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\clock.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SystemCoreClock
        EXTERN __aeabi_uidiv
        EXTERN etimer_next_expiration_time
        EXTERN etimer_pending
        EXTERN etimer_request_poll
        EXTERN g_SystickCounter

        PUBLIC SysTick_Handler
        PUBLIC clock_init
        PUBLIC clock_seconds
        PUBLIC clock_time


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        PUSH     {R4-R7,LR}
        SXTB     R0,R0
        CMP      R0,#+0
        BPL      ??NVIC_SetPriority_0
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        MOVS     R5,R2
        LSRS     R5,R5,#+2
        MOVS     R2,#+4
        MULS     R5,R2,R5
        LDR      R4,??DataTable5  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        LSRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable5  ;; 0xe000ed1c
        LDR      R2,[R3, R2]
        MOVS     R3,#+255
        LSLS     R6,R0,#+30       ;; ZeroExtS R6,R0,#+30,#+30
        LSRS     R6,R6,#+30
        MOVS     R7,#+8
        MULS     R6,R7,R6
        LSLS     R3,R3,R6
        BICS     R2,R2,R3
        LSLS     R3,R1,#+6
        UXTB     R3,R3
        LSLS     R6,R0,#+30       ;; ZeroExtS R6,R0,#+30,#+30
        LSRS     R6,R6,#+30
        MOVS     R7,#+8
        MULS     R6,R7,R6
        LSLS     R3,R3,R6
        ORRS     R3,R3,R2
        STR      R3,[R4, R5]
        B        ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        SXTB     R0,R0
        MOVS     R2,R0
        LSRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable5_1  ;; 0xe000e400
        LDR      R2,[R3, R2]
        MOVS     R3,#+255
        LSLS     R4,R0,#+30       ;; ZeroExtS R4,R0,#+30,#+30
        LSRS     R4,R4,#+30
        MOVS     R5,#+8
        MULS     R4,R5,R4
        LSLS     R3,R3,R4
        BICS     R2,R2,R3
        LSLS     R3,R1,#+6
        UXTB     R3,R3
        LSLS     R4,R0,#+30       ;; ZeroExtS R4,R0,#+30,#+30
        LSRS     R4,R4,#+30
        MOVS     R5,#+8
        MULS     R4,R5,R4
        LSLS     R3,R3,R4
        ORRS     R3,R3,R2
        SXTB     R0,R0
        MOVS     R2,R0
        LSRS     R2,R2,#+2
        MOVS     R4,#+4
        MULS     R2,R4,R2
        LDR      R4,??DataTable5_1  ;; 0xe000e400
        STR      R3,[R4, R2]
??NVIC_SetPriority_1:
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t SysTick_Config(uint32_t)
SysTick_Config:
        PUSH     {R4,LR}
        MOVS     R4,R0
        SUBS     R0,R4,#+1
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        CMP      R0,R1
        BCC      ??SysTick_Config_0
        MOVS     R0,#+1
        B        ??SysTick_Config_1
??SysTick_Config_0:
        SUBS     R0,R4,#+1
        LDR      R1,??DataTable5_2  ;; 0xe000e014
        STR      R0,[R1, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        BL       NVIC_SetPriority
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3  ;; 0xe000e018
        STR      R0,[R1, #+0]
        MOVS     R0,#+7
        LDR      R1,??DataTable5_4  ;; 0xe000e010
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
??SysTick_Config_1:
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
current_clock:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
current_seconds:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
second_countdown:
        DATA
        DC32 1000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_Handler:
        PUSH     {R4,LR}
        LDR      R0,??DataTable5_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_5
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_6
        STR      R0,[R1, #+0]
        BL       etimer_pending
        CMP      R0,#+0
        BEQ      ??SysTick_Handler_0
        LDR      R0,??DataTable5_6
        LDR      R4,[R0, #+0]
        BL       etimer_next_expiration_time
        CMP      R4,R0
        BCC      ??SysTick_Handler_0
        BL       etimer_request_poll
??SysTick_Handler_0:
        LDR      R0,??DataTable5_7
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
        CMP      R0,#+0
        BNE      ??SysTick_Handler_1
        LDR      R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable5_8
        STR      R0,[R1, #+0]
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
        LDR      R1,??DataTable5_7
        STR      R0,[R1, #+0]
??SysTick_Handler_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_init:
        PUSH     {R7,LR}
        LDR      R0,??DataTable5_9
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        BL       __aeabi_uidiv
        BL       SysTick_Config
        CMP      R0,#+0
        BEQ      ??clock_init_0
??clock_init_1:
        B        ??clock_init_1
??clock_init_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_time:
        LDR      R0,??DataTable5_6
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_seconds:
        LDR      R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xe000ed1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     g_SystickCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     current_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     second_countdown

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     current_seconds

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     SystemCoreClock

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
//   8 bytes in section .bss
//   4 bytes in section .data
// 346 bytes in section .text
// 
// 346 bytes of CODE memory
//  12 bytes of DATA memory
//
//Errors: none
//Warnings: none

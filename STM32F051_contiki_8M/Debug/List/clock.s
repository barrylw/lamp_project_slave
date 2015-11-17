///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:18
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\platform\clock.c
//    Command line =  
//        E:\svnProject\street_lamp_new\platform\clock.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -D USE_LORA_MODE -lb
//        E:\svnProject\street_lamp_new\Debug\List\ --diag_suppress Pa050 -o
//        E:\svnProject\street_lamp_new\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
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
//        E:\svnProject\street_lamp_new\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\clock.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SystemCoreClock
        EXTERN __aeabi_uidiv
        EXTERN etimer_next_expiration_time
        EXTERN etimer_pending
        EXTERN etimer_request_poll
        EXTERN g_SystickCounter
        EXTERN read_LED_state

        PUBLIC SysTick_Handler
        PUBLIC clock_init
        PUBLIC clock_seconds
        PUBLIC clock_time
        PUBLIC read_light_time


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
        LDR      R4,??DataTable6  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        LSRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable6  ;; 0xe000ed1c
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
        LDR      R3,??DataTable6_1  ;; 0xe000e400
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
        LDR      R4,??DataTable6_1  ;; 0xe000e400
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
        LDR      R1,??DataTable6_2  ;; 0xe000e014
        STR      R0,[R1, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        BL       NVIC_SetPriority
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3  ;; 0xe000e018
        STR      R0,[R1, #+0]
        MOVS     R0,#+7
        LDR      R1,??DataTable6_4  ;; 0xe000e010
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

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
light_time:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_Handler:
        PUSH     {R4,LR}
        LDR      R0,??DataTable6_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable6_5
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable6_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable6_6
        STR      R0,[R1, #+0]
        BL       read_LED_state
        CMP      R0,#+0
        BEQ      ??SysTick_Handler_0
        LDR      R0,??DataTable6_7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable6_7
        STR      R0,[R1, #+0]
??SysTick_Handler_0:
        BL       etimer_pending
        CMP      R0,#+0
        BEQ      ??SysTick_Handler_1
        LDR      R0,??DataTable6_6
        LDR      R4,[R0, #+0]
        BL       etimer_next_expiration_time
        CMP      R4,R0
        BCC      ??SysTick_Handler_1
        BL       etimer_request_poll
??SysTick_Handler_1:
        LDR      R0,??DataTable6_8
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable6_8
        STR      R0,[R1, #+0]
        CMP      R0,#+0
        BNE      ??SysTick_Handler_2
        LDR      R0,??DataTable6_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable6_9
        STR      R0,[R1, #+0]
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
        LDR      R1,??DataTable6_8
        STR      R0,[R1, #+0]
??SysTick_Handler_2:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_init:
        PUSH     {R7,LR}
        LDR      R0,??DataTable6_10
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
        LDR      R0,??DataTable6_6
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_light_time:
        LDR      R0,??DataTable6_7
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_seconds:
        LDR      R0,??DataTable6_9
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0xe000ed1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     g_SystickCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     current_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     light_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     second_countdown

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     current_seconds

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
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
//  12 bytes in section .bss
//   4 bytes in section .data
// 374 bytes in section .text
// 
// 374 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: none

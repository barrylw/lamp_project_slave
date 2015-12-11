///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:20
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\hal_timer.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\hal_timer.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -lb
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
//        E:\svnProject\street_lamp_new\coffee_arch\ -Ol -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\hal_timer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Getu8Parameter
        EXTERN PWR_BackupAccessCmd
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_RTCCLKCmd
        EXTERN RCC_RTCCLKConfig
        EXTERN RTC_DateStructInit
        EXTERN RTC_GetDate
        EXTERN RTC_GetTime
        EXTERN RTC_Init
        EXTERN RTC_ReadBackupRegister
        EXTERN RTC_SetDate
        EXTERN RTC_SetTime
        EXTERN RTC_TimeStructInit
        EXTERN RTC_WaitForSynchro
        EXTERN RTC_WriteBackupRegister
        EXTERN SystemCoreClock
        EXTERN __aeabi_uidiv
        EXTERN printf

        PUBLIC GetTime
        PUBLIC SetTime
        PUBLIC g_SystickCounter
        PUBLIC hal_GetCurrentTime
        PUBLIC hal_GetCurrentTimeString
        PUBLIC hal_InitRTC
        PUBLIC hal_InitSystickTimer
        PUBLIC hal_InitTIMER
        PUBLIC hal_InitTimerVariable
        PUBLIC hal_SetCurrentTime


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
        LSRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable6  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R4,R0,#+28       ;; ZeroExtS R4,R0,#+28,#+28
        LSRS     R4,R4,#+28
        SUBS     R4,R4,#+8
        LSRS     R4,R4,#+2
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R5,??DataTable6  ;; 0xe000ed1c
        LDR      R4,[R5, R4]
        MOVS     R5,#+255
        LSLS     R6,R0,#+30       ;; ZeroExtS R6,R0,#+30,#+30
        LSRS     R6,R6,#+30
        MOVS     R7,#+8
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        MOVS     R5,#+8
        MULS     R0,R5,R0
        LSLS     R1,R1,R0
        ORRS     R1,R1,R4
        STR      R1,[R3, R2]
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
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LSLS     R3,R0,#+30       ;; ZeroExtS R3,R0,#+30,#+30
        LSRS     R3,R3,#+30
        MOVS     R4,#+8
        MULS     R3,R4,R3
        LSLS     R1,R1,R3
        ORRS     R1,R1,R2
        SXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R2,??DataTable6_1  ;; 0xe000e400
        STR      R1,[R2, R0]
??NVIC_SetPriority_1:
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t SysTick_Config(uint32_t)
SysTick_Config:
        PUSH     {R7,LR}
        SUBS     R1,R0,#+1
        MOVS     R2,#+128
        LSLS     R2,R2,#+17       ;; #+16777216
        CMP      R1,R2
        BCC      ??SysTick_Config_0
        MOVS     R0,#+1
        B        ??SysTick_Config_1
??SysTick_Config_0:
        SUBS     R0,R0,#+1
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
        POP      {R1,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_SystickCounter:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitTimerVariable:
        MOVS     R0,#+0
        LDR      R1,??DataTable6_5
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitTIMER:
        PUSH     {R7,LR}
        BL       hal_InitSystickTimer
        BL       hal_InitRTC
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitSystickTimer:
        PUSH     {R7,LR}
        LDR      R0,??DataTable6_6
        LDR      R0,[R0, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        BL       __aeabi_uidiv
        BL       SysTick_Config
        CMP      R0,#+0
        BEQ      ??hal_InitSystickTimer_0
??hal_InitSystickTimer_1:
        B        ??hal_InitSystickTimer_1
??hal_InitSystickTimer_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitRTC:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+21       ;; #+268435456
        BL       RCC_APB1PeriphClockCmd
        MOVS     R0,#+1
        BL       PWR_BackupAccessCmd
        MOVS     R0,#+192
        LSLS     R0,R0,#+2        ;; #+768
        BL       RCC_RTCCLKConfig
        MOVS     R0,#+0
        BL       RTC_ReadBackupRegister
        LDR      R1,??DataTable6_7  ;; 0xa5a5
        CMP      R0,R1
        BEQ      ??hal_InitRTC_0
        MOVS     R0,#+1
        BL       RCC_RTCCLKCmd
        BL       RTC_WaitForSynchro
        MOVS     R0,#+124
        STR      R0,[SP, #+12]
        LDR      R0,??DataTable6_8  ;; 0xf9f
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+8
        BL       RTC_Init
        CMP      R0,#+0
        BNE      ??hal_InitRTC_1
        LDR      R0,??DataTable6_9
        BL       printf
        B        ??hal_InitRTC_2
??hal_InitRTC_1:
        LDR      R0,??DataTable6_10
        BL       printf
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+10
        BL       hal_SetCurrentTime
        B        ??hal_InitRTC_2
??hal_InitRTC_0:
        BL       RTC_WaitForSynchro
        BL       hal_GetCurrentTime
??hal_InitRTC_2:
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_SetCurrentTime:
        PUSH     {R2-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R7,R0
        MOVS     R6,R1
        ADD      R0,SP,#+16
        BL       RTC_DateStructInit
        ADD      R0,SP,#+12
        BL       RTC_TimeStructInit
        UXTB     R7,R7
        CMP      R7,#+100
        BGE      ??hal_SetCurrentTime_0
        UXTB     R6,R6
        CMP      R6,#+0
        BEQ      ??hal_SetCurrentTime_0
        UXTB     R6,R6
        CMP      R6,#+13
        BGE      ??hal_SetCurrentTime_0
        MOV      R0,SP
        LDRB     R0,[R0, #+20]
        CMP      R0,#+0
        BEQ      ??hal_SetCurrentTime_0
        MOV      R0,SP
        LDRB     R0,[R0, #+20]
        CMP      R0,#+32
        BGE      ??hal_SetCurrentTime_0
        ADD      R0,SP,#+16
        STRB     R7,[R0, #+3]
        ADD      R0,SP,#+16
        STRB     R6,[R0, #+1]
        MOV      R0,SP
        LDRB     R0,[R0, #+20]
        ADD      R1,SP,#+16
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        LDRB     R0,[R0, #+24]
        CMP      R0,#+24
        BGE      ??hal_SetCurrentTime_1
        LDR      R4,[SP, #+48]
        UXTB     R4,R4
        CMP      R4,#+60
        BGE      ??hal_SetCurrentTime_1
        LDR      R5,[SP, #+52]
        UXTB     R5,R5
        CMP      R5,#+60
        BGE      ??hal_SetCurrentTime_1
        MOV      R0,SP
        LDRB     R0,[R0, #+24]
        MOV      R1,SP
        STRB     R0,[R1, #+12]
        ADD      R0,SP,#+12
        STRB     R4,[R0, #+1]
        ADD      R0,SP,#+12
        STRB     R5,[R0, #+2]
        ADD      R1,SP,#+12
        MOVS     R0,#+0
        BL       RTC_SetTime
        CMP      R0,#+0
        BNE      ??hal_SetCurrentTime_2
        LDR      R0,??DataTable6_11
        BL       printf
        B        ??hal_SetCurrentTime_3
??hal_SetCurrentTime_0:
        LDR      R0,??DataTable6_12
        BL       printf
        B        ??hal_SetCurrentTime_4
??hal_SetCurrentTime_1:
        LDR      R0,??DataTable6_13
        BL       printf
        B        ??hal_SetCurrentTime_4
??hal_SetCurrentTime_2:
        LDR      R0,??DataTable6_14  ;; 0x40002804
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        ADD      R1,SP,#+16
        MOVS     R0,#+0
        BL       RTC_SetDate
        CMP      R0,#+0
        BNE      ??hal_SetCurrentTime_5
        LDR      R0,??DataTable6_15
        BL       printf
        B        ??hal_SetCurrentTime_3
??hal_SetCurrentTime_5:
        UXTB     R5,R5
        STR      R5,[SP, #+8]
        UXTB     R4,R4
        STR      R4,[SP, #+4]
        MOV      R0,SP
        LDRB     R0,[R0, #+24]
        STR      R0,[SP, #+0]
        MOV      R0,SP
        LDRB     R3,[R0, #+20]
        UXTB     R6,R6
        MOVS     R2,R6
        UXTB     R7,R7
        MOVS     R1,R7
        LDR      R0,??DataTable6_16
        BL       printf
        LDR      R1,??DataTable6_7  ;; 0xa5a5
        MOVS     R0,#+0
        BL       RTC_WriteBackupRegister
??hal_SetCurrentTime_3:
??hal_SetCurrentTime_4:
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_GetCurrentTime:
        PUSH     {LR}
        SUB      SP,SP,#+20
        ADD      R1,SP,#+16
        MOVS     R0,#+0
        BL       RTC_GetDate
        ADD      R1,SP,#+12
        MOVS     R0,#+0
        BL       RTC_GetTime
        ADD      R0,SP,#+12
        LDRB     R0,[R0, #+2]
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+12
        LDRB     R0,[R0, #+1]
        STR      R0,[SP, #+4]
        MOV      R0,SP
        LDRB     R0,[R0, #+12]
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+16
        LDRB     R3,[R0, #+2]
        ADD      R0,SP,#+16
        LDRB     R2,[R0, #+1]
        ADD      R0,SP,#+16
        LDRB     R1,[R0, #+3]
        LDR      R0,??DataTable6_17
        BL       printf
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

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
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0xa5a5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0xf9f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     `?<Constant "RTC init failed\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     `?<Constant "\\r\\nCurrent time is Inv...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     `?<Constant "RTC set time failed\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     `?<Constant "Date Format Error\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     `?<Constant "Time Format Error\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     0x40002804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     `?<Constant "RTC set date failed\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     `?<Constant "Set current time=%02d...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     `?<Constant "Current time=%02d-%02...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_GetCurrentTimeString:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SetTime:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R0,#+10
        MOV      R1,SP
        STRB     R0,[R1, #+13]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+12]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+11]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+10]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+9]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+8]
        MOVS     R1,#+1
        ADD      R0,SP,#+12
        ADDS     R0,R0,#+1
        BL       Getu8Parameter
        MOVS     R1,#+2
        ADD      R0,SP,#+12
        BL       Getu8Parameter
        MOVS     R1,#+3
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+3
        BL       Getu8Parameter
        MOVS     R1,#+4
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+2
        BL       Getu8Parameter
        MOVS     R1,#+5
        ADD      R0,SP,#+8
        ADDS     R0,R0,#+1
        BL       Getu8Parameter
        MOVS     R1,#+6
        ADD      R0,SP,#+8
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        STR      R0,[SP, #+4]
        MOV      R0,SP
        LDRB     R0,[R0, #+9]
        STR      R0,[SP, #+0]
        MOV      R0,SP
        LDRB     R3,[R0, #+10]
        MOV      R0,SP
        LDRB     R2,[R0, #+11]
        MOV      R0,SP
        LDRB     R1,[R0, #+12]
        MOV      R0,SP
        LDRB     R0,[R0, #+13]
        BL       hal_SetCurrentTime
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GetTime:
        PUSH     {R7,LR}
        BL       hal_GetCurrentTime
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "RTC init failed\\r\\n">`:
        DATA
        DC8 "RTC init failed\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\r\\nCurrent time is Inv...">`:
        DATA
        DC8 "\015\012Current time is Invalid\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Date Format Error\\r\\n">`:
        DATA
        DC8 "Date Format Error\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Time Format Error\\r\\n">`:
        DATA
        DC8 "Time Format Error\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "RTC set time failed\\r\\n">`:
        DATA
        DC8 "RTC set time failed\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "RTC set date failed\\r\\n">`:
        DATA
        DC8 "RTC set date failed\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Set current time=%02d...">`:
        DATA
        DC8 "Set current time=%02d-%02d-%02d %02d:%02d:%02d\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Current time=%02d-%02...">`:
        DATA
        DC8 "Current time=%02d-%02d-%02d %02d:%02d:%02d\015\012"
        DC8 0, 0, 0

        END
// 
//   4 bytes in section .bss
// 236 bytes in section .rodata
// 838 bytes in section .text
// 
// 838 bytes of CODE  memory
// 236 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: none

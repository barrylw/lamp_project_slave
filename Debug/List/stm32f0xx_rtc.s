///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:22
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_rtc.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_rtc.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
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
//    List file    =  G:\gitclone\lamp_project_slave\Debug\List\stm32f0xx_rtc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC RTC_AlarmCmd
        PUBLIC RTC_AlarmStructInit
        PUBLIC RTC_AlarmSubSecondConfig
        PUBLIC RTC_BypassShadowCmd
        PUBLIC RTC_CalibOutputCmd
        PUBLIC RTC_CalibOutputConfig
        PUBLIC RTC_ClearFlag
        PUBLIC RTC_ClearITPendingBit
        PUBLIC RTC_DateStructInit
        PUBLIC RTC_DayLightSavingConfig
        PUBLIC RTC_DeInit
        PUBLIC RTC_EnterInitMode
        PUBLIC RTC_ExitInitMode
        PUBLIC RTC_GetAlarm
        PUBLIC RTC_GetAlarmSubSecond
        PUBLIC RTC_GetDate
        PUBLIC RTC_GetFlagStatus
        PUBLIC RTC_GetITStatus
        PUBLIC RTC_GetStoreOperation
        PUBLIC RTC_GetSubSecond
        PUBLIC RTC_GetTime
        PUBLIC RTC_GetTimeStamp
        PUBLIC RTC_GetTimeStampSubSecond
        PUBLIC RTC_ITConfig
        PUBLIC RTC_Init
        PUBLIC RTC_OutputConfig
        PUBLIC RTC_OutputTypeConfig
        PUBLIC RTC_ReadBackupRegister
        PUBLIC RTC_RefClockCmd
        PUBLIC RTC_SetAlarm
        PUBLIC RTC_SetDate
        PUBLIC RTC_SetTime
        PUBLIC RTC_SmoothCalibConfig
        PUBLIC RTC_StructInit
        PUBLIC RTC_SynchroShiftConfig
        PUBLIC RTC_TamperCmd
        PUBLIC RTC_TamperFilterConfig
        PUBLIC RTC_TamperPinsPrechargeDuration
        PUBLIC RTC_TamperPullUpCmd
        PUBLIC RTC_TamperSamplingFreqConfig
        PUBLIC RTC_TamperTriggerConfig
        PUBLIC RTC_TimeStampCmd
        PUBLIC RTC_TimeStampOnTamperDetectionCmd
        PUBLIC RTC_TimeStructInit
        PUBLIC RTC_WaitForSynchro
        PUBLIC RTC_WriteBackupRegister
        PUBLIC RTC_WriteProtectionCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_DeInit:
        PUSH     {R3-R5,LR}
        MOVS     R4,#+0
        MOVS     R0,#+202
        LDR      R1,??DataTable7  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,#+83
        LDR      R1,??DataTable7  ;; 0x40002824
        STR      R0,[R1, #+0]
        BL       RTC_EnterInitMode
        CMP      R0,#+0
        BNE      ??RTC_DeInit_0
        MOVS     R0,#+0
        MOVS     R4,R0
        B        ??RTC_DeInit_1
??RTC_DeInit_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable7_1  ;; 0x40002800
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable7_2  ;; 0x2101
        LDR      R1,??DataTable7_3  ;; 0x40002804
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable7_4  ;; 0x40002808
        LDR      R5,[R0, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_4  ;; 0x40002808
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable7_5  ;; 0x7f00ff
        LDR      R1,??DataTable7_6  ;; 0x40002810
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_7  ;; 0x4000281c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_8  ;; 0x4000282c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_9  ;; 0x4000283c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_10  ;; 0x40002844
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable8  ;; 0x4000280c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_11  ;; 0x40002840
        STR      R0,[R1, #+0]
        BL       RTC_WaitForSynchro
        CMP      R0,#+0
        BNE      ??RTC_DeInit_2
        MOVS     R0,#+0
        MOVS     R4,R0
        B        ??RTC_DeInit_1
??RTC_DeInit_2:
        MOVS     R0,#+1
        MOVS     R4,R0
??RTC_DeInit_1:
        MOVS     R0,#+255
        LDR      R1,??DataTable7  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_Init:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,#+202
        LDR      R1,??DataTable7  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,#+83
        LDR      R1,??DataTable7  ;; 0x40002824
        STR      R0,[R1, #+0]
        BL       RTC_EnterInitMode
        CMP      R0,#+0
        BNE      ??RTC_Init_0
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??RTC_Init_1
??RTC_Init_0:
        LDR      R0,??DataTable7_4  ;; 0x40002808
        LDR      R0,[R0, #+0]
        MOVS     R1,#+64
        BICS     R0,R0,R1
        LDR      R1,??DataTable7_4  ;; 0x40002808
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable7_4  ;; 0x40002808
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+0]
        ORRS     R1,R1,R0
        LDR      R0,??DataTable7_4  ;; 0x40002808
        STR      R1,[R0, #+0]
        LDR      R0,[R4, #+8]
        LDR      R1,??DataTable7_6  ;; 0x40002810
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable7_6  ;; 0x40002810
        LDR      R0,[R0, #+0]
        LDR      R1,[R4, #+4]
        LSLS     R1,R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable7_6  ;; 0x40002810
        STR      R1,[R0, #+0]
        BL       RTC_ExitInitMode
        MOVS     R0,#+1
        MOVS     R5,R0
??RTC_Init_1:
        MOVS     R0,#+255
        LDR      R1,??DataTable7  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+127
        STR      R1,[R0, #+4]
        MOVS     R1,#+255
        STR      R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_WriteProtectionCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RTC_WriteProtectionCmd_0
        MOVS     R1,#+255
        LDR      R2,??DataTable7  ;; 0x40002824
        STR      R1,[R2, #+0]
        B        ??RTC_WriteProtectionCmd_1
??RTC_WriteProtectionCmd_0:
        MOVS     R1,#+202
        LDR      R2,??DataTable7  ;; 0x40002824
        STR      R1,[R2, #+0]
        MOVS     R1,#+83
        LDR      R2,??DataTable7  ;; 0x40002824
        STR      R1,[R2, #+0]
??RTC_WriteProtectionCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_EnterInitMode:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        MOVS     R1,#+0
        LDR      R2,??DataTable8  ;; 0x4000280c
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+25
        BMI      ??RTC_EnterInitMode_0
        MOVS     R2,#+0
        MVNS     R2,R2            ;; #-1
        LDR      R3,??DataTable8  ;; 0x4000280c
        STR      R2,[R3, #+0]
??RTC_EnterInitMode_1:
        LDR      R2,??DataTable8  ;; 0x4000280c
        LDR      R2,[R2, #+0]
        MOVS     R3,#+64
        ANDS     R2,R2,R3
        MOVS     R1,R2
        LDR      R2,[SP, #+0]
        ADDS     R2,R2,#+1
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+7        ;; #+16384
        CMP      R2,R3
        BEQ      ??RTC_EnterInitMode_2
        CMP      R1,#+0
        BEQ      ??RTC_EnterInitMode_1
??RTC_EnterInitMode_2:
        LDR      R2,??DataTable8  ;; 0x4000280c
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+25
        BPL      ??RTC_EnterInitMode_3
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??RTC_EnterInitMode_4
??RTC_EnterInitMode_3:
        MOVS     R2,#+0
        MOVS     R0,R2
        B        ??RTC_EnterInitMode_4
??RTC_EnterInitMode_0:
        MOVS     R2,#+1
        MOVS     R0,R2
??RTC_EnterInitMode_4:
        UXTB     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ExitInitMode:
        LDR      R0,??DataTable10  ;; 0x4000280c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        BICS     R0,R0,R1
        LDR      R1,??DataTable10  ;; 0x4000280c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_WaitForSynchro:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        MOVS     R1,#+0
        LDR      R2,??DataTable7_4  ;; 0x40002808
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+26
        BPL      ??RTC_WaitForSynchro_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??RTC_WaitForSynchro_1
??RTC_WaitForSynchro_0:
        MOVS     R2,#+202
        LDR      R3,??DataTable7  ;; 0x40002824
        STR      R2,[R3, #+0]
        MOVS     R2,#+83
        LDR      R3,??DataTable7  ;; 0x40002824
        STR      R2,[R3, #+0]
        LDR      R2,??DataTable8  ;; 0x4000280c
        LDR      R2,[R2, #+0]
        MOVS     R3,#+160
        BICS     R2,R2,R3
        LDR      R3,??DataTable8  ;; 0x4000280c
        STR      R2,[R3, #+0]
??RTC_WaitForSynchro_2:
        LDR      R2,??DataTable8  ;; 0x4000280c
        LDR      R2,[R2, #+0]
        MOVS     R3,#+32
        ANDS     R2,R2,R3
        MOVS     R1,R2
        LDR      R2,[SP, #+0]
        ADDS     R2,R2,#+1
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+8        ;; #+32768
        CMP      R2,R3
        BEQ      ??RTC_WaitForSynchro_3
        CMP      R1,#+0
        BEQ      ??RTC_WaitForSynchro_2
??RTC_WaitForSynchro_3:
        LDR      R2,??DataTable8  ;; 0x4000280c
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+26
        BPL      ??RTC_WaitForSynchro_4
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??RTC_WaitForSynchro_5
??RTC_WaitForSynchro_4:
        MOVS     R2,#+0
        MOVS     R0,R2
??RTC_WaitForSynchro_5:
        MOVS     R2,#+255
        LDR      R3,??DataTable7  ;; 0x40002824
        STR      R2,[R3, #+0]
??RTC_WaitForSynchro_1:
        UXTB     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_RefClockCmd:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,#+202
        LDR      R1,??DataTable8_1  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,#+83
        LDR      R1,??DataTable8_1  ;; 0x40002824
        STR      R0,[R1, #+0]
        BL       RTC_EnterInitMode
        CMP      R0,#+0
        BNE      ??RTC_RefClockCmd_0
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??RTC_RefClockCmd_1
??RTC_RefClockCmd_0:
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??RTC_RefClockCmd_2
        LDR      R0,??DataTable8_2  ;; 0x40002808
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8_2  ;; 0x40002808
        STR      R1,[R0, #+0]
        B        ??RTC_RefClockCmd_3
??RTC_RefClockCmd_2:
        LDR      R0,??DataTable8_2  ;; 0x40002808
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable8_2  ;; 0x40002808
        STR      R0,[R1, #+0]
??RTC_RefClockCmd_3:
        BL       RTC_ExitInitMode
        MOVS     R0,#+1
        MOVS     R5,R0
??RTC_RefClockCmd_1:
        MOVS     R0,#+255
        LDR      R1,??DataTable8_1  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_BypassShadowCmd:
        PUSH     {LR}
        MOVS     R1,#+202
        LDR      R2,??DataTable8_1  ;; 0x40002824
        STR      R1,[R2, #+0]
        MOVS     R1,#+83
        LDR      R2,??DataTable8_1  ;; 0x40002824
        STR      R1,[R2, #+0]
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RTC_BypassShadowCmd_0
        LDR      R1,??DataTable8_2  ;; 0x40002808
        LDR      R1,[R1, #+0]
        MOVS     R2,#+32
        ORRS     R2,R2,R1
        LDR      R1,??DataTable8_2  ;; 0x40002808
        STR      R2,[R1, #+0]
        B        ??RTC_BypassShadowCmd_1
??RTC_BypassShadowCmd_0:
        LDR      R1,??DataTable8_2  ;; 0x40002808
        LDR      R1,[R1, #+0]
        MOVS     R2,#+223
        ANDS     R2,R2,R1
        LDR      R1,??DataTable8_2  ;; 0x40002808
        STR      R2,[R1, #+0]
??RTC_BypassShadowCmd_1:
        MOVS     R1,#+255
        LDR      R2,??DataTable8_1  ;; 0x40002824
        STR      R1,[R2, #+0]
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x40002824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x40002800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x2101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x40002804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x40002808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x7f00ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x40002810

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     0x4000281c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0x4000282c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     0x4000283c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x40002844

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     0x40002840

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SetTime:
        PUSH     {R0,R4-R7,LR}
        MOVS     R4,R1
        MOVS     R7,#+0
        MOVS     R5,#+0
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BNE      ??RTC_SetTime_0
        LDR      R0,??DataTable8_2  ;; 0x40002808
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BMI      ??RTC_SetTime_1
??RTC_SetTime_2:
        MOVS     R0,#+0
        STRB     R0,[R4, #+3]
??RTC_SetTime_1:
        B        ??RTC_SetTime_3
??RTC_SetTime_0:
        LDR      R0,??DataTable8_2  ;; 0x40002808
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL      ??RTC_SetTime_4
        LDRB     R0,[R4, #+0]
        BL       RTC_Bcd2ToByte
        MOVS     R7,R0
        B        ??RTC_SetTime_5
??RTC_SetTime_4:
        MOVS     R0,#+0
        STRB     R0,[R4, #+3]
??RTC_SetTime_5:
??RTC_SetTime_3:
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ      ??RTC_SetTime_6
        LDRB     R0,[R4, #+0]
        LSLS     R0,R0,#+16
        LDRB     R1,[R4, #+1]
        LSLS     R1,R1,#+8
        ORRS     R1,R1,R0
        LDRB     R0,[R4, #+2]
        ORRS     R0,R0,R1
        LDRB     R1,[R4, #+3]
        LSLS     R1,R1,#+16
        ORRS     R1,R1,R0
        MOVS     R7,R1
        B        ??RTC_SetTime_7
??RTC_SetTime_6:
        LDRB     R0,[R4, #+0]
        BL       RTC_ByteToBcd2
        MOVS     R6,R0
        LDRB     R0,[R4, #+1]
        BL       RTC_ByteToBcd2
        UXTB     R6,R6
        LSLS     R1,R6,#+16
        UXTB     R0,R0
        LSLS     R6,R0,#+8
        ORRS     R6,R6,R1
        LDRB     R0,[R4, #+2]
        BL       RTC_ByteToBcd2
        ORRS     R0,R0,R6
        LDRB     R1,[R4, #+3]
        LSLS     R1,R1,#+16
        ORRS     R1,R1,R0
        MOVS     R7,R1
??RTC_SetTime_7:
        MOVS     R0,#+202
        LDR      R1,??DataTable8_1  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,#+83
        LDR      R1,??DataTable8_1  ;; 0x40002824
        STR      R0,[R1, #+0]
        BL       RTC_EnterInitMode
        CMP      R0,#+0
        BNE      ??RTC_SetTime_8
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??RTC_SetTime_9
??RTC_SetTime_8:
        LDR      R0,??DataTable13  ;; 0x7f7f7f
        ANDS     R0,R0,R7
        LDR      R1,??DataTable13_1  ;; 0x40002800
        STR      R0,[R1, #+0]
        BL       RTC_ExitInitMode
        LDR      R0,??DataTable8_2  ;; 0x40002808
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BMI      ??RTC_SetTime_10
        BL       RTC_WaitForSynchro
        CMP      R0,#+0
        BNE      ??RTC_SetTime_11
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??RTC_SetTime_9
??RTC_SetTime_11:
        MOVS     R0,#+1
        MOVS     R5,R0
        B        ??RTC_SetTime_9
??RTC_SetTime_10:
        MOVS     R0,#+1
        MOVS     R5,R0
??RTC_SetTime_9:
        MOVS     R0,#+255
        LDR      R1,??DataTable8_1  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x4000280c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x40002824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x40002808

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TimeStructInit:
        MOVS     R1,#+0
        STRB     R1,[R0, #+3]
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
        MOVS     R1,#+0
        STRB     R1,[R0, #+2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetTime:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+0
        LDR      R0,??DataTable13_1  ;; 0x40002800
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable13  ;; 0x7f7f7f
        ANDS     R1,R1,R0
        MOVS     R6,R1
        MOVS     R0,R6
        LSRS     R0,R0,#+16
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        STRB     R0,[R4, #+0]
        MOVS     R0,R6
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        STRB     R0,[R4, #+1]
        MOVS     R0,R6
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        STRB     R0,[R4, #+2]
        MOVS     R0,R6
        LSRS     R0,R0,#+16
        MOVS     R1,#+64
        ANDS     R0,R0,R1
        STRB     R0,[R4, #+3]
        CMP      R5,#+0
        BNE      ??RTC_GetTime_0
        LDRB     R0,[R4, #+0]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+0]
        LDRB     R0,[R4, #+1]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+1]
        LDRB     R0,[R4, #+2]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+2]
??RTC_GetTime_0:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetSubSecond:
        MOVS     R0,#+0
        LDR      R1,??DataTable14  ;; 0x40002828
        LDR      R1,[R1, #+0]
        MOVS     R0,R1
        LDR      R1,??DataTable15  ;; 0x40002804
        LDR      R1,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x4000280c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SetDate:
        PUSH     {R0,R4-R7,LR}
        MOVS     R4,R1
        MOVS     R7,#+0
        MOVS     R5,#+0
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BNE      ??RTC_SetDate_0
        LDRB     R0,[R4, #+1]
        LSLS     R0,R0,#+27
        BPL      ??RTC_SetDate_0
        LDRB     R0,[R4, #+1]
        MOVS     R1,#+239
        ANDS     R1,R1,R0
        ADDS     R1,R1,#+10
        STRB     R1,[R4, #+1]
??RTC_SetDate_0:
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ      ??RTC_SetDate_1
??RTC_SetDate_2:
        LDRB     R0,[R4, #+1]
        BL       RTC_Bcd2ToByte
        MOVS     R7,R0
        LDRB     R0,[R4, #+2]
        BL       RTC_Bcd2ToByte
        MOVS     R7,R0
??RTC_SetDate_1:
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ      ??RTC_SetDate_3
        LDRB     R0,[R4, #+3]
        LSLS     R0,R0,#+16
        LDRB     R1,[R4, #+1]
        LSLS     R1,R1,#+8
        ORRS     R1,R1,R0
        LDRB     R0,[R4, #+2]
        ORRS     R0,R0,R1
        LDRB     R1,[R4, #+0]
        LSLS     R1,R1,#+13
        ORRS     R1,R1,R0
        MOVS     R7,R1
        B        ??RTC_SetDate_4
??RTC_SetDate_3:
        LDRB     R0,[R4, #+3]
        BL       RTC_ByteToBcd2
        MOVS     R6,R0
        LDRB     R0,[R4, #+1]
        BL       RTC_ByteToBcd2
        UXTB     R6,R6
        LSLS     R1,R6,#+16
        UXTB     R0,R0
        LSLS     R6,R0,#+8
        ORRS     R6,R6,R1
        LDRB     R0,[R4, #+2]
        BL       RTC_ByteToBcd2
        ORRS     R0,R0,R6
        LDRB     R1,[R4, #+0]
        LSLS     R1,R1,#+13
        ORRS     R1,R1,R0
        MOVS     R7,R1
??RTC_SetDate_4:
        MOVS     R0,#+202
        LDR      R1,??DataTable19  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,#+83
        LDR      R1,??DataTable19  ;; 0x40002824
        STR      R0,[R1, #+0]
        BL       RTC_EnterInitMode
        CMP      R0,#+0
        BNE      ??RTC_SetDate_5
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??RTC_SetDate_6
??RTC_SetDate_5:
        LDR      R0,??DataTable17  ;; 0xffff3f
        ANDS     R0,R0,R7
        LDR      R1,??DataTable15  ;; 0x40002804
        STR      R0,[R1, #+0]
        BL       RTC_ExitInitMode
        LDR      R0,??DataTable19_1  ;; 0x40002808
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BMI      ??RTC_SetDate_7
        BL       RTC_WaitForSynchro
        CMP      R0,#+0
        BNE      ??RTC_SetDate_8
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??RTC_SetDate_6
??RTC_SetDate_8:
        MOVS     R0,#+1
        MOVS     R5,R0
        B        ??RTC_SetDate_6
??RTC_SetDate_7:
        MOVS     R0,#+1
        MOVS     R5,R0
??RTC_SetDate_6:
        MOVS     R0,#+255
        LDR      R1,??DataTable19  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_DateStructInit:
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        MOVS     R1,#+1
        STRB     R1,[R0, #+2]
        MOVS     R1,#+1
        STRB     R1,[R0, #+1]
        MOVS     R1,#+0
        STRB     R1,[R0, #+3]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetDate:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+0
        LDR      R0,??DataTable15  ;; 0x40002804
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable17  ;; 0xffff3f
        ANDS     R1,R1,R0
        MOVS     R6,R1
        MOVS     R0,R6
        LSRS     R0,R0,#+16
        STRB     R0,[R4, #+3]
        MOVS     R0,R6
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        STRB     R0,[R4, #+1]
        MOVS     R0,R6
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        STRB     R0,[R4, #+2]
        MOVS     R0,R6
        LSRS     R0,R0,#+13
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        STRB     R0,[R4, #+0]
        CMP      R5,#+0
        BNE      ??RTC_GetDate_0
        LDRB     R0,[R4, #+3]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+3]
        LDRB     R0,[R4, #+1]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+1]
        LDRB     R0,[R4, #+2]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+2]
        LDRB     R0,[R4, #+0]
        STRB     R0,[R4, #+0]
??RTC_GetDate_0:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SetAlarm:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+4
        MOVS     R4,R2
        MOVS     R7,#+0
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BNE      ??RTC_SetAlarm_0
        LDR      R0,??DataTable19_1  ;; 0x40002808
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BMI      ??RTC_SetAlarm_1
??RTC_SetAlarm_2:
        MOVS     R0,#+0
        STRB     R0,[R4, #+3]
??RTC_SetAlarm_1:
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BEQ      ??RTC_SetAlarm_3
??RTC_SetAlarm_4:
        B        ??RTC_SetAlarm_3
??RTC_SetAlarm_0:
        LDR      R0,??DataTable19_1  ;; 0x40002808
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL      ??RTC_SetAlarm_5
        LDRB     R0,[R4, #+0]
        BL       RTC_Bcd2ToByte
        MOVS     R7,R0
        B        ??RTC_SetAlarm_6
??RTC_SetAlarm_5:
        MOVS     R0,#+0
        STRB     R0,[R4, #+3]
??RTC_SetAlarm_6:
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BNE      ??RTC_SetAlarm_7
        LDRB     R0,[R4, #+12]
        BL       RTC_Bcd2ToByte
        MOVS     R7,R0
        B        ??RTC_SetAlarm_3
??RTC_SetAlarm_7:
        LDRB     R0,[R4, #+12]
        BL       RTC_Bcd2ToByte
        MOVS     R7,R0
??RTC_SetAlarm_3:
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BEQ      ??RTC_SetAlarm_8
        LDRB     R0,[R4, #+0]
        LSLS     R0,R0,#+16
        LDRB     R1,[R4, #+1]
        LSLS     R1,R1,#+8
        ORRS     R1,R1,R0
        LDRB     R0,[R4, #+2]
        ORRS     R0,R0,R1
        LDRB     R1,[R4, #+3]
        LSLS     R1,R1,#+16
        ORRS     R1,R1,R0
        LDRB     R0,[R4, #+12]
        LSLS     R0,R0,#+24
        ORRS     R0,R0,R1
        LDR      R1,[R4, #+8]
        ORRS     R1,R1,R0
        LDR      R0,[R4, #+4]
        ORRS     R0,R0,R1
        MOVS     R7,R0
        B        ??RTC_SetAlarm_9
??RTC_SetAlarm_8:
        LDRB     R0,[R4, #+0]
        BL       RTC_ByteToBcd2
        MOVS     R5,R0
        LDRB     R0,[R4, #+1]
        BL       RTC_ByteToBcd2
        MOVS     R6,R0
        LDRB     R0,[R4, #+2]
        BL       RTC_ByteToBcd2
        UXTB     R5,R5
        LSLS     R1,R5,#+16
        UXTB     R6,R6
        LSLS     R2,R6,#+8
        ORRS     R2,R2,R1
        UXTB     R0,R0
        ORRS     R0,R0,R2
        LDRB     R1,[R4, #+3]
        LSLS     R5,R1,#+16
        ORRS     R5,R5,R0
        LDRB     R0,[R4, #+12]
        BL       RTC_ByteToBcd2
        LSLS     R0,R0,#+24
        ORRS     R0,R0,R5
        LDR      R1,[R4, #+8]
        ORRS     R1,R1,R0
        LDR      R0,[R4, #+4]
        ORRS     R0,R0,R1
        MOVS     R7,R0
??RTC_SetAlarm_9:
        MOVS     R0,#+202
        LDR      R1,??DataTable19  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,#+83
        LDR      R1,??DataTable19  ;; 0x40002824
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable23  ;; 0x4000281c
        STR      R7,[R0, #+0]
        MOVS     R0,#+255
        LDR      R1,??DataTable19  ;; 0x40002824
        STR      R0,[R1, #+0]
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x7f7f7f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0x40002800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_AlarmStructInit:
        MOVS     R1,#+0
        STRB     R1,[R0, #+3]
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
        MOVS     R1,#+0
        STRB     R1,[R0, #+2]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+1
        STRB     R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetAlarm:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R6,#+0
        LDR      R0,??DataTable23  ;; 0x4000281c
        LDR      R0,[R0, #+0]
        MOVS     R6,R0
        MOVS     R0,R6
        LSRS     R0,R0,#+16
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        STRB     R0,[R5, #+0]
        MOVS     R0,R6
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        STRB     R0,[R5, #+1]
        MOVS     R0,R6
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        STRB     R0,[R5, #+2]
        MOVS     R0,R6
        LSRS     R0,R0,#+16
        MOVS     R1,#+64
        ANDS     R0,R0,R1
        STRB     R0,[R5, #+3]
        MOVS     R0,R6
        LSRS     R0,R0,#+24
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        STRB     R0,[R5, #+12]
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        ANDS     R0,R0,R6
        STR      R0,[R5, #+8]
        LDR      R0,??DataTable27  ;; 0x80808080
        ANDS     R0,R0,R6
        STR      R0,[R5, #+4]
        CMP      R4,#+0
        BNE      ??RTC_GetAlarm_0
        LDRB     R0,[R5, #+0]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R5, #+0]
        LDRB     R0,[R5, #+1]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R5, #+1]
        LDRB     R0,[R5, #+2]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R5, #+2]
        LDRB     R0,[R5, #+12]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R5, #+12]
??RTC_GetAlarm_0:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     0x40002828

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_AlarmCmd:
        PUSH     {R3-R5,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R0,#+0
        MOVS     R4,#+202
        LDR      R5,??DataTable19  ;; 0x40002824
        STR      R4,[R5, #+0]
        MOVS     R4,#+83
        LDR      R5,??DataTable19  ;; 0x40002824
        STR      R4,[R5, #+0]
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RTC_AlarmCmd_0
        LDR      R4,??DataTable19_1  ;; 0x40002808
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,R2
        LDR      R5,??DataTable19_1  ;; 0x40002808
        STR      R4,[R5, #+0]
        MOVS     R4,#+1
        MOVS     R0,R4
        B        ??RTC_AlarmCmd_1
??RTC_AlarmCmd_0:
        LDR      R4,??DataTable19_1  ;; 0x40002808
        LDR      R4,[R4, #+0]
        BICS     R4,R4,R2
        LDR      R5,??DataTable19_1  ;; 0x40002808
        STR      R4,[R5, #+0]
??RTC_AlarmCmd_2:
        LDR      R4,??DataTable26  ;; 0x4000280c
        LDR      R4,[R4, #+0]
        MOVS     R5,R2
        LSRS     R5,R5,#+8
        ANDS     R5,R5,R4
        MOVS     R3,R5
        LDR      R4,[SP, #+0]
        ADDS     R4,R4,#+1
        STR      R4,[SP, #+0]
        LDR      R4,[SP, #+0]
        MOVS     R5,#+128
        LSLS     R5,R5,#+7        ;; #+16384
        CMP      R4,R5
        BEQ      ??RTC_AlarmCmd_3
        CMP      R3,#+0
        BEQ      ??RTC_AlarmCmd_2
??RTC_AlarmCmd_3:
        LDR      R4,??DataTable26  ;; 0x4000280c
        LDR      R4,[R4, #+0]
        MOVS     R5,R2
        LSRS     R5,R5,#+8
        ANDS     R5,R5,R4
        CMP      R5,#+0
        BNE      ??RTC_AlarmCmd_4
        MOVS     R4,#+0
        MOVS     R0,R4
        B        ??RTC_AlarmCmd_1
??RTC_AlarmCmd_4:
        MOVS     R4,#+1
        MOVS     R0,R4
??RTC_AlarmCmd_1:
        MOVS     R4,#+255
        LDR      R5,??DataTable19  ;; 0x40002824
        STR      R4,[R5, #+0]
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0x40002804

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_AlarmSubSecondConfig:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+202
        LDR      R5,??DataTable19  ;; 0x40002824
        STR      R4,[R5, #+0]
        MOVS     R4,#+83
        LDR      R5,??DataTable19  ;; 0x40002824
        STR      R4,[R5, #+0]
        UXTB     R2,R2
        LSLS     R4,R2,#+24
        ORRS     R4,R4,R1
        MOVS     R3,R4
        LDR      R4,??DataTable29  ;; 0x40002844
        STR      R3,[R4, #+0]
        MOVS     R4,#+255
        LDR      R5,??DataTable19  ;; 0x40002824
        STR      R4,[R5, #+0]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetAlarmSubSecond:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable29  ;; 0x40002844
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+17       ;; ZeroExtS R2,R2,#+17,#+17
        LSRS     R2,R2,#+17
        MOVS     R0,R2
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     0xffff3f

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_DayLightSavingConfig:
        MOVS     R2,#+202
        LDR      R3,??DataTable19  ;; 0x40002824
        STR      R2,[R3, #+0]
        MOVS     R2,#+83
        LDR      R3,??DataTable19  ;; 0x40002824
        STR      R2,[R3, #+0]
        LDR      R2,??DataTable19_1  ;; 0x40002808
        LDR      R2,[R2, #+0]
        LDR      R3,??DataTable31  ;; 0xfffbffff
        ANDS     R3,R3,R2
        LDR      R2,??DataTable19_1  ;; 0x40002808
        STR      R3,[R2, #+0]
        LDR      R2,??DataTable19_1  ;; 0x40002808
        LDR      R2,[R2, #+0]
        MOVS     R3,R1
        ORRS     R3,R3,R0
        ORRS     R3,R3,R2
        LDR      R2,??DataTable19_1  ;; 0x40002808
        STR      R3,[R2, #+0]
        MOVS     R2,#+255
        LDR      R3,??DataTable19  ;; 0x40002824
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetStoreOperation:
        LDR      R0,??DataTable33  ;; 0x40002808
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+11       ;; #+262144
        ANDS     R0,R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0x40002824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0x40002808

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_OutputConfig:
        MOVS     R2,#+202
        LDR      R3,??DataTable36  ;; 0x40002824
        STR      R2,[R3, #+0]
        MOVS     R2,#+83
        LDR      R3,??DataTable36  ;; 0x40002824
        STR      R2,[R3, #+0]
        LDR      R2,??DataTable33  ;; 0x40002808
        LDR      R2,[R2, #+0]
        LDR      R3,??DataTable33_1  ;; 0xff8fffff
        ANDS     R3,R3,R2
        LDR      R2,??DataTable33  ;; 0x40002808
        STR      R3,[R2, #+0]
        LDR      R2,??DataTable33  ;; 0x40002808
        LDR      R2,[R2, #+0]
        MOVS     R3,R1
        ORRS     R3,R3,R0
        ORRS     R3,R3,R2
        LDR      R2,??DataTable33  ;; 0x40002808
        STR      R3,[R2, #+0]
        MOVS     R2,#+255
        LDR      R3,??DataTable36  ;; 0x40002824
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_CalibOutputCmd:
        PUSH     {LR}
        MOVS     R1,#+202
        LDR      R2,??DataTable36  ;; 0x40002824
        STR      R1,[R2, #+0]
        MOVS     R1,#+83
        LDR      R2,??DataTable36  ;; 0x40002824
        STR      R1,[R2, #+0]
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RTC_CalibOutputCmd_0
        LDR      R1,??DataTable33  ;; 0x40002808
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+16       ;; #+8388608
        ORRS     R2,R2,R1
        LDR      R1,??DataTable33  ;; 0x40002808
        STR      R2,[R1, #+0]
        B        ??RTC_CalibOutputCmd_1
??RTC_CalibOutputCmd_0:
        LDR      R1,??DataTable33  ;; 0x40002808
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable35  ;; 0xff7fffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable33  ;; 0x40002808
        STR      R2,[R1, #+0]
??RTC_CalibOutputCmd_1:
        MOVS     R1,#+255
        LDR      R2,??DataTable36  ;; 0x40002824
        STR      R1,[R2, #+0]
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_CalibOutputConfig:
        MOVS     R1,#+202
        LDR      R2,??DataTable36  ;; 0x40002824
        STR      R1,[R2, #+0]
        MOVS     R1,#+83
        LDR      R2,??DataTable36  ;; 0x40002824
        STR      R1,[R2, #+0]
        LDR      R1,??DataTable33  ;; 0x40002808
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable36_1  ;; 0xfff7ffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable33  ;; 0x40002808
        STR      R2,[R1, #+0]
        LDR      R1,??DataTable33  ;; 0x40002808
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable33  ;; 0x40002808
        STR      R1,[R2, #+0]
        MOVS     R1,#+255
        LDR      R2,??DataTable36  ;; 0x40002824
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SmoothCalibConfig:
        PUSH     {R4-R6,LR}
        MOVS     R3,R0
        MOVS     R0,#+0
        MOVS     R4,#+0
        MOVS     R5,#+202
        LDR      R6,??DataTable36  ;; 0x40002824
        STR      R5,[R6, #+0]
        MOVS     R5,#+83
        LDR      R6,??DataTable36  ;; 0x40002824
        STR      R5,[R6, #+0]
        LDR      R5,??DataTable26  ;; 0x4000280c
        LDR      R5,[R5, #+0]
        LSLS     R5,R5,#+15
        BPL      ??RTC_SmoothCalibConfig_0
??RTC_SmoothCalibConfig_1:
        LDR      R5,??DataTable26  ;; 0x4000280c
        LDR      R5,[R5, #+0]
        LSLS     R5,R5,#+15
        BPL      ??RTC_SmoothCalibConfig_0
        MOVS     R5,#+128
        LSLS     R5,R5,#+5        ;; #+4096
        CMP      R4,R5
        BEQ      ??RTC_SmoothCalibConfig_0
        ADDS     R4,R4,#+1
        B        ??RTC_SmoothCalibConfig_1
??RTC_SmoothCalibConfig_0:
        LDR      R5,??DataTable26  ;; 0x4000280c
        LDR      R5,[R5, #+0]
        LSLS     R5,R5,#+15
        BMI      ??RTC_SmoothCalibConfig_2
        MOVS     R5,R1
        ORRS     R5,R5,R3
        ORRS     R5,R5,R2
        LDR      R6,??DataTable37  ;; 0x4000283c
        STR      R5,[R6, #+0]
        MOVS     R5,#+1
        MOVS     R0,R5
        B        ??RTC_SmoothCalibConfig_3
??RTC_SmoothCalibConfig_2:
        MOVS     R5,#+0
        MOVS     R0,R5
??RTC_SmoothCalibConfig_3:
        MOVS     R5,#+255
        LDR      R6,??DataTable36  ;; 0x40002824
        STR      R5,[R6, #+0]
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0x4000281c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TimeStampCmd:
        PUSH     {R4,LR}
        MOVS     R2,#+0
        LDR      R3,??DataTable33  ;; 0x40002808
        LDR      R3,[R3, #+0]
        LDR      R4,??DataTable37_1  ;; 0xfffff7f7
        ANDS     R4,R4,R3
        MOVS     R2,R4
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RTC_TimeStampCmd_0
        MOVS     R3,R2
        MOVS     R2,#+128
        LSLS     R2,R2,#+4        ;; #+2048
        ORRS     R2,R2,R0
        ORRS     R2,R2,R3
        B        ??RTC_TimeStampCmd_1
??RTC_TimeStampCmd_0:
        ORRS     R2,R2,R0
??RTC_TimeStampCmd_1:
        MOVS     R3,#+202
        LDR      R4,??DataTable36  ;; 0x40002824
        STR      R3,[R4, #+0]
        MOVS     R3,#+83
        LDR      R4,??DataTable36  ;; 0x40002824
        STR      R3,[R4, #+0]
        LDR      R3,??DataTable33  ;; 0x40002808
        STR      R2,[R3, #+0]
        MOVS     R3,#+255
        LDR      R4,??DataTable36  ;; 0x40002824
        STR      R3,[R4, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetTimeStamp:
        PUSH     {R0,R4-R7,LR}
        MOVS     R7,R1
        MOVS     R4,R2
        MOVS     R5,#+0
        MOVS     R6,#+0
        LDR      R0,??DataTable38  ;; 0x40002830
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable38_1  ;; 0x7f7f7f
        ANDS     R1,R1,R0
        MOVS     R5,R1
        LDR      R0,??DataTable38_2  ;; 0x40002834
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable40  ;; 0xffff3f
        ANDS     R1,R1,R0
        MOVS     R6,R1
        MOVS     R0,R5
        LSRS     R0,R0,#+16
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        STRB     R0,[R7, #+0]
        MOVS     R0,R5
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        STRB     R0,[R7, #+1]
        MOVS     R0,R5
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        STRB     R0,[R7, #+2]
        MOVS     R0,R5
        LSRS     R0,R0,#+16
        MOVS     R1,#+64
        ANDS     R0,R0,R1
        STRB     R0,[R7, #+3]
        MOVS     R0,#+0
        STRB     R0,[R4, #+3]
        MOVS     R0,R6
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        STRB     R0,[R4, #+1]
        MOVS     R0,R6
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        STRB     R0,[R4, #+2]
        MOVS     R0,R6
        LSRS     R0,R0,#+13
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        STRB     R0,[R4, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BNE      ??RTC_GetTimeStamp_0
        LDRB     R0,[R7, #+0]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R7, #+0]
        LDRB     R0,[R7, #+1]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R7, #+1]
        LDRB     R0,[R7, #+2]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R7, #+2]
        LDRB     R0,[R4, #+1]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+1]
        LDRB     R0,[R4, #+2]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+2]
        LDRB     R0,[R4, #+0]
        BL       RTC_Bcd2ToByte
        STRB     R0,[R4, #+0]
??RTC_GetTimeStamp_0:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetTimeStampSubSecond:
        LDR      R0,??DataTable42  ;; 0x40002838
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     0x4000280c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TamperTriggerConfig:
        PUSH     {LR}
        CMP      R1,#+0
        BNE      ??RTC_TamperTriggerConfig_0
        LDR      R2,??DataTable42_1  ;; 0x40002840
        LDR      R2,[R2, #+0]
        LSLS     R3,R0,#+1
        BICS     R2,R2,R3
        LDR      R3,??DataTable42_1  ;; 0x40002840
        STR      R2,[R3, #+0]
        B        ??RTC_TamperTriggerConfig_1
??RTC_TamperTriggerConfig_0:
        LDR      R2,??DataTable42_1  ;; 0x40002840
        LDR      R2,[R2, #+0]
        LSLS     R3,R0,#+1
        ORRS     R3,R3,R2
        LDR      R2,??DataTable42_1  ;; 0x40002840
        STR      R3,[R2, #+0]
??RTC_TamperTriggerConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     0x80808080

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TamperCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RTC_TamperCmd_0
        LDR      R2,??DataTable42_1  ;; 0x40002840
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable42_1  ;; 0x40002840
        STR      R2,[R3, #+0]
        B        ??RTC_TamperCmd_1
??RTC_TamperCmd_0:
        LDR      R2,??DataTable42_1  ;; 0x40002840
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable42_1  ;; 0x40002840
        STR      R2,[R3, #+0]
??RTC_TamperCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TamperFilterConfig:
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable42_2  ;; 0xffffe7ff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable42_1  ;; 0x40002840
        STR      R2,[R1, #+0]
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable42_1  ;; 0x40002840
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29:
        DC32     0x40002844

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TamperSamplingFreqConfig:
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable42_3  ;; 0xfffff8ff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable42_1  ;; 0x40002840
        STR      R2,[R1, #+0]
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable42_1  ;; 0x40002840
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TamperPinsPrechargeDuration:
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable42_4  ;; 0xffff9fff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable42_1  ;; 0x40002840
        STR      R2,[R1, #+0]
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable42_1  ;; 0x40002840
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable31:
        DC32     0xfffbffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TimeStampOnTamperDetectionCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RTC_TimeStampOnTamperDetectionCmd_0
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        ORRS     R2,R2,R1
        LDR      R1,??DataTable42_1  ;; 0x40002840
        STR      R2,[R1, #+0]
        B        ??RTC_TimeStampOnTamperDetectionCmd_1
??RTC_TimeStampOnTamperDetectionCmd_0:
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        BICS     R1,R1,R2
        LDR      R2,??DataTable42_1  ;; 0x40002840
        STR      R1,[R2, #+0]
??RTC_TimeStampOnTamperDetectionCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_TamperPullUpCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RTC_TamperPullUpCmd_0
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable42_5  ;; 0xffff7fff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable42_1  ;; 0x40002840
        STR      R2,[R1, #+0]
        B        ??RTC_TamperPullUpCmd_1
??RTC_TamperPullUpCmd_0:
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+8        ;; #+32768
        ORRS     R2,R2,R1
        LDR      R1,??DataTable42_1  ;; 0x40002840
        STR      R2,[R1, #+0]
??RTC_TamperPullUpCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33:
        DC32     0x40002808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33_1:
        DC32     0xff8fffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_WriteBackupRegister:
        SUB      SP,SP,#+4
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
        LDR      R2,??DataTable42_6  ;; 0x40002850
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        MOVS     R3,#+4
        MULS     R3,R0,R3
        ADDS     R2,R2,R3
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        STR      R1,[R2, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ReadBackupRegister:
        SUB      SP,SP,#+4
        MOVS     R1,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable42_6  ;; 0x40002850
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        MOVS     R2,#+4
        MULS     R2,R1,R2
        ADDS     R0,R0,R2
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable35:
        DC32     0xff7fffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_OutputTypeConfig:
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable42_7  ;; 0xfffbffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable42_1  ;; 0x40002840
        STR      R2,[R1, #+0]
        LDR      R1,??DataTable42_1  ;; 0x40002840
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable42_1  ;; 0x40002840
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36:
        DC32     0x40002824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_1:
        DC32     0xfff7ffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_SynchroShiftConfig:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R0,#+202
        LDR      R1,??DataTable42_8  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,#+83
        LDR      R1,??DataTable42_8  ;; 0x40002824
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable42_9  ;; 0x4000280c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??RTC_SynchroShiftConfig_0
??RTC_SynchroShiftConfig_1:
        LDR      R0,??DataTable42_9  ;; 0x4000280c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL      ??RTC_SynchroShiftConfig_0
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        CMP      R6,R0
        BEQ      ??RTC_SynchroShiftConfig_0
        ADDS     R6,R6,#+1
        B        ??RTC_SynchroShiftConfig_1
??RTC_SynchroShiftConfig_0:
        LDR      R0,??DataTable42_9  ;; 0x4000280c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BMI      ??RTC_SynchroShiftConfig_2
        LDR      R0,??DataTable42_10  ;; 0x40002808
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI      ??RTC_SynchroShiftConfig_3
        MOVS     R0,R4
        ORRS     R0,R0,R7
        LDR      R1,??DataTable42_11  ;; 0x4000282c
        STR      R0,[R1, #+0]
        BL       RTC_WaitForSynchro
        CMP      R0,#+0
        BNE      ??RTC_SynchroShiftConfig_4
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??RTC_SynchroShiftConfig_5
??RTC_SynchroShiftConfig_4:
        MOVS     R0,#+1
        MOVS     R5,R0
        B        ??RTC_SynchroShiftConfig_5
??RTC_SynchroShiftConfig_3:
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??RTC_SynchroShiftConfig_5
??RTC_SynchroShiftConfig_2:
        MOVS     R0,#+0
        MOVS     R5,R0
??RTC_SynchroShiftConfig_5:
        MOVS     R0,#+255
        LDR      R1,??DataTable42_8  ;; 0x40002824
        STR      R0,[R1, #+0]
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37:
        DC32     0x4000283c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_1:
        DC32     0xfffff7f7

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ITConfig:
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R0,#+202
        LDR      R3,??DataTable42_8  ;; 0x40002824
        STR      R0,[R3, #+0]
        MOVS     R0,#+83
        LDR      R3,??DataTable42_8  ;; 0x40002824
        STR      R0,[R3, #+0]
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RTC_ITConfig_0
        LDR      R0,??DataTable42_10  ;; 0x40002808
        LDR      R0,[R0, #+0]
        MOVS     R3,R2
        MOVS     R4,#+4
        BICS     R3,R3,R4
        ORRS     R3,R3,R0
        LDR      R0,??DataTable42_10  ;; 0x40002808
        STR      R3,[R0, #+0]
        LDR      R0,??DataTable42_1  ;; 0x40002840
        LDR      R0,[R0, #+0]
        MOVS     R3,#+4
        ANDS     R3,R3,R2
        ORRS     R3,R3,R0
        LDR      R0,??DataTable42_1  ;; 0x40002840
        STR      R3,[R0, #+0]
        B        ??RTC_ITConfig_1
??RTC_ITConfig_0:
        LDR      R0,??DataTable42_10  ;; 0x40002808
        LDR      R3,[R0, #+0]
        MOVS     R0,R2
        MOVS     R4,#+4
        BICS     R0,R0,R4
        BICS     R3,R3,R0
        LDR      R0,??DataTable42_10  ;; 0x40002808
        STR      R3,[R0, #+0]
        LDR      R0,??DataTable42_1  ;; 0x40002840
        LDR      R0,[R0, #+0]
        MOVS     R3,#+4
        ANDS     R3,R3,R2
        BICS     R0,R0,R3
        LDR      R3,??DataTable42_1  ;; 0x40002840
        STR      R0,[R3, #+0]
??RTC_ITConfig_1:
        MOVS     R0,#+255
        LDR      R3,??DataTable42_8  ;; 0x40002824
        STR      R0,[R3, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable38:
        DC32     0x40002830

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable38_1:
        DC32     0x7f7f7f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable38_2:
        DC32     0x40002834

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetFlagStatus:
        PUSH     {R4,LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        LDR      R3,??DataTable42_9  ;; 0x4000280c
        LDR      R3,[R3, #+0]
        LDR      R4,??DataTable42_12  ;; 0x17978
        ANDS     R4,R4,R3
        MOVS     R2,R4
        TST      R2,R1
        BEQ      ??RTC_GetFlagStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B        ??RTC_GetFlagStatus_1
??RTC_GetFlagStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??RTC_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ClearFlag:
        LSLS     R1,R0,#+15       ;; ZeroExtS R1,R0,#+15,#+15
        LSRS     R1,R1,#+15
        MOVS     R2,#+128
        ORRS     R2,R2,R1
        MVNS     R1,R2
        LDR      R2,??DataTable42_9  ;; 0x4000280c
        LDR      R2,[R2, #+0]
        MOVS     R3,#+128
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        LDR      R1,??DataTable42_9  ;; 0x4000280c
        STR      R2,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable40:
        DC32     0xffff3f

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_GetITStatus:
        PUSH     {R4-R6,LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        LDR      R4,??DataTable42_1  ;; 0x40002840
        LDR      R4,[R4, #+0]
        MOVS     R5,#+4
        ANDS     R4,R4,R5
        MOVS     R2,R4
        LDR      R4,??DataTable42_10  ;; 0x40002808
        LDR      R4,[R4, #+0]
        ANDS     R4,R4,R1
        MOVS     R5,R1
        LSRS     R5,R5,#+18
        MOVS     R6,R1
        LSRS     R6,R6,R5
        MOVS     R5,R6
        LSRS     R5,R5,#+15
        ANDS     R5,R5,R2
        ORRS     R5,R5,R4
        MOVS     R3,R5
        LDR      R4,??DataTable42_9  ;; 0x4000280c
        LDR      R4,[R4, #+0]
        MOVS     R5,R1
        LSRS     R5,R5,#+4
        ANDS     R5,R5,R4
        MOVS     R2,R5
        CMP      R3,#+0
        BEQ      ??RTC_GetITStatus_0
        UXTH     R4,R2
        CMP      R4,#+0
        BEQ      ??RTC_GetITStatus_0
        MOVS     R4,#+1
        MOVS     R0,R4
        B        ??RTC_GetITStatus_1
??RTC_GetITStatus_0:
        MOVS     R4,#+0
        MOVS     R0,R4
??RTC_GetITStatus_1:
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ClearITPendingBit:
        PUSH     {R4}
        MOVS     R1,#+0
        MOVS     R2,R0
        LSRS     R2,R2,#+4
        MOVS     R1,R2
        UXTH     R2,R1
        MOVS     R3,#+128
        ORRS     R3,R3,R2
        MVNS     R2,R3
        LDR      R3,??DataTable42_9  ;; 0x4000280c
        LDR      R3,[R3, #+0]
        MOVS     R4,#+128
        ANDS     R3,R3,R4
        ORRS     R3,R3,R2
        LDR      R2,??DataTable42_9  ;; 0x4000280c
        STR      R3,[R2, #+0]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42:
        DC32     0x40002838

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_1:
        DC32     0x40002840

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_2:
        DC32     0xffffe7ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_3:
        DC32     0xfffff8ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_4:
        DC32     0xffff9fff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_5:
        DC32     0xffff7fff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_6:
        DC32     0x40002850

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_7:
        DC32     0xfffbffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_8:
        DC32     0x40002824

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_9:
        DC32     0x4000280c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_10:
        DC32     0x40002808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_11:
        DC32     0x4000282c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable42_12:
        DC32     0x17978

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_ByteToBcd2:
        PUSH     {LR}
        MOVS     R1,#+0
??RTC_ByteToBcd2_0:
        UXTB     R0,R0
        CMP      R0,#+10
        BLT      ??RTC_ByteToBcd2_1
        ADDS     R1,R1,#+1
        SUBS     R0,R0,#+10
        B        ??RTC_ByteToBcd2_0
??RTC_ByteToBcd2_1:
        LSLS     R1,R1,#+4
        ORRS     R0,R0,R1
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RTC_Bcd2ToByte:
        MOVS     R1,#+0
        MOVS     R2,R0
        UXTB     R2,R2
        LSRS     R2,R2,#+4
        MOVS     R3,#+10
        MULS     R2,R3,R2
        MOVS     R1,R2
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ADDS     R0,R1,R0
        UXTB     R0,R0
        BX       LR               ;; return

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
// 3 210 bytes in section .text
// 
// 3 210 bytes of CODE memory
//
//Errors: none
//Warnings: none

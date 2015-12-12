///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       12/Dec/2015  12:36:16
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_adc.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_adc.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -D USE_LORA_MODE -lb
//        G:\git_hub_lamp\lamp_slave_git\Debug\List\ --diag_suppress Pa050 -o
//        G:\git_hub_lamp\lamp_slave_git\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
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
//        G:\git_hub_lamp\lamp_slave_git\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_adc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC ADC_AnalogWatchdogCmd
        PUBLIC ADC_AnalogWatchdogSingleChannelCmd
        PUBLIC ADC_AnalogWatchdogSingleChannelConfig
        PUBLIC ADC_AnalogWatchdogThresholdsConfig
        PUBLIC ADC_AutoPowerOffCmd
        PUBLIC ADC_ChannelConfig
        PUBLIC ADC_ClearFlag
        PUBLIC ADC_ClearITPendingBit
        PUBLIC ADC_Cmd
        PUBLIC ADC_ContinuousModeCmd
        PUBLIC ADC_DMACmd
        PUBLIC ADC_DMARequestModeConfig
        PUBLIC ADC_DeInit
        PUBLIC ADC_DiscModeCmd
        PUBLIC ADC_GetCalibrationFactor
        PUBLIC ADC_GetConversionValue
        PUBLIC ADC_GetFlagStatus
        PUBLIC ADC_GetITStatus
        PUBLIC ADC_ITConfig
        PUBLIC ADC_Init
        PUBLIC ADC_JitterCmd
        PUBLIC ADC_OverrunModeCmd
        PUBLIC ADC_StartOfConversion
        PUBLIC ADC_StopOfConversion
        PUBLIC ADC_StructInit
        PUBLIC ADC_TempSensorCmd
        PUBLIC ADC_VbatCmd
        PUBLIC ADC_VrefintCmd
        PUBLIC ADC_WaitModeCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable13  ;; 0x40012400
        CMP      R4,R0
        BNE      ??ADC_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       RCC_APB2PeriphResetCmd
??ADC_DeInit_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        LDR      R2,[R0, #+12]
        MOVS     R3,R2
        MOVS     R2,R3
        LDR      R3,??DataTable13_1  ;; 0xffffd203
        ANDS     R3,R3,R2
        MOVS     R2,R3
        LDR      R3,[R1, #+0]
        LDRB     R4,[R1, #+4]
        LSLS     R4,R4,#+13
        ORRS     R4,R4,R3
        LDR      R3,[R1, #+8]
        ORRS     R3,R3,R4
        LDR      R4,[R1, #+12]
        ORRS     R4,R4,R3
        LDR      R5,[R1, #+16]
        ORRS     R5,R5,R4
        LDR      R3,[R1, #+20]
        ORRS     R3,R3,R5
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_Cmd_0
        LDR      R2,[R0, #+8]
        MOVS     R3,#+1
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
        B        ??ADC_Cmd_1
??ADC_Cmd_0:
        LDR      R2,[R0, #+8]
        MOVS     R3,#+2
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
??ADC_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_JitterCmd:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??ADC_JitterCmd_0
        LDR      R3,[R0, #+16]
        ORRS     R3,R3,R1
        STR      R3,[R0, #+16]
        B        ??ADC_JitterCmd_1
??ADC_JitterCmd_0:
        LDR      R3,[R0, #+16]
        BICS     R3,R3,R1
        STR      R3,[R0, #+16]
??ADC_JitterCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AutoPowerOffCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_AutoPowerOffCmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+128
        LSLS     R3,R3,#+8        ;; #+32768
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??ADC_AutoPowerOffCmd_1
??ADC_AutoPowerOffCmd_0:
        LDR      R2,[R0, #+12]
        LDR      R3,??DataTable13_2  ;; 0xffff7fff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+12]
??ADC_AutoPowerOffCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_WaitModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_WaitModeCmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+128
        LSLS     R3,R3,#+7        ;; #+16384
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??ADC_WaitModeCmd_1
??ADC_WaitModeCmd_0:
        LDR      R2,[R0, #+12]
        LDR      R3,??DataTable13_3  ;; 0xffffbfff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+12]
??ADC_WaitModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_AnalogWatchdogCmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+128
        LSLS     R3,R3,#+16       ;; #+8388608
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??ADC_AnalogWatchdogCmd_1
??ADC_AnalogWatchdogCmd_0:
        LDR      R2,[R0, #+12]
        LDR      R3,??DataTable13_4  ;; 0xff7fffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+12]
??ADC_AnalogWatchdogCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogThresholdsConfig:
        UXTH     R2,R2
        LSLS     R3,R1,#+16
        ORRS     R3,R3,R2
        STR      R3,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogSingleChannelConfig:
        MOVS     R2,#+0
        LDR      R3,[R0, #+12]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable13_5  ;; 0x83ffffff
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STR      R2,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_AnalogWatchdogSingleChannelCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_AnalogWatchdogSingleChannelCmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+128
        LSLS     R3,R3,#+15       ;; #+4194304
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??ADC_AnalogWatchdogSingleChannelCmd_1
??ADC_AnalogWatchdogSingleChannelCmd_0:
        LDR      R2,[R0, #+12]
        LDR      R3,??DataTable13_6  ;; 0xffbfffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+12]
??ADC_AnalogWatchdogSingleChannelCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_TempSensorCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??ADC_TempSensorCmd_0
        LDR      R1,??DataTable13_7  ;; 0x40012708
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+16       ;; #+8388608
        ORRS     R2,R2,R1
        LDR      R1,??DataTable13_7  ;; 0x40012708
        STR      R2,[R1, #+0]
        B        ??ADC_TempSensorCmd_1
??ADC_TempSensorCmd_0:
        LDR      R1,??DataTable13_7  ;; 0x40012708
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable13_4  ;; 0xff7fffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable13_7  ;; 0x40012708
        STR      R2,[R1, #+0]
??ADC_TempSensorCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_VrefintCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??ADC_VrefintCmd_0
        LDR      R1,??DataTable13_7  ;; 0x40012708
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+15       ;; #+4194304
        ORRS     R2,R2,R1
        LDR      R1,??DataTable13_7  ;; 0x40012708
        STR      R2,[R1, #+0]
        B        ??ADC_VrefintCmd_1
??ADC_VrefintCmd_0:
        LDR      R1,??DataTable13_7  ;; 0x40012708
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable13_6  ;; 0xffbfffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable13_7  ;; 0x40012708
        STR      R2,[R1, #+0]
??ADC_VrefintCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_VbatCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??ADC_VbatCmd_0
        LDR      R1,??DataTable13_7  ;; 0x40012708
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+17       ;; #+16777216
        ORRS     R2,R2,R1
        LDR      R1,??DataTable13_7  ;; 0x40012708
        STR      R2,[R1, #+0]
        B        ??ADC_VbatCmd_1
??ADC_VbatCmd_0:
        LDR      R1,??DataTable13_7  ;; 0x40012708
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable13_8  ;; 0xfeffffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable13_7  ;; 0x40012708
        STR      R2,[R1, #+0]
??ADC_VbatCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ChannelConfig:
        PUSH     {R4}
        MOVS     R3,#+0
        LDR      R4,[R0, #+40]
        ORRS     R4,R4,R1
        STR      R4,[R0, #+40]
        MOVS     R4,#+7
        BICS     R3,R3,R4
        ORRS     R3,R3,R2
        STR      R3,[R0, #+20]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ContinuousModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_ContinuousModeCmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+128
        LSLS     R3,R3,#+6        ;; #+8192
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??ADC_ContinuousModeCmd_1
??ADC_ContinuousModeCmd_0:
        LDR      R2,[R0, #+12]
        LDR      R3,??DataTable13_9  ;; 0xffffdfff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+12]
??ADC_ContinuousModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DiscModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_DiscModeCmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+128
        LSLS     R3,R3,#+9        ;; #+65536
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??ADC_DiscModeCmd_1
??ADC_DiscModeCmd_0:
        LDR      R2,[R0, #+12]
        LDR      R3,??DataTable13_10  ;; 0xfffeffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+12]
??ADC_DiscModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_OverrunModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_OverrunModeCmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+128
        LSLS     R3,R3,#+5        ;; #+4096
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??ADC_OverrunModeCmd_1
??ADC_OverrunModeCmd_0:
        LDR      R2,[R0, #+12]
        LDR      R3,??DataTable13_11  ;; 0xffffefff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+12]
??ADC_OverrunModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetCalibrationFactor:
        PUSH     {R4,R5,LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR      R4,[R1, #+8]
        MOVS     R5,#+128
        LSLS     R5,R5,#+24       ;; #-2147483648
        ORRS     R5,R5,R4
        STR      R5,[R1, #+8]
??ADC_GetCalibrationFactor_0:
        LDR      R4,[R1, #+8]
        MOVS     R5,#+128
        LSLS     R5,R5,#+24       ;; #-2147483648
        ANDS     R4,R4,R5
        MOVS     R2,R4
        ADDS     R3,R3,#+1
        MOVS     R4,#+240
        LSLS     R4,R4,#+8        ;; #+61440
        CMP      R3,R4
        BEQ      ??ADC_GetCalibrationFactor_1
        CMP      R2,#+0
        BNE      ??ADC_GetCalibrationFactor_0
??ADC_GetCalibrationFactor_1:
        LDR      R4,[R1, #+8]
        CMP      R4,#+0
        BMI      ??ADC_GetCalibrationFactor_2
        LDR      R4,[R1, #+64]
        MOVS     R0,R4
        B        ??ADC_GetCalibrationFactor_3
??ADC_GetCalibrationFactor_2:
        MOVS     R4,#+0
        MOVS     R0,R4
??ADC_GetCalibrationFactor_3:
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_StopOfConversion:
        LDR      R1,[R0, #+8]
        MOVS     R2,#+16
        ORRS     R2,R2,R1
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_StartOfConversion:
        LDR      R1,[R0, #+8]
        MOVS     R2,#+4
        ORRS     R2,R2,R1
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetConversionValue:
        LDR      R0,[R0, #+64]
        UXTH     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DMACmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??ADC_DMACmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+1
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??ADC_DMACmd_1
??ADC_DMACmd_0:
        LDR      R2,[R0, #+12]
        MOVS     R3,#+1
        BICS     R2,R2,R3
        STR      R2,[R0, #+12]
??ADC_DMACmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_DMARequestModeConfig:
        LDR      R2,[R0, #+12]
        MOVS     R3,#+2
        BICS     R2,R2,R3
        STR      R2,[R0, #+12]
        LDR      R2,[R0, #+12]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ITConfig:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??ADC_ITConfig_0
        LDR      R3,[R0, #+4]
        ORRS     R3,R3,R1
        STR      R3,[R0, #+4]
        B        ??ADC_ITConfig_1
??ADC_ITConfig_0:
        LDR      R3,[R0, #+4]
        BICS     R3,R3,R1
        STR      R3,[R0, #+4]
??ADC_ITConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetFlagStatus:
        PUSH     {R4,R5,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        LSLS     R4,R1,#+7
        BPL      ??ADC_GetFlagStatus_0
        LDR      R4,[R2, #+8]
        LDR      R5,??DataTable13_8  ;; 0xfeffffff
        ANDS     R5,R5,R4
        MOVS     R3,R5
        B        ??ADC_GetFlagStatus_1
??ADC_GetFlagStatus_0:
        LDR      R4,[R2, #+0]
        MOVS     R3,R4
??ADC_GetFlagStatus_1:
        TST      R3,R1
        BEQ      ??ADC_GetFlagStatus_2
        MOVS     R4,#+1
        MOVS     R0,R4
        B        ??ADC_GetFlagStatus_3
??ADC_GetFlagStatus_2:
        MOVS     R4,#+0
        MOVS     R0,R4
??ADC_GetFlagStatus_3:
        UXTB     R0,R0
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x40012400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0xffffd203

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     0xffff7fff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     0xffffbfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     0xff7fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     0x83ffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     0xffbfffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     0x40012708

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     0xfeffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     0xffffdfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     0xfffeffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_11:
        DC32     0xffffefff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ClearFlag:
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_GetITStatus:
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        LDR      R4,[R2, #+4]
        ANDS     R4,R4,R1
        MOVS     R3,R4
        LDR      R4,[R2, #+0]
        ANDS     R4,R4,R1
        CMP      R4,#+0
        BEQ      ??ADC_GetITStatus_0
        CMP      R3,#+0
        BEQ      ??ADC_GetITStatus_0
        MOVS     R4,#+1
        MOVS     R0,R4
        B        ??ADC_GetITStatus_1
??ADC_GetITStatus_0:
        MOVS     R4,#+0
        MOVS     R0,R4
??ADC_GetITStatus_1:
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ADC_ClearITPendingBit:
        STR      R1,[R0, #+0]
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
// 828 bytes in section .text
// 
// 828 bytes of CODE memory
//
//Errors: none
//Warnings: none

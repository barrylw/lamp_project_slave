///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:31:16
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_tim.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_tim.c
//        -D USE_STDPERIPH_DRIVER -D STM32F051X8 -D AUTOSTART_ENABLE -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\stm32f0xx_tim.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC TIM_ARRPreloadConfig
        PUBLIC TIM_BDTRConfig
        PUBLIC TIM_BDTRStructInit
        PUBLIC TIM_CCPreloadControl
        PUBLIC TIM_CCxCmd
        PUBLIC TIM_CCxNCmd
        PUBLIC TIM_ClearFlag
        PUBLIC TIM_ClearITPendingBit
        PUBLIC TIM_ClearOC1Ref
        PUBLIC TIM_ClearOC2Ref
        PUBLIC TIM_ClearOC3Ref
        PUBLIC TIM_ClearOC4Ref
        PUBLIC TIM_Cmd
        PUBLIC TIM_CounterModeConfig
        PUBLIC TIM_CtrlPWMOutputs
        PUBLIC TIM_DMACmd
        PUBLIC TIM_DMAConfig
        PUBLIC TIM_DeInit
        PUBLIC TIM_ETRClockMode1Config
        PUBLIC TIM_ETRClockMode2Config
        PUBLIC TIM_ETRConfig
        PUBLIC TIM_EncoderInterfaceConfig
        PUBLIC TIM_ForcedOC1Config
        PUBLIC TIM_ForcedOC2Config
        PUBLIC TIM_ForcedOC3Config
        PUBLIC TIM_ForcedOC4Config
        PUBLIC TIM_GenerateEvent
        PUBLIC TIM_GetCapture1
        PUBLIC TIM_GetCapture2
        PUBLIC TIM_GetCapture3
        PUBLIC TIM_GetCapture4
        PUBLIC TIM_GetCounter
        PUBLIC TIM_GetFlagStatus
        PUBLIC TIM_GetITStatus
        PUBLIC TIM_GetPrescaler
        PUBLIC TIM_ICInit
        PUBLIC TIM_ICStructInit
        PUBLIC TIM_ITConfig
        PUBLIC TIM_ITRxExternalClockConfig
        PUBLIC TIM_InternalClockConfig
        PUBLIC TIM_OC1FastConfig
        PUBLIC TIM_OC1Init
        PUBLIC TIM_OC1NPolarityConfig
        PUBLIC TIM_OC1PolarityConfig
        PUBLIC TIM_OC1PreloadConfig
        PUBLIC TIM_OC2FastConfig
        PUBLIC TIM_OC2Init
        PUBLIC TIM_OC2NPolarityConfig
        PUBLIC TIM_OC2PolarityConfig
        PUBLIC TIM_OC2PreloadConfig
        PUBLIC TIM_OC3FastConfig
        PUBLIC TIM_OC3Init
        PUBLIC TIM_OC3NPolarityConfig
        PUBLIC TIM_OC3PolarityConfig
        PUBLIC TIM_OC3PreloadConfig
        PUBLIC TIM_OC4FastConfig
        PUBLIC TIM_OC4Init
        PUBLIC TIM_OC4PolarityConfig
        PUBLIC TIM_OC4PreloadConfig
        PUBLIC TIM_OCStructInit
        PUBLIC TIM_PWMIConfig
        PUBLIC TIM_PrescalerConfig
        PUBLIC TIM_RemapConfig
        PUBLIC TIM_SelectCCDMA
        PUBLIC TIM_SelectCOM
        PUBLIC TIM_SelectHallSensor
        PUBLIC TIM_SelectInputTrigger
        PUBLIC TIM_SelectMasterSlaveMode
        PUBLIC TIM_SelectOCREFClear
        PUBLIC TIM_SelectOCxM
        PUBLIC TIM_SelectOnePulseMode
        PUBLIC TIM_SelectOutputTrigger
        PUBLIC TIM_SelectSlaveMode
        PUBLIC TIM_SetAutoreload
        PUBLIC TIM_SetClockDivision
        PUBLIC TIM_SetCompare1
        PUBLIC TIM_SetCompare2
        PUBLIC TIM_SetCompare3
        PUBLIC TIM_SetCompare4
        PUBLIC TIM_SetCounter
        PUBLIC TIM_SetIC1Prescaler
        PUBLIC TIM_SetIC2Prescaler
        PUBLIC TIM_SetIC3Prescaler
        PUBLIC TIM_SetIC4Prescaler
        PUBLIC TIM_TIxExternalClockConfig
        PUBLIC TIM_TimeBaseInit
        PUBLIC TIM_TimeBaseStructInit
        PUBLIC TIM_UpdateDisableConfig
        PUBLIC TIM_UpdateRequestConfig


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable8  ;; 0x40012c00
        CMP      R4,R0
        BNE      ??TIM_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       RCC_APB2PeriphResetCmd
        B        ??TIM_DeInit_1
??TIM_DeInit_0:
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        CMP      R4,R0
        BNE      ??TIM_DeInit_2
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       RCC_APB1PeriphResetCmd
        B        ??TIM_DeInit_1
??TIM_DeInit_2:
        LDR      R0,??DataTable8_1  ;; 0x40000400
        CMP      R4,R0
        BNE      ??TIM_DeInit_3
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       RCC_APB1PeriphResetCmd
        B        ??TIM_DeInit_1
??TIM_DeInit_3:
        LDR      R0,??DataTable8_2  ;; 0x40001000
        CMP      R4,R0
        BNE      ??TIM_DeInit_4
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       RCC_APB1PeriphResetCmd
        B        ??TIM_DeInit_1
??TIM_DeInit_4:
        LDR      R0,??DataTable8_3  ;; 0x40002000
        CMP      R4,R0
        BNE      ??TIM_DeInit_5
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        BL       RCC_APB1PeriphResetCmd
        B        ??TIM_DeInit_1
??TIM_DeInit_5:
        LDR      R0,??DataTable8_4  ;; 0x40014000
        CMP      R4,R0
        BNE      ??TIM_DeInit_6
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+9        ;; #+65536
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+9        ;; #+65536
        BL       RCC_APB2PeriphResetCmd
        B        ??TIM_DeInit_1
??TIM_DeInit_6:
        LDR      R0,??DataTable9  ;; 0x40014400
        CMP      R4,R0
        BNE      ??TIM_DeInit_7
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_APB2PeriphResetCmd
        B        ??TIM_DeInit_1
??TIM_DeInit_7:
        LDR      R0,??DataTable10  ;; 0x40014800
        CMP      R4,R0
        BNE      ??TIM_DeInit_1
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        BL       RCC_APB2PeriphResetCmd
??TIM_DeInit_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_TimeBaseInit:
        PUSH     {LR}
        MOVS     R2,#+0
        LDRH     R3,[R0, #+0]
        MOVS     R2,R3
        LDR      R3,??DataTable8  ;; 0x40012c00
        CMP      R0,R3
        BEQ      ??TIM_TimeBaseInit_0
        MOVS     R3,#+128
        LSLS     R3,R3,#+23       ;; #+1073741824
        CMP      R0,R3
        BEQ      ??TIM_TimeBaseInit_0
        LDR      R3,??DataTable8_1  ;; 0x40000400
        CMP      R0,R3
        BNE      ??TIM_TimeBaseInit_1
??TIM_TimeBaseInit_0:
        MOVS     R3,R2
        LDR      R2,??DataTable9_1  ;; 0xff8f
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LDRH     R2,[R1, #+2]
        ORRS     R2,R2,R3
??TIM_TimeBaseInit_1:
        LDR      R3,??DataTable8_2  ;; 0x40001000
        CMP      R0,R3
        BEQ      ??TIM_TimeBaseInit_2
        MOVS     R3,R2
        LDR      R2,??DataTable9_2  ;; 0xfcff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LDRH     R2,[R1, #+8]
        ORRS     R2,R2,R3
??TIM_TimeBaseInit_2:
        STRH     R2,[R0, #+0]
        LDR      R3,[R1, #+4]
        STR      R3,[R0, #+44]
        LDRH     R3,[R1, #+0]
        STRH     R3,[R0, #+40]
        LDR      R3,??DataTable8  ;; 0x40012c00
        CMP      R0,R3
        BEQ      ??TIM_TimeBaseInit_3
        LDR      R3,??DataTable8_4  ;; 0x40014000
        CMP      R0,R3
        BEQ      ??TIM_TimeBaseInit_3
        LDR      R3,??DataTable9  ;; 0x40014400
        CMP      R0,R3
        BEQ      ??TIM_TimeBaseInit_3
        LDR      R3,??DataTable10  ;; 0x40014800
        CMP      R0,R3
        BNE      ??TIM_TimeBaseInit_4
??TIM_TimeBaseInit_3:
        LDRB     R3,[R1, #+10]
        STRH     R3,[R0, #+48]
??TIM_TimeBaseInit_4:
        MOVS     R3,#+1
        STRH     R3,[R0, #+20]
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_TimeBaseStructInit:
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRB     R1,[R0, #+10]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_PrescalerConfig:
        STRH     R1,[R0, #+40]
        STRH     R2,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CounterModeConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+0]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable9_1  ;; 0xff8f
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCounter:
        STR      R1,[R0, #+36]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetAutoreload:
        STR      R1,[R0, #+44]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCounter:
        LDR      R0,[R0, #+36]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetPrescaler:
        LDRH     R0,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_UpdateDisableConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_UpdateDisableConfig_0
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+2
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        B        ??TIM_UpdateDisableConfig_1
??TIM_UpdateDisableConfig_0:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable12  ;; 0xfffd
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
??TIM_UpdateDisableConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_UpdateRequestConfig:
        PUSH     {LR}
        UXTH     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_UpdateRequestConfig_0
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+4
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        B        ??TIM_UpdateRequestConfig_1
??TIM_UpdateRequestConfig_0:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable12_1  ;; 0xfffb
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
??TIM_UpdateRequestConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ARRPreloadConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_ARRPreloadConfig_0
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+128
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        B        ??TIM_ARRPreloadConfig_1
??TIM_ARRPreloadConfig_0:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable12_2  ;; 0xff7f
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
??TIM_ARRPreloadConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectOnePulseMode:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable12_3  ;; 0xfff7
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetClockDivision:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable9_2  ;; 0xfcff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_Cmd_0
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+1
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        B        ??TIM_Cmd_1
??TIM_Cmd_0:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable12_4  ;; 0xfffe
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
??TIM_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x40012c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x40000400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x40001000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x40002000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x40014000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_BDTRConfig:
        LDRH     R2,[R1, #+0]
        LDRH     R3,[R1, #+2]
        ORRS     R3,R3,R2
        LDRH     R2,[R1, #+4]
        ORRS     R2,R2,R3
        LDRH     R3,[R1, #+6]
        ORRS     R3,R3,R2
        LDRH     R2,[R1, #+8]
        ORRS     R2,R2,R3
        LDRH     R3,[R1, #+10]
        ORRS     R3,R3,R2
        LDRH     R2,[R1, #+12]
        ORRS     R2,R2,R3
        MOVS     R3,#+68
        STRH     R2,[R0, R3]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_BDTRStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CtrlPWMOutputs:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_CtrlPWMOutputs_0
        MOVS     R2,#+68
        LDRH     R2,[R0, R2]
        MOVS     R3,#+128
        LSLS     R3,R3,#+8        ;; #+32768
        ORRS     R3,R3,R2
        MOVS     R2,#+68
        STRH     R3,[R0, R2]
        B        ??TIM_CtrlPWMOutputs_1
??TIM_CtrlPWMOutputs_0:
        MOVS     R2,#+68
        LDRH     R2,[R0, R2]
        LSLS     R2,R2,#+17       ;; ZeroExtS R2,R2,#+17,#+17
        LSRS     R2,R2,#+17
        MOVS     R3,#+68
        STRH     R2,[R0, R3]
??TIM_CtrlPWMOutputs_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1Init:
        PUSH     {R4-R6,LR}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        LDRH     R5,[R0, #+32]
        LDR      R6,??DataTable12_4  ;; 0xfffe
        ANDS     R6,R6,R5
        STRH     R6,[R0, #+32]
        LDRH     R5,[R0, #+32]
        MOVS     R3,R5
        LDRH     R5,[R0, #+4]
        MOVS     R4,R5
        LDRH     R5,[R0, #+24]
        MOVS     R2,R5
        MOVS     R5,R2
        LDR      R2,??DataTable9_1  ;; 0xff8f
        ANDS     R2,R2,R5
        MOVS     R5,R2
        LDR      R2,??DataTable12_5  ;; 0xfffc
        ANDS     R2,R2,R5
        MOVS     R5,R2
        LDRH     R2,[R1, #+0]
        ORRS     R2,R2,R5
        MOVS     R5,R3
        LDR      R3,??DataTable12  ;; 0xfffd
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+12]
        ORRS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+2]
        ORRS     R3,R3,R5
        LDR      R5,??DataTable12_6  ;; 0x40012c00
        CMP      R0,R5
        BEQ      ??TIM_OC1Init_0
        LDR      R5,??DataTable13  ;; 0x40014000
        CMP      R0,R5
        BEQ      ??TIM_OC1Init_0
        LDR      R5,??DataTable9  ;; 0x40014400
        CMP      R0,R5
        BEQ      ??TIM_OC1Init_0
        LDR      R5,??DataTable10  ;; 0x40014800
        CMP      R0,R5
        BNE      ??TIM_OC1Init_1
??TIM_OC1Init_0:
        MOVS     R5,R3
        LDR      R3,??DataTable12_3  ;; 0xfff7
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+14]
        ORRS     R3,R3,R5
        MOVS     R5,R3
        LDR      R3,??DataTable12_1  ;; 0xfffb
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+4]
        ORRS     R3,R3,R5
        MOVS     R5,R4
        LDR      R4,??DataTable16  ;; 0xfeff
        ANDS     R4,R4,R5
        MOVS     R5,R4
        LDR      R4,??DataTable23  ;; 0xfdff
        ANDS     R4,R4,R5
        MOVS     R5,R4
        LDRH     R4,[R1, #+16]
        ORRS     R4,R4,R5
        MOVS     R5,R4
        LDRH     R4,[R1, #+18]
        ORRS     R4,R4,R5
??TIM_OC1Init_1:
        STRH     R4,[R0, #+4]
        STRH     R2,[R0, #+24]
        LDR      R5,[R1, #+8]
        STR      R5,[R0, #+52]
        STRH     R3,[R0, #+32]
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x40014400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0xff8f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0xfcff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2Init:
        PUSH     {R4-R6,LR}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        LDRH     R5,[R0, #+32]
        LDR      R6,??DataTable18  ;; 0xffef
        ANDS     R6,R6,R5
        STRH     R6,[R0, #+32]
        LDRH     R5,[R0, #+32]
        MOVS     R3,R5
        LDRH     R5,[R0, #+4]
        MOVS     R4,R5
        LDRH     R5,[R0, #+24]
        MOVS     R2,R5
        MOVS     R5,R2
        LDR      R2,??DataTable19  ;; 0x8fff
        ANDS     R2,R2,R5
        MOVS     R5,R2
        LDR      R2,??DataTable19_1  ;; 0xfcff
        ANDS     R2,R2,R5
        MOVS     R5,R2
        LDRH     R2,[R1, #+0]
        LSLS     R2,R2,#+8
        ORRS     R2,R2,R5
        MOVS     R5,R3
        LDR      R3,??DataTable20  ;; 0xffdf
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+12]
        LSLS     R3,R3,#+4
        ORRS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+2]
        LSLS     R3,R3,#+4
        ORRS     R3,R3,R5
        LDR      R5,??DataTable12_6  ;; 0x40012c00
        CMP      R0,R5
        BEQ      ??TIM_OC2Init_0
        LDR      R5,??DataTable13  ;; 0x40014000
        CMP      R0,R5
        BNE      ??TIM_OC2Init_1
??TIM_OC2Init_0:
        MOVS     R5,R4
        LDR      R4,??DataTable22  ;; 0xfbff
        ANDS     R4,R4,R5
        MOVS     R5,R4
        LDRH     R4,[R1, #+16]
        LSLS     R4,R4,#+2
        ORRS     R4,R4,R5
        LDR      R5,??DataTable12_6  ;; 0x40012c00
        CMP      R0,R5
        BNE      ??TIM_OC2Init_1
        MOVS     R5,R3
        LDR      R3,??DataTable12_2  ;; 0xff7f
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+14]
        LSLS     R3,R3,#+4
        ORRS     R3,R3,R5
        MOVS     R5,R3
        LDR      R3,??DataTable25  ;; 0xffbf
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+4]
        LSLS     R3,R3,#+4
        ORRS     R3,R3,R5
        MOVS     R5,R4
        LDR      R4,??DataTable28  ;; 0xf7ff
        ANDS     R4,R4,R5
        MOVS     R5,R4
        LDRH     R4,[R1, #+18]
        LSLS     R4,R4,#+2
        ORRS     R4,R4,R5
??TIM_OC2Init_1:
        STRH     R4,[R0, #+4]
        STRH     R2,[R0, #+24]
        LDR      R5,[R1, #+8]
        STR      R5,[R0, #+56]
        STRH     R3,[R0, #+32]
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x40014800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3Init:
        PUSH     {R4-R6,LR}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        LDRH     R5,[R0, #+32]
        LDR      R6,??DataTable16  ;; 0xfeff
        ANDS     R6,R6,R5
        STRH     R6,[R0, #+32]
        LDRH     R5,[R0, #+32]
        MOVS     R3,R5
        LDRH     R5,[R0, #+4]
        MOVS     R4,R5
        LDRH     R5,[R0, #+28]
        MOVS     R2,R5
        MOVS     R5,R2
        LDR      R2,??DataTable27  ;; 0xff8f
        ANDS     R2,R2,R5
        MOVS     R5,R2
        LDR      R2,??DataTable12_5  ;; 0xfffc
        ANDS     R2,R2,R5
        MOVS     R5,R2
        LDRH     R2,[R1, #+0]
        ORRS     R2,R2,R5
        MOVS     R5,R3
        LDR      R3,??DataTable23  ;; 0xfdff
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+12]
        LSLS     R3,R3,#+8
        ORRS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+2]
        LSLS     R3,R3,#+8
        ORRS     R3,R3,R5
        LDR      R5,??DataTable12_6  ;; 0x40012c00
        CMP      R0,R5
        BNE      ??TIM_OC3Init_0
        MOVS     R5,R3
        LDR      R3,??DataTable28  ;; 0xf7ff
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+14]
        LSLS     R3,R3,#+8
        ORRS     R3,R3,R5
        MOVS     R5,R3
        LDR      R3,??DataTable22  ;; 0xfbff
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+4]
        LSLS     R3,R3,#+8
        ORRS     R3,R3,R5
        MOVS     R5,R4
        LDR      R4,??DataTable31  ;; 0xefff
        ANDS     R4,R4,R5
        MOVS     R5,R4
        LDR      R4,??DataTable33  ;; 0xdfff
        ANDS     R4,R4,R5
        MOVS     R5,R4
        LDRH     R4,[R1, #+16]
        LSLS     R4,R4,#+4
        ORRS     R4,R4,R5
        MOVS     R5,R4
        LDRH     R4,[R1, #+18]
        LSLS     R4,R4,#+4
        ORRS     R4,R4,R5
??TIM_OC3Init_0:
        STRH     R4,[R0, #+4]
        STRH     R2,[R0, #+28]
        LDR      R5,[R1, #+8]
        STR      R5,[R0, #+60]
        STRH     R3,[R0, #+32]
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC4Init:
        PUSH     {R4-R6,LR}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        LDRH     R5,[R0, #+32]
        LDR      R6,??DataTable31  ;; 0xefff
        ANDS     R6,R6,R5
        STRH     R6,[R0, #+32]
        LDRH     R5,[R0, #+32]
        MOVS     R3,R5
        LDRH     R5,[R0, #+4]
        MOVS     R4,R5
        LDRH     R5,[R0, #+28]
        MOVS     R2,R5
        MOVS     R5,R2
        LDR      R2,??DataTable19  ;; 0x8fff
        ANDS     R2,R2,R5
        MOVS     R5,R2
        LDR      R2,??DataTable19_1  ;; 0xfcff
        ANDS     R2,R2,R5
        MOVS     R5,R2
        LDRH     R2,[R1, #+0]
        LSLS     R2,R2,#+8
        ORRS     R2,R2,R5
        MOVS     R5,R3
        LDR      R3,??DataTable33  ;; 0xdfff
        ANDS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+12]
        LSLS     R3,R3,#+12
        ORRS     R3,R3,R5
        MOVS     R5,R3
        LDRH     R3,[R1, #+2]
        LSLS     R3,R3,#+12
        ORRS     R3,R3,R5
        LDR      R5,??DataTable12_6  ;; 0x40012c00
        CMP      R0,R5
        BNE      ??TIM_OC4Init_0
        MOVS     R5,R4
        LDR      R4,??DataTable36  ;; 0xbfff
        ANDS     R4,R4,R5
        MOVS     R5,R4
        LDRH     R4,[R1, #+16]
        LSLS     R4,R4,#+6
        ORRS     R4,R4,R5
??TIM_OC4Init_0:
        STRH     R4,[R0, #+4]
        STRH     R2,[R0, #+28]
        LDR      R5,[R1, #+8]
        STR      R5,[R0, #+64]
        STRH     R3,[R0, #+32]
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0xfffd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0xfffb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0xff7f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0xfff7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0xfffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0xfffc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     0x40012c00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OCStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        MOVS     R1,#+0
        STRH     R1,[R0, #+14]
        MOVS     R1,#+0
        STRH     R1,[R0, #+16]
        MOVS     R1,#+0
        STRH     R1,[R0, #+18]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectOCxM:
        PUSH     {R4-R6,LR}
        MOVS     R4,#+0
        MOVS     R3,#+0
        MOVS     R4,R0
        ADDS     R4,R4,#+24
        MOVS     R5,#+1
        LSLS     R5,R5,R1
        MOVS     R3,R5
        LDRH     R5,[R0, #+32]
        BICS     R5,R5,R3
        STRH     R5,[R0, #+32]
        UXTH     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_SelectOCxM_0
        UXTH     R1,R1
        CMP      R1,#+8
        BNE      ??TIM_SelectOCxM_1
??TIM_SelectOCxM_0:
        MOVS     R5,R1
        UXTH     R5,R5
        LSRS     R5,R5,#+1
        UXTH     R5,R5
        ADDS     R4,R4,R5
        LDR      R5,[R4, #+0]
        MOVS     R6,#+112
        BICS     R5,R5,R6
        STR      R5,[R4, #+0]
        LDR      R5,[R4, #+0]
        UXTH     R2,R2
        ORRS     R5,R5,R2
        STR      R5,[R4, #+0]
        B        ??TIM_SelectOCxM_2
??TIM_SelectOCxM_1:
        SUBS     R5,R1,#+4
        UXTH     R5,R5
        LSRS     R5,R5,#+1
        UXTH     R5,R5
        ADDS     R4,R4,R5
        LDR      R5,[R4, #+0]
        LDR      R6,??DataTable37  ;; 0xffff8fff
        ANDS     R6,R6,R5
        STR      R6,[R4, #+0]
        LDR      R5,[R4, #+0]
        LSLS     R6,R2,#+8
        UXTH     R6,R6
        ORRS     R5,R5,R6
        STR      R5,[R4, #+0]
??TIM_SelectOCxM_2:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x40014000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCompare1:
        STR      R1,[R0, #+52]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCompare2:
        STR      R1,[R0, #+56]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCompare3:
        STR      R1,[R0, #+60]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetCompare4:
        STR      R1,[R0, #+64]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ForcedOC1Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable27  ;; 0xff8f
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ForcedOC2Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable19  ;; 0x8fff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ForcedOC3Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable27  ;; 0xff8f
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     0xfeff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ForcedOC4Config:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable19  ;; 0x8fff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CCPreloadControl:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_CCPreloadControl_0
        LDRH     R2,[R0, #+4]
        MOVS     R3,#+1
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+4]
        B        ??TIM_CCPreloadControl_1
??TIM_CCPreloadControl_0:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable37_1  ;; 0xfffe
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
??TIM_CCPreloadControl_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0xffef

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1PreloadConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable37_2  ;; 0xfff7
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0x8fff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0xfcff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2PreloadConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable30  ;; 0xf7ff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     0xffdf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3PreloadConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable37_2  ;; 0xfff7
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC4PreloadConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable30  ;; 0xf7ff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0xfbff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1FastConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable41  ;; 0xfffb
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0xfdff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2FastConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable41_1  ;; 0xfbff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3FastConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable41  ;; 0xfffb
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0xffbf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC4FastConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable41_1  ;; 0xfbff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearOC1Ref:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable41_2  ;; 0xff7f
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     0xff8f

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearOC2Ref:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+24]
        MOVS     R2,R3
        LSLS     R2,R2,#+17       ;; ZeroExtS R2,R2,#+17,#+17
        LSRS     R2,R2,#+17
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearOC3Ref:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable41_2  ;; 0xff7f
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28:
        DC32     0xf7ff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearOC4Ref:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+28]
        MOVS     R2,R3
        LSLS     R2,R2,#+17       ;; ZeroExtS R2,R2,#+17,#+17
        LSRS     R2,R2,#+17
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1PolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable41_3  ;; 0xfffd
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC1NPolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable37_2  ;; 0xfff7
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     0xf7ff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2PolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable43  ;; 0xffdf
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+4
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable31:
        DC32     0xefff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC2NPolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable41_2  ;; 0xff7f
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+4
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3PolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable43_1  ;; 0xfdff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33:
        DC32     0xdfff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC3NPolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable43_2  ;; 0xf7ff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+8
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_OC4PolarityConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+32]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable36_1  ;; 0xdfff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LSLS     R2,R1,#+12
        ORRS     R2,R2,R3
        STRH     R2,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectOCREFClear:
        LDRH     R2,[R0, #+8]
        LDR      R3,??DataTable37_2  ;; 0xfff7
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+8]
        LDRH     R2,[R0, #+8]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36:
        DC32     0xbfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable36_1:
        DC32     0xdfff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CCxCmd:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+1
        LSLS     R4,R4,R1
        MOVS     R3,R4
        LDRH     R4,[R0, #+32]
        BICS     R4,R4,R3
        STRH     R4,[R0, #+32]
        LDRH     R4,[R0, #+32]
        UXTH     R2,R2
        MOVS     R5,R2
        LSLS     R5,R5,R1
        ORRS     R5,R5,R4
        STRH     R5,[R0, #+32]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_CCxNCmd:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+4
        LSLS     R4,R4,R1
        MOVS     R3,R4
        LDRH     R4,[R0, #+32]
        BICS     R4,R4,R3
        STRH     R4,[R0, #+32]
        LDRH     R4,[R0, #+32]
        UXTH     R2,R2
        MOVS     R5,R2
        LSLS     R5,R5,R1
        ORRS     R5,R5,R4
        STRH     R5,[R0, #+32]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectCOM:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_SelectCOM_0
        LDRH     R2,[R0, #+4]
        MOVS     R3,#+4
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+4]
        B        ??TIM_SelectCOM_1
??TIM_SelectCOM_0:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable41  ;; 0xfffb
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
??TIM_SelectCOM_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37:
        DC32     0xffff8fff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_1:
        DC32     0xfffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_2:
        DC32     0xfff7

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ICInit:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BNE      ??TIM_ICInit_0
        LDRH     R3,[R4, #+8]
        LDRH     R2,[R4, #+4]
        LDRH     R1,[R4, #+2]
        MOVS     R0,R5
        BL       TI1_Config
        LDRH     R1,[R4, #+6]
        MOVS     R0,R5
        BL       TIM_SetIC1Prescaler
        B        ??TIM_ICInit_1
??TIM_ICInit_0:
        LDRH     R0,[R4, #+0]
        CMP      R0,#+4
        BNE      ??TIM_ICInit_2
        LDRH     R3,[R4, #+8]
        LDRH     R2,[R4, #+4]
        LDRH     R1,[R4, #+2]
        MOVS     R0,R5
        BL       TI2_Config
        LDRH     R1,[R4, #+6]
        MOVS     R0,R5
        BL       TIM_SetIC2Prescaler
        B        ??TIM_ICInit_1
??TIM_ICInit_2:
        LDRH     R0,[R4, #+0]
        CMP      R0,#+8
        BNE      ??TIM_ICInit_3
        LDRH     R3,[R4, #+8]
        LDRH     R2,[R4, #+4]
        LDRH     R1,[R4, #+2]
        MOVS     R0,R5
        BL       TI3_Config
        LDRH     R1,[R4, #+6]
        MOVS     R0,R5
        BL       TIM_SetIC3Prescaler
        B        ??TIM_ICInit_1
??TIM_ICInit_3:
        LDRH     R3,[R4, #+8]
        LDRH     R2,[R4, #+4]
        LDRH     R1,[R4, #+2]
        MOVS     R0,R5
        BL       TI4_Config
        LDRH     R1,[R4, #+6]
        MOVS     R0,R5
        BL       TIM_SetIC4Prescaler
??TIM_ICInit_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ICStructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+1
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_PWMIConfig:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R7,#+0
        MOVS     R6,#+1
        LDRH     R0,[R4, #+2]
        CMP      R0,#+0
        BNE      ??TIM_PWMIConfig_0
        MOVS     R0,#+2
        MOVS     R7,R0
        B        ??TIM_PWMIConfig_1
??TIM_PWMIConfig_0:
        MOVS     R0,#+0
        MOVS     R7,R0
??TIM_PWMIConfig_1:
        LDRH     R0,[R4, #+4]
        CMP      R0,#+1
        BNE      ??TIM_PWMIConfig_2
        MOVS     R0,#+2
        MOVS     R6,R0
        B        ??TIM_PWMIConfig_3
??TIM_PWMIConfig_2:
        MOVS     R0,#+1
        MOVS     R6,R0
??TIM_PWMIConfig_3:
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BNE      ??TIM_PWMIConfig_4
        LDRH     R3,[R4, #+8]
        LDRH     R2,[R4, #+4]
        LDRH     R1,[R4, #+2]
        MOVS     R0,R5
        BL       TI1_Config
        LDRH     R1,[R4, #+6]
        MOVS     R0,R5
        BL       TIM_SetIC1Prescaler
        LDRH     R3,[R4, #+8]
        MOVS     R2,R6
        UXTH     R2,R2
        MOVS     R1,R7
        UXTH     R1,R1
        MOVS     R0,R5
        BL       TI2_Config
        LDRH     R1,[R4, #+6]
        MOVS     R0,R5
        BL       TIM_SetIC2Prescaler
        B        ??TIM_PWMIConfig_5
??TIM_PWMIConfig_4:
        LDRH     R3,[R4, #+8]
        LDRH     R2,[R4, #+4]
        LDRH     R1,[R4, #+2]
        MOVS     R0,R5
        BL       TI2_Config
        LDRH     R1,[R4, #+6]
        MOVS     R0,R5
        BL       TIM_SetIC2Prescaler
        LDRH     R3,[R4, #+8]
        MOVS     R2,R6
        UXTH     R2,R2
        MOVS     R1,R7
        UXTH     R1,R1
        MOVS     R0,R5
        BL       TI1_Config
        LDRH     R1,[R4, #+6]
        MOVS     R0,R5
        BL       TIM_SetIC1Prescaler
??TIM_PWMIConfig_5:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCapture1:
        LDR      R0,[R0, #+52]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCapture2:
        LDR      R0,[R0, #+56]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCapture3:
        LDR      R0,[R0, #+60]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetCapture4:
        LDR      R0,[R0, #+64]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetIC1Prescaler:
        LDRH     R2,[R0, #+24]
        LDR      R3,??DataTable52  ;; 0xfff3
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+24]
        LDRH     R2,[R0, #+24]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetIC2Prescaler:
        LDRH     R2,[R0, #+24]
        LDR      R3,??DataTable52_1  ;; 0xf3ff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+24]
        LDRH     R2,[R0, #+24]
        LSLS     R3,R1,#+8
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetIC3Prescaler:
        LDRH     R2,[R0, #+28]
        LDR      R3,??DataTable52  ;; 0xfff3
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+28]
        LDRH     R2,[R0, #+28]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SetIC4Prescaler:
        LDRH     R2,[R0, #+28]
        LDR      R3,??DataTable52_1  ;; 0xf3ff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+28]
        LDRH     R2,[R0, #+28]
        LSLS     R3,R1,#+8
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable41:
        DC32     0xfffb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable41_1:
        DC32     0xfbff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable41_2:
        DC32     0xff7f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable41_3:
        DC32     0xfffd

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ITConfig:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??TIM_ITConfig_0
        LDRH     R3,[R0, #+12]
        ORRS     R3,R3,R1
        STRH     R3,[R0, #+12]
        B        ??TIM_ITConfig_1
??TIM_ITConfig_0:
        LDRH     R3,[R0, #+12]
        BICS     R3,R3,R1
        STRH     R3,[R0, #+12]
??TIM_ITConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GenerateEvent:
        STRH     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetFlagStatus:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R3,[R2, #+16]
        TST      R3,R1
        BEQ      ??TIM_GetFlagStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B        ??TIM_GetFlagStatus_1
??TIM_GetFlagStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??TIM_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearFlag:
        UXTH     R1,R1
        MVNS     R2,R1
        STRH     R2,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_GetITStatus:
        PUSH     {R4,R5,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        LDRH     R5,[R2, #+16]
        ANDS     R5,R5,R1
        MOVS     R3,R5
        LDRH     R5,[R2, #+12]
        ANDS     R5,R5,R1
        MOVS     R4,R5
        UXTH     R3,R3
        CMP      R3,#+0
        BEQ      ??TIM_GetITStatus_0
        UXTH     R4,R4
        CMP      R4,#+0
        BEQ      ??TIM_GetITStatus_0
        MOVS     R5,#+1
        MOVS     R0,R5
        B        ??TIM_GetITStatus_1
??TIM_GetITStatus_0:
        MOVS     R5,#+0
        MOVS     R0,R5
??TIM_GetITStatus_1:
        UXTB     R0,R0
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ClearITPendingBit:
        UXTH     R1,R1
        MVNS     R2,R1
        STRH     R2,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_DMAConfig:
        PUSH     {R4}
        MOVS     R3,R2
        ORRS     R3,R3,R1
        MOVS     R4,#+72
        STRH     R3,[R0, R4]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_DMACmd:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??TIM_DMACmd_0
        LDRH     R3,[R0, #+12]
        ORRS     R3,R3,R1
        STRH     R3,[R0, #+12]
        B        ??TIM_DMACmd_1
??TIM_DMACmd_0:
        LDRH     R3,[R0, #+12]
        BICS     R3,R3,R1
        STRH     R3,[R0, #+12]
??TIM_DMACmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectCCDMA:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_SelectCCDMA_0
        LDRH     R2,[R0, #+4]
        MOVS     R3,#+8
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+4]
        B        ??TIM_SelectCCDMA_1
??TIM_SelectCCDMA_0:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable54  ;; 0xfff7
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
??TIM_SelectCCDMA_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_InternalClockConfig:
        LDRH     R1,[R0, #+8]
        LDR      R2,??DataTable54_1  ;; 0xfff8
        ANDS     R2,R2,R1
        STRH     R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable43:
        DC32     0xffdf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable43_1:
        DC32     0xfdff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable43_2:
        DC32     0xf7ff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ITRxExternalClockConfig:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R1,R4
        UXTH     R1,R1
        MOVS     R0,R5
        BL       TIM_SelectInputTrigger
        LDRH     R0,[R5, #+8]
        MOVS     R1,#+7
        ORRS     R1,R1,R0
        STRH     R1,[R5, #+8]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_TIxExternalClockConfig:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R7,R3
        UXTH     R6,R6
        CMP      R6,#+96
        BNE      ??TIM_TIxExternalClockConfig_0
        MOVS     R3,R7
        UXTH     R3,R3
        MOVS     R2,#+1
        MOVS     R1,R5
        UXTH     R1,R1
        MOVS     R0,R4
        BL       TI2_Config
        B        ??TIM_TIxExternalClockConfig_1
??TIM_TIxExternalClockConfig_0:
        MOVS     R3,R7
        UXTH     R3,R3
        MOVS     R2,#+1
        MOVS     R1,R5
        UXTH     R1,R1
        MOVS     R0,R4
        BL       TI1_Config
??TIM_TIxExternalClockConfig_1:
        MOVS     R1,R6
        UXTH     R1,R1
        MOVS     R0,R4
        BL       TIM_SelectInputTrigger
        LDRH     R0,[R4, #+8]
        MOVS     R1,#+7
        ORRS     R1,R1,R0
        STRH     R1,[R4, #+8]
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ETRClockMode1Config:
        PUSH     {R1,R4-R7,LR}
        MOVS     R5,R0
        MOVS     R7,R2
        MOVS     R6,R3
        MOVS     R4,#+0
        MOVS     R3,R6
        UXTH     R3,R3
        MOVS     R2,R7
        UXTH     R2,R2
        MOV      R0,SP
        LDRH     R1,[R0, #+0]
        MOVS     R0,R5
        BL       TIM_ETRConfig
        LDRH     R0,[R5, #+8]
        MOVS     R4,R0
        MOVS     R0,R4
        LDR      R4,??DataTable54_1  ;; 0xfff8
        ANDS     R4,R4,R0
        MOVS     R0,R4
        MOVS     R4,#+7
        ORRS     R4,R4,R0
        MOVS     R0,R4
        LDR      R4,??DataTable54_2  ;; 0xff8f
        ANDS     R4,R4,R0
        MOVS     R0,R4
        MOVS     R4,#+112
        ORRS     R4,R4,R0
        STRH     R4,[R5, #+8]
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ETRClockMode2Config:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R6,R2
        MOVS     R5,R3
        MOVS     R3,R5
        UXTH     R3,R3
        MOVS     R2,R6
        UXTH     R2,R2
        MOVS     R1,R7
        UXTH     R1,R1
        MOVS     R0,R4
        BL       TIM_ETRConfig
        LDRH     R0,[R4, #+8]
        MOVS     R1,#+128
        LSLS     R1,R1,#+7        ;; #+16384
        ORRS     R1,R1,R0
        STRH     R1,[R4, #+8]
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectInputTrigger:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+8]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable54_2  ;; 0xff8f
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectOutputTrigger:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable54_2  ;; 0xff8f
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectSlaveMode:
        LDRH     R2,[R0, #+8]
        LDR      R3,??DataTable54_1  ;; 0xfff8
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+8]
        LDRH     R2,[R0, #+8]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectMasterSlaveMode:
        LDRH     R2,[R0, #+8]
        LDR      R3,??DataTable54_3  ;; 0xff7f
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+8]
        LDRH     R2,[R0, #+8]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_ETRConfig:
        PUSH     {R4,R5}
        MOVS     R4,#+0
        LDRH     R5,[R0, #+8]
        MOVS     R4,R5
        UXTB     R4,R4
        MOVS     R5,R4
        LSLS     R4,R3,#+8
        ORRS     R4,R4,R2
        ORRS     R4,R4,R1
        ORRS     R4,R4,R5
        STRH     R4,[R0, #+8]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_EncoderInterfaceConfig:
        PUSH     {R4-R7}
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        LDRH     R7,[R0, #+8]
        MOVS     R4,R7
        LDRH     R7,[R0, #+24]
        MOVS     R5,R7
        LDRH     R7,[R0, #+32]
        MOVS     R6,R7
        MOVS     R7,R4
        LDR      R4,??DataTable54_1  ;; 0xfff8
        ANDS     R4,R4,R7
        ORRS     R4,R4,R1
        MOVS     R7,R5
        LDR      R5,??DataTable54_4  ;; 0xfcfc
        ANDS     R5,R5,R7
        MOVS     R7,R5
        MOVS     R5,#+255
        ADDS     R5,R5,#+2        ;; #+257
        ORRS     R5,R5,R7
        MOVS     R7,R6
        LDR      R6,??DataTable54_5  ;; 0xff55
        ANDS     R6,R6,R7
        MOVS     R7,R6
        LSLS     R6,R3,#+4
        ORRS     R6,R6,R2
        ORRS     R6,R6,R7
        STRH     R4,[R0, #+8]
        STRH     R5,[R0, #+24]
        STRH     R6,[R0, #+32]
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_SelectHallSensor:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??TIM_SelectHallSensor_0
        LDRH     R2,[R0, #+4]
        MOVS     R3,#+128
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+4]
        B        ??TIM_SelectHallSensor_1
??TIM_SelectHallSensor_0:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable54_3  ;; 0xff7f
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
??TIM_SelectHallSensor_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM_RemapConfig:
        MOVS     R2,#+80
        STRH     R1,[R0, R2]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TI1_Config:
        PUSH     {R4-R7}
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRH     R6,[R0, #+32]
        LDR      R7,??DataTable54_6  ;; 0xfffe
        ANDS     R7,R7,R6
        STRH     R7,[R0, #+32]
        LDRH     R6,[R0, #+24]
        MOVS     R4,R6
        LDRH     R6,[R0, #+32]
        MOVS     R5,R6
        MOVS     R6,R4
        LDR      R4,??DataTable54_7  ;; 0xff0c
        ANDS     R4,R4,R6
        MOVS     R6,R4
        LSLS     R4,R3,#+4
        ORRS     R4,R4,R2
        ORRS     R4,R4,R6
        MOVS     R6,R5
        LDR      R5,??DataTable54_8  ;; 0xfff5
        ANDS     R5,R5,R6
        MOVS     R6,R5
        MOVS     R5,#+1
        ORRS     R5,R5,R1
        ORRS     R5,R5,R6
        STRH     R4,[R0, #+24]
        STRH     R5,[R0, #+32]
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TI2_Config:
        PUSH     {R1,R4-R7}
        MOVS     R1,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRH     R6,[R0, #+32]
        LDR      R7,??DataTable54_9  ;; 0xffef
        ANDS     R7,R7,R6
        STRH     R7,[R0, #+32]
        LDRH     R6,[R0, #+24]
        MOVS     R1,R6
        LDRH     R6,[R0, #+32]
        MOVS     R4,R6
        MOV      R6,SP
        LDRH     R6,[R6, #+0]
        LSLS     R6,R6,#+4
        MOVS     R5,R6
        MOVS     R6,R1
        LDR      R1,??DataTable54_10  ;; 0xcff
        ANDS     R1,R1,R6
        MOVS     R6,R1
        LSLS     R1,R3,#+12
        ORRS     R1,R1,R6
        MOVS     R6,R1
        LSLS     R1,R2,#+8
        ORRS     R1,R1,R6
        MOVS     R6,R4
        LDR      R4,??DataTable54_11  ;; 0xff5f
        ANDS     R4,R4,R6
        MOVS     R6,R4
        MOVS     R4,#+16
        ORRS     R4,R4,R5
        ORRS     R4,R4,R6
        STRH     R1,[R0, #+24]
        STRH     R4,[R0, #+32]
        POP      {R0,R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable52:
        DC32     0xfff3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable52_1:
        DC32     0xf3ff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TI3_Config:
        PUSH     {R1,R4-R7}
        MOVS     R1,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRH     R6,[R0, #+32]
        LDR      R7,??DataTable54_12  ;; 0xfeff
        ANDS     R7,R7,R6
        STRH     R7,[R0, #+32]
        LDRH     R6,[R0, #+28]
        MOVS     R1,R6
        LDRH     R6,[R0, #+32]
        MOVS     R4,R6
        MOV      R6,SP
        LDRH     R6,[R6, #+0]
        LSLS     R6,R6,#+8
        MOVS     R5,R6
        MOVS     R6,R1
        LDR      R1,??DataTable54_7  ;; 0xff0c
        ANDS     R1,R1,R6
        MOVS     R6,R1
        LSLS     R1,R3,#+4
        ORRS     R1,R1,R2
        ORRS     R1,R1,R6
        MOVS     R6,R4
        LDR      R4,??DataTable54_13  ;; 0xf5ff
        ANDS     R4,R4,R6
        MOVS     R6,R4
        MOVS     R4,#+128
        LSLS     R4,R4,#+1        ;; #+256
        ORRS     R4,R4,R5
        ORRS     R4,R4,R6
        STRH     R1,[R0, #+28]
        STRH     R4,[R0, #+32]
        POP      {R0,R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TI4_Config:
        PUSH     {R1,R4-R7}
        MOVS     R1,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRH     R6,[R0, #+32]
        LDR      R7,??DataTable54_14  ;; 0xefff
        ANDS     R7,R7,R6
        STRH     R7,[R0, #+32]
        LDRH     R6,[R0, #+28]
        MOVS     R1,R6
        LDRH     R6,[R0, #+32]
        MOVS     R4,R6
        MOV      R6,SP
        LDRH     R6,[R6, #+0]
        LSLS     R6,R6,#+12
        MOVS     R5,R6
        MOVS     R6,R1
        LDR      R1,??DataTable54_10  ;; 0xcff
        ANDS     R1,R1,R6
        MOVS     R6,R1
        LSLS     R1,R2,#+8
        ORRS     R1,R1,R6
        MOVS     R6,R1
        LSLS     R1,R3,#+12
        ORRS     R1,R1,R6
        MOVS     R6,R4
        LDR      R4,??DataTable54_15  ;; 0x5fff
        ANDS     R4,R4,R6
        MOVS     R6,R4
        MOVS     R4,#+128
        LSLS     R4,R4,#+5        ;; #+4096
        ORRS     R4,R4,R5
        ORRS     R4,R4,R6
        STRH     R1,[R0, #+28]
        STRH     R4,[R0, #+32]
        POP      {R0,R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54:
        DC32     0xfff7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_1:
        DC32     0xfff8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_2:
        DC32     0xff8f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_3:
        DC32     0xff7f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_4:
        DC32     0xfcfc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_5:
        DC32     0xff55

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_6:
        DC32     0xfffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_7:
        DC32     0xff0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_8:
        DC32     0xfff5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_9:
        DC32     0xffef

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_10:
        DC32     0xcff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_11:
        DC32     0xff5f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_12:
        DC32     0xfeff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_13:
        DC32     0xf5ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_14:
        DC32     0xefff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable54_15:
        DC32     0x5fff

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
// 3 370 bytes in section .text
// 
// 3 370 bytes of CODE memory
//
//Errors: none
//Warnings: none

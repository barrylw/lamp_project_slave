///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:24
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_usart.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_usart.c
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
//    List file    =  
//        G:\gitclone\lamp_project_slave\Debug\List\stm32f0xx_usart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd
        EXTERN RCC_GetClocksFreq
        EXTERN __aeabi_uidiv
        EXTERN __aeabi_uidivmod

        PUBLIC USART_AddressDetectionConfig
        PUBLIC USART_AutoBaudRateCmd
        PUBLIC USART_AutoBaudRateConfig
        PUBLIC USART_ClearFlag
        PUBLIC USART_ClearITPendingBit
        PUBLIC USART_ClockInit
        PUBLIC USART_ClockStructInit
        PUBLIC USART_Cmd
        PUBLIC USART_DECmd
        PUBLIC USART_DEPolarityConfig
        PUBLIC USART_DMACmd
        PUBLIC USART_DMAReceptionErrorConfig
        PUBLIC USART_DataInvCmd
        PUBLIC USART_DeInit
        PUBLIC USART_DirectionModeCmd
        PUBLIC USART_GetFlagStatus
        PUBLIC USART_GetITStatus
        PUBLIC USART_HalfDuplexCmd
        PUBLIC USART_ITConfig
        PUBLIC USART_Init
        PUBLIC USART_InvPinCmd
        PUBLIC USART_IrDACmd
        PUBLIC USART_IrDAConfig
        PUBLIC USART_LINBreakDetectLengthConfig
        PUBLIC USART_LINCmd
        PUBLIC USART_MSBFirstCmd
        PUBLIC USART_MuteModeCmd
        PUBLIC USART_MuteModeWakeUpConfig
        PUBLIC USART_OneBitMethodCmd
        PUBLIC USART_OverSampling8Cmd
        PUBLIC USART_OverrunDetectionConfig
        PUBLIC USART_ReceiveData
        PUBLIC USART_ReceiverTimeOutCmd
        PUBLIC USART_RequestCmd
        PUBLIC USART_STOPModeCmd
        PUBLIC USART_SWAPPinCmd
        PUBLIC USART_SendData
        PUBLIC USART_SetAddress
        PUBLIC USART_SetAutoRetryCount
        PUBLIC USART_SetBlockLength
        PUBLIC USART_SetDEAssertionTime
        PUBLIC USART_SetDEDeassertionTime
        PUBLIC USART_SetGuardTime
        PUBLIC USART_SetPrescaler
        PUBLIC USART_SetReceiverTimeOut
        PUBLIC USART_SmartCardCmd
        PUBLIC USART_SmartCardNACKCmd
        PUBLIC USART_StopModeWakeUpSourceConfig
        PUBLIC USART_StructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable11  ;; 0x40013800
        CMP      R4,R0
        BNE      ??USART_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+7        ;; #+16384
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+7        ;; #+16384
        BL       RCC_APB2PeriphResetCmd
        B        ??USART_DeInit_1
??USART_DeInit_0:
        LDR      R0,??DataTable12  ;; 0x40004400
        CMP      R4,R0
        BNE      ??USART_DeInit_1
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_APB1PeriphResetCmd
??USART_DeInit_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_Init:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+36
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R5,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R4,#+0
        LDR      R0,[R6, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        STR      R0,[R6, #+0]
        LDR      R0,[R6, #+4]
        MOVS     R4,R0
        MOVS     R0,R4
        LDR      R4,??DataTable13  ;; 0xffffcfff
        ANDS     R4,R4,R0
        MOVS     R0,R4
        LDR      R4,[R7, #+8]
        ORRS     R4,R4,R0
        STR      R4,[R6, #+4]
        LDR      R0,[R6, #+0]
        MOVS     R4,R0
        MOVS     R0,R4
        LDR      R4,??DataTable13_1  ;; 0xffffe9f3
        ANDS     R4,R4,R0
        LDR      R0,[R7, #+4]
        LDR      R1,[R7, #+12]
        ORRS     R1,R1,R0
        LDR      R0,[R7, #+16]
        ORRS     R0,R0,R1
        ORRS     R0,R0,R4
        MOVS     R4,R0
        STR      R4,[R6, #+0]
        LDR      R0,[R6, #+8]
        MOVS     R4,R0
        MOVS     R0,R4
        LDR      R4,??DataTable14  ;; 0xfffffcff
        ANDS     R4,R4,R0
        MOVS     R0,R4
        LDR      R4,[R7, #+20]
        ORRS     R4,R4,R0
        STR      R4,[R6, #+8]
        ADD      R0,SP,#+4
        BL       RCC_GetClocksFreq
        LDR      R0,??DataTable11  ;; 0x40013800
        CMP      R6,R0
        BNE      ??USART_Init_0
        LDR      R0,[SP, #+28]
        STR      R0,[SP, #+0]
        B        ??USART_Init_1
??USART_Init_0:
        LDR      R0,[SP, #+12]
        STR      R0,[SP, #+0]
??USART_Init_1:
        LDR      R0,[R6, #+0]
        LSLS     R0,R0,#+16
        BPL      ??USART_Init_2
        LDR      R0,[SP, #+0]
        MOVS     R1,#+2
        MULS     R0,R1,R0
        LDR      R1,[R7, #+0]
        BL       __aeabi_uidiv
        MOVS     R5,R0
        LDR      R0,[SP, #+0]
        MOVS     R1,#+2
        MULS     R0,R1,R0
        LDR      R1,[R7, #+0]
        BL       __aeabi_uidivmod
        MOVS     R4,R1
        B        ??USART_Init_3
??USART_Init_2:
        LDR      R0,[SP, #+0]
        LDR      R1,[R7, #+0]
        BL       __aeabi_uidiv
        MOVS     R5,R0
        LDR      R0,[SP, #+0]
        LDR      R1,[R7, #+0]
        BL       __aeabi_uidivmod
        MOVS     R4,R1
??USART_Init_3:
        LDR      R0,[R7, #+0]
        LSRS     R0,R0,#+1
        CMP      R4,R0
        BCC      ??USART_Init_4
        ADDS     R5,R5,#+1
??USART_Init_4:
        LDR      R0,[R6, #+0]
        LSLS     R0,R0,#+16
        BPL      ??USART_Init_5
        MOVS     R0,R5
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        MOVS     R4,R0
        MOVS     R0,R5
        LDR      R5,??DataTable14_1  ;; 0xfff0
        ANDS     R5,R5,R0
        ORRS     R5,R5,R4
??USART_Init_5:
        MOVS     R0,R5
        STRH     R0,[R6, #+12]
        ADD      SP,SP,#+36
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_StructInit:
        MOVS     R1,#+150
        LSLS     R1,R1,#+6        ;; #+9600
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+12
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClockInit:
        PUSH     {R4,R5}
        MOVS     R2,#+0
        LDR      R3,[R0, #+4]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable15  ;; 0xfffff0ff
        ANDS     R2,R2,R3
        MOVS     R5,R2
        LDR      R2,[R1, #+0]
        LDR      R3,[R1, #+4]
        ORRS     R3,R3,R2
        LDR      R4,[R1, #+8]
        ORRS     R4,R4,R3
        LDR      R2,[R1, #+12]
        ORRS     R2,R2,R4
        ORRS     R2,R2,R5
        STR      R2,[R0, #+4]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClockStructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_Cmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??USART_Cmd_1
??USART_Cmd_0:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        BICS     R2,R2,R3
        STR      R2,[R0, #+0]
??USART_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DirectionModeCmd:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??USART_DirectionModeCmd_0
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,R1
        STR      R3,[R0, #+0]
        B        ??USART_DirectionModeCmd_1
??USART_DirectionModeCmd_0:
        LDR      R3,[R0, #+0]
        BICS     R3,R3,R1
        STR      R3,[R0, #+0]
??USART_DirectionModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_OverSampling8Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_OverSampling8Cmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+8        ;; #+32768
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??USART_OverSampling8Cmd_1
??USART_OverSampling8Cmd_0:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable19  ;; 0xffff7fff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
??USART_OverSampling8Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_OneBitMethodCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_OneBitMethodCmd_0
        LDR      R2,[R0, #+8]
        MOVS     R3,#+128
        LSLS     R3,R3,#+4        ;; #+2048
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
        B        ??USART_OneBitMethodCmd_1
??USART_OneBitMethodCmd_0:
        LDR      R2,[R0, #+8]
        LDR      R3,??DataTable19_1  ;; 0xfffff7ff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+8]
??USART_OneBitMethodCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_MSBFirstCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_MSBFirstCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+12       ;; #+524288
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??USART_MSBFirstCmd_1
??USART_MSBFirstCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable20  ;; 0xfff7ffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??USART_MSBFirstCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DataInvCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_DataInvCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+11       ;; #+262144
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??USART_DataInvCmd_1
??USART_DataInvCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable20_1  ;; 0xfffbffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??USART_DataInvCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_InvPinCmd:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??USART_InvPinCmd_0
        LDR      R3,[R0, #+4]
        ORRS     R3,R3,R1
        STR      R3,[R0, #+4]
        B        ??USART_InvPinCmd_1
??USART_InvPinCmd_0:
        LDR      R3,[R0, #+4]
        BICS     R3,R3,R1
        STR      R3,[R0, #+4]
??USART_InvPinCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SWAPPinCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_SWAPPinCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+8        ;; #+32768
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??USART_SWAPPinCmd_1
??USART_SWAPPinCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable19  ;; 0xffff7fff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??USART_SWAPPinCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ReceiverTimeOutCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_ReceiverTimeOutCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+16       ;; #+8388608
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??USART_ReceiverTimeOutCmd_1
??USART_ReceiverTimeOutCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable21  ;; 0xff7fffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??USART_ReceiverTimeOutCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetReceiverTimeOut:
        LDR      R2,[R0, #+20]
        LSRS     R2,R2,#+24
        LSLS     R2,R2,#+24
        STR      R2,[R0, #+20]
        LDR      R2,[R0, #+20]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetPrescaler:
        LDRH     R2,[R0, #+16]
        MOVS     R3,#+255
        LSLS     R3,R3,#+8        ;; #+65280
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+16]
        LDRH     R2,[R0, #+16]
        UXTB     R1,R1
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_STOPModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_STOPModeCmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+2
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??USART_STOPModeCmd_1
??USART_STOPModeCmd_0:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+2
        BICS     R2,R2,R3
        STR      R2,[R0, #+0]
??USART_STOPModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_StopModeWakeUpSourceConfig:
        LDR      R2,[R0, #+8]
        LDR      R3,??DataTable21_1  ;; 0xffcfffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+8]
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_AutoBaudRateCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_AutoBaudRateCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+13       ;; #+1048576
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??USART_AutoBaudRateCmd_1
??USART_AutoBaudRateCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable21_2  ;; 0xffefffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??USART_AutoBaudRateCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_AutoBaudRateConfig:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable21_3  ;; 0xff9fffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
        LDR      R2,[R0, #+4]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SendData:
        LSLS     R2,R1,#+23       ;; ZeroExtS R2,R1,#+23,#+23
        LSRS     R2,R2,#+23
        STRH     R2,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ReceiveData:
        LDRH     R0,[R0, #+36]
        LSLS     R0,R0,#+23       ;; ZeroExtS R0,R0,#+23,#+23
        LSRS     R0,R0,#+23
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetAddress:
        LDR      R2,[R0, #+4]
        LSLS     R2,R2,#+8        ;; ZeroExtS R2,R2,#+8,#+8
        LSRS     R2,R2,#+8
        STR      R2,[R0, #+4]
        LDR      R2,[R0, #+4]
        UXTB     R1,R1
        LSLS     R3,R1,#+24
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_MuteModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_MuteModeCmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+6        ;; #+8192
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??USART_MuteModeCmd_1
??USART_MuteModeCmd_0:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable21_4  ;; 0xffffdfff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
??USART_MuteModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_MuteModeWakeUpConfig:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable19_1  ;; 0xfffff7ff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
        LDR      R2,[R0, #+0]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0xffffcfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0xffffe9f3

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_AddressDetectionConfig:
        LDR      R2,[R0, #+4]
        MOVS     R3,#+16
        BICS     R2,R2,R3
        STR      R2,[R0, #+4]
        LDR      R2,[R0, #+4]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_LINBreakDetectLengthConfig:
        LDR      R2,[R0, #+4]
        MOVS     R3,#+32
        BICS     R2,R2,R3
        STR      R2,[R0, #+4]
        LDR      R2,[R0, #+4]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_LINCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_LINCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+7        ;; #+16384
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??USART_LINCmd_1
??USART_LINCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable21_5  ;; 0xffffbfff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??USART_LINCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     0xfffffcff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     0xfff0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_HalfDuplexCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_HalfDuplexCmd_0
        LDR      R2,[R0, #+8]
        MOVS     R3,#+8
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
        B        ??USART_HalfDuplexCmd_1
??USART_HalfDuplexCmd_0:
        LDR      R2,[R0, #+8]
        MOVS     R3,#+8
        BICS     R2,R2,R3
        STR      R2,[R0, #+8]
??USART_HalfDuplexCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetGuardTime:
        LDRH     R2,[R0, #+16]
        UXTB     R2,R2
        STRH     R2,[R0, #+16]
        LDRH     R2,[R0, #+16]
        UXTB     R1,R1
        LSLS     R3,R1,#+8
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SmartCardCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_SmartCardCmd_0
        LDR      R2,[R0, #+8]
        MOVS     R3,#+32
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
        B        ??USART_SmartCardCmd_1
??USART_SmartCardCmd_0:
        LDR      R2,[R0, #+8]
        MOVS     R3,#+32
        BICS     R2,R2,R3
        STR      R2,[R0, #+8]
??USART_SmartCardCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SmartCardNACKCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_SmartCardNACKCmd_0
        LDR      R2,[R0, #+8]
        MOVS     R3,#+16
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
        B        ??USART_SmartCardNACKCmd_1
??USART_SmartCardNACKCmd_0:
        LDR      R2,[R0, #+8]
        MOVS     R3,#+16
        BICS     R2,R2,R3
        STR      R2,[R0, #+8]
??USART_SmartCardNACKCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetAutoRetryCount:
        LDR      R2,[R0, #+8]
        LDR      R3,??DataTable21_6  ;; 0xfff1ffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+8]
        LDR      R2,[R0, #+8]
        UXTB     R1,R1
        LSLS     R3,R1,#+17
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0xfffff0ff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetBlockLength:
        LDR      R2,[R0, #+20]
        LSLS     R2,R2,#+8        ;; ZeroExtS R2,R2,#+8,#+8
        LSRS     R2,R2,#+8
        STR      R2,[R0, #+20]
        LDR      R2,[R0, #+20]
        UXTB     R1,R1
        LSLS     R3,R1,#+24
        ORRS     R3,R3,R2
        STR      R3,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_IrDAConfig:
        LDR      R2,[R0, #+8]
        MOVS     R3,#+4
        BICS     R2,R2,R3
        STR      R2,[R0, #+8]
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_IrDACmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_IrDACmd_0
        LDR      R2,[R0, #+8]
        MOVS     R3,#+2
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
        B        ??USART_IrDACmd_1
??USART_IrDACmd_0:
        LDR      R2,[R0, #+8]
        MOVS     R3,#+2
        BICS     R2,R2,R3
        STR      R2,[R0, #+8]
??USART_IrDACmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DECmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??USART_DECmd_0
        LDR      R2,[R0, #+8]
        MOVS     R3,#+128
        LSLS     R3,R3,#+7        ;; #+16384
        ORRS     R3,R3,R2
        STR      R3,[R0, #+8]
        B        ??USART_DECmd_1
??USART_DECmd_0:
        LDR      R2,[R0, #+8]
        LDR      R3,??DataTable21_5  ;; 0xffffbfff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+8]
??USART_DECmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DEPolarityConfig:
        LDR      R2,[R0, #+8]
        LDR      R3,??DataTable19  ;; 0xffff7fff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+8]
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetDEAssertionTime:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable21_7  ;; 0xfc1fffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
        LDR      R2,[R0, #+0]
        LSLS     R3,R1,#+21
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_SetDEDeassertionTime:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable21_8  ;; 0xffe0ffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
        LDR      R2,[R0, #+0]
        LSLS     R3,R1,#+16
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0xffff7fff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0xfffff7ff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DMACmd:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??USART_DMACmd_0
        LDR      R3,[R0, #+8]
        ORRS     R3,R3,R1
        STR      R3,[R0, #+8]
        B        ??USART_DMACmd_1
??USART_DMACmd_0:
        LDR      R3,[R0, #+8]
        BICS     R3,R3,R1
        STR      R3,[R0, #+8]
??USART_DMACmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_DMAReceptionErrorConfig:
        LDR      R2,[R0, #+8]
        LDR      R3,??DataTable21_4  ;; 0xffffdfff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+8]
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     0xfff7ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_1:
        DC32     0xfffbffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ITConfig:
        PUSH     {R4-R7,LR}
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R6,R0
        MOVS     R7,R1
        UXTH     R7,R7
        LSRS     R7,R7,#+8
        UXTH     R7,R7
        MOVS     R3,R7
        UXTB     R7,R1
        MOVS     R4,R7
        MOVS     R7,#+1
        LSLS     R7,R7,R4
        MOVS     R5,R7
        CMP      R3,#+2
        BNE      ??USART_ITConfig_0
        ADDS     R6,R6,#+4
        B        ??USART_ITConfig_1
??USART_ITConfig_0:
        CMP      R3,#+3
        BNE      ??USART_ITConfig_1
        ADDS     R6,R6,#+8
??USART_ITConfig_1:
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??USART_ITConfig_2
        LDR      R7,[R6, #+0]
        ORRS     R7,R7,R5
        STR      R7,[R6, #+0]
        B        ??USART_ITConfig_3
??USART_ITConfig_2:
        LDR      R7,[R6, #+0]
        BICS     R7,R7,R5
        STR      R7,[R6, #+0]
??USART_ITConfig_3:
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_RequestCmd:
        PUSH     {R4,LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??USART_RequestCmd_0
        LDRH     R3,[R0, #+24]
        MOVS     R4,R1
        ORRS     R4,R4,R3
        STRH     R4,[R0, #+24]
        B        ??USART_RequestCmd_1
??USART_RequestCmd_0:
        LDRH     R3,[R0, #+24]
        MOVS     R4,R1
        BICS     R3,R3,R4
        STRH     R3,[R0, #+24]
??USART_RequestCmd_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_OverrunDetectionConfig:
        LDR      R2,[R0, #+8]
        LDR      R3,??DataTable21_9  ;; 0xffffefff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+8]
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,R1
        STR      R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0xff7fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_1:
        DC32     0xffcfffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_2:
        DC32     0xffefffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_3:
        DC32     0xff9fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_4:
        DC32     0xffffdfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_5:
        DC32     0xffffbfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_6:
        DC32     0xfff1ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_7:
        DC32     0xfc1fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_8:
        DC32     0xffe0ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_9:
        DC32     0xffffefff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_GetFlagStatus:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        LDR      R3,[R2, #+28]
        ANDS     R3,R3,R1
        CMP      R3,#+0
        BEQ      ??USART_GetFlagStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B        ??USART_GetFlagStatus_1
??USART_GetFlagStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??USART_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClearFlag:
        STR      R1,[R0, #+32]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_GetITStatus:
        PUSH     {R4-R7,LR}
        MOVS     R3,R0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R0,#+0
        MOVS     R2,R1
        UXTH     R2,R2
        LSRS     R2,R2,#+8
        UXTH     R2,R2
        MOVS     R6,R2
        UXTB     R2,R1
        MOVS     R5,R2
        MOVS     R7,#+1
        MOVS     R2,R5
        MOVS     R5,R7
        LSLS     R5,R5,R2
        CMP      R6,#+1
        BNE      ??USART_GetITStatus_0
        MOVS     R2,R5
        LDR      R5,[R3, #+0]
        ANDS     R5,R5,R2
        B        ??USART_GetITStatus_1
??USART_GetITStatus_0:
        CMP      R6,#+2
        BNE      ??USART_GetITStatus_2
        MOVS     R2,R5
        LDR      R5,[R3, #+4]
        ANDS     R5,R5,R2
        B        ??USART_GetITStatus_1
??USART_GetITStatus_2:
        MOVS     R2,R5
        LDR      R5,[R3, #+8]
        ANDS     R5,R5,R2
??USART_GetITStatus_1:
        MOVS     R2,R1
        LSRS     R2,R2,#+16
        MOVS     R4,R2
        MOVS     R7,#+1
        MOVS     R2,R4
        MOVS     R4,R7
        LSLS     R4,R4,R2
        MOVS     R2,R4
        LDR      R4,[R3, #+28]
        ANDS     R4,R4,R2
        CMP      R5,#+0
        BEQ      ??USART_GetITStatus_3
        CMP      R4,#+0
        BEQ      ??USART_GetITStatus_3
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??USART_GetITStatus_4
??USART_GetITStatus_3:
        MOVS     R2,#+0
        MOVS     R0,R2
??USART_GetITStatus_4:
        UXTB     R0,R0
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_ClearITPendingBit:
        PUSH     {R4}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,R1
        LSRS     R4,R4,#+16
        MOVS     R2,R4
        MOVS     R4,#+1
        LSLS     R4,R4,R2
        MOVS     R3,R4
        STR      R3,[R0, #+32]
        POP      {R4}
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
// 1 542 bytes in section .text
// 
// 1 542 bytes of CODE memory
//
//Errors: none
//Warnings: none

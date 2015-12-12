///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       12/Dec/2015  12:36:20
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_rcc.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_rcc.c
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_rcc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidiv

        PUBLIC RCC_ADCCLKConfig
        PUBLIC RCC_AHBPeriphClockCmd
        PUBLIC RCC_AHBPeriphResetCmd
        PUBLIC RCC_APB1PeriphClockCmd
        PUBLIC RCC_APB1PeriphResetCmd
        PUBLIC RCC_APB2PeriphClockCmd
        PUBLIC RCC_APB2PeriphResetCmd
        PUBLIC RCC_AdjustHSI14CalibrationValue
        PUBLIC RCC_AdjustHSICalibrationValue
        PUBLIC RCC_BackupResetCmd
        PUBLIC RCC_CECCLKConfig
        PUBLIC RCC_ClearFlag
        PUBLIC RCC_ClearITPendingBit
        PUBLIC RCC_ClockSecuritySystemCmd
        PUBLIC RCC_DeInit
        PUBLIC RCC_GetClocksFreq
        PUBLIC RCC_GetFlagStatus
        PUBLIC RCC_GetITStatus
        PUBLIC RCC_GetSYSCLKSource
        PUBLIC RCC_HCLKConfig
        PUBLIC RCC_HSEConfig
        PUBLIC RCC_HSI14ADCRequestCmd
        PUBLIC RCC_HSI14Cmd
        PUBLIC RCC_HSICmd
        PUBLIC RCC_I2CCLKConfig
        PUBLIC RCC_ITConfig
        PUBLIC RCC_LSEConfig
        PUBLIC RCC_LSEDriveConfig
        PUBLIC RCC_LSICmd
        PUBLIC RCC_MCOConfig
        PUBLIC RCC_PCLKConfig
        PUBLIC RCC_PLLCmd
        PUBLIC RCC_PLLConfig
        PUBLIC RCC_PREDIV1Config
        PUBLIC RCC_RTCCLKCmd
        PUBLIC RCC_RTCCLKConfig
        PUBLIC RCC_SYSCLKConfig
        PUBLIC RCC_USARTCLKConfig
        PUBLIC RCC_WaitForHSEStartUp


        SECTION `.data`:DATA:REORDER:NOROOT(2)
APBAHBPrescTable:
        DATA
        DC8 0, 0, 0, 0, 1, 2, 3, 4, 1, 2, 3, 4, 6, 7, 8, 9

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_DeInit:
        LDR      R0,??DataTable18  ;; 0x40021000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable18  ;; 0x40021000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable18_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable18_2  ;; 0x8ffb80c
        ANDS     R1,R1,R0
        LDR      R0,??DataTable18_1  ;; 0x40021004
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable18  ;; 0x40021000
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable18_3  ;; 0xfef6ffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable18  ;; 0x40021000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable18  ;; 0x40021000
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable18_4  ;; 0xfffbffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable18  ;; 0x40021000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable18_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable18_5  ;; 0xffc0ffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable18_1  ;; 0x40021004
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable19  ;; 0x4002102c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+15
        BICS     R0,R0,R1
        LDR      R1,??DataTable19  ;; 0x4002102c
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable19_1  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable19_2  ;; 0xfffffeac
        ANDS     R1,R1,R0
        LDR      R0,??DataTable19_1  ;; 0x40021030
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable20  ;; 0x40021034
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable20  ;; 0x40021034
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable22  ;; 0x40021008
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HSEConfig:
        MOVS     R1,#+0
        LDR      R2,??DataTable22_1  ;; 0x40021002
        STRB     R1,[R2, #+0]
        LDR      R1,??DataTable22_1  ;; 0x40021002
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_WaitForHSEStartUp:
        PUSH     {R3-R5,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R4,#+0
        MOVS     R5,#+0
??RCC_WaitForHSEStartUp_0:
        MOVS     R0,#+17
        BL       RCC_GetFlagStatus
        MOVS     R5,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        MOVS     R1,#+160
        LSLS     R1,R1,#+7        ;; #+20480
        CMP      R0,R1
        BEQ      ??RCC_WaitForHSEStartUp_1
        UXTB     R5,R5
        CMP      R5,#+0
        BEQ      ??RCC_WaitForHSEStartUp_0
??RCC_WaitForHSEStartUp_1:
        MOVS     R0,#+17
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??RCC_WaitForHSEStartUp_2
        MOVS     R0,#+1
        MOVS     R4,R0
        B        ??RCC_WaitForHSEStartUp_3
??RCC_WaitForHSEStartUp_2:
        MOVS     R0,#+0
        MOVS     R4,R0
??RCC_WaitForHSEStartUp_3:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AdjustHSICalibrationValue:
        MOVS     R1,#+0
        LDR      R2,??DataTable18  ;; 0x40021000
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+248
        BICS     R1,R1,R2
        MOVS     R2,R1
        UXTB     R0,R0
        LSLS     R1,R0,#+3
        ORRS     R1,R1,R2
        LDR      R2,??DataTable18  ;; 0x40021000
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HSICmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RCC_HSICmd_0
        LDR      R1,??DataTable18  ;; 0x40021000
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        ORRS     R2,R2,R1
        LDR      R1,??DataTable18  ;; 0x40021000
        STR      R2,[R1, #+0]
        B        ??RCC_HSICmd_1
??RCC_HSICmd_0:
        LDR      R1,??DataTable18  ;; 0x40021000
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        BICS     R1,R1,R2
        LDR      R2,??DataTable18  ;; 0x40021000
        STR      R1,[R2, #+0]
??RCC_HSICmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AdjustHSI14CalibrationValue:
        MOVS     R1,#+0
        LDR      R2,??DataTable20  ;; 0x40021034
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+248
        BICS     R1,R1,R2
        MOVS     R2,R1
        UXTB     R0,R0
        LSLS     R1,R0,#+3
        ORRS     R1,R1,R2
        LDR      R2,??DataTable20  ;; 0x40021034
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HSI14Cmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RCC_HSI14Cmd_0
        LDR      R1,??DataTable20  ;; 0x40021034
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        ORRS     R2,R2,R1
        LDR      R1,??DataTable20  ;; 0x40021034
        STR      R2,[R1, #+0]
        B        ??RCC_HSI14Cmd_1
??RCC_HSI14Cmd_0:
        LDR      R1,??DataTable20  ;; 0x40021034
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        BICS     R1,R1,R2
        LDR      R2,??DataTable20  ;; 0x40021034
        STR      R1,[R2, #+0]
??RCC_HSI14Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HSI14ADCRequestCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RCC_HSI14ADCRequestCmd_0
        LDR      R1,??DataTable20  ;; 0x40021034
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        BICS     R1,R1,R2
        LDR      R2,??DataTable20  ;; 0x40021034
        STR      R1,[R2, #+0]
        B        ??RCC_HSI14ADCRequestCmd_1
??RCC_HSI14ADCRequestCmd_0:
        LDR      R1,??DataTable20  ;; 0x40021034
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        ORRS     R2,R2,R1
        LDR      R1,??DataTable20  ;; 0x40021034
        STR      R2,[R1, #+0]
??RCC_HSI14ADCRequestCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_LSEConfig:
        LDR      R1,??DataTable22_2  ;; 0x40021020
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        BICS     R1,R1,R2
        LDR      R2,??DataTable22_2  ;; 0x40021020
        STR      R1,[R2, #+0]
        LDR      R1,??DataTable22_2  ;; 0x40021020
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        BICS     R1,R1,R2
        LDR      R2,??DataTable22_2  ;; 0x40021020
        STR      R1,[R2, #+0]
        LDR      R1,??DataTable22_2  ;; 0x40021020
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable22_2  ;; 0x40021020
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_LSEDriveConfig:
        LDR      R1,??DataTable22_2  ;; 0x40021020
        LDR      R1,[R1, #+0]
        MOVS     R2,#+24
        BICS     R1,R1,R2
        LDR      R2,??DataTable22_2  ;; 0x40021020
        STR      R1,[R2, #+0]
        LDR      R1,??DataTable22_2  ;; 0x40021020
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable22_2  ;; 0x40021020
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_LSICmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RCC_LSICmd_0
        LDR      R1,??DataTable24  ;; 0x40021024
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        ORRS     R2,R2,R1
        LDR      R1,??DataTable24  ;; 0x40021024
        STR      R2,[R1, #+0]
        B        ??RCC_LSICmd_1
??RCC_LSICmd_0:
        LDR      R1,??DataTable24  ;; 0x40021024
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        BICS     R1,R1,R2
        LDR      R2,??DataTable24  ;; 0x40021024
        STR      R1,[R2, #+0]
??RCC_LSICmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PLLConfig:
        LDR      R2,??DataTable18_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        LDR      R3,??DataTable22_3  ;; 0xffc2ffff
        ANDS     R3,R3,R2
        LDR      R2,??DataTable18_1  ;; 0x40021004
        STR      R3,[R2, #+0]
        LDR      R2,??DataTable18_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R3,R1
        ORRS     R3,R3,R0
        ORRS     R3,R3,R2
        LDR      R2,??DataTable18_1  ;; 0x40021004
        STR      R3,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PLLCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RCC_PLLCmd_0
        LDR      R1,??DataTable18  ;; 0x40021000
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+17       ;; #+16777216
        ORRS     R2,R2,R1
        LDR      R1,??DataTable18  ;; 0x40021000
        STR      R2,[R1, #+0]
        B        ??RCC_PLLCmd_1
??RCC_PLLCmd_0:
        LDR      R1,??DataTable18  ;; 0x40021000
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable24_1  ;; 0xfeffffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable18  ;; 0x40021000
        STR      R2,[R1, #+0]
??RCC_PLLCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PREDIV1Config:
        MOVS     R1,#+0
        LDR      R2,??DataTable19  ;; 0x4002102c
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+15
        BICS     R1,R1,R2
        ORRS     R1,R1,R0
        LDR      R2,??DataTable19  ;; 0x4002102c
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClockSecuritySystemCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RCC_ClockSecuritySystemCmd_0
        LDR      R1,??DataTable18  ;; 0x40021000
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+12       ;; #+524288
        ORRS     R2,R2,R1
        LDR      R1,??DataTable18  ;; 0x40021000
        STR      R2,[R1, #+0]
        B        ??RCC_ClockSecuritySystemCmd_1
??RCC_ClockSecuritySystemCmd_0:
        LDR      R1,??DataTable18  ;; 0x40021000
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable25  ;; 0xfff7ffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable18  ;; 0x40021000
        STR      R2,[R1, #+0]
??RCC_ClockSecuritySystemCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_MCOConfig:
        MOVS     R2,#+0
        LDR      R3,??DataTable18_1  ;; 0x40021004
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable25_1  ;; 0x8ffffff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        UXTB     R0,R0
        LSLS     R2,R0,#+24
        ORRS     R2,R2,R1
        ORRS     R2,R2,R3
        LDR      R3,??DataTable18_1  ;; 0x40021004
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_SYSCLKConfig:
        MOVS     R1,#+0
        LDR      R2,??DataTable18_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+3
        BICS     R1,R1,R2
        ORRS     R1,R1,R0
        LDR      R2,??DataTable18_1  ;; 0x40021004
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetSYSCLKSource:
        LDR      R0,??DataTable29  ;; 0x40021004
        LDR      R1,[R0, #+0]
        MOVS     R0,#+12
        ANDS     R0,R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HCLKConfig:
        MOVS     R1,#+0
        LDR      R2,??DataTable29  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+240
        BICS     R1,R1,R2
        ORRS     R1,R1,R0
        LDR      R2,??DataTable29  ;; 0x40021004
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PCLKConfig:
        MOVS     R1,#+0
        LDR      R2,??DataTable29  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,R1
        LDR      R1,??DataTable28  ;; 0xfffff8ff
        ANDS     R1,R1,R2
        ORRS     R1,R1,R0
        LDR      R2,??DataTable29  ;; 0x40021004
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     0x40021004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_2:
        DC32     0x8ffb80c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_3:
        DC32     0xfef6ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_4:
        DC32     0xfffbffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_5:
        DC32     0xffc0ffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ADCCLKConfig:
        LDR      R1,??DataTable29  ;; 0x40021004
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable29_1  ;; 0xffffbfff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable29  ;; 0x40021004
        STR      R2,[R1, #+0]
        LDR      R1,??DataTable29  ;; 0x40021004
        LDR      R1,[R1, #+0]
        UXTH     R2,R0
        ORRS     R2,R2,R1
        LDR      R1,??DataTable29  ;; 0x40021004
        STR      R2,[R1, #+0]
        LDR      R1,??DataTable19_1  ;; 0x40021030
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable30  ;; 0xfffffeff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable19_1  ;; 0x40021030
        STR      R2,[R1, #+0]
        LDR      R1,??DataTable19_1  ;; 0x40021030
        LDR      R1,[R1, #+0]
        MOVS     R2,R0
        LSRS     R2,R2,#+16
        ORRS     R2,R2,R1
        LDR      R1,??DataTable19_1  ;; 0x40021030
        STR      R2,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0x4002102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0x40021030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_2:
        DC32     0xfffffeac

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_CECCLKConfig:
        LDR      R1,??DataTable32  ;; 0x40021030
        LDR      R1,[R1, #+0]
        MOVS     R2,#+64
        BICS     R1,R1,R2
        LDR      R2,??DataTable32  ;; 0x40021030
        STR      R1,[R2, #+0]
        LDR      R1,??DataTable32  ;; 0x40021030
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable32  ;; 0x40021030
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     0x40021034

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_I2CCLKConfig:
        LDR      R1,??DataTable32  ;; 0x40021030
        LDR      R1,[R1, #+0]
        MOVS     R2,#+16
        BICS     R1,R1,R2
        LDR      R2,??DataTable32  ;; 0x40021030
        STR      R1,[R2, #+0]
        LDR      R1,??DataTable32  ;; 0x40021030
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable32  ;; 0x40021030
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_USARTCLKConfig:
        LDR      R1,??DataTable32  ;; 0x40021030
        LDR      R1,[R1, #+0]
        MOVS     R2,#+3
        BICS     R1,R1,R2
        LDR      R2,??DataTable32  ;; 0x40021030
        STR      R1,[R2, #+0]
        LDR      R1,??DataTable32  ;; 0x40021030
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable32  ;; 0x40021030
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0x40021008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_1:
        DC32     0x40021002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_2:
        DC32     0x40021020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_3:
        DC32     0xffc2ffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetClocksFreq:
        PUSH     {R2-R7,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R7,#+0
        LDR      R0,??DataTable29  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+12
        ANDS     R1,R1,R0
        MOVS     R5,R1
        MOVS     R0,R5
        CMP      R0,#+0
        BEQ      ??RCC_GetClocksFreq_0
        CMP      R0,#+4
        BEQ      ??RCC_GetClocksFreq_1
        CMP      R0,#+8
        BEQ      ??RCC_GetClocksFreq_2
        B        ??RCC_GetClocksFreq_3
??RCC_GetClocksFreq_0:
        LDR      R0,??DataTable35  ;; 0x7a1200
        STR      R0,[R4, #+0]
        B        ??RCC_GetClocksFreq_4
??RCC_GetClocksFreq_1:
        LDR      R0,??DataTable33  ;; 0xf42400
        STR      R0,[R4, #+0]
        B        ??RCC_GetClocksFreq_4
??RCC_GetClocksFreq_2:
        LDR      R0,??DataTable29  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+240
        LSLS     R1,R1,#+14       ;; #+3932160
        ANDS     R1,R1,R0
        MOVS     R6,R1
        LDR      R0,??DataTable29  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        ANDS     R0,R0,R1
        STR      R0,[SP, #+4]
        LSRS     R6,R6,#+18
        ADDS     R6,R6,#+2
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BNE      ??RCC_GetClocksFreq_5
        LDR      R0,??DataTable34  ;; 0x3d0900
        MULS     R0,R6,R0
        STR      R0,[R4, #+0]
        B        ??RCC_GetClocksFreq_6
??RCC_GetClocksFreq_5:
        LDR      R0,??DataTable35_1  ;; 0x4002102c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable33  ;; 0xf42400
        LDR      R1,[SP, #+0]
        BL       __aeabi_uidiv
        MULS     R0,R6,R0
        STR      R0,[R4, #+0]
??RCC_GetClocksFreq_6:
        B        ??RCC_GetClocksFreq_4
??RCC_GetClocksFreq_3:
        LDR      R0,??DataTable35  ;; 0x7a1200
        STR      R0,[R4, #+0]
??RCC_GetClocksFreq_4:
        LDR      R0,??DataTable29  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        MOVS     R5,R1
        LSRS     R5,R5,#+4
        LDR      R0,??DataTable37
        LDRB     R0,[R0, R5]
        MOVS     R7,R0
        LDR      R0,[R4, #+0]
        LSRS     R0,R0,R7
        STR      R0,[R4, #+4]
        LDR      R0,??DataTable29  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+224
        LSLS     R1,R1,#+3        ;; #+1792
        ANDS     R1,R1,R0
        MOVS     R5,R1
        LSRS     R5,R5,#+8
        LDR      R0,??DataTable37
        LDRB     R0,[R0, R5]
        MOVS     R7,R0
        LDR      R0,[R4, #+4]
        LSRS     R0,R0,R7
        STR      R0,[R4, #+8]
        LDR      R0,??DataTable32  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+23
        BMI      ??RCC_GetClocksFreq_7
        LDR      R0,??DataTable37_1  ;; 0xd59f80
        STR      R0,[R4, #+12]
        B        ??RCC_GetClocksFreq_8
??RCC_GetClocksFreq_7:
        LDR      R0,??DataTable29  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+17
        BMI      ??RCC_GetClocksFreq_9
        LDR      R0,[R4, #+8]
        LSRS     R0,R0,#+1
        STR      R0,[R4, #+12]
        B        ??RCC_GetClocksFreq_8
??RCC_GetClocksFreq_9:
        LDR      R0,[R4, #+8]
        LSRS     R0,R0,#+2
        STR      R0,[R4, #+12]
??RCC_GetClocksFreq_8:
        LDR      R0,??DataTable32  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BMI      ??RCC_GetClocksFreq_10
        LDR      R0,??DataTable37_2  ;; 0x8012
        STR      R0,[R4, #+16]
        B        ??RCC_GetClocksFreq_11
??RCC_GetClocksFreq_10:
        MOVS     R0,#+128
        LSLS     R0,R0,#+8        ;; #+32768
        STR      R0,[R4, #+16]
??RCC_GetClocksFreq_11:
        LDR      R0,??DataTable32  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI      ??RCC_GetClocksFreq_12
        LDR      R0,??DataTable35  ;; 0x7a1200
        STR      R0,[R4, #+20]
        B        ??RCC_GetClocksFreq_13
??RCC_GetClocksFreq_12:
        LDR      R0,[R4, #+0]
        STR      R0,[R4, #+20]
??RCC_GetClocksFreq_13:
        LDR      R0,??DataTable32  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        CMP      R0,#+0
        BNE      ??RCC_GetClocksFreq_14
        LDR      R0,[R4, #+8]
        STR      R0,[R4, #+24]
        B        ??RCC_GetClocksFreq_15
??RCC_GetClocksFreq_14:
        LDR      R0,??DataTable32  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        CMP      R0,#+1
        BNE      ??RCC_GetClocksFreq_16
        LDR      R0,[R4, #+0]
        STR      R0,[R4, #+24]
        B        ??RCC_GetClocksFreq_15
??RCC_GetClocksFreq_16:
        LDR      R0,??DataTable32  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        CMP      R0,#+2
        BNE      ??RCC_GetClocksFreq_17
        MOVS     R0,#+128
        LSLS     R0,R0,#+8        ;; #+32768
        STR      R0,[R4, #+24]
        B        ??RCC_GetClocksFreq_15
??RCC_GetClocksFreq_17:
        LDR      R0,??DataTable32  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        CMP      R0,#+3
        BNE      ??RCC_GetClocksFreq_15
        LDR      R0,??DataTable35  ;; 0x7a1200
        STR      R0,[R4, #+24]
??RCC_GetClocksFreq_15:
        POP      {R0,R1,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_RTCCLKConfig:
        LDR      R1,??DataTable37_3  ;; 0x40021020
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable37_3  ;; 0x40021020
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     0x40021024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_1:
        DC32     0xfeffffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_RTCCLKCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RCC_RTCCLKCmd_0
        LDR      R1,??DataTable37_3  ;; 0x40021020
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+8        ;; #+32768
        ORRS     R2,R2,R1
        LDR      R1,??DataTable37_3  ;; 0x40021020
        STR      R2,[R1, #+0]
        B        ??RCC_RTCCLKCmd_1
??RCC_RTCCLKCmd_0:
        LDR      R1,??DataTable37_3  ;; 0x40021020
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable37_4  ;; 0xffff7fff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable37_3  ;; 0x40021020
        STR      R2,[R1, #+0]
??RCC_RTCCLKCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0xfff7ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     0x8ffffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_BackupResetCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??RCC_BackupResetCmd_0
        LDR      R1,??DataTable37_3  ;; 0x40021020
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+9        ;; #+65536
        ORRS     R2,R2,R1
        LDR      R1,??DataTable37_3  ;; 0x40021020
        STR      R2,[R1, #+0]
        B        ??RCC_BackupResetCmd_1
??RCC_BackupResetCmd_0:
        LDR      R1,??DataTable37_3  ;; 0x40021020
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable37_5  ;; 0xfffeffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable37_3  ;; 0x40021020
        STR      R2,[R1, #+0]
??RCC_BackupResetCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AHBPeriphClockCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RCC_AHBPeriphClockCmd_0
        LDR      R2,??DataTable37_6  ;; 0x40021014
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable37_6  ;; 0x40021014
        STR      R2,[R3, #+0]
        B        ??RCC_AHBPeriphClockCmd_1
??RCC_AHBPeriphClockCmd_0:
        LDR      R2,??DataTable37_6  ;; 0x40021014
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable37_6  ;; 0x40021014
        STR      R2,[R3, #+0]
??RCC_AHBPeriphClockCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB2PeriphClockCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RCC_APB2PeriphClockCmd_0
        LDR      R2,??DataTable37_7  ;; 0x40021018
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable37_7  ;; 0x40021018
        STR      R2,[R3, #+0]
        B        ??RCC_APB2PeriphClockCmd_1
??RCC_APB2PeriphClockCmd_0:
        LDR      R2,??DataTable37_7  ;; 0x40021018
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable37_7  ;; 0x40021018
        STR      R2,[R3, #+0]
??RCC_APB2PeriphClockCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28:
        DC32     0xfffff8ff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB1PeriphClockCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RCC_APB1PeriphClockCmd_0
        LDR      R2,??DataTable37_8  ;; 0x4002101c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable37_8  ;; 0x4002101c
        STR      R2,[R3, #+0]
        B        ??RCC_APB1PeriphClockCmd_1
??RCC_APB1PeriphClockCmd_0:
        LDR      R2,??DataTable37_8  ;; 0x4002101c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable37_8  ;; 0x4002101c
        STR      R2,[R3, #+0]
??RCC_APB1PeriphClockCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29:
        DC32     0x40021004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29_1:
        DC32     0xffffbfff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AHBPeriphResetCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RCC_AHBPeriphResetCmd_0
        LDR      R2,??DataTable37_9  ;; 0x40021028
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable37_9  ;; 0x40021028
        STR      R2,[R3, #+0]
        B        ??RCC_AHBPeriphResetCmd_1
??RCC_AHBPeriphResetCmd_0:
        LDR      R2,??DataTable37_9  ;; 0x40021028
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable37_9  ;; 0x40021028
        STR      R2,[R3, #+0]
??RCC_AHBPeriphResetCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     0xfffffeff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB2PeriphResetCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RCC_APB2PeriphResetCmd_0
        LDR      R2,??DataTable37_10  ;; 0x4002100c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable37_10  ;; 0x4002100c
        STR      R2,[R3, #+0]
        B        ??RCC_APB2PeriphResetCmd_1
??RCC_APB2PeriphResetCmd_0:
        LDR      R2,??DataTable37_10  ;; 0x4002100c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable37_10  ;; 0x4002100c
        STR      R2,[R3, #+0]
??RCC_APB2PeriphResetCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB1PeriphResetCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RCC_APB1PeriphResetCmd_0
        LDR      R2,??DataTable37_11  ;; 0x40021010
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable37_11  ;; 0x40021010
        STR      R2,[R3, #+0]
        B        ??RCC_APB1PeriphResetCmd_1
??RCC_APB1PeriphResetCmd_0:
        LDR      R2,??DataTable37_11  ;; 0x40021010
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable37_11  ;; 0x40021010
        STR      R2,[R3, #+0]
??RCC_APB1PeriphResetCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable32:
        DC32     0x40021030

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ITConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??RCC_ITConfig_0
        LDR      R2,??DataTable37_12  ;; 0x40021009
        LDRB     R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable37_12  ;; 0x40021009
        STRB     R2,[R3, #+0]
        B        ??RCC_ITConfig_1
??RCC_ITConfig_0:
        LDR      R2,??DataTable37_12  ;; 0x40021009
        LDRB     R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable37_12  ;; 0x40021009
        STRB     R2,[R3, #+0]
??RCC_ITConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33:
        DC32     0xf42400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetFlagStatus:
        PUSH     {R4,LR}
        MOVS     R1,R0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R0,#+0
        MOVS     R4,R1
        UXTB     R4,R4
        LSRS     R4,R4,#+5
        UXTB     R4,R4
        MOVS     R2,R4
        CMP      R2,#+0
        BNE      ??RCC_GetFlagStatus_0
        LDR      R4,??DataTable37_13  ;; 0x40021000
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B        ??RCC_GetFlagStatus_1
??RCC_GetFlagStatus_0:
        CMP      R2,#+1
        BNE      ??RCC_GetFlagStatus_2
        LDR      R4,??DataTable37_3  ;; 0x40021020
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B        ??RCC_GetFlagStatus_1
??RCC_GetFlagStatus_2:
        CMP      R2,#+2
        BNE      ??RCC_GetFlagStatus_3
        LDR      R4,??DataTable37_14  ;; 0x40021024
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B        ??RCC_GetFlagStatus_1
??RCC_GetFlagStatus_3:
        LDR      R4,??DataTable37_15  ;; 0x40021034
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
??RCC_GetFlagStatus_1:
        UXTB     R1,R1
        LSLS     R4,R1,#+27       ;; ZeroExtS R4,R1,#+27,#+27
        LSRS     R4,R4,#+27
        MOVS     R2,R4
        MOVS     R4,R3
        LSRS     R4,R4,R2
        LSLS     R4,R4,#+31
        BPL      ??RCC_GetFlagStatus_4
        MOVS     R4,#+1
        MOVS     R0,R4
        B        ??RCC_GetFlagStatus_5
??RCC_GetFlagStatus_4:
        MOVS     R4,#+0
        MOVS     R0,R4
??RCC_GetFlagStatus_5:
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34:
        DC32     0x3d0900

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClearFlag:
        LDR      R0,??DataTable37_14  ;; 0x40021024
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        ORRS     R1,R1,R0
        LDR      R0,??DataTable37_14  ;; 0x40021024
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable35:
        DC32     0x7a1200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable35_1:
        DC32     0x4002102c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetITStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable37_16  ;; 0x40021008
        LDR      R2,[R2, #+0]
        UXTB     R1,R1
        ANDS     R2,R2,R1
        CMP      R2,#+0
        BEQ      ??RCC_GetITStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??RCC_GetITStatus_1
??RCC_GetITStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??RCC_GetITStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClearITPendingBit:
        LDR      R1,??DataTable37_17  ;; 0x4002100a
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37:
        DC32     APBAHBPrescTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_1:
        DC32     0xd59f80

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_2:
        DC32     0x8012

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_3:
        DC32     0x40021020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_4:
        DC32     0xffff7fff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_5:
        DC32     0xfffeffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_6:
        DC32     0x40021014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_7:
        DC32     0x40021018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_8:
        DC32     0x4002101c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_9:
        DC32     0x40021028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_10:
        DC32     0x4002100c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_11:
        DC32     0x40021010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_12:
        DC32     0x40021009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_13:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_14:
        DC32     0x40021024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_15:
        DC32     0x40021034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_16:
        DC32     0x40021008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable37_17:
        DC32     0x4002100a

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
//    16 bytes in section .data
// 1 752 bytes in section .text
// 
// 1 752 bytes of CODE memory
//    16 bytes of DATA memory
//
//Errors: none
//Warnings: none

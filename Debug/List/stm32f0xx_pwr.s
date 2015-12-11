///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:29:39
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_pwr.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_pwr.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -lb G:\git_hub_lamp\lamp_slave_git\Debug\List\
//        --diag_suppress Pa050 -o G:\git_hub_lamp\lamp_slave_git\Debug\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0 -e --fpu=None --dlib_config "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
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
//        G:\git_hub_lamp\lamp_slave_git\coffee_arch\ -Ol -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_pwr.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC PWR_BackupAccessCmd
        PUBLIC PWR_ClearFlag
        PUBLIC PWR_DeInit
        PUBLIC PWR_EnterSTANDBYMode
        PUBLIC PWR_EnterSTOPMode
        PUBLIC PWR_EnterSleepMode
        PUBLIC PWR_GetFlagStatus
        PUBLIC PWR_PVDCmd
        PUBLIC PWR_PVDLevelConfig
        PUBLIC PWR_WakeUpPinCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+21       ;; #+268435456
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+21       ;; #+268435456
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_BackupAccessCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??PWR_BackupAccessCmd_0
        LDR      R0,??DataTable8  ;; 0x40007000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8  ;; 0x40007000
        STR      R1,[R0, #+0]
        B        ??PWR_BackupAccessCmd_1
??PWR_BackupAccessCmd_0:
        LDR      R0,??DataTable8  ;; 0x40007000
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable8_1  ;; 0xfffffeff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable8  ;; 0x40007000
        STR      R1,[R0, #+0]
??PWR_BackupAccessCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_PVDLevelConfig:
        MOVS     R1,#+0
        LDR      R2,??DataTable8  ;; 0x40007000
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+224
        BICS     R1,R1,R2
        ORRS     R0,R0,R1
        MOVS     R1,R0
        LDR      R0,??DataTable8  ;; 0x40007000
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_PVDCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??PWR_PVDCmd_0
        LDR      R0,??DataTable8  ;; 0x40007000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8  ;; 0x40007000
        STR      R1,[R0, #+0]
        B        ??PWR_PVDCmd_1
??PWR_PVDCmd_0:
        LDR      R0,??DataTable8  ;; 0x40007000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable8  ;; 0x40007000
        STR      R0,[R1, #+0]
??PWR_PVDCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_WakeUpPinCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??PWR_WakeUpPinCmd_0
        LDR      R1,??DataTable8_2  ;; 0x40007004
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable8_2  ;; 0x40007004
        STR      R0,[R1, #+0]
        B        ??PWR_WakeUpPinCmd_1
??PWR_WakeUpPinCmd_0:
        LDR      R1,??DataTable8_2  ;; 0x40007004
        LDR      R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR      R0,??DataTable8_2  ;; 0x40007004
        STR      R1,[R0, #+0]
??PWR_WakeUpPinCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_EnterSleepMode:
        PUSH     {LR}
        LDR      R1,??DataTable8_3  ;; 0xe000ed10
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        BICS     R1,R1,R2
        LDR      R2,??DataTable8_3  ;; 0xe000ed10
        STR      R1,[R2, #+0]
        UXTB     R0,R0
        CMP      R0,#+1
        BNE      ??PWR_EnterSleepMode_0
        WFI      
        B        ??PWR_EnterSleepMode_1
??PWR_EnterSleepMode_0:
        WFE      
??PWR_EnterSleepMode_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_EnterSTOPMode:
        PUSH     {LR}
        MOVS     R2,#+0
        LDR      R3,??DataTable8  ;; 0x40007000
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
        MOVS     R3,#+3
        BICS     R2,R2,R3
        ORRS     R0,R0,R2
        MOVS     R2,R0
        LDR      R0,??DataTable8  ;; 0x40007000
        STR      R2,[R0, #+0]
        LDR      R0,??DataTable8_3  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        MOVS     R2,#+4
        ORRS     R2,R2,R0
        LDR      R0,??DataTable8_3  ;; 0xe000ed10
        STR      R2,[R0, #+0]
        UXTB     R1,R1
        CMP      R1,#+1
        BNE      ??PWR_EnterSTOPMode_0
        WFI      
        B        ??PWR_EnterSTOPMode_1
??PWR_EnterSTOPMode_0:
        WFE      
??PWR_EnterSTOPMode_1:
        LDR      R0,??DataTable8_3  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        BICS     R0,R0,R1
        LDR      R1,??DataTable8_3  ;; 0xe000ed10
        STR      R0,[R1, #+0]
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_EnterSTANDBYMode:
        LDR      R0,??DataTable8  ;; 0x40007000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8  ;; 0x40007000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable8  ;; 0x40007000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8  ;; 0x40007000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable8_3  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8_3  ;; 0xe000ed10
        STR      R1,[R0, #+0]
        WFI      
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_GetFlagStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable8_2  ;; 0x40007004
        LDR      R2,[R2, #+0]
        ANDS     R1,R1,R2
        CMP      R1,#+0
        BEQ      ??PWR_GetFlagStatus_0
        MOVS     R0,#+1
        B        ??PWR_GetFlagStatus_1
??PWR_GetFlagStatus_0:
        MOVS     R0,#+0
??PWR_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_ClearFlag:
        LDR      R1,??DataTable8  ;; 0x40007000
        LDR      R1,[R1, #+0]
        LSLS     R0,R0,#+2
        ORRS     R0,R0,R1
        LDR      R1,??DataTable8  ;; 0x40007000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x40007000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0xfffffeff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x40007004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0xe000ed10

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
// 336 bytes in section .text
// 
// 336 bytes of CODE memory
//
//Errors: none
//Warnings: none

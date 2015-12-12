///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       12/Dec/2015  12:36:21
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_syscfg.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_syscfg.c
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
//    List file    =  
//        G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_syscfg.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC SYSCFG_BreakConfig
        PUBLIC SYSCFG_ClearFlag
        PUBLIC SYSCFG_DMAChannelRemapConfig
        PUBLIC SYSCFG_DeInit
        PUBLIC SYSCFG_EXTILineConfig
        PUBLIC SYSCFG_GetFlagStatus
        PUBLIC SYSCFG_I2CFastModePlusConfig
        PUBLIC SYSCFG_MemoryRemapConfig


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_DeInit:
        LDR      R0,??DataTable7  ;; 0x40010000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        LDR      R1,??DataTable7  ;; 0x40010000
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_1  ;; 0x40010008
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_2  ;; 0x4001000c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_3  ;; 0x40010010
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable7_4  ;; 0x40010014
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable7_5  ;; 0x40010018
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        ORRS     R1,R1,R0
        LDR      R0,??DataTable7_5  ;; 0x40010018
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_MemoryRemapConfig:
        MOVS     R1,#+0
        LDR      R2,??DataTable7  ;; 0x40010000
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+3
        BICS     R1,R1,R2
        ORRS     R1,R1,R0
        LDR      R2,??DataTable7  ;; 0x40010000
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_DMAChannelRemapConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SYSCFG_DMAChannelRemapConfig_0
        LDR      R2,??DataTable7  ;; 0x40010000
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable7  ;; 0x40010000
        STR      R2,[R3, #+0]
        B        ??SYSCFG_DMAChannelRemapConfig_1
??SYSCFG_DMAChannelRemapConfig_0:
        LDR      R2,??DataTable7  ;; 0x40010000
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable7  ;; 0x40010000
        STR      R2,[R3, #+0]
??SYSCFG_DMAChannelRemapConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_I2CFastModePlusConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SYSCFG_I2CFastModePlusConfig_0
        LDR      R2,??DataTable7  ;; 0x40010000
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable7  ;; 0x40010000
        STR      R2,[R3, #+0]
        B        ??SYSCFG_I2CFastModePlusConfig_1
??SYSCFG_I2CFastModePlusConfig_0:
        LDR      R2,??DataTable7  ;; 0x40010000
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable7  ;; 0x40010000
        STR      R2,[R3, #+0]
??SYSCFG_I2CFastModePlusConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_EXTILineConfig:
        PUSH     {R4,R5}
        MOVS     R2,#+0
        MOVS     R3,#+15
        LSLS     R4,R1,#+30       ;; ZeroExtS R4,R1,#+30,#+30
        LSRS     R4,R4,#+30
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LSLS     R3,R3,R4
        MOVS     R2,R3
        UXTB     R1,R1
        MOVS     R3,R1
        ASRS     R3,R3,#+2
        MOVS     R4,#+4
        MULS     R3,R4,R3
        LDR      R4,??DataTable7_1  ;; 0x40010008
        LDR      R3,[R4, R3]
        BICS     R3,R3,R2
        UXTB     R1,R1
        MOVS     R4,R1
        ASRS     R4,R4,#+2
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R5,??DataTable7_1  ;; 0x40010008
        STR      R3,[R5, R4]
        UXTB     R1,R1
        MOVS     R3,R1
        ASRS     R3,R3,#+2
        MOVS     R4,#+4
        MULS     R3,R4,R3
        LDR      R4,??DataTable7_1  ;; 0x40010008
        LDR      R4,[R4, R3]
        UXTB     R0,R0
        LSLS     R5,R1,#+30       ;; ZeroExtS R5,R1,#+30,#+30
        LSRS     R5,R5,#+30
        MOVS     R3,#+4
        MULS     R5,R3,R5
        MOVS     R3,R0
        LSLS     R3,R3,R5
        ORRS     R3,R3,R4
        UXTB     R1,R1
        MOVS     R4,R1
        ASRS     R4,R4,#+2
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R5,??DataTable7_1  ;; 0x40010008
        STR      R3,[R5, R4]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_BreakConfig:
        LDR      R1,??DataTable7_5  ;; 0x40010018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable7_5  ;; 0x40010018
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_GetFlagStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable7_5  ;; 0x40010018
        LDR      R2,[R2, #+0]
        LSLS     R2,R2,#+23
        BPL      ??SYSCFG_GetFlagStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??SYSCFG_GetFlagStatus_1
??SYSCFG_GetFlagStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??SYSCFG_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_ClearFlag:
        LDR      R1,??DataTable7_5  ;; 0x40010018
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable7_5  ;; 0x40010018
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x40010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x40010008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x4001000c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x40010010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x40010014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x40010018

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
// 308 bytes in section .text
// 
// 308 bytes of CODE memory
//
//Errors: none
//Warnings: none

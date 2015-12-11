///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:38
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_syscfg.c
//    Command line =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_syscfg.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -lb E:\svnProject\street_lamp_new\Debug\List\
//        --diag_suppress Pa050 -o E:\svnProject\street_lamp_new\Debug\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0 -e --fpu=None --dlib_config "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
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
//    List file    =  
//        E:\svnProject\street_lamp_new\Debug\List\stm32f0xx_syscfg.s
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
        ORRS     R0,R0,R1
        MOVS     R1,R0
        LDR      R0,??DataTable7  ;; 0x40010000
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_DMAChannelRemapConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SYSCFG_DMAChannelRemapConfig_0
        LDR      R1,??DataTable7  ;; 0x40010000
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable7  ;; 0x40010000
        STR      R0,[R1, #+0]
        B        ??SYSCFG_DMAChannelRemapConfig_1
??SYSCFG_DMAChannelRemapConfig_0:
        LDR      R1,??DataTable7  ;; 0x40010000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR      R0,??DataTable7  ;; 0x40010000
        STR      R1,[R0, #+0]
??SYSCFG_DMAChannelRemapConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_I2CFastModePlusConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SYSCFG_I2CFastModePlusConfig_0
        LDR      R1,??DataTable7  ;; 0x40010000
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable7  ;; 0x40010000
        STR      R0,[R1, #+0]
        B        ??SYSCFG_I2CFastModePlusConfig_1
??SYSCFG_I2CFastModePlusConfig_0:
        LDR      R1,??DataTable7  ;; 0x40010000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR      R0,??DataTable7  ;; 0x40010000
        STR      R1,[R0, #+0]
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
        MOVS     R2,R1
        ASRS     R2,R2,#+2
        MOVS     R4,#+4
        MULS     R2,R4,R2
        LDR      R4,??DataTable7_1  ;; 0x40010008
        STR      R3,[R4, R2]
        UXTB     R1,R1
        MOVS     R2,R1
        ASRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable7_1  ;; 0x40010008
        LDR      R2,[R3, R2]
        UXTB     R0,R0
        LSLS     R3,R1,#+30       ;; ZeroExtS R3,R1,#+30,#+30
        LSRS     R3,R3,#+30
        MOVS     R4,#+4
        MULS     R3,R4,R3
        LSLS     R0,R0,R3
        ORRS     R0,R0,R2
        UXTB     R1,R1
        ASRS     R1,R1,#+2
        MOVS     R2,#+4
        MULS     R1,R2,R1
        LDR      R2,??DataTable7_1  ;; 0x40010008
        STR      R0,[R2, R1]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_BreakConfig:
        LDR      R1,??DataTable7_5  ;; 0x40010018
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable7_5  ;; 0x40010018
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_GetFlagStatus:
        PUSH     {LR}
        MOVS     R0,#+0
        LDR      R1,??DataTable7_5  ;; 0x40010018
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+23
        BPL      ??SYSCFG_GetFlagStatus_0
        MOVS     R0,#+1
        B        ??SYSCFG_GetFlagStatus_1
??SYSCFG_GetFlagStatus_0:
        MOVS     R0,#+0
??SYSCFG_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SYSCFG_ClearFlag:
        LDR      R1,??DataTable7_5  ;; 0x40010018
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable7_5  ;; 0x40010018
        STR      R0,[R1, #+0]
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
// 300 bytes in section .text
// 
// 300 bytes of CODE memory
//
//Errors: none
//Warnings: none
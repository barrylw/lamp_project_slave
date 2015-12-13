///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       13/Dec/2015  23:36:24
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_comp.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_comp.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
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
//        G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_comp.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC COMP_Cmd
        PUBLIC COMP_DeInit
        PUBLIC COMP_GetOutputLevel
        PUBLIC COMP_Init
        PUBLIC COMP_LockConfig
        PUBLIC COMP_StructInit
        PUBLIC COMP_SwitchCmd
        PUBLIC COMP_WindowCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
COMP_DeInit:
        MOVS     R0,#+0
        LDR      R1,??DataTable6  ;; 0x4001001c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
COMP_Init:
        PUSH     {R4}
        MOVS     R2,#+0
        LDR      R3,??DataTable6  ;; 0x4001001c
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
        LDR      R3,??DataTable6_1  ;; 0x3ffe
        LSLS     R3,R3,R0
        BICS     R2,R2,R3
        MOVS     R4,R2
        LDR      R2,[R1, #+0]
        LDR      R3,[R1, #+4]
        ORRS     R3,R3,R2
        LDR      R2,[R1, #+8]
        ORRS     R2,R2,R3
        LDR      R3,[R1, #+12]
        ORRS     R3,R3,R2
        LDR      R2,[R1, #+16]
        ORRS     R2,R2,R3
        LSLS     R2,R2,R0
        ORRS     R2,R2,R4
        LDR      R3,??DataTable6  ;; 0x4001001c
        STR      R2,[R3, #+0]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
COMP_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+12
        STR      R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
COMP_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??COMP_Cmd_0
        LDR      R2,??DataTable6  ;; 0x4001001c
        LDR      R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R0
        ORRS     R3,R3,R2
        LDR      R2,??DataTable6  ;; 0x4001001c
        STR      R3,[R2, #+0]
        B        ??COMP_Cmd_1
??COMP_Cmd_0:
        LDR      R2,??DataTable6  ;; 0x4001001c
        LDR      R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R0
        BICS     R2,R2,R3
        LDR      R3,??DataTable6  ;; 0x4001001c
        STR      R2,[R3, #+0]
??COMP_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
COMP_SwitchCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??COMP_SwitchCmd_0
        LDR      R1,??DataTable6  ;; 0x4001001c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+2
        ORRS     R2,R2,R1
        LDR      R1,??DataTable6  ;; 0x4001001c
        STR      R2,[R1, #+0]
        B        ??COMP_SwitchCmd_1
??COMP_SwitchCmd_0:
        LDR      R1,??DataTable6  ;; 0x4001001c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+2
        BICS     R1,R1,R2
        LDR      R2,??DataTable6  ;; 0x4001001c
        STR      R1,[R2, #+0]
??COMP_SwitchCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
COMP_GetOutputLevel:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable6  ;; 0x4001001c
        LDR      R2,[R2, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+7        ;; #+16384
        LSLS     R3,R3,R1
        ANDS     R3,R3,R2
        CMP      R3,#+0
        BEQ      ??COMP_GetOutputLevel_0
        MOVS     R2,#+128
        LSLS     R2,R2,#+7        ;; #+16384
        MOVS     R0,R2
        B        ??COMP_GetOutputLevel_1
??COMP_GetOutputLevel_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??COMP_GetOutputLevel_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
COMP_WindowCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??COMP_WindowCmd_0
        LDR      R1,??DataTable6  ;; 0x4001001c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+16       ;; #+8388608
        ORRS     R2,R2,R1
        LDR      R1,??DataTable6  ;; 0x4001001c
        STR      R2,[R1, #+0]
        B        ??COMP_WindowCmd_1
??COMP_WindowCmd_0:
        LDR      R1,??DataTable6  ;; 0x4001001c
        LDR      R1,[R1, #+0]
        LDR      R2,??DataTable6_2  ;; 0xff7fffff
        ANDS     R2,R2,R1
        LDR      R1,??DataTable6  ;; 0x4001001c
        STR      R2,[R1, #+0]
??COMP_WindowCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
COMP_LockConfig:
        LDR      R1,??DataTable6  ;; 0x4001001c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+8        ;; #+32768
        LSLS     R2,R2,R0
        ORRS     R2,R2,R1
        LDR      R1,??DataTable6  ;; 0x4001001c
        STR      R2,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x4001001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x3ffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0xff7fffff

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
// 258 bytes in section .text
// 
// 258 bytes of CODE memory
//
//Errors: none
//Warnings: none

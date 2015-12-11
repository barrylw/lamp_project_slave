///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:31
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_dac.c
//    Command line =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_dac.c
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\stm32f0xx_dac.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC DAC_ClearFlag
        PUBLIC DAC_ClearITPendingBit
        PUBLIC DAC_Cmd
        PUBLIC DAC_DMACmd
        PUBLIC DAC_DeInit
        PUBLIC DAC_GetDataOutputValue
        PUBLIC DAC_GetFlagStatus
        PUBLIC DAC_GetITStatus
        PUBLIC DAC_ITConfig
        PUBLIC DAC_Init
        PUBLIC DAC_SetChannel1Data
        PUBLIC DAC_SoftwareTriggerCmd
        PUBLIC DAC_StructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+22       ;; #+536870912
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+22       ;; #+536870912
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_Init:
        PUSH     {R4}
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR      R4,??DataTable10  ;; 0x40007400
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        MOVS     R4,#+62
        LSLS     R4,R4,R0
        BICS     R3,R3,R4
        LDR      R4,[R1, #+0]
        LDR      R1,[R1, #+4]
        ORRS     R1,R1,R4
        MOVS     R2,R1
        MOVS     R1,R3
        MOVS     R3,R2
        LSLS     R3,R3,R0
        ORRS     R3,R3,R1
        LDR      R0,??DataTable10  ;; 0x40007400
        STR      R3,[R0, #+0]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??DAC_Cmd_0
        LDR      R1,??DataTable10  ;; 0x40007400
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R2,R2,R1
        LDR      R0,??DataTable10  ;; 0x40007400
        STR      R2,[R0, #+0]
        B        ??DAC_Cmd_1
??DAC_Cmd_0:
        LDR      R1,??DataTable10  ;; 0x40007400
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        BICS     R1,R1,R2
        LDR      R0,??DataTable10  ;; 0x40007400
        STR      R1,[R0, #+0]
??DAC_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_SoftwareTriggerCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??DAC_SoftwareTriggerCmd_0
        LDR      R1,??DataTable10_1  ;; 0x40007404
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSRS     R0,R0,#+4
        LSLS     R2,R2,R0
        ORRS     R2,R2,R1
        LDR      R0,??DataTable10_1  ;; 0x40007404
        STR      R2,[R0, #+0]
        B        ??DAC_SoftwareTriggerCmd_1
??DAC_SoftwareTriggerCmd_0:
        LDR      R1,??DataTable10_1  ;; 0x40007404
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        LSRS     R0,R0,#+4
        LSLS     R2,R2,R0
        BICS     R1,R1,R2
        LDR      R0,??DataTable10_1  ;; 0x40007404
        STR      R1,[R0, #+0]
??DAC_SoftwareTriggerCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_SetChannel1Data:
        SUB      SP,SP,#+4
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
        LDR      R2,??DataTable10  ;; 0x40007400
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        ADDS     R0,R0,#+8
        ADDS     R0,R2,R0
        STR      R0,[SP, #+0]
        UXTH     R1,R1
        LDR      R0,[SP, #+0]
        STR      R1,[R0, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_GetDataOutputValue:
        SUB      SP,SP,#+4
        MOVS     R1,#+0
        STR      R1,[SP, #+0]
        LDR      R1,??DataTable10  ;; 0x40007400
        STR      R1,[SP, #+0]
        LDR      R1,[SP, #+0]
        LSRS     R0,R0,#+2
        ADDS     R0,R0,#+44
        ADDS     R0,R1,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+0]
        UXTH     R0,R0
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_DMACmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??DAC_DMACmd_0
        LDR      R1,??DataTable10  ;; 0x40007400
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+5        ;; #+4096
        LSLS     R2,R2,R0
        ORRS     R2,R2,R1
        LDR      R0,??DataTable10  ;; 0x40007400
        STR      R2,[R0, #+0]
        B        ??DAC_DMACmd_1
??DAC_DMACmd_0:
        LDR      R1,??DataTable10  ;; 0x40007400
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+5        ;; #+4096
        LSLS     R2,R2,R0
        BICS     R1,R1,R2
        LDR      R0,??DataTable10  ;; 0x40007400
        STR      R1,[R0, #+0]
??DAC_DMACmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_ITConfig:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??DAC_ITConfig_0
        LDR      R2,??DataTable10  ;; 0x40007400
        LDR      R2,[R2, #+0]
        LSLS     R1,R1,R0
        ORRS     R1,R1,R2
        LDR      R0,??DataTable10  ;; 0x40007400
        STR      R1,[R0, #+0]
        B        ??DAC_ITConfig_1
??DAC_ITConfig_0:
        LDR      R2,??DataTable10  ;; 0x40007400
        LDR      R2,[R2, #+0]
        LSLS     R1,R1,R0
        BICS     R2,R2,R1
        LDR      R0,??DataTable10  ;; 0x40007400
        STR      R2,[R0, #+0]
??DAC_ITConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_GetFlagStatus:
        PUSH     {LR}
        MOVS     R2,#+0
        LDR      R3,??DataTable10_2  ;; 0x40007434
        LDR      R3,[R3, #+0]
        LSLS     R1,R1,R0
        ANDS     R1,R1,R3
        CMP      R1,#+0
        BEQ      ??DAC_GetFlagStatus_0
        MOVS     R2,#+1
        B        ??DAC_GetFlagStatus_1
??DAC_GetFlagStatus_0:
        MOVS     R2,#+0
??DAC_GetFlagStatus_1:
        MOVS     R0,R2
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_ClearFlag:
        LSLS     R1,R1,R0
        LDR      R0,??DataTable10_2  ;; 0x40007434
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_GetITStatus:
        PUSH     {R4,R5,LR}
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        MOVS     R4,#+0
        LDR      R1,??DataTable10  ;; 0x40007400
        LDR      R5,[R1, #+0]
        MOVS     R1,R3
        LSLS     R1,R1,R2
        ANDS     R1,R1,R5
        MOVS     R4,R1
        LDR      R1,??DataTable10_2  ;; 0x40007434
        LDR      R1,[R1, #+0]
        LSLS     R3,R3,R2
        ANDS     R3,R3,R1
        CMP      R3,#+0
        BEQ      ??DAC_GetITStatus_0
        CMP      R4,#+0
        BEQ      ??DAC_GetITStatus_0
        MOVS     R0,#+1
        B        ??DAC_GetITStatus_1
??DAC_GetITStatus_0:
        MOVS     R0,#+0
??DAC_GetITStatus_1:
        UXTB     R0,R0
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_ClearITPendingBit:
        LSLS     R1,R1,R0
        LDR      R0,??DataTable10_2  ;; 0x40007434
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x40007400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x40007404

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x40007434

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
// 402 bytes in section .text
// 
// 402 bytes of CODE memory
//
//Errors: none
//Warnings: none

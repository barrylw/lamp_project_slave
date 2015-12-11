///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:29:38
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_gpio.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_gpio.c
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
//    List file    =  
//        G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_AHBPeriphResetCmd

        PUBLIC GPIO_DeInit
        PUBLIC GPIO_Init
        PUBLIC GPIO_PinAFConfig
        PUBLIC GPIO_PinLockConfig
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputDataBit
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_ReadOutputDataBit
        PUBLIC GPIO_ResetBits
        PUBLIC GPIO_SetBits
        PUBLIC GPIO_StructInit
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteBit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+144
        LSLS     R1,R1,#+23       ;; #+1207959552
        CMP      R0,R1
        BNE      ??GPIO_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_AHBPeriphResetCmd
        B        ??GPIO_DeInit_1
??GPIO_DeInit_0:
        LDR      R1,??DataTable1  ;; 0x48000400
        CMP      R0,R1
        BNE      ??GPIO_DeInit_2
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        BL       RCC_AHBPeriphResetCmd
        B        ??GPIO_DeInit_1
??GPIO_DeInit_2:
        LDR      R1,??DataTable1_1  ;; 0x48000800
        CMP      R0,R1
        BNE      ??GPIO_DeInit_3
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+12       ;; #+524288
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+12       ;; #+524288
        BL       RCC_AHBPeriphResetCmd
        B        ??GPIO_DeInit_1
??GPIO_DeInit_3:
        LDR      R1,??DataTable1_2  ;; 0x48000c00
        CMP      R0,R1
        BNE      ??GPIO_DeInit_4
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+13       ;; #+1048576
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+13       ;; #+1048576
        BL       RCC_AHBPeriphResetCmd
        B        ??GPIO_DeInit_1
??GPIO_DeInit_4:
        LDR      R1,??DataTable1_3  ;; 0x48001400
        CMP      R0,R1
        BNE      ??GPIO_DeInit_1
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+15       ;; #+4194304
        BL       RCC_AHBPeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+15       ;; #+4194304
        BL       RCC_AHBPeriphResetCmd
??GPIO_DeInit_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Init:
        PUSH     {R4-R6,LR}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R2,R5
        B        ??GPIO_Init_0
??GPIO_Init_1:
        MOVS     R3,#+1
        LSLS     R3,R3,R2
        LDR      R4,[R1, #+0]
        ANDS     R4,R4,R3
        CMP      R4,R3
        BNE      ??GPIO_Init_2
        LDRB     R3,[R1, #+4]
        CMP      R3,#+1
        BEQ      ??GPIO_Init_3
        LDRB     R3,[R1, #+4]
        CMP      R3,#+2
        BNE      ??GPIO_Init_4
??GPIO_Init_3:
        LDR      R3,[R0, #+8]
        MOVS     R4,#+3
        MOVS     R5,R2
        MOVS     R6,#+2
        MULS     R5,R6,R5
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
        STR      R3,[R0, #+8]
        LDR      R3,[R0, #+8]
        LDRB     R4,[R1, #+5]
        MOVS     R5,R2
        MOVS     R6,#+2
        MULS     R5,R6,R5
        LSLS     R4,R4,R5
        ORRS     R4,R4,R3
        STR      R4,[R0, #+8]
        LDRH     R3,[R0, #+4]
        MOVS     R4,#+1
        LSLS     R4,R4,R2
        BICS     R3,R3,R4
        STRH     R3,[R0, #+4]
        LDRH     R3,[R0, #+4]
        LDRB     R4,[R1, #+6]
        LSLS     R4,R4,R2
        ORRS     R4,R4,R3
        STRH     R4,[R0, #+4]
??GPIO_Init_4:
        LDR      R3,[R0, #+0]
        MOVS     R4,#+3
        MOVS     R5,R2
        MOVS     R6,#+2
        MULS     R5,R6,R5
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
        STR      R3,[R0, #+0]
        LDR      R3,[R0, #+0]
        LDRB     R4,[R1, #+4]
        MOVS     R5,R2
        MOVS     R6,#+2
        MULS     R5,R6,R5
        LSLS     R4,R4,R5
        ORRS     R4,R4,R3
        STR      R4,[R0, #+0]
        LDR      R3,[R0, #+12]
        MOVS     R4,#+3
        MOVS     R5,R2
        MOVS     R6,#+2
        MULS     R5,R6,R5
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
        STR      R3,[R0, #+12]
        LDR      R3,[R0, #+12]
        LDRB     R4,[R1, #+7]
        MOVS     R5,R2
        MOVS     R6,#+2
        MULS     R5,R6,R5
        LSLS     R4,R4,R5
        ORRS     R4,R4,R3
        STR      R4,[R0, #+12]
??GPIO_Init_2:
        ADDS     R2,R2,#+1
??GPIO_Init_0:
        CMP      R2,#+16
        BCC      ??GPIO_Init_1
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_StructInit:
        LDR      R1,??DataTable1_4  ;; 0xffff
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+1
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
        MOVS     R1,#+0
        STRB     R1,[R0, #+7]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x48000400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x48000800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x48000c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x48001400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_PinLockConfig:
        SUB      SP,SP,#+4
        MOVS     R2,#+128
        LSLS     R2,R2,#+9        ;; #+65536
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        UXTH     R1,R1
        ORRS     R2,R2,R1
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        STR      R2,[R0, #+28]
        UXTH     R1,R1
        STR      R1,[R0, #+28]
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+28]
        LDR      R1,[R0, #+28]
        STR      R1,[SP, #+0]
        LDR      R0,[R0, #+28]
        STR      R0,[SP, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputDataBit:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R2,[R2, #+16]
        UXTH     R1,R1
        ANDS     R1,R1,R2
        CMP      R1,#+0
        BEQ      ??GPIO_ReadInputDataBit_0
        MOVS     R0,#+1
        B        ??GPIO_ReadInputDataBit_1
??GPIO_ReadInputDataBit_0:
        MOVS     R0,#+0
??GPIO_ReadInputDataBit_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputData:
        LDRH     R0,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadOutputDataBit:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R2,[R2, #+20]
        UXTH     R1,R1
        ANDS     R1,R1,R2
        CMP      R1,#+0
        BEQ      ??GPIO_ReadOutputDataBit_0
        MOVS     R0,#+1
        B        ??GPIO_ReadOutputDataBit_1
??GPIO_ReadOutputDataBit_0:
        MOVS     R0,#+0
??GPIO_ReadOutputDataBit_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadOutputData:
        LDRH     R0,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_SetBits:
        UXTH     R1,R1
        STR      R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ResetBits:
        STRH     R1,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_WriteBit:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??GPIO_WriteBit_0
        UXTH     R1,R1
        STR      R1,[R0, #+24]
        B        ??GPIO_WriteBit_1
??GPIO_WriteBit_0:
        STRH     R1,[R0, #+40]
??GPIO_WriteBit_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Write:
        STRH     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_PinAFConfig:
        PUSH     {R4-R7}
        MOVS     R4,R2
        MOVS     R2,#+0
        MOVS     R3,#+0
        UXTB     R4,R4
        MOVS     R5,R1
        LSLS     R5,R5,#+29       ;; ZeroExtS R5,R5,#+29,#+29
        LSRS     R5,R5,#+29
        MOVS     R6,#+4
        MULS     R5,R6,R5
        LSLS     R4,R4,R5
        MOVS     R2,R4
        UXTH     R1,R1
        MOVS     R4,R1
        ASRS     R4,R4,#+3
        MOVS     R5,#+4
        MULS     R4,R5,R4
        ADDS     R5,R0,R4
        UXTH     R1,R1
        MOVS     R4,R1
        ASRS     R4,R4,#+3
        MOVS     R6,#+4
        MULS     R4,R6,R4
        ADDS     R4,R0,R4
        LDR      R6,[R4, #+32]
        MOVS     R7,#+15
        MOV      R12,R7
        MOVS     R4,R1
        LSLS     R4,R4,#+29       ;; ZeroExtS R4,R4,#+29,#+29
        LSRS     R4,R4,#+29
        MOVS     R7,#+4
        MULS     R4,R7,R4
        MOV      R7,R12
        LSLS     R7,R7,R4
        BICS     R6,R6,R7
        STR      R6,[R5, #+32]
        UXTH     R1,R1
        MOVS     R4,R1
        ASRS     R4,R4,#+3
        MOVS     R5,#+4
        MULS     R4,R5,R4
        ADDS     R4,R0,R4
        LDR      R4,[R4, #+32]
        ORRS     R2,R2,R4
        MOVS     R3,R2
        UXTH     R1,R1
        ASRS     R1,R1,#+3
        MOVS     R2,#+4
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        STR      R3,[R0, #+32]
        POP      {R4-R7}
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
// 586 bytes in section .text
// 
// 586 bytes of CODE memory
//
//Errors: none
//Warnings: none

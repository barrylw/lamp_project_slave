///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:18
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_gpio.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_gpio.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
//        F:\cloneSlave\lamp_project_slave\Debug\List\ --diag_suppress Pa050 -o
//        F:\cloneSlave\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\cloneSlave\lamp_project_slave\APP\ -I
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\inc\
//        -I
//        F:\cloneSlave\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I F:\cloneSlave\lamp_project_slave\LIB\CMSIS\CM0\CoreSupport\ -I
//        F:\cloneSlave\lamp_project_slave\core\ -I
//        F:\cloneSlave\lamp_project_slave\core\sys\ -I
//        F:\cloneSlave\lamp_project_slave\platform\ -I
//        F:\cloneSlave\lamp_project_slave\core\lib\ -I
//        F:\cloneSlave\lamp_project_slave\tools\wpcapslip\ -I
//        F:\cloneSlave\lamp_project_slave\core\cfs\ -I
//        F:\cloneSlave\lamp_project_slave\OLED\ -I
//        F:\cloneSlave\lamp_project_slave\coffee_arch\ -On -I "F:\Program
//        Files (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\cloneSlave\lamp_project_slave\Debug\List\stm32f0xx_gpio.s
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
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        CMP      R4,R0
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
        LDR      R0,??DataTable1  ;; 0x48000400
        CMP      R4,R0
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
        LDR      R0,??DataTable1_1  ;; 0x48000800
        CMP      R4,R0
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
        LDR      R0,??DataTable1_2  ;; 0x48000c00
        CMP      R4,R0
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
        LDR      R0,??DataTable1_3  ;; 0x48001400
        CMP      R4,R0
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
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Init:
        PUSH     {R4-R7,LR}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R2,R5
??GPIO_Init_0:
        CMP      R2,#+16
        BCS      ??GPIO_Init_1
        MOVS     R5,#+1
        LSLS     R5,R5,R2
        MOVS     R3,R5
        LDR      R5,[R1, #+0]
        ANDS     R5,R5,R3
        MOVS     R4,R5
        CMP      R4,R3
        BNE      ??GPIO_Init_2
        LDRB     R5,[R1, #+4]
        CMP      R5,#+1
        BEQ      ??GPIO_Init_3
        LDRB     R5,[R1, #+4]
        CMP      R5,#+2
        BNE      ??GPIO_Init_4
??GPIO_Init_3:
        LDR      R6,[R0, #+8]
        MOVS     R7,#+3
        MOV      R12,R7
        MOVS     R5,R2
        MOVS     R7,#+2
        MULS     R5,R7,R5
        MOV      R7,R12
        LSLS     R7,R7,R5
        BICS     R6,R6,R7
        STR      R6,[R0, #+8]
        LDR      R6,[R0, #+8]
        LDRB     R7,[R1, #+5]
        MOV      R12,R7
        MOVS     R5,R2
        MOVS     R7,#+2
        MULS     R5,R7,R5
        MOV      R7,R12
        LSLS     R7,R7,R5
        ORRS     R7,R7,R6
        STR      R7,[R0, #+8]
        LDRH     R5,[R0, #+4]
        MOVS     R6,#+1
        LSLS     R6,R6,R2
        BICS     R5,R5,R6
        STRH     R5,[R0, #+4]
        LDRH     R5,[R0, #+4]
        LDRB     R6,[R1, #+6]
        LSLS     R6,R6,R2
        ORRS     R6,R6,R5
        STRH     R6,[R0, #+4]
??GPIO_Init_4:
        LDR      R6,[R0, #+0]
        MOVS     R7,#+3
        MOV      R12,R7
        MOVS     R5,R2
        MOVS     R7,#+2
        MULS     R5,R7,R5
        MOV      R7,R12
        LSLS     R7,R7,R5
        BICS     R6,R6,R7
        STR      R6,[R0, #+0]
        LDR      R6,[R0, #+0]
        LDRB     R7,[R1, #+4]
        MOV      R12,R7
        MOVS     R5,R2
        MOVS     R7,#+2
        MULS     R5,R7,R5
        MOV      R7,R12
        LSLS     R7,R7,R5
        ORRS     R7,R7,R6
        STR      R7,[R0, #+0]
        LDR      R6,[R0, #+12]
        MOVS     R7,#+3
        MOV      R12,R7
        MOVS     R5,R2
        MOVS     R7,#+2
        MULS     R5,R7,R5
        MOV      R7,R12
        LSLS     R7,R7,R5
        BICS     R6,R6,R7
        STR      R6,[R0, #+12]
        LDR      R6,[R0, #+12]
        LDRB     R7,[R1, #+7]
        MOV      R12,R7
        MOVS     R5,R2
        MOVS     R7,#+2
        MULS     R5,R7,R5
        MOV      R7,R12
        LSLS     R7,R7,R5
        ORRS     R7,R7,R6
        STR      R7,[R0, #+12]
??GPIO_Init_2:
        ADDS     R2,R2,#+1
        B        ??GPIO_Init_0
??GPIO_Init_1:
        POP      {R4-R7,PC}       ;; return

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
        LDR      R2,[SP, #+0]
        STR      R2,[R0, #+28]
        LDR      R2,[R0, #+28]
        STR      R2,[SP, #+0]
        LDR      R2,[R0, #+28]
        STR      R2,[SP, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputDataBit:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R3,[R2, #+16]
        UXTH     R1,R1
        ANDS     R3,R3,R1
        CMP      R3,#+0
        BEQ      ??GPIO_ReadInputDataBit_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B        ??GPIO_ReadInputDataBit_1
??GPIO_ReadInputDataBit_0:
        MOVS     R3,#+0
        MOVS     R0,R3
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
        LDRH     R3,[R2, #+20]
        UXTH     R1,R1
        ANDS     R3,R3,R1
        CMP      R3,#+0
        BEQ      ??GPIO_ReadOutputDataBit_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B        ??GPIO_ReadOutputDataBit_1
??GPIO_ReadOutputDataBit_0:
        MOVS     R3,#+0
        MOVS     R0,R3
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
        PUSH     {R3-R7}
        MOVS     R3,#+0
        MOVS     R4,#+0
        UXTB     R2,R2
        MOVS     R5,R1
        LSLS     R5,R5,#+29       ;; ZeroExtS R5,R5,#+29,#+29
        LSRS     R5,R5,#+29
        MOVS     R6,#+4
        MULS     R5,R6,R5
        MOVS     R6,R2
        LSLS     R6,R6,R5
        MOVS     R3,R6
        UXTH     R1,R1
        MOVS     R5,R1
        ASRS     R5,R5,#+3
        MOVS     R6,#+4
        MULS     R5,R6,R5
        ADDS     R5,R0,R5
        STR      R5,[SP, #+0]
        UXTH     R1,R1
        MOVS     R5,R1
        ASRS     R5,R5,#+3
        MOVS     R6,#+4
        MULS     R5,R6,R5
        ADDS     R5,R0,R5
        LDR      R7,[R5, #+32]
        MOVS     R5,#+15
        MOV      R12,R5
        MOVS     R5,R1
        LSLS     R6,R5,#+29       ;; ZeroExtS R6,R5,#+29,#+29
        LSRS     R6,R6,#+29
        MOVS     R5,#+4
        MULS     R6,R5,R6
        MOV      R5,R12
        LSLS     R5,R5,R6
        BICS     R7,R7,R5
        LDR      R5,[SP, #+0]
        STR      R7,[R5, #+32]
        UXTH     R1,R1
        MOVS     R5,R1
        ASRS     R5,R5,#+3
        MOVS     R6,#+4
        MULS     R5,R6,R5
        ADDS     R5,R0,R5
        LDR      R5,[R5, #+32]
        ORRS     R5,R5,R3
        MOVS     R4,R5
        UXTH     R1,R1
        MOVS     R5,R1
        ASRS     R5,R5,#+3
        MOVS     R6,#+4
        MULS     R5,R6,R5
        ADDS     R5,R0,R5
        STR      R4,[R5, #+32]
        POP      {R0,R4-R7}
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
// 630 bytes in section .text
// 
// 630 bytes of CODE memory
//
//Errors: none
//Warnings: none

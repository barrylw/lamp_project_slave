///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       12/Dec/2015  12:36:09
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\APP\hal_led.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\APP\hal_led.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -D USE_LORA_MODE
//        -lb G:\git_hub_lamp\lamp_slave_git\Debug\List\ --diag_suppress Pa050
//        -o G:\git_hub_lamp\lamp_slave_git\Debug\Obj\ --no_cse --no_unroll
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\hal_led.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init
        EXTERN RCC_AHBPeriphClockCmd

        PUBLIC LED_CLK
        PUBLIC LED_PIN
        PUBLIC LED_PORT
        PUBLIC hal_InitLED


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void hal_LightLED(Led_TypeDef)
hal_LightLED:
        UXTB     R0,R0
        MOVS     R1,#+2
        MULS     R1,R0,R1
        LDR      R2,??DataTable1
        LDRH     R1,[R2, R1]
        UXTB     R0,R0
        MOVS     R2,#+4
        MULS     R2,R0,R2
        LDR      R3,??DataTable1_1
        LDR      R2,[R3, R2]
        STRH     R1,[R2, #+40]
        BX       LR               ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
LED_PIN:
        DATA
        DC16 16384, 32768

        SECTION `.data`:DATA:REORDER:NOROOT(2)
LED_PORT:
        DATA
        DC32 48000800H, 48000800H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
LED_CLK:
        DATA
        DC32 524288, 524288

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitLED:
        PUSH     {R2-R4,LR}
        MOVS     R4,#+0
??hal_InitLED_0:
        UXTB     R4,R4
        CMP      R4,#+2
        BGE      ??hal_InitLED_1
        MOVS     R1,#+1
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable1_2
        LDR      R0,[R2, R0]
        BL       RCC_AHBPeriphClockCmd
        UXTB     R4,R4
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDR      R1,??DataTable1
        LDRH     R0,[R1, R0]
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOV      R1,SP
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable1_1
        LDR      R0,[R2, R0]
        BL       GPIO_Init
        MOVS     R0,R4
        UXTB     R0,R0
        BL       hal_LightLED
        ADDS     R4,R4,#+1
        B        ??hal_InitLED_0
??hal_InitLED_1:
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     LED_PIN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     LED_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     LED_CLK

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
//   8 bytes in section .data
//  12 bytes in section .rodata
// 128 bytes in section .text
// 
// 128 bytes of CODE  memory
//  12 bytes of CONST memory
//   8 bytes of DATA  memory
//
//Errors: none
//Warnings: none

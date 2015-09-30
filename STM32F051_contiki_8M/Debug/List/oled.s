///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:48:17
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\OLED\oled.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\OLED\oled.c -D
//        USE_STDPERIPH_DRIVER -D STM32F051X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -D USE_LORA_MODE -lb
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\ --diag_suppress
//        Pa050 -o F:\meterModuleFSK\STM32F051_contiki_8M\Debug\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\LIB\STM32F0xx_StdPeriph_Driver\inc\
//        -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I F:\meterModuleFSK\STM32F051_contiki_8M\LIB\CMSIS\CM0\CoreSupport\
//        -I F:\meterModuleFSK\STM32F051_contiki_8M\core\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\platform\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\lib\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\tools\wpcapslip\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\cfs\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\OLED\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\coffee_arch\ -On --vla -I
//        "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\oled.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delayms
        EXTERN GPIO_Init
        EXTERN GPIO_SetBits
        EXTERN GPIO_WriteBit
        EXTERN RCC_AHBPeriphClockCmd
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_uidiv
        EXTERN __aeabi_uidivmod

        PUBLIC F6x8
        PUBLIC F8X16
        PUBLIC Hzk
        PUBLIC OLED_Clear
        PUBLIC OLED_Display_Off
        PUBLIC OLED_Display_On
        PUBLIC OLED_DrawBMP
        PUBLIC OLED_Init
        PUBLIC OLED_Set_Pos
        PUBLIC OLED_ShowCHinese
        PUBLIC OLED_ShowChar
        PUBLIC OLED_ShowNum
        PUBLIC OLED_ShowString
        PUBLIC OLED_WR_Byte
        PUBLIC oled_pow


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const F6x8[92][6]
F6x8:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 7, 0, 7, 0, 0, 20, 127
        DC8 20, 127, 20, 0, 36, 42, 127, 42, 18, 0, 98, 100, 8, 19, 35, 0, 54
        DC8 73, 85, 34, 80, 0, 0, 5, 3, 0, 0, 0, 0, 28, 34, 65, 0, 0, 0, 65, 34
        DC8 28, 0, 0, 20, 8, 62, 8, 20, 0, 8, 8, 62, 8, 8, 0, 0, 0, 160, 96, 0
        DC8 0, 8, 8, 8, 8, 8, 0, 0, 96, 96, 0, 0, 0, 32, 16, 8, 4, 2, 0, 62, 81
        DC8 73, 69, 62, 0, 0, 66, 127, 64, 0, 0, 66, 97, 81, 73, 70, 0, 33, 65
        DC8 69, 75, 49, 0, 24, 20, 18, 127, 16, 0, 39, 69, 69, 69, 57, 0, 60
        DC8 74, 73, 73, 48, 0, 1, 113, 9, 5, 3, 0, 54, 73, 73, 73, 54, 0, 6, 73
        DC8 73, 41, 30, 0, 0, 54, 54, 0, 0, 0, 0, 86, 54, 0, 0, 0, 8, 20, 34
        DC8 65, 0, 0, 20, 20, 20, 20, 20, 0, 0, 65, 34, 20, 8, 0, 2, 1, 81, 9
        DC8 6, 0, 50, 73, 89, 81, 62, 0, 124, 18, 17, 18, 124, 0, 127, 73, 73
        DC8 73, 54, 0, 62, 65, 65, 65, 34, 0, 127, 65, 65, 34, 28, 0, 127, 73
        DC8 73, 73, 65, 0, 127, 9, 9, 9, 1, 0, 62, 65, 73, 73, 122, 0, 127, 8
        DC8 8, 8, 127, 0, 0, 65, 127, 65, 0, 0, 32, 64, 65, 63, 1, 0, 127, 8
        DC8 20, 34, 65, 0, 127, 64, 64, 64, 64, 0, 127, 2, 12, 2, 127, 0, 127
        DC8 4, 8, 16, 127, 0, 62, 65, 65, 65, 62, 0, 127, 9, 9, 9, 6, 0, 62, 65
        DC8 81, 33, 94, 0, 127, 9, 25, 41, 70, 0, 70, 73, 73, 73, 49, 0, 1, 1
        DC8 127, 1, 1, 0, 63, 64, 64, 64, 63, 0, 31, 32, 64, 32, 31, 0, 63, 64
        DC8 56, 64, 63, 0, 99, 20, 8, 20, 99, 0, 7, 8, 112, 8, 7, 0, 97, 81, 73
        DC8 69, 67, 0, 0, 127, 65, 65, 0, 0, 85, 42, 85, 42, 85, 0, 0, 65, 65
        DC8 127, 0, 0, 4, 2, 1, 2, 4, 0, 64, 64, 64, 64, 64, 0, 0, 1, 2, 4, 0
        DC8 0, 32, 84, 84, 84, 120, 0, 127, 72, 68, 68, 56, 0, 56, 68, 68, 68
        DC8 32, 0, 56, 68, 68, 72, 127, 0, 56, 84, 84, 84, 24, 0, 8, 126, 9, 1
        DC8 2, 0, 24, 164, 164, 164, 124, 0, 127, 8, 4, 4, 120, 0, 0, 68, 125
        DC8 64, 0, 0, 64, 128, 132, 125, 0, 0, 127, 16, 40, 68, 0, 0, 0, 65
        DC8 127, 64, 0, 0, 124, 4, 24, 4, 120, 0, 124, 8, 4, 4, 120, 0, 56, 68
        DC8 68, 68, 56, 0, 252, 36, 36, 36, 24, 0, 24, 36, 36, 24, 252, 0, 124
        DC8 8, 4, 4, 8, 0, 72, 84, 84, 84, 32, 0, 4, 63, 68, 64, 32, 0, 60, 64
        DC8 64, 32, 124, 0, 28, 32, 64, 32, 28, 0, 60, 64, 48, 64, 60, 0, 68
        DC8 40, 16, 40, 68, 0, 28, 160, 160, 160, 124, 0, 68, 100, 84, 76, 68
        DC8 20, 20, 20, 20, 20, 20

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const F8X16[1520]
F8X16:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 0, 0
        DC8 0, 0, 0, 0, 0, 51, 48, 0, 0, 0, 0, 16, 12, 6, 16, 12, 6, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 64, 192, 120, 64, 192, 120, 64, 0, 4, 63, 4, 4, 63
        DC8 4, 4, 0, 0, 112, 136, 252, 8, 48, 0, 0, 0, 24, 32, 255, 33, 30, 0
        DC8 0, 240, 8, 240, 0, 224, 24, 0, 0, 0, 33, 28, 3, 30, 33, 30, 0, 0
        DC8 240, 8, 136, 112, 0, 0, 0, 30, 33, 35, 36, 25, 39, 33, 16, 16, 22
        DC8 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 24, 4, 2
        DC8 0, 0, 0, 0, 7, 24, 32, 64, 0, 0, 2, 4, 24, 224, 0, 0, 0, 0, 64, 32
        DC8 24, 7, 0, 0, 0, 64, 64, 128, 240, 128, 64, 64, 0, 2, 2, 1, 15, 1, 2
        DC8 2, 0, 0, 0, 0, 240, 0, 0, 0, 0, 1, 1, 1, 31, 1, 1, 1, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 128, 176, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 48, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 128, 96, 24, 4, 0, 96, 24, 6, 1, 0, 0, 0, 0, 224, 16
        DC8 8, 8, 16, 224, 0, 0, 15, 16, 32, 32, 16, 15, 0, 0, 16, 16, 248, 0
        DC8 0, 0, 0, 0, 32, 32, 63, 32, 32, 0, 0, 0, 112, 8, 8, 8, 136, 112, 0
        DC8 0, 48, 40, 36, 34, 33, 48, 0, 0, 48, 8, 136, 136, 72, 48, 0, 0, 24
        DC8 32, 32, 32, 17, 14, 0, 0, 0, 192, 32, 16, 248, 0, 0, 0, 7, 4, 36
        DC8 36, 63, 36, 0, 0, 248, 8, 136, 136, 8, 8, 0, 0, 25, 33, 32, 32, 17
        DC8 14, 0, 0, 224, 16, 136, 136, 24, 0, 0, 0, 15, 17, 32, 32, 17, 14, 0
        DC8 0, 56, 8, 8, 200, 56, 8, 0, 0, 0, 0, 63, 0, 0, 0, 0, 0, 112, 136, 8
        DC8 8, 136, 112, 0, 0, 28, 34, 33, 33, 34, 28, 0, 0, 224, 16, 8, 8, 16
        DC8 224, 0, 0, 0, 49, 34, 34, 17, 15, 0, 0, 0, 0, 192, 192, 0, 0, 0, 0
        DC8 0, 0, 48, 48, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 128, 96, 0
        DC8 0, 0, 0, 0, 0, 128, 64, 32, 16, 8, 0, 0, 1, 2, 4, 8, 16, 32, 0, 64
        DC8 64, 64, 64, 64, 64, 64, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 8, 16, 32, 64
        DC8 128, 0, 0, 0, 32, 16, 8, 4, 2, 1, 0, 0, 112, 72, 8, 8, 8, 240, 0, 0
        DC8 0, 0, 48, 54, 1, 0, 0, 192, 48, 200, 40, 232, 16, 224, 0, 7, 24, 39
        DC8 36, 35, 20, 11, 0, 0, 0, 192, 56, 224, 0, 0, 0, 32, 60, 35, 2, 2
        DC8 39, 56, 32, 8, 248, 136, 136, 136, 112, 0, 0, 32, 63, 32, 32, 32
        DC8 17, 14, 0, 192, 48, 8, 8, 8, 8, 56, 0, 7, 24, 32, 32, 32, 16, 8, 0
        DC8 8, 248, 8, 8, 8, 16, 224, 0, 32, 63, 32, 32, 32, 16, 15, 0, 8, 248
        DC8 136, 136, 232, 8, 16, 0, 32, 63, 32, 32, 35, 32, 24, 0, 8, 248, 136
        DC8 136, 232, 8, 16, 0, 32, 63, 32, 0, 3, 0, 0, 0, 192, 48, 8, 8, 8, 56
        DC8 0, 0, 7, 24, 32, 32, 34, 30, 2, 0, 8, 248, 8, 0, 0, 8, 248, 8, 32
        DC8 63, 33, 1, 1, 33, 63, 32, 0, 8, 8, 248, 8, 8, 0, 0, 0, 32, 32, 63
        DC8 32, 32, 0, 0, 0, 0, 8, 8, 248, 8, 8, 0, 192, 128, 128, 128, 127, 0
        DC8 0, 0, 8, 248, 136, 192, 40, 24, 8, 0, 32, 63, 32, 1, 38, 56, 32, 0
        DC8 8, 248, 8, 0, 0, 0, 0, 0, 32, 63, 32, 32, 32, 32, 48, 0, 8, 248
        DC8 248, 0, 248, 248, 8, 0, 32, 63, 0, 63, 0, 63, 32, 0, 8, 248, 48
        DC8 192, 0, 8, 248, 8, 32, 63, 32, 0, 7, 24, 63, 0, 224, 16, 8, 8, 8
        DC8 16, 224, 0, 15, 16, 32, 32, 32, 16, 15, 0, 8, 248, 8, 8, 8, 8, 240
        DC8 0, 32, 63, 33, 1, 1, 1, 0, 0, 224, 16, 8, 8, 8, 16, 224, 0, 15, 24
        DC8 36, 36, 56, 80, 79, 0, 8, 248, 136, 136, 136, 136, 112, 0, 32, 63
        DC8 32, 0, 3, 12, 48, 32, 0, 112, 136, 8, 8, 8, 56, 0, 0, 56, 32, 33
        DC8 33, 34, 28, 0, 24, 8, 8, 248, 8, 8, 24, 0, 0, 0, 32, 63, 32, 0, 0
        DC8 0, 8, 248, 8, 0, 0, 8, 248, 8, 0, 31, 32, 32, 32, 32, 31, 0, 8, 120
        DC8 136, 0, 0, 200, 56, 8, 0, 0, 7, 56, 14, 1, 0, 0, 248, 8, 0, 248, 0
        DC8 8, 248, 0, 3, 60, 7, 0, 7, 60, 3, 0, 8, 24, 104, 128, 128, 104, 24
        DC8 8, 32, 48, 44, 3, 3, 44, 48, 32, 8, 56, 200, 0, 200, 56, 8, 0, 0, 0
        DC8 32, 63, 32, 0, 0, 0, 16, 8, 8, 8, 200, 56, 8, 0, 32, 56, 38, 33, 32
        DC8 32, 24, 0, 0, 0, 0, 254, 2, 2, 2, 0, 0, 0, 0, 127, 64, 64, 64, 0, 0
        DC8 12, 48, 192, 0, 0, 0, 0, 0, 0, 0, 1, 6, 56, 192, 0, 0, 2, 2, 2, 254
        DC8 0, 0, 0, 0, 64, 64, 64, 127, 0, 0, 0, 0, 0, 4, 2, 2, 2, 4, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128
        DC8 128, 128, 128, 0, 2, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 128, 128, 128, 128, 0, 0, 0, 25, 36, 34, 34, 34, 63, 32, 8, 248, 0
        DC8 128, 128, 0, 0, 0, 0, 63, 17, 32, 32, 17, 14, 0, 0, 0, 0, 128, 128
        DC8 128, 0, 0, 0, 14, 17, 32, 32, 32, 17, 0, 0, 0, 0, 128, 128, 136
        DC8 248, 0, 0, 14, 17, 32, 32, 16, 63, 32, 0, 0, 128, 128, 128, 128, 0
        DC8 0, 0, 31, 34, 34, 34, 34, 19, 0, 0, 128, 128, 240, 136, 136, 136
        DC8 24, 0, 32, 32, 63, 32, 32, 0, 0, 0, 0, 128, 128, 128, 128, 128, 0
        DC8 0, 107, 148, 148, 148, 147, 96, 0, 8, 248, 0, 128, 128, 128, 0, 0
        DC8 32, 63, 33, 0, 0, 32, 63, 32, 0, 128, 152, 152, 0, 0, 0, 0, 0, 32
        DC8 32, 63, 32, 32, 0, 0, 0, 0, 0, 128, 152, 152, 0, 0, 0, 192, 128
        DC8 128, 128, 127, 0, 0, 8, 248, 0, 0, 128, 128, 128, 0, 32, 63, 36, 2
        DC8 45, 48, 32, 0, 0, 8, 8, 248, 0, 0, 0, 0, 0, 32, 32, 63, 32, 32, 0
        DC8 0, 128, 128, 128, 128, 128, 128, 128, 0, 32, 63, 32, 0, 63, 32, 0
        DC8 63, 128, 128, 0, 128, 128, 128, 0, 0, 32, 63, 33, 0, 0, 32, 63, 32
        DC8 0, 0, 128, 128, 128, 128, 0, 0, 0, 31, 32, 32, 32, 32, 31, 0, 128
        DC8 128, 0, 128, 128, 0, 0, 0, 128, 255, 161, 32, 32, 17, 14, 0, 0, 0
        DC8 0, 128, 128, 128, 128, 0, 0, 14, 17, 32, 32, 160, 255, 128, 128
        DC8 128, 128, 0, 128, 128, 128, 0, 32, 32, 63, 33, 32, 0, 1, 0, 0, 0
        DC8 128, 128, 128, 128, 128, 0, 0, 51, 36, 36, 36, 36, 25, 0, 0, 128
        DC8 128, 224, 128, 128, 0, 0, 0, 0, 0, 31, 32, 32, 0, 0, 128, 128, 0, 0
        DC8 0, 128, 128, 0, 0, 31, 32, 32, 32, 16, 63, 32, 128, 128, 128, 0, 0
        DC8 128, 128, 128, 0, 1, 14, 48, 8, 6, 1, 0, 128, 128, 0, 128, 0, 128
        DC8 128, 128, 15, 48, 12, 3, 12, 48, 15, 0, 0, 128, 128, 0, 128, 128
        DC8 128, 0, 0, 32, 49, 46, 14, 49, 32, 0, 128, 128, 128, 0, 0, 128, 128
        DC8 128, 128, 129, 142, 112, 24, 6, 1, 0, 0, 128, 128, 128, 128, 128
        DC8 128, 0, 0, 33, 48, 44, 34, 33, 48, 0, 0, 0, 0, 0, 128, 124, 2, 2, 0
        DC8 0, 0, 0, 0, 63, 64, 64, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 255
        DC8 0, 0, 0, 0, 2, 2, 124, 128, 0, 0, 0, 0, 64, 64, 63, 0, 0, 0, 0, 0
        DC8 6, 1, 1, 2, 2, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
// __absolute char Hzk[14][32]
Hzk:
        DATA
        DC8 0, 0, 240, 16, 16, 16, 16, 255, 16, 16, 16, 16, 240, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 4, 4, 4, 4, 255
        DC8 4, 4, 4, 4, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 64, 64, 64, 95, 85, 85, 85, 117, 85, 85, 85, 95, 64, 64, 64
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 32, 15, 9
        DC8 73, 137, 121, 9, 9, 9, 15, 32, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 254, 2, 66, 74, 202, 74, 74, 202, 74, 74
        DC8 66, 2, 254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 255, 64, 80, 76, 67, 64, 64, 79, 80, 80, 92, 64, 255, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 136, 136, 136
        DC8 136, 255, 136, 136, 136, 136, 248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 31, 8, 8, 8, 8, 127, 136, 136, 136
        DC8 136, 159, 128, 240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 128, 130, 130, 130, 130, 130, 130, 226, 162, 146, 138, 134, 130
        DC8 128, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 64, 128, 127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 36, 36, 164, 254, 163, 34, 0, 34, 204, 0
        DC8 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 8, 6, 1, 255, 0, 1, 4, 4, 4, 4, 4, 255, 2, 2, 2, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16, 16, 16, 255, 16, 144, 8, 136
        DC8 136, 136, 255, 136, 136, 136, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 4, 68, 130, 127, 1, 128, 128, 64, 67, 44, 16, 40, 70
        DC8 129, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_WR_Byte:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        UXTB     R6,R6
        CMP      R6,#+0
        BEQ      ??OLED_WR_Byte_0
        MOVS     R2,#+1
        MOVS     R1,#+8
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        B        ??OLED_WR_Byte_1
??OLED_WR_Byte_0:
        MOVS     R2,#+0
        MOVS     R1,#+8
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
??OLED_WR_Byte_1:
        MOVS     R2,#+0
        MOVS     R1,#+16
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        MOVS     R0,#+0
        MOVS     R5,R0
??OLED_WR_Byte_2:
        UXTB     R5,R5
        CMP      R5,#+8
        BGE      ??OLED_WR_Byte_3
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        LSLS     R0,R4,#+24
        BPL      ??OLED_WR_Byte_4
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        B        ??OLED_WR_Byte_5
??OLED_WR_Byte_4:
        MOVS     R2,#+0
        MOVS     R1,#+2
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
??OLED_WR_Byte_5:
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        LSLS     R4,R4,#+1
        ADDS     R5,R5,#+1
        B        ??OLED_WR_Byte_2
??OLED_WR_Byte_3:
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        MOVS     R2,#+1
        MOVS     R1,#+8
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_Set_Pos:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R1,#+0
        MOVS     R0,R5
        SUBS     R0,R0,#+80
        UXTB     R0,R0
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R2,R4
        UXTB     R2,R2
        LSRS     R2,R2,#+4
        MOVS     R0,#+16
        ORRS     R0,R0,R2
        UXTB     R0,R0
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        LSLS     R2,R4,#+28       ;; ZeroExtS R2,R4,#+28,#+28
        LSRS     R2,R2,#+28
        MOVS     R0,#+1
        ORRS     R0,R0,R2
        UXTB     R0,R0
        BL       OLED_WR_Byte
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_Display_On:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+175
        BL       OLED_WR_Byte
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_Display_Off:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+174
        BL       OLED_WR_Byte
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_Clear:
        PUSH     {R3-R5,LR}
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_Clear_0:
        UXTB     R4,R4
        CMP      R4,#+8
        BGE      ??OLED_Clear_1
        MOVS     R1,#+0
        MOVS     R0,R4
        SUBS     R0,R0,#+80
        UXTB     R0,R0
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       OLED_WR_Byte
        MOVS     R0,#+0
        MOVS     R5,R0
??OLED_Clear_2:
        UXTB     R5,R5
        CMP      R5,#+128
        BGE      ??OLED_Clear_3
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       OLED_WR_Byte
        ADDS     R5,R5,#+1
        B        ??OLED_Clear_2
??OLED_Clear_3:
        ADDS     R4,R4,#+1
        B        ??OLED_Clear_0
??OLED_Clear_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_ShowChar:
        PUSH     {R2,R4-R7,LR}
        MOVS     R7,R0
        MOVS     R4,R1
        MOVS     R6,#+0
        MOVS     R5,#+0
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+32
        MOVS     R6,R0
        UXTB     R7,R7
        CMP      R7,#+128
        BLT      ??OLED_ShowChar_0
        MOVS     R0,#+0
        MOVS     R7,R0
        ADDS     R4,R4,#+2
??OLED_ShowChar_0:
        MOVS     R1,R4
        UXTB     R1,R1
        MOVS     R0,R7
        UXTB     R0,R0
        BL       OLED_Set_Pos
        MOVS     R0,#+0
        MOVS     R5,R0
??OLED_ShowChar_1:
        UXTB     R5,R5
        CMP      R5,#+8
        BGE      ??OLED_ShowChar_2
        MOVS     R1,#+1
        UXTB     R6,R6
        MOVS     R0,#+16
        MULS     R0,R6,R0
        UXTB     R5,R5
        ADDS     R0,R0,R5
        LDR      R2,??DataTable1
        LDRB     R0,[R2, R0]
        BL       OLED_WR_Byte
        ADDS     R5,R5,#+1
        B        ??OLED_ShowChar_1
??OLED_ShowChar_2:
        MOVS     R1,R4
        ADDS     R1,R1,#+1
        UXTB     R1,R1
        MOVS     R0,R7
        UXTB     R0,R0
        BL       OLED_Set_Pos
        MOVS     R0,#+0
        MOVS     R5,R0
??OLED_ShowChar_3:
        UXTB     R5,R5
        CMP      R5,#+8
        BGE      ??OLED_ShowChar_4
        MOVS     R1,#+1
        UXTB     R6,R6
        MOVS     R0,#+16
        MULS     R0,R6,R0
        UXTB     R5,R5
        ADDS     R0,R0,R5
        LDR      R2,??DataTable1
        ADDS     R0,R2,R0
        LDRB     R0,[R0, #+8]
        BL       OLED_WR_Byte
        ADDS     R5,R5,#+1
        B        ??OLED_ShowChar_3
??OLED_ShowChar_4:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
oled_pow:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R0,#+1
??oled_pow_0:
        MOVS     R3,R1
        SUBS     R1,R3,#+1
        UXTB     R3,R3
        CMP      R3,#+0
        BEQ      ??oled_pow_1
        UXTB     R2,R2
        MULS     R0,R2,R0
        B        ??oled_pow_0
??oled_pow_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_ShowNum:
        PUSH     {R0-R2,R4-R7,LR}
        SUB      SP,SP,#+16
        MOVS     R5,R3
        LDR      R7,[SP, #+48]
        MOVS     R6,#+0
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_ShowNum_0:
        UXTB     R4,R4
        UXTB     R5,R5
        CMP      R4,R5
        BCS      ??OLED_ShowNum_1
        SUBS     R0,R5,R4
        SUBS     R1,R0,#+1
        UXTB     R1,R1
        MOVS     R0,#+10
        BL       oled_pow
        MOVS     R1,R0
        LDR      R0,[SP, #+24]
        BL       __aeabi_uidiv
        MOVS     R1,#+10
        BL       __aeabi_uidivmod
        MOV      R0,SP
        STRB     R1,[R0, #+12]
        UXTB     R6,R6
        CMP      R6,#+0
        BNE      ??OLED_ShowNum_2
        UXTB     R4,R4
        UXTB     R5,R5
        SUBS     R0,R5,#+1
        CMP      R4,R0
        BGE      ??OLED_ShowNum_2
        MOV      R0,SP
        LDRB     R0,[R0, #+12]
        CMP      R0,#+0
        BNE      ??OLED_ShowNum_3
        MOVS     R2,#+32
        MOV      R0,SP
        LDRB     R1,[R0, #+20]
        STR      R1,[SP, #+4]
        STR      R2,[SP, #+8]
        MOV      R0,SP
        LDRB     R1,[R0, #+16]
        STR      R1,[SP, #+0]
        UXTB     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+2
        BL       __aeabi_idiv
        UXTB     R4,R4
        MULS     R0,R4,R0
        LDR      R1,[SP, #+0]
        ADDS     R0,R1,R0
        LDR      R2,[SP, #+8]
        LDR      R1,[SP, #+4]
        UXTB     R0,R0
        BL       OLED_ShowChar
        B        ??OLED_ShowNum_4
??OLED_ShowNum_3:
        MOVS     R0,#+1
        MOVS     R6,R0
??OLED_ShowNum_2:
        MOV      R0,SP
        LDRB     R2,[R0, #+12]
        ADDS     R2,R2,#+48
        UXTB     R2,R2
        MOV      R0,SP
        LDRB     R1,[R0, #+20]
        STR      R1,[SP, #+4]
        STR      R2,[SP, #+8]
        MOV      R0,SP
        LDRB     R1,[R0, #+16]
        STR      R1,[SP, #+0]
        UXTB     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+2
        BL       __aeabi_idiv
        UXTB     R4,R4
        MULS     R0,R4,R0
        LDR      R1,[SP, #+0]
        ADDS     R0,R1,R0
        LDR      R2,[SP, #+8]
        LDR      R1,[SP, #+4]
        UXTB     R0,R0
        BL       OLED_ShowChar
??OLED_ShowNum_4:
        ADDS     R4,R4,#+1
        B        ??OLED_ShowNum_0
??OLED_ShowNum_1:
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_ShowString:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R5,#+0
??OLED_ShowString_0:
        UXTB     R5,R5
        LDRB     R0,[R7, R5]
        CMP      R0,#+0
        BEQ      ??OLED_ShowString_1
        UXTB     R5,R5
        LDRB     R2,[R7, R5]
        MOVS     R1,R6
        UXTB     R1,R1
        MOVS     R0,R4
        UXTB     R0,R0
        BL       OLED_ShowChar
        ADDS     R4,R4,#+8
        UXTB     R4,R4
        CMP      R4,#+121
        BLT      ??OLED_ShowString_2
        MOVS     R0,#+0
        MOVS     R4,R0
        ADDS     R6,R6,#+2
??OLED_ShowString_2:
        ADDS     R5,R5,#+1
        B        ??OLED_ShowString_0
??OLED_ShowString_1:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_ShowCHinese:
        PUSH     {R2,R4-R7,LR}
        MOVS     R7,R0
        MOVS     R6,R1
        MOVS     R5,#+0
        MOVS     R1,R6
        UXTB     R1,R1
        MOVS     R0,R7
        UXTB     R0,R0
        BL       OLED_Set_Pos
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_ShowCHinese_0:
        UXTB     R4,R4
        CMP      R4,#+16
        BGE      ??OLED_ShowCHinese_1
        MOVS     R1,#+1
        UXTB     R4,R4
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R2,#+64
        MULS     R0,R2,R0
        LDR      R2,??DataTable1_1
        ADDS     R0,R2,R0
        LDRB     R0,[R0, R4]
        BL       OLED_WR_Byte
        ADDS     R5,R5,#+1
        ADDS     R4,R4,#+1
        B        ??OLED_ShowCHinese_0
??OLED_ShowCHinese_1:
        MOVS     R1,R6
        ADDS     R1,R1,#+1
        UXTB     R1,R1
        MOVS     R0,R7
        UXTB     R0,R0
        BL       OLED_Set_Pos
        MOVS     R0,#+0
        MOVS     R4,R0
??OLED_ShowCHinese_2:
        UXTB     R4,R4
        CMP      R4,#+16
        BGE      ??OLED_ShowCHinese_3
        MOVS     R1,#+1
        UXTB     R4,R4
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R2,#+64
        MULS     R0,R2,R0
        LDR      R2,??DataTable1_1
        ADDS     R0,R2,R0
        ADDS     R0,R0,R4
        ADDS     R0,R0,#+32
        LDRB     R0,[R0, #+0]
        BL       OLED_WR_Byte
        ADDS     R5,R5,#+1
        ADDS     R4,R4,#+1
        B        ??OLED_ShowCHinese_2
??OLED_ShowCHinese_3:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     F8X16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     Hzk

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_DrawBMP:
        PUSH     {R0-R2,R4-R7,LR}
        MOVS     R7,R3
        MOVS     R4,#+0
        UXTB     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+8
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??OLED_DrawBMP_0
        UXTB     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+8
        BL       __aeabi_idiv
        MOVS     R6,R0
        B        ??OLED_DrawBMP_1
??OLED_DrawBMP_0:
        UXTB     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+8
        BL       __aeabi_idiv
        ADDS     R0,R0,#+1
        MOVS     R6,R0
??OLED_DrawBMP_1:
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        MOVS     R6,R0
??OLED_DrawBMP_2:
        UXTB     R6,R6
        UXTB     R7,R7
        CMP      R6,R7
        BCS      ??OLED_DrawBMP_3
        MOVS     R1,R6
        UXTB     R1,R1
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       OLED_Set_Pos
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R5,R0
??OLED_DrawBMP_4:
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??OLED_DrawBMP_5
        MOVS     R1,#+1
        LDR      R0,[SP, #+32]
        LDRB     R0,[R0, R4]
        BL       OLED_WR_Byte
        ADDS     R4,R4,#+1
        ADDS     R5,R5,#+1
        B        ??OLED_DrawBMP_4
??OLED_DrawBMP_5:
        ADDS     R6,R6,#+1
        B        ??OLED_DrawBMP_2
??OLED_DrawBMP_3:
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OLED_Init:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_AHBPeriphClockCmd
        MOVS     R0,#+25
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOV      R1,SP
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_Init
        MOVS     R0,#+6
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOV      R1,SP
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_Init
        MOVS     R1,#+31
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        MOVS     R2,#+1
        MOVS     R1,#+4
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        MOVS     R0,#+200
        BL       Delayms
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        MOVS     R0,#+200
        BL       Delayms
        MOVS     R2,#+1
        MOVS     R1,#+4
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_WriteBit
        MOVS     R1,#+0
        MOVS     R0,#+174
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+129
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+207
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+161
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+200
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+166
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+168
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+63
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+211
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+213
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+217
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+241
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+218
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+18
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+219
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+141
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+164
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+166
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+175
        BL       OLED_WR_Byte
        MOVS     R1,#+0
        MOVS     R0,#+175
        BL       OLED_WR_Byte
        BL       OLED_Clear
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       OLED_Set_Pos
        POP      {R0-R2,PC}       ;; return

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
//   448 bytes in section .data
// 2 072 bytes in section .rodata
// 1 332 bytes in section .text
// 
// 1 332 bytes of CODE  memory
// 2 072 bytes of CONST memory
//   448 bytes of DATA  memory
//
//Errors: none
//Warnings: none

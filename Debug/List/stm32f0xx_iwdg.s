///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:35
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_iwdg.c
//    Command line =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_iwdg.c
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\stm32f0xx_iwdg.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC IWDG_Enable
        PUBLIC IWDG_GetFlagStatus
        PUBLIC IWDG_ReloadCounter
        PUBLIC IWDG_SetPrescaler
        PUBLIC IWDG_SetReload
        PUBLIC IWDG_SetWindowValue
        PUBLIC IWDG_WriteAccessCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_WriteAccessCmd:
        UXTH     R0,R0
        LDR      R1,??DataTable6  ;; 0x40003000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_SetPrescaler:
        UXTB     R0,R0
        LDR      R1,??DataTable6_1  ;; 0x40003004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_SetReload:
        UXTH     R0,R0
        LDR      R1,??DataTable6_2  ;; 0x40003008
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_ReloadCounter:
        LDR      R0,??DataTable6_3  ;; 0xaaaa
        LDR      R1,??DataTable6  ;; 0x40003000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_SetWindowValue:
        UXTH     R0,R0
        LDR      R1,??DataTable6_4  ;; 0x40003010
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_Enable:
        LDR      R0,??DataTable6_5  ;; 0xcccc
        LDR      R1,??DataTable6  ;; 0x40003000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
IWDG_GetFlagStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable6_6  ;; 0x4000300c
        LDR      R2,[R2, #+0]
        UXTH     R1,R1
        ANDS     R2,R2,R1
        CMP      R2,#+0
        BEQ      ??IWDG_GetFlagStatus_0
        MOVS     R0,#+1
        B        ??IWDG_GetFlagStatus_1
??IWDG_GetFlagStatus_0:
        MOVS     R0,#+0
??IWDG_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x40003000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x40003004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40003008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0xaaaa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x40003010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0xcccc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x4000300c

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
// 104 bytes in section .text
// 
// 104 bytes of CODE memory
//
//Errors: none
//Warnings: none

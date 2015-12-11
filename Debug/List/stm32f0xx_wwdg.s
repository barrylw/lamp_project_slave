///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:39
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_wwdg.c
//    Command line =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_wwdg.c
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\stm32f0xx_wwdg.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC WWDG_ClearFlag
        PUBLIC WWDG_DeInit
        PUBLIC WWDG_Enable
        PUBLIC WWDG_EnableIT
        PUBLIC WWDG_GetFlagStatus
        PUBLIC WWDG_SetCounter
        PUBLIC WWDG_SetPrescaler
        PUBLIC WWDG_SetWindowValue


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
WWDG_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
WWDG_SetPrescaler:
        MOVS     R1,#+0
        LDR      R2,??DataTable6  ;; 0x40002c04
        LDR      R2,[R2, #+0]
        LDR      R3,??DataTable6_1  ;; 0xfffffe7f
        ANDS     R3,R3,R2
        MOVS     R1,R3
        ORRS     R0,R0,R1
        MOVS     R1,R0
        LDR      R0,??DataTable6  ;; 0x40002c04
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
WWDG_SetWindowValue:
        SUB      SP,SP,#+4
        MOVS     R1,#+0
        STR      R1,[SP, #+0]
        LDR      R1,??DataTable6  ;; 0x40002c04
        LDR      R1,[R1, #+0]
        MOVS     R2,#+127
        BICS     R1,R1,R2
        STR      R1,[SP, #+0]
        LDR      R1,[SP, #+0]
        UXTB     R0,R0
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        ORRS     R0,R0,R1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable6  ;; 0x40002c04
        STR      R0,[R1, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
WWDG_EnableIT:
        LDR      R0,??DataTable6  ;; 0x40002c04
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6  ;; 0x40002c04
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
WWDG_SetCounter:
        UXTB     R0,R0
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        LDR      R1,??DataTable6_2  ;; 0x40002c00
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
WWDG_Enable:
        UXTB     R0,R0
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_2  ;; 0x40002c00
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
WWDG_GetFlagStatus:
        PUSH     {LR}
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3  ;; 0x40002c08
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??WWDG_GetFlagStatus_0
        MOVS     R0,#+1
        B        ??WWDG_GetFlagStatus_1
??WWDG_GetFlagStatus_0:
        MOVS     R0,#+0
??WWDG_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
WWDG_ClearFlag:
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3  ;; 0x40002c08
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x40002c04

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0xfffffe7f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40002c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x40002c08

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
// 170 bytes in section .text
// 
// 170 bytes of CODE memory
//
//Errors: none
//Warnings: none

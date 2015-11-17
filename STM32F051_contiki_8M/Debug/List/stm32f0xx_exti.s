///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:27
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_exti.c
//    Command line =  
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_exti.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -D USE_LORA_MODE -lb
//        E:\svnProject\street_lamp_new\Debug\List\ --diag_suppress Pa050 -o
//        E:\svnProject\street_lamp_new\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
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
//        E:\svnProject\street_lamp_new\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\stm32f0xx_exti.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC EXTI_ClearFlag
        PUBLIC EXTI_ClearITPendingBit
        PUBLIC EXTI_DeInit
        PUBLIC EXTI_GenerateSWInterrupt
        PUBLIC EXTI_GetFlagStatus
        PUBLIC EXTI_GetITStatus
        PUBLIC EXTI_Init
        PUBLIC EXTI_StructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_DeInit:
        LDR      R0,??DataTable6  ;; 0xf940000
        LDR      R1,??DataTable6_1  ;; 0x40010400
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable6_2  ;; 0x40010404
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable6_3  ;; 0x40010408
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable6_4  ;; 0x4001040c
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable6_5  ;; 0x6bffff
        LDR      R1,??DataTable6_6  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_Init:
        PUSH     {LR}
        MOVS     R1,#+0
        LDR      R2,??DataTable6_1  ;; 0x40010400
        MOVS     R1,R2
        LDRB     R2,[R0, #+6]
        CMP      R2,#+0
        BEQ      ??EXTI_Init_0
        LDR      R2,??DataTable6_1  ;; 0x40010400
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR      R3,??DataTable6_1  ;; 0x40010400
        STR      R2,[R3, #+0]
        LDR      R2,??DataTable6_2  ;; 0x40010404
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR      R3,??DataTable6_2  ;; 0x40010404
        STR      R2,[R3, #+0]
        LDRB     R2,[R0, #+4]
        ADDS     R1,R1,R2
        LDR      R2,[R1, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,R2
        STR      R3,[R1, #+0]
        LDR      R2,??DataTable6_3  ;; 0x40010408
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR      R3,??DataTable6_3  ;; 0x40010408
        STR      R2,[R3, #+0]
        LDR      R2,??DataTable6_4  ;; 0x4001040c
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        LDR      R3,??DataTable6_4  ;; 0x4001040c
        STR      R2,[R3, #+0]
        LDRB     R2,[R0, #+5]
        CMP      R2,#+16
        BNE      ??EXTI_Init_1
        LDR      R2,??DataTable6_3  ;; 0x40010408
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,R2
        LDR      R2,??DataTable6_3  ;; 0x40010408
        STR      R3,[R2, #+0]
        LDR      R2,??DataTable6_4  ;; 0x4001040c
        LDR      R2,[R2, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,R2
        LDR      R2,??DataTable6_4  ;; 0x4001040c
        STR      R3,[R2, #+0]
        B        ??EXTI_Init_2
??EXTI_Init_1:
        LDR      R2,??DataTable6_1  ;; 0x40010400
        MOVS     R1,R2
        LDRB     R2,[R0, #+5]
        ADDS     R1,R1,R2
        LDR      R2,[R1, #+0]
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,R2
        STR      R3,[R1, #+0]
        B        ??EXTI_Init_2
??EXTI_Init_0:
        LDRB     R2,[R0, #+4]
        ADDS     R1,R1,R2
        LDR      R2,[R1, #+0]
        LDR      R3,[R0, #+0]
        BICS     R2,R2,R3
        STR      R2,[R1, #+0]
??EXTI_Init_2:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRB     R1,[R0, #+4]
        MOVS     R1,#+12
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GenerateSWInterrupt:
        LDR      R1,??DataTable6_7  ;; 0x40010410
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,R0
        LDR      R2,??DataTable6_7  ;; 0x40010410
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GetFlagStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable6_6  ;; 0x40010414
        LDR      R2,[R2, #+0]
        ANDS     R2,R2,R1
        CMP      R2,#+0
        BEQ      ??EXTI_GetFlagStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??EXTI_GetFlagStatus_1
??EXTI_GetFlagStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??EXTI_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_ClearFlag:
        LDR      R1,??DataTable6_6  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_GetITStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable6_6  ;; 0x40010414
        LDR      R2,[R2, #+0]
        ANDS     R2,R2,R1
        CMP      R2,#+0
        BEQ      ??EXTI_GetITStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??EXTI_GetITStatus_1
??EXTI_GetITStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??EXTI_GetITStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI_ClearITPendingBit:
        LDR      R1,??DataTable6_6  ;; 0x40010414
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0xf940000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x40010400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40010404

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x40010408

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x4001040c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x6bffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x40010414

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0x40010410

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
// 304 bytes in section .text
// 
// 304 bytes of CODE memory
//
//Errors: none
//Warnings: none

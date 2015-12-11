///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:19
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\hal_nvic.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\hal_nvic.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -lb
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
//        E:\svnProject\street_lamp_new\coffee_arch\ -Ol -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\hal_nvic.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN NVIC_Init

        PUBLIC hal_InitNVIC


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        PUSH     {R4-R7,LR}
        SXTB     R0,R0
        CMP      R0,#+0
        BPL      ??NVIC_SetPriority_0
        SXTB     R0,R0
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        SUBS     R2,R2,#+8
        LSRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable0  ;; 0xe000ed1c
        SXTB     R0,R0
        LSLS     R4,R0,#+28       ;; ZeroExtS R4,R0,#+28,#+28
        LSRS     R4,R4,#+28
        SUBS     R4,R4,#+8
        LSRS     R4,R4,#+2
        MOVS     R5,#+4
        MULS     R4,R5,R4
        LDR      R5,??DataTable0  ;; 0xe000ed1c
        LDR      R4,[R5, R4]
        MOVS     R5,#+255
        LSLS     R6,R0,#+30       ;; ZeroExtS R6,R0,#+30,#+30
        LSRS     R6,R6,#+30
        MOVS     R7,#+8
        MULS     R6,R7,R6
        LSLS     R5,R5,R6
        BICS     R4,R4,R5
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        MOVS     R5,#+8
        MULS     R0,R5,R0
        LSLS     R1,R1,R0
        ORRS     R1,R1,R4
        STR      R1,[R3, R2]
        B        ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        SXTB     R0,R0
        MOVS     R2,R0
        LSRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable0_1  ;; 0xe000e400
        LDR      R2,[R3, R2]
        MOVS     R3,#+255
        LSLS     R4,R0,#+30       ;; ZeroExtS R4,R0,#+30,#+30
        LSRS     R4,R4,#+30
        MOVS     R5,#+8
        MULS     R4,R5,R4
        LSLS     R3,R3,R4
        BICS     R2,R2,R3
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LSLS     R3,R0,#+30       ;; ZeroExtS R3,R0,#+30,#+30
        LSRS     R3,R3,#+30
        MOVS     R4,#+8
        MULS     R3,R4,R3
        LSLS     R1,R1,R3
        ORRS     R1,R1,R2
        SXTB     R0,R0
        LSRS     R0,R0,#+2
        MOVS     R2,#+4
        MULS     R0,R2,R0
        LDR      R2,??DataTable0_1  ;; 0xe000e400
        STR      R1,[R2, R0]
??NVIC_SetPriority_1:
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0xe000ed1c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitNVIC:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        BL       NVIC_SetPriority
        MOVS     R0,#+4
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        BL       NVIC_Init
        MOVS     R0,#+5
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        BL       NVIC_Init
        MOVS     R0,#+7
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        BL       NVIC_Init
        MOVS     R0,#+10
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+2
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOV      R0,SP
        BL       NVIC_Init
        MOVS     R0,#+27
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        BL       NVIC_Init
        MOVS     R0,#+28
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+4
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        BL       NVIC_Init
        MOVS     R0,#+11
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+5
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        BL       NVIC_Init
        MOVS     R0,#+19
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+4
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        BL       NVIC_Init
        MOV      R0,SP
        BL       NVIC_Init
        POP      {R0,PC}          ;; return

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
// 348 bytes in section .text
// 
// 348 bytes of CODE memory
//
//Errors: none
//Warnings: none

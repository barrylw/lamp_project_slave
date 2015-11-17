///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:24
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\core\lib\ifft.c
//    Command line =  
//        E:\svnProject\street_lamp_new\core\lib\ifft.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -D USE_LORA_MODE
//        -lb E:\svnProject\street_lamp_new\Debug\List\ --diag_suppress Pa050
//        -o E:\svnProject\street_lamp_new\Debug\Obj\ --no_cse --no_unroll
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\ifft.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_uidiv

        PUBLIC ifft


        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
SIN_TAB:
        DATA
        DC8 0, 6, 13, 20, 26, 33, 39, 45, 52, 58, 63, 69, 75, 80, 85, 90, 95
        DC8 99, 103, 107, 110, 114, 116, 119, 121, 123, 125, 126, 127, 127, 127
        DC8 127, 127, 126, 125, 123, 121, 119, 116, 114, 110, 107, 103, 99, 95
        DC8 90, 85, 80, 75, 69, 63, 58, 52, 45, 39, 33, 26, 20, 13, 6, 0, -6
        DC8 -13, -20, -26, -33, -39, -45, -52, -58, -63, -69, -75, -80, -85
        DC8 -90, -95, -99, -103, -107, -110, -114, -116, -119, -121, -123, -125
        DC8 -126, -127, -127, -127, -127, -127, -126, -125, -123, -121, -119
        DC8 -116, -114, -110, -107, -103, -99, -95, -90, -85, -80, -75, -69
        DC8 -63, -58, -52, -45, -39, -33, -26, -20, -13, -6

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
bitrev:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R3,#+0
        MOVS     R0,R3
??bitrev_0:
        UXTH     R1,R1
        CMP      R1,#+0
        BEQ      ??bitrev_1
        UXTH     R0,R0
        LSLS     R0,R0,#+1
        UXTH     R2,R2
        MOVS     R3,R2
        LSLS     R3,R3,#+31       ;; ZeroExtS R3,R3,#+31,#+31
        LSRS     R3,R3,#+31
        ADDS     R0,R0,R3
        UXTH     R2,R2
        LSRS     R2,R2,#+1
        SUBS     R1,R1,#+1
        B        ??bitrev_0
??bitrev_1:
        UXTH     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
sinI:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,#+120
        MULS     R0,R4,R0
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        BL       __aeabi_uidiv
        MOVS     R5,R0
        UXTH     R5,R5
        MOVS     R0,R5
        MOVS     R1,#+120
        BL       __aeabi_idivmod
        LDR      R0,??DataTable0
        LDRSB    R0,[R0, R1]
        SXTH     R0,R0
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     SIN_TAB

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cosI:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        ADDS     R0,R0,#+250
        UXTH     R0,R0
        BL       sinI
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ilog2:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R2,#+0
        MOVS     R0,R2
        UXTH     R1,R1
        LSRS     R1,R1,#+1
??ilog2_0:
        UXTH     R1,R1
        CMP      R1,#+0
        BEQ      ??ilog2_1
        UXTH     R1,R1
        LSRS     R1,R1,#+1
        ADDS     R0,R0,#+1
        B        ??ilog2_0
??ilog2_1:
        UXTH     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ifft:
        PUSH     {R0,R2,R4-R7,LR}
        SUB      SP,SP,#+28
        MOVS     R7,R1
        MOV      R0,SP
        LDRH     R0,[R0, #+32]
        BL       ilog2
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOV      R0,SP
        MOV      R1,SP
        LDRH     R1,[R1, #+0]
        SUBS     R1,R1,#+1
        STRH     R1,[R0, #+2]
        MOV      R0,SP
        LDRH     R0,[R0, #+32]
        MOVS     R1,#+2
        BL       __aeabi_idiv
        MOVS     R6,R0
        MOVS     R0,#+0
        MOVS     R5,R0
??ifft_0:
        MOV      R0,SP
        LDRH     R0,[R0, #+32]
        CMP      R5,R0
        BGE      ??ifft_1
        MOVS     R0,#+0
        MOVS     R1,#+2
        MULS     R1,R5,R1
        STRH     R0,[R7, R1]
        ADDS     R5,R5,#+1
        B        ??ifft_0
??ifft_1:
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
??ifft_2:
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        LDR      R1,[SP, #+8]
        CMP      R0,R1
        BGE      .+4
        B        ??ifft_3
        MOVS     R0,#+0
        MOVS     R4,R0
??ifft_4:
        MOV      R0,SP
        LDRH     R0,[R0, #+32]
        CMP      R4,R0
        BGE      ??ifft_5
        MOVS     R0,#+1
        MOVS     R5,R0
??ifft_6:
        UXTH     R6,R6
        CMP      R6,R5
        BLT      ??ifft_7
        MOV      R0,SP
        LDRH     R1,[R0, #+0]
        MOVS     R0,R4
        MOV      R2,SP
        LDRH     R2,[R2, #+2]
        ASRS     R0,R0,R2
        UXTH     R0,R0
        BL       bitrev
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        MOV      R1,SP
        LDRH     R1,[R1, #+32]
        BL       __aeabi_idiv
        UXTH     R0,R0
        BL       cosI
        STR      R0,[SP, #+24]
        LDR      R0,[SP, #+4]
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        MOV      R1,SP
        LDRH     R1,[R1, #+32]
        BL       __aeabi_idiv
        UXTH     R0,R0
        BL       sinI
        STR      R0,[SP, #+20]
        UXTH     R6,R6
        ADDS     R0,R4,R6
        MOVS     R1,#+2
        MULS     R0,R1,R0
        LDR      R1,[SP, #+28]
        LDRSH    R1,[R1, R0]
        LDR      R0,[SP, #+24]
        MULS     R0,R1,R0
        UXTH     R6,R6
        ADDS     R1,R4,R6
        MOVS     R2,#+2
        MULS     R1,R2,R1
        LDRSH    R1,[R7, R1]
        LDR      R2,[SP, #+20]
        MULS     R2,R1,R2
        ADDS     R0,R0,R2
        ASRS     R0,R0,#+7
        STR      R0,[SP, #+16]
        UXTH     R6,R6
        ADDS     R0,R4,R6
        MOVS     R1,#+2
        MULS     R0,R1,R0
        LDRSH    R1,[R7, R0]
        LDR      R0,[SP, #+24]
        MULS     R0,R1,R0
        UXTH     R6,R6
        ADDS     R1,R4,R6
        MOVS     R2,#+2
        MULS     R1,R2,R1
        LDR      R2,[SP, #+28]
        LDRSH    R1,[R2, R1]
        LDR      R2,[SP, #+20]
        MULS     R2,R1,R2
        SUBS     R0,R0,R2
        ASRS     R0,R0,#+7
        STR      R0,[SP, #+12]
        UXTH     R6,R6
        ADDS     R0,R4,R6
        MOVS     R1,#+2
        MULS     R0,R1,R0
        LDR      R2,[SP, #+28]
        MOVS     R1,#+2
        MULS     R1,R4,R1
        LDR      R3,[SP, #+28]
        LDRH     R1,[R3, R1]
        LDR      R3,[SP, #+16]
        SUBS     R1,R1,R3
        STRH     R1,[R2, R0]
        UXTH     R6,R6
        ADDS     R0,R4,R6
        MOVS     R1,#+2
        MULS     R0,R1,R0
        MOVS     R1,#+2
        MULS     R1,R4,R1
        LDRH     R1,[R7, R1]
        LDR      R2,[SP, #+12]
        SUBS     R1,R1,R2
        STRH     R1,[R7, R0]
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDR      R1,[SP, #+28]
        LDRH     R0,[R1, R0]
        LDR      R1,[SP, #+16]
        ADDS     R0,R0,R1
        MOVS     R1,#+2
        MULS     R1,R4,R1
        LDR      R2,[SP, #+28]
        STRH     R0,[R2, R1]
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDRH     R0,[R7, R0]
        LDR      R1,[SP, #+12]
        ADDS     R0,R0,R1
        MOVS     R1,#+2
        MULS     R1,R4,R1
        STRH     R0,[R7, R1]
        ADDS     R4,R4,#+1
        ADDS     R5,R5,#+1
        B        ??ifft_6
??ifft_7:
        UXTH     R6,R6
        ADDS     R4,R4,R6
        B        ??ifft_4
??ifft_5:
        MOV      R0,SP
        MOV      R1,SP
        LDRH     R1,[R1, #+2]
        SUBS     R1,R1,#+1
        STRH     R1,[R0, #+2]
        UXTH     R6,R6
        MOVS     R0,R6
        MOVS     R1,#+2
        BL       __aeabi_idiv
        MOVS     R6,R0
        LDR      R0,[SP, #+8]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+8]
        B        ??ifft_2
??ifft_3:
        MOVS     R0,#+0
        MOVS     R4,R0
??ifft_8:
        MOV      R0,SP
        LDRH     R0,[R0, #+32]
        CMP      R4,R0
        BGE      ??ifft_9
        MOV      R0,SP
        LDRH     R1,[R0, #+0]
        MOVS     R0,R4
        UXTH     R0,R0
        BL       bitrev
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        CMP      R4,R0
        BGE      ??ifft_10
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDR      R1,[SP, #+28]
        LDRH     R0,[R1, R0]
        MOVS     R6,R0
        LDR      R0,[SP, #+4]
        MOVS     R1,#+2
        MULS     R0,R1,R0
        LDR      R1,[SP, #+28]
        LDRH     R0,[R1, R0]
        MOVS     R1,#+2
        MULS     R1,R4,R1
        LDR      R2,[SP, #+28]
        STRH     R0,[R2, R1]
        LDR      R0,[SP, #+4]
        MOVS     R1,#+2
        MULS     R0,R1,R0
        LDR      R1,[SP, #+28]
        STRH     R6,[R1, R0]
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDRH     R0,[R7, R0]
        MOVS     R6,R0
        LDR      R0,[SP, #+4]
        MOVS     R1,#+2
        MULS     R0,R1,R0
        LDRH     R0,[R7, R0]
        MOVS     R1,#+2
        MULS     R1,R4,R1
        STRH     R0,[R7, R1]
        LDR      R0,[SP, #+4]
        MOVS     R1,#+2
        MULS     R0,R1,R0
        STRH     R6,[R7, R0]
??ifft_10:
        ADDS     R4,R4,#+1
        B        ??ifft_8
??ifft_9:
        MOVS     R0,#+0
        MOVS     R5,R0
        MOV      R0,SP
        LDRH     R0,[R0, #+32]
        MOVS     R1,#+2
        BL       __aeabi_idiv
        MOVS     R6,R0
??ifft_11:
        UXTH     R6,R6
        CMP      R5,R6
        BGE      ??ifft_12
        MOVS     R0,#+2
        MULS     R0,R5,R0
        LDR      R1,[SP, #+28]
        LDRSH    R0,[R1, R0]
        CMP      R0,#+0
        BPL      ??ifft_13
        MOVS     R0,#+2
        MULS     R0,R5,R0
        LDR      R1,[SP, #+28]
        LDRSH    R1,[R1, R0]
        RSBS     R0,R1,#+0
        B        ??ifft_14
??ifft_13:
        MOVS     R0,#+2
        MULS     R0,R5,R0
        LDR      R1,[SP, #+28]
        LDRSH    R0,[R1, R0]
??ifft_14:
        MOVS     R1,#+2
        MULS     R1,R5,R1
        LDRSH    R1,[R7, R1]
        CMP      R1,#+0
        BPL      ??ifft_15
        MOVS     R1,#+2
        MULS     R1,R5,R1
        LDRSH    R2,[R7, R1]
        RSBS     R1,R2,#+0
        B        ??ifft_16
??ifft_15:
        MOVS     R1,#+2
        MULS     R1,R5,R1
        LDRSH    R1,[R7, R1]
??ifft_16:
        ADDS     R0,R0,R1
        MOVS     R1,#+2
        MULS     R1,R5,R1
        LDR      R2,[SP, #+28]
        STRH     R0,[R2, R1]
        ADDS     R5,R5,#+1
        B        ??ifft_11
??ifft_12:
        ADD      SP,SP,#+36
        POP      {R4-R7,PC}       ;; return

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
// 120 bytes in section .rodata
// 694 bytes in section .text
// 
// 694 bytes of CODE  memory
// 120 bytes of CONST memory
//
//Errors: none
//Warnings: none

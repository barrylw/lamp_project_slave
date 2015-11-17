///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:22
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\hal_falsh.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\hal_falsh.c -D USE_STDPERIPH_DRIVER
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\hal_falsh.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FLASH_ClearFlag
        EXTERN FLASH_ProgramHalfWord
        EXTERN FLASH_ProgramWord
        EXTERN FLASH_Unlock
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod

        PUBLIC FLASH_If_Write
        PUBLIC FLASH_Init
        PUBLIC FLASH_Write_16BITS
        PUBLIC FLASH_Write_Params
        PUBLIC FLASH_Write_chars
        PUBLIC hal_Init_Flash


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Init:
        PUSH     {R7,LR}
        BL       FLASH_Unlock
        MOVS     R0,#+53
        BL       FLASH_ClearFlag
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_Init_Flash:
        PUSH     {R7,LR}
        BL       FLASH_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_If_Write:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R5,#+0
        MOVS     R0,#+0
        MOVS     R5,R0
??FLASH_If_Write_0:
        UXTH     R7,R7
        CMP      R5,R7
        BCS      ??FLASH_If_Write_1
        LDR      R0,[R4, #+0]
        LDR      R1,??DataTable0  ;; 0x800fffc
        CMP      R0,R1
        BCS      ??FLASH_If_Write_1
        MOVS     R0,#+4
        MULS     R0,R5,R0
        LDR      R1,[R6, R0]
        LDR      R0,[R4, #+0]
        BL       FLASH_ProgramWord
        CMP      R0,#+4
        BNE      ??FLASH_If_Write_2
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        MULS     R1,R5,R1
        LDR      R1,[R6, R1]
        CMP      R0,R1
        BEQ      ??FLASH_If_Write_3
        MOVS     R0,#+2
        B        ??FLASH_If_Write_4
??FLASH_If_Write_3:
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+4
        STR      R0,[R4, #+0]
        ADDS     R5,R5,#+1
        B        ??FLASH_If_Write_0
??FLASH_If_Write_2:
        MOVS     R0,#+1
        B        ??FLASH_If_Write_4
??FLASH_If_Write_1:
        MOVS     R0,#+0
??FLASH_If_Write_4:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x800fffc

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Write_chars:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        CPSID    I
        MOVS     R4,#+0
??FLASH_Write_chars_0:
        UXTH     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+2
        BL       __aeabi_idiv
        UXTH     R4,R4
        CMP      R4,R0
        BGE      ??FLASH_Write_chars_1
        UXTH     R4,R4
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDRB     R0,[R6, R0]
        UXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        ADDS     R1,R6,R1
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOV      R0,SP
        LDRH     R1,[R0, #+0]
        MOVS     R0,R5
        BL       FLASH_ProgramHalfWord
        CMP      R0,#+4
        BNE      ??FLASH_Write_chars_2
        LDRH     R0,[R5, #+0]
        MOV      R1,SP
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??FLASH_Write_chars_3
        CPSIE    I
        MOVS     R0,#+2
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_3:
        ADDS     R5,R5,#+2
        ADDS     R4,R4,#+1
        B        ??FLASH_Write_chars_0
??FLASH_Write_chars_2:
        CPSIE    I
        MOVS     R0,#+1
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_1:
        UXTH     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+2
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??FLASH_Write_chars_5
        CPSIE    I
        MOVS     R0,#+0
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_5:
        MOV      R0,SP
        UXTH     R7,R7
        ADDS     R1,R6,R7
        SUBS     R1,R1,#+1
        LDRB     R1,[R1, #+0]
        STRH     R1,[R0, #+0]
        MOV      R0,SP
        LDRH     R1,[R0, #+0]
        MOVS     R0,R5
        BL       FLASH_ProgramHalfWord
        CMP      R0,#+4
        BNE      ??FLASH_Write_chars_6
        LDRH     R0,[R5, #+0]
        MOV      R1,SP
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??FLASH_Write_chars_7
        CPSIE    I
        MOVS     R0,#+2
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_7:
        CPSIE    I
        MOVS     R0,#+0
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_6:
        CPSIE    I
        MOVS     R0,#+1
??FLASH_Write_chars_4:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Write_16BITS:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R7,R2
        CPSID    I
        MOVS     R5,#+0
??FLASH_Write_16BITS_0:
        UXTH     R5,R5
        UXTH     R7,R7
        CMP      R5,R7
        BCS      ??FLASH_Write_16BITS_1
        UXTH     R5,R5
        MOVS     R0,#+2
        MULS     R0,R5,R0
        LDRH     R1,[R6, R0]
        LDR      R0,[R4, #+0]
        BL       FLASH_ProgramHalfWord
        CMP      R0,#+4
        BNE      ??FLASH_Write_16BITS_2
        LDR      R0,[R4, #+0]
        LDRH     R0,[R0, #+0]
        UXTH     R5,R5
        MOVS     R1,#+2
        MULS     R1,R5,R1
        LDRH     R1,[R6, R1]
        CMP      R0,R1
        BEQ      ??FLASH_Write_16BITS_3
        MOVS     R0,#+2
        B        ??FLASH_Write_16BITS_4
??FLASH_Write_16BITS_3:
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+2
        STR      R0,[R4, #+0]
        ADDS     R5,R5,#+1
        B        ??FLASH_Write_16BITS_0
??FLASH_Write_16BITS_2:
        MOVS     R0,#+1
        B        ??FLASH_Write_16BITS_4
??FLASH_Write_16BITS_1:
        CPSIE    I
        MOVS     R0,#+0
??FLASH_Write_16BITS_4:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Write_Params:
        MOVS     R3,R0
        MOVS     R0,#+0
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
// 364 bytes in section .text
// 
// 364 bytes of CODE memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:23
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\core\lib\memb.c
//    Command line =  
//        E:\svnProject\street_lamp_new\core\lib\memb.c -D USE_STDPERIPH_DRIVER
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\memb.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN memset

        PUBLIC memb_alloc
        PUBLIC memb_free
        PUBLIC memb_init
        PUBLIC memb_inmemb


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_init:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDRH     R2,[R4, #+2]
        MOVS     R1,#+0
        LDR      R0,[R4, #+4]
        BL       memset
        LDRH     R2,[R4, #+0]
        LDRH     R0,[R4, #+2]
        MULS     R2,R0,R2
        MOVS     R1,#+0
        LDR      R0,[R4, #+8]
        BL       memset
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_alloc:
        PUSH     {LR}
        MOVS     R1,#+0
        B        ??memb_alloc_0
??memb_alloc_1:
        ADDS     R1,R1,#+1
??memb_alloc_0:
        LDRH     R2,[R0, #+2]
        CMP      R1,R2
        BGE      ??memb_alloc_2
        LDR      R2,[R0, #+4]
        LDRB     R2,[R2, R1]
        CMP      R2,#+0
        BNE      ??memb_alloc_1
        LDR      R2,[R0, #+4]
        LDRB     R2,[R2, R1]
        ADDS     R2,R2,#+1
        LDR      R3,[R0, #+4]
        STRB     R2,[R3, R1]
        LDRH     R2,[R0, #+0]
        MULS     R1,R2,R1
        LDR      R0,[R0, #+8]
        ADDS     R0,R0,R1
        B        ??memb_alloc_3
??memb_alloc_2:
        MOVS     R0,#+0
??memb_alloc_3:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_free:
        PUSH     {R4,LR}
        LDR      R3,[R0, #+8]
        MOVS     R2,#+0
        B        ??memb_free_0
??memb_free_1:
        LDRH     R4,[R0, #+0]
        ADDS     R3,R3,R4
        ADDS     R2,R2,#+1
??memb_free_0:
        LDRH     R4,[R0, #+2]
        CMP      R2,R4
        BGE      ??memb_free_2
        CMP      R3,R1
        BNE      ??memb_free_1
        LDR      R1,[R0, #+4]
        LDRB     R1,[R1, R2]
        CMP      R1,#+0
        BEQ      ??memb_free_3
        LDR      R1,[R0, #+4]
        LDRB     R1,[R1, R2]
        SUBS     R1,R1,#+1
        LDR      R3,[R0, #+4]
        STRB     R1,[R3, R2]
??memb_free_3:
        LDR      R0,[R0, #+4]
        LDRB     R0,[R0, R2]
        B        ??memb_free_4
??memb_free_2:
        MOVS     R0,#+255
??memb_free_4:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
memb_inmemb:
        PUSH     {LR}
        LDR      R2,[R0, #+8]
        CMP      R1,R2
        BCC      ??memb_inmemb_0
        LDRH     R2,[R0, #+2]
        LDRH     R3,[R0, #+0]
        MULS     R2,R3,R2
        LDR      R0,[R0, #+8]
        ADDS     R0,R0,R2
        CMP      R1,R0
        BCS      ??memb_inmemb_0
        MOVS     R0,#+1
        B        ??memb_inmemb_1
??memb_inmemb_0:
        MOVS     R0,#+0
??memb_inmemb_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

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
// 160 bytes in section .text
// 
// 160 bytes of CODE memory
//
//Errors: none
//Warnings: none
///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:22
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\core\lib\list.c
//    Command line =  
//        E:\svnProject\street_lamp_new\core\lib\list.c -D USE_STDPERIPH_DRIVER
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\list.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC list_add
        PUBLIC list_chop
        PUBLIC list_copy
        PUBLIC list_head
        PUBLIC list_init
        PUBLIC list_insert
        PUBLIC list_item_next
        PUBLIC list_length
        PUBLIC list_pop
        PUBLIC list_push
        PUBLIC list_remove
        PUBLIC list_tail


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_init:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_head:
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_copy:
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_tail:
        PUSH     {LR}
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BNE      ??list_tail_0
        MOVS     R0,#+0
        B        ??list_tail_1
??list_tail_0:
        LDR      R0,[R0, #+0]
        B        ??list_tail_2
??list_tail_3:
        LDR      R0,[R0, #+0]
??list_tail_2:
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BNE      ??list_tail_3
??list_tail_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_add:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R1,R4
        MOVS     R0,R5
        BL       list_remove
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
        MOVS     R0,R5
        BL       list_tail
        CMP      R0,#+0
        BNE      ??list_add_0
        STR      R4,[R5, #+0]
        B        ??list_add_1
??list_add_0:
        STR      R4,[R0, #+0]
??list_add_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_push:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R1,R4
        MOVS     R0,R5
        BL       list_remove
        LDR      R0,[R5, #+0]
        STR      R0,[R4, #+0]
        STR      R4,[R5, #+0]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_chop:
        PUSH     {LR}
        LDR      R1,[R0, #+0]
        CMP      R1,#+0
        BNE      ??list_chop_0
        MOVS     R0,#+0
        B        ??list_chop_1
??list_chop_0:
        LDR      R1,[R0, #+0]
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE      ??list_chop_2
        LDR      R1,[R0, #+0]
        MOVS     R2,#+0
        STR      R2,[R0, #+0]
        MOVS     R0,R1
        B        ??list_chop_1
??list_chop_2:
        LDR      R1,[R0, #+0]
        B        ??list_chop_3
??list_chop_4:
        LDR      R1,[R1, #+0]
??list_chop_3:
        LDR      R0,[R1, #+0]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??list_chop_4
        LDR      R0,[R1, #+0]
        MOVS     R2,#+0
        STR      R2,[R1, #+0]
??list_chop_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_pop:
        PUSH     {LR}
        MOVS     R1,R0
        LDR      R0,[R1, #+0]
        LDR      R2,[R1, #+0]
        CMP      R2,#+0
        BEQ      ??list_pop_0
        LDR      R2,[R1, #+0]
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
??list_pop_0:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_remove:
        PUSH     {LR}
        LDR      R2,[R0, #+0]
        CMP      R2,#+0
        BEQ      ??list_remove_0
??list_remove_1:
        MOVS     R3,#+0
        LDR      R2,[R0, #+0]
        B        ??list_remove_2
??list_remove_3:
        MOVS     R3,R2
        LDR      R2,[R2, #+0]
??list_remove_2:
        CMP      R2,#+0
        BEQ      ??list_remove_4
        CMP      R2,R1
        BNE      ??list_remove_3
        CMP      R3,#+0
        BNE      ??list_remove_5
        LDR      R1,[R2, #+0]
        STR      R1,[R0, #+0]
        B        ??list_remove_6
??list_remove_5:
        LDR      R0,[R2, #+0]
        STR      R0,[R3, #+0]
??list_remove_6:
        MOVS     R0,#+0
        STR      R0,[R2, #+0]
        B        ??list_remove_0
??list_remove_4:
??list_remove_0:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_length:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R1,[R1, #+0]
        B        ??list_length_0
??list_length_1:
        ADDS     R0,R0,#+1
        LDR      R1,[R1, #+0]
??list_length_0:
        CMP      R1,#+0
        BNE      ??list_length_1
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_insert:
        PUSH     {R7,LR}
        CMP      R1,#+0
        BNE      ??list_insert_0
        MOVS     R1,R2
        BL       list_push
        B        ??list_insert_1
??list_insert_0:
        LDR      R0,[R1, #+0]
        STR      R0,[R2, #+0]
        STR      R2,[R1, #+0]
??list_insert_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
list_item_next:
        PUSH     {LR}
        CMP      R0,#+0
        BNE      ??list_item_next_0
        MOVS     R0,#+0
        B        ??list_item_next_1
??list_item_next_0:
        LDR      R0,[R0, #+0]
??list_item_next_1:
        POP      {PC}             ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 276 bytes in section .text
// 
// 276 bytes of CODE memory
//
//Errors: none
//Warnings: none

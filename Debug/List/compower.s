///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\gitclone\lamp_project_slave\core\sys\compower.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\core\sys\compower.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
//        G:\gitclone\lamp_project_slave\Debug\List\ --diag_suppress Pa050 -o
//        G:\gitclone\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        G:\gitclone\lamp_project_slave\APP\ -I
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\CoreSupport\ -I
//        G:\gitclone\lamp_project_slave\core\ -I
//        G:\gitclone\lamp_project_slave\core\sys\ -I
//        G:\gitclone\lamp_project_slave\platform\ -I
//        G:\gitclone\lamp_project_slave\core\lib\ -I
//        G:\gitclone\lamp_project_slave\tools\wpcapslip\ -I
//        G:\gitclone\lamp_project_slave\core\cfs\ -I
//        G:\gitclone\lamp_project_slave\OLED\ -I
//        G:\gitclone\lamp_project_slave\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\gitclone\lamp_project_slave\Debug\List\compower.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN energest_flush
        EXTERN energest_type_time
        EXTERN packetbuf_attr
        EXTERN packetbuf_set_attr

        PUBLIC compower_accumulate
        PUBLIC compower_accumulate_attrs
        PUBLIC compower_attrconv
        PUBLIC compower_clear
        PUBLIC compower_idle_activity
        PUBLIC compower_init


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
compower_idle_activity:
        DS8 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
compower_init:
        PUSH     {R7,LR}
        LDR      R0,??DataTable1
        BL       compower_clear
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
compower_accumulate:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        BL       energest_flush
        MOVS     R0,#+7
        BL       energest_type_time
        MOVS     R5,R0
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,R5
        LDR      R1,??DataTable1_1
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        STR      R0,[R4, #+0]
        LDR      R0,??DataTable1_1
        STR      R5,[R0, #+0]
        MOVS     R0,#+6
        BL       energest_type_time
        MOVS     R6,R0
        LDR      R0,[R4, #+4]
        ADDS     R0,R0,R6
        LDR      R1,??DataTable1_2
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        STR      R0,[R4, #+4]
        LDR      R0,??DataTable1_2
        STR      R6,[R0, #+0]
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     compower_idle_activity

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     ??last_listen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     ??last_transmit

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??last_listen:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??last_transmit:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
compower_clear:
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
compower_attrconv:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+7
        BL       packetbuf_attr
        LDR      R1,[R4, #+0]
        ADDS     R1,R0,R1
        UXTH     R1,R1
        MOVS     R0,#+7
        BL       packetbuf_set_attr
        MOVS     R0,#+8
        BL       packetbuf_attr
        LDR      R1,[R4, #+4]
        ADDS     R1,R0,R1
        UXTH     R1,R1
        MOVS     R0,#+8
        BL       packetbuf_set_attr
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
compower_accumulate_attrs:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR      R5,[R4, #+0]
        MOVS     R0,#+7
        BL       packetbuf_attr
        ADDS     R0,R5,R0
        STR      R0,[R4, #+0]
        LDR      R5,[R4, #+4]
        MOVS     R0,#+8
        BL       packetbuf_attr
        ADDS     R0,R5,R0
        STR      R0,[R4, #+4]
        POP      {R0,R4,R5,PC}    ;; return

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
//  16 bytes in section .bss
// 160 bytes in section .text
// 
// 160 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: none

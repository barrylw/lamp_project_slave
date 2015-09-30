///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:31:18
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\timetable-aggregate.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\timetable-aggregate.c
//        -D USE_STDPERIPH_DRIVER -D STM32F051X8 -D AUTOSTART_ENABLE -D
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
//    List file    =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\timetable-aggregate.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidiv
        EXTERN printf
        EXTERN timetable_timestamp_time

        PUBLIC timetable_aggregate_compute_categories
        PUBLIC timetable_aggregate_compute_detailed
        PUBLIC timetable_aggregate_print_categories
        PUBLIC timetable_aggregate_print_detailed
        PUBLIC timetable_aggregate_reset


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_aggregate_category:
        PUSH     {R4-R6,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,R0
??find_aggregate_category_0:
        LDR      R0,[R2, #+4]
        CMP      R3,R0
        BGE      ??find_aggregate_category_1
        MOVS     R0,#+12
        MULS     R0,R3,R0
        LDR      R5,[R2, #+0]
        LDR      R0,[R5, R0]
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        MOVS     R5,#+12
        MULS     R5,R3,R5
        LDR      R6,[R2, #+0]
        LDR      R5,[R6, R5]
        LDRB     R5,[R5, #+1]
        ADDS     R0,R0,R5
        MOVS     R4,R0
        UXTH     R4,R4
        UXTH     R1,R1
        CMP      R4,R1
        BNE      ??find_aggregate_category_2
        MOVS     R0,#+12
        MULS     R3,R0,R3
        LDR      R0,[R2, #+0]
        ADDS     R0,R0,R3
        B        ??find_aggregate_category_3
??find_aggregate_category_2:
        ADDS     R3,R3,#+1
        B        ??find_aggregate_category_0
??find_aggregate_category_1:
        LDR      R0,[R2, #+8]
        CMP      R3,R0
        BNE      ??find_aggregate_category_4
        MOVS     R0,#+0
        B        ??find_aggregate_category_3
??find_aggregate_category_4:
        MOVS     R0,#+0
        LDR      R5,[R2, #+4]
        MOVS     R6,#+12
        MULS     R5,R6,R5
        LDR      R6,[R2, #+0]
        STR      R0,[R6, R5]
        LDR      R0,[R2, #+4]
        MOVS     R5,R0
        ADDS     R5,R5,#+1
        STR      R5,[R2, #+4]
        MOVS     R5,#+12
        MULS     R0,R5,R0
        LDR      R2,[R2, #+0]
        ADDS     R0,R2,R0
??find_aggregate_category_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_aggregate:
        PUSH     {R4,R5,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,R0
??find_aggregate_0:
        LDR      R0,[R2, #+4]
        CMP      R3,R0
        BGE      ??find_aggregate_1
        MOVS     R0,#+12
        MULS     R0,R3,R0
        LDR      R4,[R2, #+0]
        LDR      R0,[R4, R0]
        CMP      R0,R1
        BNE      ??find_aggregate_2
        MOVS     R0,#+12
        MULS     R3,R0,R3
        LDR      R0,[R2, #+0]
        ADDS     R0,R0,R3
        B        ??find_aggregate_3
??find_aggregate_2:
        ADDS     R3,R3,#+1
        B        ??find_aggregate_0
??find_aggregate_1:
        LDR      R0,[R2, #+8]
        CMP      R3,R0
        BNE      ??find_aggregate_4
        MOVS     R0,#+0
        B        ??find_aggregate_3
??find_aggregate_4:
        MOVS     R0,#+0
        LDR      R4,[R2, #+4]
        MOVS     R5,#+12
        MULS     R4,R5,R4
        LDR      R5,[R2, #+0]
        STR      R0,[R5, R4]
        LDR      R0,[R2, #+4]
        MOVS     R4,R0
        ADDS     R4,R4,#+1
        STR      R4,[R2, #+4]
        MOVS     R4,#+12
        MULS     R0,R4,R0
        LDR      R2,[R2, #+0]
        ADDS     R0,R2,R0
??find_aggregate_3:
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timetable_aggregate_print_detailed:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??timetable_aggregate_print_detailed_0:
        LDR      R0,[R5, #+4]
        CMP      R4,R0
        BGE      ??timetable_aggregate_print_detailed_1
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        ADDS     R0,R1,R0
        LDR      R0,[R0, #+8]
        MOVS     R1,#+12
        MULS     R1,R4,R1
        LDR      R2,[R5, #+0]
        ADDS     R1,R2,R1
        LDRH     R1,[R1, #+4]
        BL       __aeabi_uidiv
        STR      R0,[SP, #+0]
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        ADDS     R0,R1,R0
        LDRH     R3,[R0, #+4]
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        ADDS     R0,R1,R0
        LDR      R2,[R0, #+8]
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        LDR      R1,[R1, R0]
        LDR      R0,??DataTable3
        BL       printf
        ADDS     R4,R4,#+1
        B        ??timetable_aggregate_print_detailed_0
??timetable_aggregate_print_detailed_1:
        LDR      R3,[R5, #+4]
        MOVS     R0,#+12
        MULS     R3,R0,R3
        LDR      R2,[R5, #+4]
        MOVS     R1,#+12
        LDR      R0,??DataTable3_1
        BL       printf
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timetable_aggregate_reset:
        PUSH     {R4,LR}
        MOVS     R2,#+0
        MOVS     R1,R2
??timetable_aggregate_reset_0:
        LDR      R2,[R0, #+4]
        CMP      R1,R2
        BGE      ??timetable_aggregate_reset_1
        MOVS     R2,#+0
        MOVS     R3,#+12
        MULS     R3,R1,R3
        LDR      R4,[R0, #+0]
        ADDS     R3,R4,R3
        STR      R2,[R3, #+8]
        MOVS     R2,#+0
        MOVS     R3,#+12
        MULS     R3,R1,R3
        LDR      R4,[R0, #+0]
        ADDS     R3,R4,R3
        STRH     R2,[R3, #+4]
        ADDS     R1,R1,#+1
        B        ??timetable_aggregate_reset_0
??timetable_aggregate_reset_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timetable_aggregate_print_categories:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R5,R0
        MOVS     R0,#+0
        MOVS     R4,R0
??timetable_aggregate_print_categories_0:
        LDR      R0,[R5, #+4]
        CMP      R4,R0
        BGE      ??timetable_aggregate_print_categories_1
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        ADDS     R0,R1,R0
        LDR      R0,[R0, #+8]
        MOVS     R1,#+12
        MULS     R1,R4,R1
        LDR      R2,[R5, #+0]
        ADDS     R1,R2,R1
        LDRH     R1,[R1, #+4]
        BL       __aeabi_uidiv
        STR      R0,[SP, #+4]
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        ADDS     R0,R1,R0
        LDRH     R0,[R0, #+4]
        STR      R0,[SP, #+0]
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        ADDS     R0,R1,R0
        LDR      R3,[R0, #+8]
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        LDR      R0,[R1, R0]
        LDRB     R2,[R0, #+1]
        MOVS     R0,#+12
        MULS     R0,R4,R0
        LDR      R1,[R5, #+0]
        LDR      R0,[R1, R0]
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable3_2
        BL       printf
        ADDS     R4,R4,#+1
        B        ??timetable_aggregate_print_categories_0
??timetable_aggregate_print_categories_1:
        LDR      R3,[R5, #+4]
        MOVS     R0,#+12
        MULS     R3,R0,R3
        LDR      R2,[R5, #+4]
        MOVS     R1,#+12
        LDR      R0,??DataTable3_1
        BL       printf
        POP      {R0-R2,R4,R5,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timetable_aggregate_compute_detailed:
        PUSH     {R3-R7,LR}
        MOVS     R7,R0
        MOVS     R6,R1
        MOV      R0,SP
        LDR      R1,[R6, #+0]
        LDRH     R1,[R1, #+4]
        STRH     R1,[R0, #+0]
        MOVS     R0,#+1
        MOVS     R4,R0
??timetable_aggregate_compute_detailed_0:
        LDR      R0,[R6, #+8]
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BCS      ??timetable_aggregate_compute_detailed_1
        MOVS     R0,#+8
        MULS     R0,R4,R0
        LDR      R1,[R6, #+0]
        ADDS     R0,R1,R0
        SUBS     R0,R0,#+8
        LDR      R1,[R0, #+0]
        MOVS     R0,R7
        BL       find_aggregate
        MOVS     R5,R0
        CMP      R5,#+0
        BEQ      ??timetable_aggregate_compute_detailed_2
        LDR      R0,[R5, #+0]
        CMP      R0,#+0
        BNE      ??timetable_aggregate_compute_detailed_3
        MOVS     R0,#+8
        MULS     R0,R4,R0
        LDR      R1,[R6, #+0]
        ADDS     R0,R1,R0
        SUBS     R0,R0,#+8
        LDR      R0,[R0, #+0]
        STR      R0,[R5, #+0]
        MOVS     R0,#+8
        MULS     R0,R4,R0
        LDR      R1,[R6, #+0]
        ADDS     R0,R1,R0
        LDRH     R0,[R0, #+4]
        MOV      R1,SP
        LDRH     R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR      R1,??DataTable3_3
        LDRH     R1,[R1, #+0]
        SUBS     R0,R0,R1
        STR      R0,[R5, #+8]
        MOVS     R0,#+1
        STRH     R0,[R5, #+4]
        B        ??timetable_aggregate_compute_detailed_2
??timetable_aggregate_compute_detailed_3:
        LDR      R0,[R5, #+8]
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R2,[R6, #+0]
        ADDS     R1,R2,R1
        LDRH     R1,[R1, #+4]
        MOV      R2,SP
        LDRH     R2,[R2, #+0]
        SUBS     R1,R1,R2
        LDR      R2,??DataTable3_3
        LDRH     R2,[R2, #+0]
        SUBS     R1,R1,R2
        ADDS     R0,R0,R1
        STR      R0,[R5, #+8]
        LDRH     R0,[R5, #+4]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+4]
??timetable_aggregate_compute_detailed_2:
        MOV      R0,SP
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R2,[R6, #+0]
        ADDS     R1,R2,R1
        LDRH     R1,[R1, #+4]
        STRH     R1,[R0, #+0]
        ADDS     R4,R4,#+1
        B        ??timetable_aggregate_compute_detailed_0
??timetable_aggregate_compute_detailed_1:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timetable_aggregate_compute_categories:
        PUSH     {R0,R4-R7,LR}
        SUB      SP,SP,#+72
        MOVS     R7,R1
        MOVS     R6,#+0
        MOV      R0,SP
        LDR      R1,[R7, #+0]
        LDRH     R1,[R1, #+4]
        STRH     R1,[R0, #+6]
        MOVS     R0,#+1
        MOVS     R4,R0
??timetable_aggregate_compute_categories_0:
        LDR      R0,[R7, #+8]
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BCS      ??timetable_aggregate_compute_categories_1
        MOVS     R0,#+8
        MULS     R0,R4,R0
        LDR      R1,[R7, #+0]
        ADDS     R0,R1,R0
        SUBS     R0,R0,#+8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R2,[R7, #+0]
        ADDS     R1,R2,R1
        SUBS     R1,R1,#+8
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+1]
        ADDS     R0,R0,R1
        MOV      R1,SP
        STRH     R0,[R1, #+4]
        MOV      R0,SP
        LDRH     R1,[R0, #+4]
        LDR      R0,[SP, #+72]
        BL       find_aggregate_category
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ      ??timetable_aggregate_compute_categories_2
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??timetable_aggregate_compute_categories_3
        MOVS     R0,#+8
        MULS     R0,R4,R0
        LDR      R1,[R7, #+0]
        ADDS     R0,R1,R0
        SUBS     R0,R0,#+8
        LDR      R0,[R0, #+0]
        LDR      R1,[SP, #+0]
        STR      R0,[R1, #+0]
        MOVS     R0,#+8
        MULS     R0,R4,R0
        LDR      R1,[R7, #+0]
        ADDS     R0,R1,R0
        LDRH     R0,[R0, #+4]
        MOV      R1,SP
        LDRH     R1,[R1, #+6]
        SUBS     R0,R0,R1
        LDR      R1,??DataTable3_3
        LDRH     R1,[R1, #+0]
        SUBS     R0,R0,R1
        LDR      R1,[SP, #+0]
        STR      R0,[R1, #+8]
        MOVS     R0,#+1
        LDR      R1,[SP, #+0]
        STRH     R0,[R1, #+4]
        B        ??timetable_aggregate_compute_categories_2
??timetable_aggregate_compute_categories_3:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+8]
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R2,[R7, #+0]
        ADDS     R1,R2,R1
        LDRH     R1,[R1, #+4]
        MOV      R2,SP
        LDRH     R2,[R2, #+6]
        SUBS     R1,R1,R2
        LDR      R2,??DataTable3_3
        LDRH     R2,[R2, #+0]
        SUBS     R1,R1,R2
        ADDS     R0,R0,R1
        LDR      R1,[SP, #+0]
        STR      R0,[R1, #+8]
        MOVS     R0,#+0
        MOVS     R5,R0
??timetable_aggregate_compute_categories_4:
        CMP      R5,R6
        BGE      ??timetable_aggregate_compute_categories_5
        MOVS     R0,#+2
        MULS     R0,R5,R0
        ADD      R1,SP,#+8
        LDRH     R0,[R1, R0]
        MOV      R1,SP
        LDRH     R1,[R1, #+4]
        CMP      R0,R1
        BEQ      ??timetable_aggregate_compute_categories_5
??timetable_aggregate_compute_categories_6:
        ADDS     R5,R5,#+1
        B        ??timetable_aggregate_compute_categories_4
??timetable_aggregate_compute_categories_5:
        CMP      R5,R6
        BNE      ??timetable_aggregate_compute_categories_2
        MOV      R0,SP
        LDRH     R0,[R0, #+4]
        MOVS     R1,#+2
        MULS     R1,R5,R1
        ADD      R2,SP,#+8
        STRH     R0,[R2, R1]
        ADDS     R6,R6,#+1
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+4]
        ADDS     R0,R0,#+1
        LDR      R1,[SP, #+0]
        STRH     R0,[R1, #+4]
??timetable_aggregate_compute_categories_2:
        MOV      R0,SP
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R2,[R7, #+0]
        ADDS     R1,R2,R1
        LDRH     R1,[R1, #+4]
        STRH     R1,[R0, #+6]
        ADDS     R4,R4,#+1
        B        ??timetable_aggregate_compute_categories_0
??timetable_aggregate_compute_categories_1:
        ADD      SP,SP,#+76
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     `?<Constant "-- %s: %lu / %u = %lu\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     `?<Constant "Memory for entries: %...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     `?<Constant "-- %c%c: %lu / %u = %lu\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     timetable_timestamp_time

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "-- %s: %lu / %u = %lu\\n">`:
        DATA
        DC8 "-- %s: %lu / %u = %lu\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Memory for entries: %...">`:
        DATA
        DC8 "Memory for entries: %d * %d = %d\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "-- %c%c: %lu / %u = %lu\\n">`:
        DATA
        DC8 "-- %c%c: %lu / %u = %lu\012"
        DC8 0, 0, 0

        END
// 
//  88 bytes in section .rodata
// 852 bytes in section .text
// 
// 852 bytes of CODE  memory
//  88 bytes of CONST memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:31:10
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\profile.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\profile.c -D
//        USE_STDPERIPH_DRIVER -D STM32F051X8 -D AUTOSTART_ENABLE -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\profile.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidiv
        EXTERN clock_time
        EXTERN printf
        EXTERN timetable_clear
        EXTERN timetable_entry
        EXTERN timetable_init
        EXTERN timetable_ptr
        EXTERN timetable_timestamp_time

        PUBLIC profile_aggregate_compute_detailed
        PUBLIC profile_aggregate_print_detailed
        PUBLIC profile_begin_timetable
        PUBLIC profile_begin_timetable_ptr
        PUBLIC profile_begin_timetable_timestamps
        PUBLIC profile_end_timetable
        PUBLIC profile_end_timetable_ptr
        PUBLIC profile_end_timetable_timestamps
        PUBLIC profile_episode_end
        PUBLIC profile_episode_start
        PUBLIC profile_init
        PUBLIC profile_timetable
        PUBLIC profile_timetable_ptr
        PUBLIC profile_timetable_timestamps


        SECTION `.data`:DATA:REORDER:NOROOT(2)
profile_timetable:
        DATA
        DC32 profile_timetable_timestamps, 128, profile_timetable_ptr

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// __absolute struct timetable_timestamp profile_timetable_timestamps[128]
profile_timetable_timestamps:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// __absolute unsigned int profile_timetable_ptr
profile_timetable_ptr:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
profile_begin_timetable:
        DATA
        DC32 profile_begin_timetable_timestamps, 128
        DC32 profile_begin_timetable_ptr

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// __absolute struct timetable_timestamp profile_begin_timetable_timestamps[128]
profile_begin_timetable_timestamps:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// __absolute unsigned int profile_begin_timetable_ptr
profile_begin_timetable_ptr:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
profile_end_timetable:
        DATA
        DC32 profile_end_timetable_timestamps, 128, profile_end_timetable_ptr

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// __absolute struct timetable_timestamp profile_end_timetable_timestamps[128]
profile_end_timetable_timestamps:
        DS8 1024

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// __absolute unsigned int profile_end_timetable_ptr
profile_end_timetable_ptr:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
profile_aggregate:
        DATA
        DC32 profile_aggregate_entries, 0, 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute struct timetable_aggregate_entry profile_aggregate_entries[128]
profile_aggregate_entries:
        DS8 1536

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
episode_start_time:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
invalid_episode_overflow:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
invalid_episode_toolong:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
max_queuelen:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
profile_init:
        PUSH     {R7,LR}
        BL       timetable_init
        LDR      R0,??DataTable4
        BL       timetable_clear
        LDR      R0,??DataTable4_1
        BL       timetable_clear
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
profile_episode_start:
        PUSH     {R4,LR}
        LDR      R0,??DataTable4
        BL       timetable_clear
        LDR      R0,??DataTable4_1
        BL       timetable_clear
        BL       clock_time
        LDR      R1,??DataTable4_2
        STRH     R0,[R1, #+0]
        MOVS     R1,#+127
        LDR      R0,??DataTable4
        BL       timetable_entry
        MOVS     R4,R0
        CMP      R4,#+0
        BEQ      ??profile_episode_start_0
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
??profile_episode_start_0:
        MOVS     R1,#+127
        LDR      R0,??DataTable4_1
        BL       timetable_entry
        MOVS     R4,R0
        CMP      R4,#+0
        BEQ      ??profile_episode_start_1
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
??profile_episode_start_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
profile_episode_end:
        PUSH     {R3-R5,LR}
        BL       clock_time
        MOVS     R5,R0
        MOVS     R1,#+127
        LDR      R0,??DataTable4
        BL       timetable_entry
        MOVS     R4,R0
        CMP      R4,#+0
        BEQ      ??profile_episode_end_0
        LDR      R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??profile_episode_end_0
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable4_3
        STR      R0,[R1, #+0]
        MOVS     R0,#+128
        LDR      R1,??DataTable4_4
        STR      R0,[R1, #+0]
        B        ??profile_episode_end_1
??profile_episode_end_0:
        UXTH     R5,R5
        LDR      R0,??DataTable4_2
        LDRH     R0,[R0, #+0]
        SUBS     R0,R5,R0
        CMP      R0,#+110
        BLT      ??profile_episode_end_2
        LDR      R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable4_5
        STR      R0,[R1, #+0]
        B        ??profile_episode_end_1
??profile_episode_end_2:
        LDR      R0,??DataTable4
        BL       timetable_ptr
        LDR      R1,??DataTable4_4
        LDR      R1,[R1, #+0]
        CMP      R1,R0
        BCS      ??profile_episode_end_1
        LDR      R0,??DataTable4
        BL       timetable_ptr
        LDR      R1,??DataTable4_4
        STR      R0,[R1, #+0]
??profile_episode_end_1:
        POP      {R0,R4,R5,PC}    ;; return

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
profile_aggregate_print_detailed:
        PUSH     {R3-R5,LR}
        LDR      R5,??DataTable4_6
        MOVS     R0,#+0
        MOVS     R4,R0
??profile_aggregate_print_detailed_0:
        LDR      R0,[R5, #+4]
        CMP      R4,R0
        BGE      ??profile_aggregate_print_detailed_1
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
        LDR      R0,??DataTable4_7
        BL       printf
        ADDS     R4,R4,#+1
        B        ??profile_aggregate_print_detailed_0
??profile_aggregate_print_detailed_1:
        LDR      R3,[R5, #+4]
        MOVS     R0,#+12
        MULS     R3,R0,R3
        LDR      R2,[R5, #+4]
        MOVS     R1,#+12
        LDR      R0,??DataTable4_8
        BL       printf
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
profile_aggregate_compute_detailed:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
        LDR      R7,??DataTable4_6
        LDR      R6,??DataTable4_9
        LDR      R0,??DataTable4
        BL       timetable_ptr
        STR      R0,[SP, #+4]
        MOV      R0,SP
        LDR      R1,??DataTable4
        LDR      R1,[R1, #+0]
        LDRH     R1,[R1, #+4]
        STRH     R1,[R0, #+0]
        MOVS     R0,#+0
        MOVS     R4,R0
??profile_aggregate_compute_detailed_0:
        LDR      R0,[SP, #+4]
        CMP      R4,R0
        BGE      ??profile_aggregate_compute_detailed_1
        MOVS     R0,#+8
        MULS     R0,R4,R0
        LDR      R1,??DataTable4
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, R0]
        MOVS     R0,R7
        BL       find_aggregate
        MOVS     R5,R0
        CMP      R5,#+0
        BEQ      ??profile_aggregate_compute_detailed_2
        LDR      R0,[R5, #+0]
        CMP      R0,#+0
        BNE      ??profile_aggregate_compute_detailed_3
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
        LDR      R1,??DataTable4_10
        LDRH     R1,[R1, #+0]
        SUBS     R0,R0,R1
        STR      R0,[R5, #+8]
        MOVS     R0,#+1
        STRH     R0,[R5, #+4]
        B        ??profile_aggregate_compute_detailed_2
??profile_aggregate_compute_detailed_3:
        LDR      R0,[R5, #+8]
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R2,[R6, #+0]
        ADDS     R1,R2,R1
        LDRH     R1,[R1, #+4]
        MOV      R2,SP
        LDRH     R2,[R2, #+0]
        SUBS     R1,R1,R2
        LDR      R2,??DataTable4_10
        LDRH     R2,[R2, #+0]
        SUBS     R1,R1,R2
        ADDS     R0,R0,R1
        STR      R0,[R5, #+8]
        LDRH     R0,[R5, #+4]
        ADDS     R0,R0,#+1
        STRH     R0,[R5, #+4]
??profile_aggregate_compute_detailed_2:
        MOV      R0,SP
        MOVS     R1,#+8
        MULS     R1,R4,R1
        LDR      R2,[R6, #+0]
        ADDS     R1,R2,R1
        LDRH     R1,[R1, #+4]
        STRH     R1,[R0, #+0]
        ADDS     R4,R4,#+1
        B        ??profile_aggregate_compute_detailed_0
??profile_aggregate_compute_detailed_1:
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     profile_begin_timetable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     profile_end_timetable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     episode_start_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     invalid_episode_overflow

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     max_queuelen

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     invalid_episode_toolong

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     profile_aggregate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     `?<Constant "-- %s: %lu / %u = %lu\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     `?<Constant "Memory for entries: %...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     profile_timetable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
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

        END
// 
// 4 634 bytes in section .bss
//    48 bytes in section .data
//    60 bytes in section .rodata
//   558 bytes in section .text
// 
//   558 bytes of CODE  memory
//    60 bytes of CONST memory
// 4 682 bytes of DATA  memory
//
//Errors: none
//Warnings: none

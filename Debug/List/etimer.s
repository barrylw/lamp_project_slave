///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:16
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\core\sys\etimer.c
//    Command line =  
//        E:\svnProject\street_lamp_new\core\sys\etimer.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\etimer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN clock_time
        EXTERN process_current
        EXTERN process_poll
        EXTERN process_post
        EXTERN timer_expired
        EXTERN timer_reset
        EXTERN timer_restart
        EXTERN timer_set

        PUBLIC etimer_adjust
        PUBLIC etimer_expiration_time
        PUBLIC etimer_expired
        PUBLIC etimer_next_expiration_time
        PUBLIC etimer_pending
        PUBLIC etimer_process
        PUBLIC etimer_remodify
        PUBLIC etimer_request_poll
        PUBLIC etimer_reset
        PUBLIC etimer_restart
        PUBLIC etimer_set
        PUBLIC etimer_start_time
        PUBLIC etimer_stop


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timerlist:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
next_expiration:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
etimer_process:
        DATA
        DC32 0H, `?<Constant "Event timer">`, process_thread_etimer_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
update_time:
        PUSH     {R4,LR}
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??update_time_0
        MOVS     R0,#+0
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
        B        ??update_time_1
??update_time_0:
        BL       clock_time
        LDR      R1,??DataTable6
        LDR      R1,[R1, #+0]
        LDR      R2,[R1, #+0]
        LDR      R3,[R1, #+4]
        ADDS     R2,R2,R3
        SUBS     R2,R2,R0
        LDR      R1,[R1, #+8]
        B        ??update_time_2
??update_time_3:
        LDR      R3,[R1, #+0]
        LDR      R4,[R1, #+4]
        ADDS     R3,R3,R4
        SUBS     R3,R3,R0
        CMP      R3,R2
        BCS      ??update_time_4
        LDR      R2,[R1, #+0]
        LDR      R3,[R1, #+4]
        ADDS     R2,R2,R3
        SUBS     R2,R2,R0
??update_time_4:
        LDR      R1,[R1, #+8]
??update_time_2:
        CMP      R1,#+0
        BNE      ??update_time_3
        ADDS     R0,R0,R2
        LDR      R1,??DataTable6_1
        STR      R0,[R1, #+0]
??update_time_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_etimer_process:
        PUSH     {R2,R4-R7,LR}
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R1,#+1
        LDRH     R0,[R6, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_etimer_process_0
        CMP      R0,#+89
        BEQ      ??process_thread_etimer_process_1
        B        ??process_thread_etimer_process_2
??process_thread_etimer_process_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
??process_thread_etimer_process_3:
        MOVS     R1,#+0
        MOVS     R0,#+89
        STRH     R0,[R6, #+0]
??process_thread_etimer_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??process_thread_etimer_process_4
        MOVS     R0,#+1
        B        ??process_thread_etimer_process_5
??process_thread_etimer_process_4:
        UXTB     R7,R7
        CMP      R7,#+135
        BNE      ??process_thread_etimer_process_6
        LDR      R0,[SP, #+0]
        B        ??process_thread_etimer_process_7
??process_thread_etimer_process_8:
        LDR      R1,??DataTable6
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+8]
        LDR      R2,??DataTable6
        STR      R1,[R2, #+0]
??process_thread_etimer_process_7:
        LDR      R1,??DataTable6
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??process_thread_etimer_process_9
        LDR      R1,??DataTable6
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+12]
        CMP      R1,R0
        BEQ      ??process_thread_etimer_process_8
??process_thread_etimer_process_9:
        LDR      R1,??DataTable6
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ      ??process_thread_etimer_process_10
        LDR      R1,??DataTable6
        LDR      R5,[R1, #+0]
        B        ??process_thread_etimer_process_11
??process_thread_etimer_process_12:
        LDR      R1,[R5, #+8]
        LDR      R1,[R1, #+8]
        STR      R1,[R5, #+8]
??process_thread_etimer_process_11:
        LDR      R1,[R5, #+8]
        CMP      R1,#+0
        BEQ      ??process_thread_etimer_process_10
        LDR      R1,[R5, #+8]
        LDR      R1,[R1, #+12]
        CMP      R1,R0
        BEQ      ??process_thread_etimer_process_12
        LDR      R5,[R5, #+8]
        B        ??process_thread_etimer_process_11
??process_thread_etimer_process_10:
        B        ??process_thread_etimer_process_3
??process_thread_etimer_process_6:
        UXTB     R7,R7
        CMP      R7,#+130
        BEQ      ??process_thread_etimer_process_13
        B        ??process_thread_etimer_process_3
??process_thread_etimer_process_14:
        LDR      R0,[R5, #+8]
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
??process_thread_etimer_process_15:
        MOVS     R0,#+0
        STR      R0,[R5, #+8]
        BL       update_time
??process_thread_etimer_process_13:
        MOVS     R4,#+0
        LDR      R0,??DataTable6
        LDR      R5,[R0, #+0]
        B        ??process_thread_etimer_process_16
??process_thread_etimer_process_17:
        BL       etimer_request_poll
??process_thread_etimer_process_18:
        MOVS     R4,R5
        LDR      R5,[R5, #+8]
??process_thread_etimer_process_16:
        CMP      R5,#+0
        BEQ      ??process_thread_etimer_process_3
        MOVS     R0,R5
        BL       timer_expired
        CMP      R0,#+0
        BEQ      ??process_thread_etimer_process_18
        MOVS     R2,R5
        MOVS     R1,#+136
        LDR      R0,[R5, #+12]
        BL       process_post
        CMP      R0,#+0
        BNE      ??process_thread_etimer_process_17
        MOVS     R0,#+0
        STR      R0,[R5, #+12]
        CMP      R4,#+0
        BEQ      ??process_thread_etimer_process_14
        LDR      R0,[R5, #+8]
        STR      R0,[R4, #+8]
        B        ??process_thread_etimer_process_15
??process_thread_etimer_process_2:
        MOVS     R1,#+0
        MOVS     R0,#+0
        STRH     R0,[R6, #+0]
        MOVS     R0,#+3
??process_thread_etimer_process_5:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_request_poll:
        PUSH     {R7,LR}
        LDR      R0,??DataTable6_2
        BL       process_poll
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
add_timer:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       etimer_request_poll
        LDR      R0,[R4, #+12]
        CMP      R0,#+0
        BEQ      ??add_timer_0
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        B        ??add_timer_1
??add_timer_2:
        LDR      R0,[R0, #+8]
??add_timer_1:
        CMP      R0,#+0
        BEQ      ??add_timer_0
        CMP      R0,R4
        BNE      ??add_timer_2
        LDR      R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+12]
        BL       update_time
        B        ??add_timer_3
??add_timer_0:
        LDR      R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+12]
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+8]
        LDR      R0,??DataTable6
        STR      R4,[R0, #+0]
        BL       update_time
??add_timer_3:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_set:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       timer_set
        MOVS     R0,R4
        BL       add_timer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_reset:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       timer_reset
        MOVS     R0,R4
        BL       add_timer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_restart:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       timer_restart
        MOVS     R0,R4
        BL       add_timer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_adjust:
        PUSH     {R7,LR}
        LDR      R2,[R0, #+0]
        ADDS     R1,R2,R1
        STR      R1,[R0, #+0]
        BL       update_time
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_expired:
        PUSH     {LR}
        LDR      R0,[R0, #+12]
        CMP      R0,#+0
        BNE      ??etimer_expired_0
        MOVS     R0,#+1
        B        ??etimer_expired_1
??etimer_expired_0:
        MOVS     R0,#+0
??etimer_expired_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_expiration_time:
        LDR      R1,[R0, #+0]
        LDR      R0,[R0, #+4]
        ADDS     R0,R1,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_start_time:
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_pending:
        PUSH     {LR}
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??etimer_pending_0
        MOVS     R0,#+1
        B        ??etimer_pending_1
??etimer_pending_0:
        MOVS     R0,#+0
??etimer_pending_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_next_expiration_time:
        PUSH     {R7,LR}
        BL       etimer_pending
        CMP      R0,#+0
        BEQ      ??etimer_next_expiration_time_0
        LDR      R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        B        ??etimer_next_expiration_time_1
??etimer_next_expiration_time_0:
        MOVS     R0,#+0
??etimer_next_expiration_time_1:
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_stop:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BNE      ??etimer_stop_0
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
        BL       update_time
        B        ??etimer_stop_1
??etimer_stop_0:
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        B        ??etimer_stop_2
??etimer_stop_3:
        LDR      R0,[R0, #+8]
??etimer_stop_2:
        CMP      R0,#+0
        BEQ      ??etimer_stop_4
        LDR      R1,[R0, #+8]
        CMP      R1,R4
        BNE      ??etimer_stop_3
??etimer_stop_4:
        CMP      R0,#+0
        BEQ      ??etimer_stop_1
        LDR      R1,[R4, #+8]
        STR      R1,[R0, #+8]
        BL       update_time
??etimer_stop_1:
        MOVS     R0,#+0
        STR      R0,[R4, #+8]
        MOVS     R0,#+0
        STR      R0,[R4, #+12]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     timerlist

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     next_expiration

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     etimer_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     process_current

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
etimer_remodify:
        PUSH     {R7,LR}
        BL       timer_set
        BL       update_time
        POP      {R0,PC}          ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Event timer">`:
        DATA
        DC8 "Event timer"

        END
// 
//   8 bytes in section .bss
//  16 bytes in section .data
//  12 bytes in section .rodata
// 590 bytes in section .text
// 
// 590 bytes of CODE  memory
//  12 bytes of CONST memory
//  24 bytes of DATA  memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:31:04
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\ctimer.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\ctimer.c -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\ctimer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN etimer_expired
        EXTERN etimer_reset
        EXTERN etimer_restart
        EXTERN etimer_set
        EXTERN etimer_stop
        EXTERN list_add
        EXTERN list_head
        EXTERN list_init
        EXTERN list_remove
        EXTERN process_current
        EXTERN process_start

        PUBLIC ctimer_expired
        PUBLIC ctimer_init
        PUBLIC ctimer_process
        PUBLIC ctimer_reset
        PUBLIC ctimer_restart
        PUBLIC ctimer_set
        PUBLIC ctimer_stop


        SECTION `.data`:DATA:REORDER:NOROOT(2)
ctimer_list:
        DATA
        DC32 ctimer_list_list

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute void *ctimer_list_list
ctimer_list_list:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
initialized:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
ctimer_process:
        DATA
        DC32 0H, `?<Constant "Ctimer process">`, process_thread_ctimer_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_ctimer_process:
        PUSH     {R2,R4-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_ctimer_process_0
        CMP      R0,#+74
        BEQ      ??process_thread_ctimer_process_1
        B        ??process_thread_ctimer_process_2
??process_thread_ctimer_process_0:
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_head
        MOVS     R5,R0
??process_thread_ctimer_process_3:
        CMP      R5,#+0
        BEQ      ??process_thread_ctimer_process_4
        LDR      R1,[R5, #+8]
        MOVS     R0,R5
        ADDS     R0,R0,#+4
        BL       etimer_set
        LDR      R5,[R5, #+0]
        B        ??process_thread_ctimer_process_3
??process_thread_ctimer_process_4:
        MOVS     R0,#+1
        LDR      R1,??DataTable6_1
        STRB     R0,[R1, #+0]
??process_thread_ctimer_process_5:
        MOVS     R1,#+0
        MOVS     R0,#+74
        STRH     R0,[R4, #+0]
??process_thread_ctimer_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??process_thread_ctimer_process_6
        UXTB     R7,R7
        CMP      R7,#+136
        BEQ      ??process_thread_ctimer_process_7
??process_thread_ctimer_process_6:
        MOVS     R0,#+1
        B        ??process_thread_ctimer_process_8
??process_thread_ctimer_process_7:
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_head
        MOVS     R5,R0
??process_thread_ctimer_process_9:
        CMP      R5,#+0
        BEQ      ??process_thread_ctimer_process_5
        MOVS     R0,R5
        ADDS     R0,R0,#+4
        LDR      R1,[SP, #+0]
        CMP      R0,R1
        BNE      ??process_thread_ctimer_process_10
        MOVS     R1,R5
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_remove
        LDR      R0,??DataTable6_2
        LDR      R6,[R0, #+0]
        LDR      R0,[R5, #+20]
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+0]
        LDR      R0,[R5, #+24]
        CMP      R0,#+0
        BEQ      ??process_thread_ctimer_process_11
        LDR      R0,[R5, #+28]
        LDR      R1,[R5, #+24]
        BLX      R1
??process_thread_ctimer_process_11:
        LDR      R0,??DataTable6_2
        STR      R6,[R0, #+0]
        B        ??process_thread_ctimer_process_5
??process_thread_ctimer_process_10:
        LDR      R5,[R5, #+0]
        B        ??process_thread_ctimer_process_9
??process_thread_ctimer_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_ctimer_process_8:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ctimer_init:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        LDR      R1,??DataTable6_1
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_init
        MOVS     R1,#+0
        LDR      R0,??DataTable6_3
        BL       process_start
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ctimer_set:
        PUSH     {R2,R4-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R7,R3
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+20]
        LDR      R0,[SP, #+0]
        STR      R0,[R4, #+24]
        STR      R7,[R4, #+28]
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctimer_set_0
        LDR      R0,??DataTable6_2
        LDR      R5,[R0, #+0]
        LDR      R0,??DataTable6_3
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+0]
        MOVS     R1,R6
        MOVS     R0,R4
        ADDS     R0,R0,#+4
        BL       etimer_set
        LDR      R0,??DataTable6_2
        STR      R5,[R0, #+0]
        B        ??ctimer_set_1
??ctimer_set_0:
        STR      R6,[R4, #+8]
??ctimer_set_1:
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_remove
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_add
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ctimer_reset:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctimer_reset_0
        LDR      R0,??DataTable6_2
        LDR      R5,[R0, #+0]
        LDR      R0,??DataTable6_3
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+0]
        MOVS     R0,R4
        ADDS     R0,R0,#+4
        BL       etimer_reset
        LDR      R0,??DataTable6_2
        STR      R5,[R0, #+0]
??ctimer_reset_0:
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_remove
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_add
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ctimer_restart:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctimer_restart_0
        LDR      R0,??DataTable6_2
        LDR      R5,[R0, #+0]
        LDR      R0,??DataTable6_3
        LDR      R1,??DataTable6_2
        STR      R0,[R1, #+0]
        MOVS     R0,R4
        ADDS     R0,R0,#+4
        BL       etimer_restart
        LDR      R0,??DataTable6_2
        STR      R5,[R0, #+0]
??ctimer_restart_0:
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_remove
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_add
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ctimer_stop:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctimer_stop_0
        MOVS     R0,R4
        ADDS     R0,R0,#+4
        BL       etimer_stop
        B        ??ctimer_stop_1
??ctimer_stop_0:
        MOVS     R0,#+0
        STR      R0,[R4, #+12]
        MOVS     R0,#+0
        STR      R0,[R4, #+16]
??ctimer_stop_1:
        MOVS     R1,R4
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_remove
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ctimer_expired:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??ctimer_expired_0
        MOVS     R0,R4
        ADDS     R0,R0,#+4
        BL       etimer_expired
        B        ??ctimer_expired_1
??ctimer_expired_0:
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       list_head
        MOVS     R5,R0
??ctimer_expired_2:
        CMP      R5,#+0
        BEQ      ??ctimer_expired_3
        CMP      R5,R4
        BNE      ??ctimer_expired_4
        MOVS     R0,#+0
        B        ??ctimer_expired_1
??ctimer_expired_4:
        LDR      R5,[R5, #+0]
        B        ??ctimer_expired_2
??ctimer_expired_3:
        MOVS     R0,#+1
??ctimer_expired_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     ctimer_list

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     initialized

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     process_current

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ctimer_process

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "Ctimer process">`:
        DATA
        DC8 "Ctimer process"
        DC8 0

        END
// 
//   5 bytes in section .bss
//  20 bytes in section .data
//  16 bytes in section .rodata
// 480 bytes in section .text
// 
// 480 bytes of CODE  memory
//  16 bytes of CONST memory
//  25 bytes of DATA  memory
//
//Errors: none
//Warnings: none

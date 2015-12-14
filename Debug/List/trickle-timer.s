///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:23
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\core\lib\trickle-timer.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\core\lib\trickle-timer.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
//        F:\cloneSlave\lamp_project_slave\Debug\List\ --diag_suppress Pa050 -o
//        F:\cloneSlave\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\cloneSlave\lamp_project_slave\APP\ -I
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\inc\
//        -I
//        F:\cloneSlave\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I F:\cloneSlave\lamp_project_slave\LIB\CMSIS\CM0\CoreSupport\ -I
//        F:\cloneSlave\lamp_project_slave\core\ -I
//        F:\cloneSlave\lamp_project_slave\core\sys\ -I
//        F:\cloneSlave\lamp_project_slave\platform\ -I
//        F:\cloneSlave\lamp_project_slave\core\lib\ -I
//        F:\cloneSlave\lamp_project_slave\tools\wpcapslip\ -I
//        F:\cloneSlave\lamp_project_slave\core\cfs\ -I
//        F:\cloneSlave\lamp_project_slave\OLED\ -I
//        F:\cloneSlave\lamp_project_slave\coffee_arch\ -On -I "F:\Program
//        Files (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\cloneSlave\lamp_project_slave\Debug\List\trickle-timer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidivmod
        EXTERN clock_time
        EXTERN ctimer_set
        EXTERN random_rand

        PUBLIC trickle_timer_config
        PUBLIC trickle_timer_consistency
        PUBLIC trickle_timer_inconsistency
        PUBLIC trickle_timer_set


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
loctt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
loc_clock:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
wide_rand:
        PUSH     {R4,LR}
        BL       random_rand
        LSLS     R0,R0,#+16
        MOVS     R4,R0
        BL       random_rand
        MOVS     R1,R0
        MOVS     R0,R4
        ORRS     R0,R0,R1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
max_imax:
        PUSH     {R4,LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R3,??DataTable4  ;; 0xffff
        SUBS     R1,R1,#+1
        MOVS     R4,#+16
        MOVS     R2,R4
??max_imax_0:
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??max_imax_1
        LSLS     R3,R3,R2
        MOVS     R4,R3
        ANDS     R4,R4,R1
        CMP      R4,#+0
        BNE      ??max_imax_2
        ADDS     R0,R0,R2
        LSLS     R1,R1,R2
??max_imax_2:
        UXTB     R2,R2
        LSRS     R2,R2,#+1
        B        ??max_imax_0
??max_imax_1:
        SUBS     R0,R0,#+1
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_t:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LSRS     R4,R4,#+1
        BL       wide_rand
        MOVS     R1,R4
        BL       __aeabi_uidivmod
        ADDS     R0,R4,R1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
schedule_for_end:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        BL       clock_time
        MOVS     R5,R0
        LDR      R0,[R4, #+8]
        LDR      R1,[R4, #+4]
        ADDS     R0,R0,R1
        SUBS     R0,R0,R5
        LDR      R1,??DataTable4_1
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        CMP      R0,R1
        BCC      ??schedule_for_end_0
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1
        STR      R0,[R1, #+0]
??schedule_for_end_0:
        MOVS     R3,R4
        LDR      R2,??DataTable4_2
        LDR      R0,??DataTable4_1
        LDR      R1,[R0, #+0]
        MOVS     R0,R4
        ADDS     R0,R0,#+16
        BL       ctimer_set
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
double_interval:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable4_3
        STR      R4,[R0, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable4_3
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+58
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+8]
        LDR      R1,??DataTable4_3
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+4]
        ADDS     R0,R0,R1
        MOVS     R5,R0
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+12]
        LSRS     R0,R0,#+1
        LDR      R1,??DataTable4_3
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BCC      ??double_interval_0
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+4]
        LSLS     R0,R0,#+1
        LDR      R1,??DataTable4_3
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+4]
        B        ??double_interval_1
??double_interval_0:
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+12]
        LDR      R1,??DataTable4_3
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+4]
??double_interval_1:
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+4]
        BL       get_t
        LDR      R1,??DataTable4_1
        STR      R0,[R1, #+0]
        BL       clock_time
        LDR      R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        ADDS     R1,R5,R1
        SUBS     R0,R1,R0
        LDR      R1,??DataTable4_1
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        CMP      R0,R1
        BCC      ??double_interval_2
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1
        STR      R0,[R1, #+0]
??double_interval_2:
        LDR      R0,??DataTable4_3
        LDR      R3,[R0, #+0]
        LDR      R2,??DataTable4_4
        LDR      R0,??DataTable4_1
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+16
        BL       ctimer_set
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        STR      R5,[R0, #+8]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fire:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable4_3
        STR      R4,[R0, #+0]
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+48]
        CMP      R0,#+0
        BEQ      ??fire_0
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+57
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??fire_1
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+58
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable4_3
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+57
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS      ??fire_2
??fire_1:
        MOVS     R1,#+1
        B        ??fire_3
??fire_2:
        MOVS     R1,#+0
??fire_3:
        UXTB     R1,R1
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+52]
        LDR      R2,??DataTable4_3
        LDR      R2,[R2, #+0]
        LDR      R2,[R2, #+48]
        BLX      R2
??fire_0:
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+4]
        CMP      R0,#+0
        BEQ      ??fire_4
        LDR      R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        BL       schedule_for_end
??fire_4:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
new_interval:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+0
        MOVS     R1,#+58
        STRB     R0,[R4, R1]
        LDR      R0,[R4, #+4]
        BL       get_t
        LDR      R1,??DataTable4_1
        STR      R0,[R1, #+0]
        MOVS     R3,R4
        LDR      R2,??DataTable4_4
        LDR      R0,??DataTable4_1
        LDR      R1,[R0, #+0]
        MOVS     R0,R4
        ADDS     R0,R0,#+16
        BL       ctimer_set
        LDR      R0,[R4, #+20]
        STR      R0,[R4, #+8]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     loc_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     double_interval

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     loctt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     fire

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
trickle_timer_consistency:
        PUSH     {LR}
        MOVS     R1,#+58
        LDRB     R1,[R0, R1]
        CMP      R1,#+255
        BEQ      ??trickle_timer_consistency_0
        MOVS     R1,#+58
        LDRB     R1,[R0, R1]
        ADDS     R1,R1,#+1
        MOVS     R2,#+58
        STRB     R1,[R0, R2]
??trickle_timer_consistency_0:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
trickle_timer_inconsistency:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+4]
        LDR      R1,[R4, #+0]
        CMP      R0,R1
        BEQ      ??trickle_timer_inconsistency_0
        LDR      R0,[R4, #+0]
        STR      R0,[R4, #+4]
        MOVS     R0,R4
        BL       new_interval
??trickle_timer_inconsistency_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
trickle_timer_config:
        PUSH     {R3-R7,LR}
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R7,R3
        CMP      R4,#+2
        BCC      ??trickle_timer_config_0
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        CMP      R4,R0
        BCC      ??trickle_timer_config_1
??trickle_timer_config_0:
        MOVS     R0,#+0
        B        ??trickle_timer_config_2
??trickle_timer_config_1:
        CMP      R6,#+0
        BEQ      ??trickle_timer_config_3
        UXTB     R5,R5
        CMP      R5,#+0
        BEQ      ??trickle_timer_config_3
        UXTB     R7,R7
        CMP      R7,#+0
        BNE      ??trickle_timer_config_4
??trickle_timer_config_3:
        MOVS     R0,#+0
        B        ??trickle_timer_config_2
??trickle_timer_config_4:
        MOVS     R1,#+0
        MVNS     R1,R1            ;; #-1
        MOVS     R0,R5
        ADDS     R0,R0,#+1
        LSRS     R1,R1,R0
        SUBS     R0,R4,#+1
        CMP      R1,R0
        BCS      ??trickle_timer_config_5
        MOVS     R0,R4
        BL       max_imax
        MOVS     R5,R0
??trickle_timer_config_5:
        STR      R4,[R6, #+0]
        MOVS     R0,#+56
        STRB     R5,[R6, R0]
        MOVS     R0,R4
        LSLS     R0,R0,R5
        STR      R0,[R6, #+12]
        MOVS     R0,#+57
        STRB     R7,[R6, R0]
        MOVS     R0,#+1
??trickle_timer_config_2:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
trickle_timer_set:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        CMP      R4,#+0
        BEQ      ??trickle_timer_set_0
        MOVS     R0,R5
        CMP      R0,#+0
        BNE      ??trickle_timer_set_1
??trickle_timer_set_0:
        MOVS     R0,#+0
        B        ??trickle_timer_set_2
??trickle_timer_set_1:
        STR      R5,[R4, #+48]
        STR      R6,[R4, #+52]
        LDR      R7,[R4, #+0]
        BL       wide_rand
        LDR      R1,[R4, #+12]
        LDR      R2,[R4, #+0]
        SUBS     R1,R1,R2
        ADDS     R1,R1,#+1
        BL       __aeabi_uidivmod
        ADDS     R0,R7,R1
        STR      R0,[R4, #+4]
        MOVS     R0,R4
        BL       new_interval
        MOVS     R0,#+1
??trickle_timer_set_2:
        POP      {R1,R4-R7,PC}    ;; return

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
//   8 bytes in section .bss
// 650 bytes in section .text
// 
// 650 bytes of CODE memory
//   8 bytes of DATA memory
//
//Errors: none
//Warnings: none

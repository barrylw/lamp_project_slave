///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:27
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\system_stm32f0xx.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\system_stm32f0xx.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
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
//    List file    =  
//        G:\gitclone\lamp_project_slave\Debug\List\system_stm32f0xx.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_uidiv

        PUBLIC AHBPrescTable
        PUBLIC SystemCoreClock
        PUBLIC SystemCoreClockUpdate
        PUBLIC SystemInit


        SECTION `.data`:DATA:REORDER:NOROOT(2)
SystemCoreClock:
        DATA
        DC32 48000000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
AHBPrescTable:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SystemInit:
        PUSH     {R7,LR}
        LDR      R0,??DataTable2  ;; 0x40021000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2  ;; 0x40021000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_2  ;; 0xf8ffb80c
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40021004
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0x40021000
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_3  ;; 0xfef6ffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2  ;; 0x40021000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0x40021000
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_4  ;; 0xfffbffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2  ;; 0x40021000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_5  ;; 0xffc0ffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40021004
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable2_6  ;; 0x4002102c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+15
        BICS     R0,R0,R1
        LDR      R1,??DataTable2_6  ;; 0x4002102c
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable2_7  ;; 0x40021030
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_8  ;; 0xfffffeac
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_7  ;; 0x40021030
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable2_9  ;; 0x40021034
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable2_9  ;; 0x40021034
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable2_10  ;; 0x40021008
        STR      R0,[R1, #+0]
        BL       SetSysClock
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SystemCoreClockUpdate:
        PUSH     {R4-R7,LR}
        MOVS     R4,#+0
        MOVS     R7,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+12
        ANDS     R1,R1,R0
        MOVS     R4,R1
        MOVS     R0,R4
        CMP      R0,#+0
        BEQ      ??SystemCoreClockUpdate_0
        CMP      R0,#+4
        BEQ      ??SystemCoreClockUpdate_1
        CMP      R0,#+8
        BEQ      ??SystemCoreClockUpdate_2
        B        ??SystemCoreClockUpdate_3
??SystemCoreClockUpdate_0:
        LDR      R0,??DataTable2_11  ;; 0x7a1200
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
        B        ??SystemCoreClockUpdate_4
??SystemCoreClockUpdate_1:
        LDR      R0,??DataTable2_13  ;; 0xf42400
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
        B        ??SystemCoreClockUpdate_4
??SystemCoreClockUpdate_2:
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+240
        LSLS     R1,R1,#+14       ;; #+3932160
        ANDS     R1,R1,R0
        MOVS     R7,R1
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        ANDS     R0,R0,R1
        MOVS     R5,R0
        LSRS     R7,R7,#+18
        ADDS     R7,R7,#+2
        CMP      R5,#+0
        BNE      ??SystemCoreClockUpdate_5
        LDR      R0,??DataTable2_14  ;; 0x3d0900
        MULS     R0,R7,R0
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
        B        ??SystemCoreClockUpdate_6
??SystemCoreClockUpdate_5:
        LDR      R0,??DataTable2_6  ;; 0x4002102c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ADDS     R0,R0,#+1
        MOVS     R6,R0
        LDR      R0,??DataTable2_13  ;; 0xf42400
        MOVS     R1,R6
        BL       __aeabi_uidiv
        MULS     R0,R7,R0
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
??SystemCoreClockUpdate_6:
        B        ??SystemCoreClockUpdate_4
??SystemCoreClockUpdate_3:
        LDR      R0,??DataTable2_11  ;; 0x7a1200
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
??SystemCoreClockUpdate_4:
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+4
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        LDR      R1,??DataTable2_15
        LDRB     R0,[R1, R0]
        MOVS     R4,R0
        LDR      R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,R4
        LDR      R1,??DataTable2_12
        STR      R0,[R1, #+0]
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SetSysClock:
        PUSH     {R6,R7,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable2  ;; 0x40021000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2  ;; 0x40021000
        STR      R1,[R0, #+0]
??SetSysClock_0:
        LDR      R0,??DataTable2  ;; 0x40021000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+10       ;; #+131072
        ANDS     R0,R0,R1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BNE      ??SetSysClock_1
        LDR      R0,[SP, #+4]
        MOVS     R1,#+160
        LSLS     R1,R1,#+7        ;; #+20480
        CMP      R0,R1
        BNE      ??SetSysClock_0
??SetSysClock_1:
        LDR      R0,??DataTable2  ;; 0x40021000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+14
        BPL      ??SetSysClock_2
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        B        ??SetSysClock_3
??SetSysClock_2:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
??SetSysClock_3:
        LDR      R0,[SP, #+0]
        CMP      R0,#+1
        BNE      ??SetSysClock_4
        MOVS     R0,#+17
        LDR      R1,??DataTable2_16  ;; 0x40022000
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1  ;; 0x40021004
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_1  ;; 0x40021004
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable2_5  ;; 0xffc0ffff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40021004
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+160
        LSLS     R1,R1,#+11       ;; #+327680
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40021004
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable2  ;; 0x40021000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2  ;; 0x40021000
        STR      R1,[R0, #+0]
??SetSysClock_5:
        LDR      R0,??DataTable2  ;; 0x40021000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+6
        BPL      ??SetSysClock_5
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+3
        BICS     R0,R0,R1
        LDR      R1,??DataTable2_1  ;; 0x40021004
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable2_1  ;; 0x40021004
        STR      R1,[R0, #+0]
??SetSysClock_6:
        LDR      R0,??DataTable2_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+12
        ANDS     R1,R1,R0
        CMP      R1,#+8
        BNE      ??SetSysClock_6
??SetSysClock_4:
        POP      {R0,R1,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40021004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0xf8ffb80c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0xfef6ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0xfffbffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0xffc0ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x4002102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x40021030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0xfffffeac

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x40021034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40021008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x7a1200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0xf42400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0x3d0900

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     AHBPrescTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0x40022000

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
//  20 bytes in section .data
// 524 bytes in section .text
// 
// 524 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       19/Aug/2015  18:02:52
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModule\STM32F051_contiki111\APP\hal_fsk_sen.c
//    Command line =  
//        F:\meterModule\STM32F051_contiki111\APP\hal_fsk_sen.c -D
//        USE_STDPERIPH_DRIVER -D STM32F051X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -lb F:\meterModule\STM32F051_contiki111\Debug\List\
//        --diag_suppress Pa050 -o
//        F:\meterModule\STM32F051_contiki111\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\meterModule\STM32F051_contiki111\APP\ -I
//        F:\meterModule\STM32F051_contiki111\LIB\STM32F0xx_StdPeriph_Driver\inc\
//        -I
//        F:\meterModule\STM32F051_contiki111\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I F:\meterModule\STM32F051_contiki111\LIB\CMSIS\CM0\CoreSupport\ -I
//        F:\meterModule\STM32F051_contiki111\core\ -I
//        F:\meterModule\STM32F051_contiki111\core\sys\ -I
//        F:\meterModule\STM32F051_contiki111\platform\ -I
//        F:\meterModule\STM32F051_contiki111\core\lib\ -I
//        F:\meterModule\STM32F051_contiki111\tools\wpcapslip\ -I
//        F:\meterModule\STM32F051_contiki111\core\cfs\ -I
//        F:\meterModule\STM32F051_contiki111\OLED\ -I
//        F:\meterModule\STM32F051_contiki111\coffee_arch\ -Ol --vla -I
//        "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  
//        F:\meterModule\STM32F051_contiki111\Debug\List\hal_fsk_sen.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SX1276Read
        EXTERN SX1276Write
        EXTERN SX1276WriteBuffer
        EXTERN SX1276WriteFifo
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_i2d
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_uread4
        EXTERN __aeabi_uwrite4
        EXTERN hal_sRF_ITConfig
        EXTERN pow
        EXTERN w_memcpy

        PUBLIC FskSettings
        PUBLIC SX1276FskInit
        PUBLIC SX1276FskSetBitrate
        PUBLIC SX1276FskSetDccBw
        PUBLIC SX1276FskSetFdev
        PUBLIC SX1276FskSetOpMode
        PUBLIC SX1276FskSetPAOutput
        PUBLIC SX1276FskSetPa20dBm
        PUBLIC SX1276FskSetRFFrequency
        PUBLIC SX1276FskSetRFPower
        PUBLIC SX1276FskSetRssiOffset
        PUBLIC SX1276Fsk_Receive_Packet
        PUBLIC SX1276Fsk_Send_Packet
        PUBLIC fill_fifo
        PUBLIC g_fsk
        PUBLIC packet_tx_data
        PUBLIC start_continuous_mode


        SECTION `.data`:DATA:REORDER:NOROOT(2)
FskSettings:
        DATA
        DC32 492000000, 10000, 20000
        DC8 14
        DC32 40000, 150000
        DC8 1, 1, 255

        SECTION `.data`:DATA:REORDER:NOROOT(0)
RegRxBw:
        DATA
        DC8 18

        SECTION `.data`:DATA:REORDER:NOROOT(0)
RegAfcBw:
        DATA
        DC8 19

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_fsk:
        DS8 260

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetRFFrequency:
        PUSH     {R7,LR}
        LDR      R1,??DataTable4
        STR      R0,[R1, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable4_1  ;; 0x404e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        MOVS     R1,R0
        LSRS     R1,R1,#+16
        MOV      R2,SP
        STRB     R1,[R2, #+0]
        MOVS     R1,R0
        LSRS     R1,R1,#+8
        MOV      R2,SP
        STRB     R1,[R2, #+1]
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOVS     R2,#+3
        MOV      R1,SP
        MOVS     R0,#+6
        BL       SX1276WriteBuffer
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetBitrate:
        PUSH     {R7,LR}
        LDR      R1,??DataTable4
        STR      R0,[R1, #+4]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable4_2  ;; 0x417e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        UXTH     R0,R0
        MOVS     R1,R0
        LSRS     R1,R1,#+8
        MOV      R2,SP
        STRB     R1,[R2, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R2,#+2
        MOV      R1,SP
        MOVS     R0,#+2
        BL       SX1276WriteBuffer
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetFdev:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        LDR      R0,??DataTable4
        STR      R4,[R0, #+8]
        MOV      R1,SP
        MOVS     R0,#+4
        BL       SX1276Read
        MOVS     R0,R4
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable4_1  ;; 0x404e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        MOVS     R4,R0
        UXTH     R4,R4
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+192
        ANDS     R1,R1,R0
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        ORRS     R0,R0,R1
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        STRB     R4,[R0, #+1]
        MOVS     R2,#+2
        MOV      R1,SP
        MOVS     R0,#+4
        BL       SX1276WriteBuffer
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskComputeRxBwMantExp:
        PUSH     {R0-R2,R4-R7,LR}
        SUB      SP,SP,#+16
        MOVS     R5,#+0
        MOVS     R4,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R0,#+0
        LDR      R1,??DataTable5  ;; 0x416312d0
        MOV      R2,SP
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        ADD      R1,SP,#+8
        MOVS     R0,#+1
        BL       SX1276Read
        MOVS     R0,#+0
        MOVS     R5,R0
        B        ??SX1276FskComputeRxBwMantExp_0
??SX1276FskComputeRxBwMantExp_1:
        UXTB     R4,R4
        MOVS     R0,R4
        BL       __aeabi_ui2d
        MOVS     R6,R0
        MOVS     R7,R1
        UXTB     R5,R5
        MOVS     R0,R5
        ADDS     R0,R0,#+2
        BL       __aeabi_i2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        BL       pow
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable4_2  ;; 0x417e8480
        BL       __aeabi_ddiv
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,[SP, #+16]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        LSLS     R1,R1,#+1        ;; ZeroExtS R1,R1,#+1,#+1
        LSRS     R1,R1,#+1
        MOV      R2,SP
        LDM      R2,{R2,R3}
        BL       __aeabi_cdcmple
        BCS      ??SX1276FskComputeRxBwMantExp_2
        LDR      R0,[SP, #+16]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        LSLS     R1,R1,#+1        ;; ZeroExtS R1,R1,#+1,#+1
        LSRS     R1,R1,#+1
        MOV      R2,SP
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        LDR      R0,[SP, #+20]
        STRB     R4,[R0, #+0]
        LDR      R0,[SP, #+24]
        STRB     R5,[R0, #+0]
??SX1276FskComputeRxBwMantExp_2:
        ADDS     R4,R4,#+4
??SX1276FskComputeRxBwMantExp_3:
        UXTB     R4,R4
        CMP      R4,#+25
        BLT      ??SX1276FskComputeRxBwMantExp_1
        ADDS     R5,R5,#+1
??SX1276FskComputeRxBwMantExp_0:
        UXTB     R5,R5
        CMP      R5,#+8
        BGE      ??SX1276FskComputeRxBwMantExp_4
        MOVS     R4,#+16
        B        ??SX1276FskComputeRxBwMantExp_3
??SX1276FskComputeRxBwMantExp_4:
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetDccBw:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R0,#+0
        MOV      R2,SP
        STRB     R0,[R2, #+1]
        MOVS     R0,#+0
        MOV      R2,SP
        STRB     R0,[R2, #+0]
        LDRB     R0,[R4, #+0]
        CMP      R0,#+18
        BNE      ??SX1276FskSetDccBw_0
        MOVS     R0,#+96
        ANDS     R0,R0,R1
        STRB     R0,[R4, #+0]
        B        ??SX1276FskSetDccBw_1
??SX1276FskSetDccBw_0:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
??SX1276FskSetDccBw_1:
        MOV      R2,SP
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        MOVS     R0,R5
        BL       SX1276FskComputeRxBwMantExp
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        CMP      R0,#+16
        BEQ      ??SX1276FskSetDccBw_2
        CMP      R0,#+20
        BEQ      ??SX1276FskSetDccBw_3
        CMP      R0,#+24
        BEQ      ??SX1276FskSetDccBw_4
        B        ??SX1276FskSetDccBw_5
??SX1276FskSetDccBw_2:
        LDRB     R0,[R4, #+0]
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+29       ;; ZeroExtS R1,R1,#+29,#+29
        LSRS     R1,R1,#+29
        ORRS     R1,R1,R0
        STRB     R1,[R4, #+0]
        B        ??SX1276FskSetDccBw_6
??SX1276FskSetDccBw_3:
        LDRB     R0,[R4, #+0]
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+29       ;; ZeroExtS R1,R1,#+29,#+29
        LSRS     R1,R1,#+29
        MOVS     R2,#+8
        ORRS     R2,R2,R1
        ORRS     R2,R2,R0
        STRB     R2,[R4, #+0]
        B        ??SX1276FskSetDccBw_6
??SX1276FskSetDccBw_4:
        LDRB     R0,[R4, #+0]
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+29       ;; ZeroExtS R1,R1,#+29,#+29
        LSRS     R1,R1,#+29
        MOVS     R2,#+16
        ORRS     R2,R2,R1
        ORRS     R2,R2,R0
        STRB     R2,[R4, #+0]
        B        ??SX1276FskSetDccBw_6
??SX1276FskSetDccBw_5:
??SX1276FskSetDccBw_6:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+18
        BNE      ??SX1276FskSetDccBw_7
        LDRB     R1,[R4, #+0]
        MOVS     R0,#+18
        BL       SX1276Write
        LDR      R1,??DataTable6
        MOVS     R0,R5
        BL       __aeabi_uwrite4
        B        ??SX1276FskSetDccBw_8
??SX1276FskSetDccBw_7:
        LDRB     R1,[R4, #+0]
        MOVS     R0,#+19
        BL       SX1276Write
        LDR      R1,??DataTable6_1
        MOVS     R0,R5
        BL       __aeabi_uwrite4
??SX1276FskSetDccBw_8:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     FskSettings

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x404e8480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x417e8480

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetRssiOffset:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOV      R1,SP
        MOVS     R0,#+14
        BL       SX1276Read
        SXTB     R4,R4
        CMP      R4,#+0
        BPL      ??SX1276FskSetRssiOffset_0
        MVNS     R0,R4
        LSLS     R4,R0,#+27       ;; ZeroExtS R4,R0,#+27,#+27
        LSRS     R4,R4,#+27
        ADDS     R4,R4,#+1
        MOVS     R0,R4
        SXTB     R0,R0
        RSBS     R4,R0,#+0
??SX1276FskSetRssiOffset_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R1,R4,#+3
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+14
        BL       SX1276Write
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetPAOutput:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOV      R1,SP
        MOVS     R0,#+9
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        ORRS     R4,R4,R0
        MOV      R0,SP
        STRB     R4,[R0, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+9
        BL       SX1276Write
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetPa20dBm:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOV      R1,SP
        MOVS     R0,#+77
        BL       SX1276Read
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        MOVS     R0,#+9
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LSLS     R0,R0,#+24
        BPL      ??SX1276FskSetPa20dBm_0
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??SX1276FskSetPa20dBm_1
        MOVS     R0,#+135
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        B        ??SX1276FskSetPa20dBm_1
??SX1276FskSetPa20dBm_0:
        MOVS     R0,#+132
        MOV      R1,SP
        STRB     R0,[R1, #+0]
??SX1276FskSetPa20dBm_1:
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+77
        BL       SX1276Write
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetRFPower:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOV      R1,SP
        MOVS     R0,#+9
        BL       SX1276Read
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        MOVS     R0,#+77
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??SX1276FskSetRFPower_0
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        MOVS     R1,#+135
        ANDS     R1,R1,R0
        CMP      R1,#+135
        BNE      ??SX1276FskSetRFPower_1
        SXTB     R4,R4
        CMP      R4,#+5
        BGE      ??SX1276FskSetRFPower_2
        MOVS     R4,#+5
??SX1276FskSetRFPower_2:
        SXTB     R4,R4
        CMP      R4,#+21
        BLT      ??SX1276FskSetRFPower_3
        MOVS     R4,#+20
??SX1276FskSetRFPower_3:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        SXTB     R4,R4
        SUBS     R0,R4,#+5
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        B        ??SX1276FskSetRFPower_4
??SX1276FskSetRFPower_1:
        SXTB     R4,R4
        CMP      R4,#+2
        BGE      ??SX1276FskSetRFPower_5
        MOVS     R4,#+2
??SX1276FskSetRFPower_5:
        SXTB     R4,R4
        CMP      R4,#+18
        BLT      ??SX1276FskSetRFPower_6
        MOVS     R4,#+17
??SX1276FskSetRFPower_6:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        SXTB     R4,R4
        SUBS     R0,R4,#+2
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        B        ??SX1276FskSetRFPower_4
??SX1276FskSetRFPower_0:
        SXTB     R4,R4
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R4,R0
        BGE      ??SX1276FskSetRFPower_7
        MOVS     R4,#+0
        MVNS     R4,R4            ;; #-1
??SX1276FskSetRFPower_7:
        SXTB     R4,R4
        CMP      R4,#+15
        BLT      ??SX1276FskSetRFPower_8
        MOVS     R4,#+14
??SX1276FskSetRFPower_8:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        SXTB     R4,R4
        MOVS     R0,R4
        ADDS     R0,R0,#+1
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        MOV      R1,SP
        STRB     R0,[R1, #+0]
??SX1276FskSetRFPower_4:
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+9
        BL       SX1276Write
        LDR      R0,??DataTable8
        STRB     R4,[R0, #+12]
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x416312d0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetOpMode:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        MOVS     R2,R1
        MOVS     R1,#+8
        ORRS     R1,R1,R0
        ORRS     R1,R1,R2
        UXTB     R1,R1
        MOVS     R0,#+1
        BL       SX1276Write
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskInit:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+1
        BL       SX1276Write
        MOV      R1,SP
        MOVS     R0,#+10
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+10
        BL       SX1276Write
        MOVS     R1,#+32
        MOVS     R0,#+12
        BL       SX1276Write
        MOV      R1,SP
        MOVS     R0,#+13
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDRB     R0,[R0, #+22]
        CMP      R0,#+1
        BNE      ??SX1276FskInit_0
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+24
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        B        ??SX1276FskInit_1
??SX1276FskInit_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+14
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
??SX1276FskInit_1:
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+13
        BL       SX1276Write
        MOVS     R1,#+10
        MOVS     R0,#+38
        BL       SX1276Write
        MOV      R1,SP
        MOVS     R0,#+31
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+170
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+31
        BL       SX1276Write
        MOV      R1,SP
        MOVS     R0,#+39
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+145
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+39
        BL       SX1276Write
        MOVS     R0,#+105
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+40
        BL       SX1276Write
        MOVS     R0,#+129
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+41
        BL       SX1276Write
        MOV      R1,SP
        MOVS     R0,#+48
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable8
        LDRB     R1,[R1, #+21]
        LSLS     R1,R1,#+4
        MOVS     R2,#+128
        ORRS     R2,R2,R1
        ORRS     R2,R2,R0
        MOV      R0,SP
        STRB     R2,[R0, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+48
        BL       SX1276Write
        LDR      R0,??DataTable8
        LDRB     R1,[R0, #+23]
        MOVS     R0,#+50
        BL       SX1276Write
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        BL       SX1276FskSetRFFrequency
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+4]
        BL       SX1276FskSetBitrate
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+8]
        BL       SX1276FskSetFdev
        LDR      R0,??DataTable6
        BL       __aeabi_uread4
        MOVS     R2,R0
        MOVS     R1,#+0
        LDR      R0,??DataTable8_1
        BL       SX1276FskSetDccBw
        LDR      R0,??DataTable6_1
        BL       __aeabi_uread4
        MOVS     R2,R0
        MOVS     R1,#+0
        LDR      R0,??DataTable8_2
        BL       SX1276FskSetDccBw
        MOVS     R0,#+0
        BL       SX1276FskSetRssiOffset
        MOVS     R0,#+0
        BL       SX1276FskSetPAOutput
        MOVS     R0,#+0
        BL       SX1276FskSetPa20dBm
        MOVS     R0,#+12
        LDR      R1,??DataTable8
        LDRSB    R0,[R1, R0]
        BL       SX1276FskSetRFPower
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     FskSettings+0xD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     FskSettings+0x11

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
start_continuous_mode:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        MOVS     R1,#+0
        MOVS     R0,#+156
        LSLS     R0,R0,#+8        ;; #+39936
        BL       hal_sRF_ITConfig
        MOVS     R0,#+206
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOVS     R0,#+49
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        STRB     R0,[R1, #+1]
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        MOVS     R0,#+64
        BL       SX1276WriteBuffer
        MOV      R1,SP
        MOVS     R0,#+20
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+32
        ORRS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+20
        BL       SX1276Write
        MOV      R1,SP
        MOVS     R0,#+49
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+191
        ANDS     R1,R1,R0
        MOV      R0,SP
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+49
        BL       SX1276Write
        MOVS     R0,#+5
        BL       SX1276FskSetOpMode
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
packet_tx_data:
        PUSH     {R4,LR}
        MOVS     R4,R1
        LDR      R1,??DataTable8_3
        STRB     R4,[R1, #+0]
        UXTB     R4,R4
        MOVS     R2,R4
        MOVS     R1,R0
        LDR      R0,??DataTable8_4
        BL       w_memcpy
        LDR      R0,??DataTable8_5
        STRB     R4,[R0, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fill_fifo:
        PUSH     {R4,LR}
        LDR      R0,??DataTable8_5
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable8_6
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCC      ??fill_fifo_0
        LDR      R0,??DataTable8_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+54
        BLT      ??fill_fifo_1
        MOVS     R4,#+54
        B        ??fill_fifo_2
??fill_fifo_1:
        LDR      R0,??DataTable8_5
        LDRB     R4,[R0, #+0]
??fill_fifo_2:
        MOVS     R1,R4
        UXTB     R1,R1
        LDR      R0,??DataTable8_6
        LDRB     R0,[R0, #+0]
        LDR      R2,??DataTable8_3
        ADDS     R0,R2,R0
        BL       SX1276WriteFifo
        LDR      R0,??DataTable8_6
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,R4
        LDR      R1,??DataTable8_6
        STRB     R0,[R1, #+0]
??fill_fifo_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     FskSettings

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     RegRxBw

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     RegAfcBw

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     g_fsk

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     g_fsk+0x1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     g_fsk+0x101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     g_fsk+0x100

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276Fsk_Send_Packet:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        MOVS     R1,#+0
        MOVS     R0,#+156
        LSLS     R0,R0,#+8        ;; #+39936
        BL       hal_sRF_ITConfig
        MOVS     R0,#+5
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+32
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R2,#+2
        MOV      R1,SP
        MOVS     R0,#+64
        BL       SX1276WriteBuffer
        MOVS     R1,#+138
        MOVS     R0,#+53
        BL       SX1276Write
        MOVS     R1,R4
        UXTB     R1,R1
        MOVS     R0,R5
        BL       packet_tx_data
        BL       fill_fifo
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+8        ;; #+32768
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       hal_sRF_ITConfig
        MOVS     R0,#+3
        BL       SX1276FskSetOpMode
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276Fsk_Receive_Packet:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        MOVS     R1,#+0
        MOVS     R0,#+156
        LSLS     R0,R0,#+8        ;; #+39936
        BL       hal_sRF_ITConfig
        MOVS     R0,#+12
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+208
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R2,#+2
        MOV      R1,SP
        MOVS     R0,#+64
        BL       SX1276WriteBuffer
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+8        ;; #+32768
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        BL       hal_sRF_ITConfig
        MOVS     R0,#+5
        BL       SX1276FskSetOpMode
        POP      {R0,PC}          ;; return

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
//   260 bytes in section .bss
//    26 bytes in section .data
// 1 720 bytes in section .text
// 
// 1 720 bytes of CODE memory
//   286 bytes of DATA memory
//
//Errors: none
//Warnings: none

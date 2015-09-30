///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:48:18
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\sx1276-FskMisc.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\sx1276-FskMisc.c -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\sx1276-FskMisc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FskSettings
        EXTERN GET_TICK_COUNT
        EXTERN SX1276
        EXTERN SX1276Read
        EXTERN SX1276ReadBuffer
        EXTERN SX1276Write
        EXTERN SX1276WriteBuffer
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_i2d
        EXTERN __aeabi_ui2d
        EXTERN pow

        PUBLIC SX1276FskCalibreateTemp
        PUBLIC SX1276FskGetAfcOn
        PUBLIC SX1276FskGetBitrate
        PUBLIC SX1276FskGetBw
        PUBLIC SX1276FskGetFdev
        PUBLIC SX1276FskGetPAOutput
        PUBLIC SX1276FskGetPa20dBm
        PUBLIC SX1276FskGetPaRamp
        PUBLIC SX1276FskGetPacketCrcOn
        PUBLIC SX1276FskGetPayloadLength
        PUBLIC SX1276FskGetRFFrequency
        PUBLIC SX1276FskGetRFPower
        PUBLIC SX1276FskGetRawTemp
        PUBLIC SX1276FskGetRssiOffset
        PUBLIC SX1276FskGetTemp
        PUBLIC SX1276FskRxCalibrate
        PUBLIC SX1276FskSetAfcOn
        PUBLIC SX1276FskSetBitrate
        PUBLIC SX1276FskSetDccBw
        PUBLIC SX1276FskSetFdev
        PUBLIC SX1276FskSetPAOutput
        PUBLIC SX1276FskSetPa20dBm
        PUBLIC SX1276FskSetPaRamp
        PUBLIC SX1276FskSetPacketCrcOn
        PUBLIC SX1276FskSetPayloadLength
        PUBLIC SX1276FskSetRFFrequency
        PUBLIC SX1276FskSetRFPower
        PUBLIC SX1276FskSetRssiOffset


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetRFFrequency:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable6
        STR      R4,[R0, #+0]
        MOVS     R0,R4
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable6_1  ;; 0x404e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        MOVS     R4,R0
        MOVS     R0,R4
        LSRS     R0,R0,#+16
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+6]
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+7]
        MOVS     R0,R4
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+8]
        MOVS     R2,#+3
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+6
        MOVS     R0,#+6
        BL       SX1276WriteBuffer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetRFFrequency:
        PUSH     {R7,LR}
        MOVS     R2,#+3
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+6
        MOVS     R0,#+6
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+6]
        LSLS     R0,R0,#+16
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+7]
        LSLS     R1,R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+8]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable6_1  ;; 0x404e8480
        BL       __aeabi_dmul
        BL       __aeabi_d2uiz
        LDR      R1,??DataTable6
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+0]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskRxCalibrate:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOV      R1,SP
        MOVS     R0,#+9
        BL       SX1276Read
        BL       SX1276FskGetRFFrequency
        MOVS     R4,R0
        MOVS     R0,#+0
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+9]
        MOVS     R0,#+9
        BL       SX1276Write
        LDR      R0,??DataTable7  ;; 0x33428f00
        BL       SX1276FskSetRFFrequency
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+59
        MOVS     R0,#+59
        BL       SX1276Read
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        STRB     R1,[R0, #+0]
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+59
        BL       SX1276Write
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+59
        MOVS     R0,#+59
        BL       SX1276Read
??SX1276FskRxCalibrate_0:
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL      ??SX1276FskRxCalibrate_1
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+59
        MOVS     R0,#+59
        BL       SX1276Read
        B        ??SX1276FskRxCalibrate_0
??SX1276FskRxCalibrate_1:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+9]
        MOVS     R0,#+9
        BL       SX1276Write
        MOVS     R0,R4
        BL       SX1276FskSetRFFrequency
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetBitrate:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable6
        STR      R4,[R0, #+4]
        MOVS     R0,R4
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable9  ;; 0x417e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+2]
        MOVS     R0,R4
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+3]
        MOVS     R2,#+2
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+2
        MOVS     R0,#+2
        BL       SX1276WriteBuffer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetBitrate:
        PUSH     {R7,LR}
        MOVS     R2,#+2
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+2
        MOVS     R0,#+2
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+2]
        LSLS     R0,R0,#+8
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+3]
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6
        STR      R1,[R0, #+4]
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+4]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable9  ;; 0x417e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        UXTH     R0,R0
        LDR      R1,??DataTable6
        STR      R0,[R1, #+4]
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+4]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetFdev:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable6
        STR      R4,[R0, #+8]
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+4
        MOVS     R0,#+4
        BL       SX1276Read
        MOVS     R0,R4
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable6_1  ;; 0x404e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        MOVS     R4,R0
        UXTH     R4,R4
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+4]
        MOVS     R1,#+192
        ANDS     R1,R1,R0
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        ORRS     R0,R0,R1
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+4]
        MOVS     R0,R4
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+5]
        MOVS     R2,#+2
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+4
        MOVS     R0,#+4
        BL       SX1276WriteBuffer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetFdev:
        PUSH     {R7,LR}
        MOVS     R2,#+2
        LDR      R0,??DataTable6_2
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+4
        MOVS     R0,#+4
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+8
        LDR      R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+5]
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6
        STR      R1,[R0, #+8]
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+8]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable6_1  ;; 0x404e8480
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        UXTH     R0,R0
        LDR      R1,??DataTable6
        STR      R0,[R1, #+8]
        LDR      R0,??DataTable6
        LDR      R0,[R0, #+8]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     FskSettings

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x404e8480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     SX1276

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetRFPower:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable11
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable11
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+77
        MOVS     R0,#+77
        BL       SX1276Read
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+24
        BPL      ??SX1276FskSetRFPower_0
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+77
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+135
        ANDS     R1,R1,R0
        CMP      R1,#+135
        BNE      ??SX1276FskSetRFPower_1
        SXTB     R4,R4
        CMP      R4,#+5
        BGE      ??SX1276FskSetRFPower_2
        MOVS     R0,#+5
        MOVS     R4,R0
??SX1276FskSetRFPower_2:
        SXTB     R4,R4
        CMP      R4,#+21
        BLT      ??SX1276FskSetRFPower_3
        MOVS     R0,#+20
        MOVS     R4,R0
??SX1276FskSetRFPower_3:
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+9]
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        SXTB     R4,R4
        SUBS     R0,R4,#+5
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        LDR      R1,??DataTable11
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
        B        ??SX1276FskSetRFPower_4
??SX1276FskSetRFPower_1:
        SXTB     R4,R4
        CMP      R4,#+2
        BGE      ??SX1276FskSetRFPower_5
        MOVS     R0,#+2
        MOVS     R4,R0
??SX1276FskSetRFPower_5:
        SXTB     R4,R4
        CMP      R4,#+18
        BLT      ??SX1276FskSetRFPower_6
        MOVS     R0,#+17
        MOVS     R4,R0
??SX1276FskSetRFPower_6:
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+9]
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        SXTB     R4,R4
        SUBS     R0,R4,#+2
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        LDR      R1,??DataTable11
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
        B        ??SX1276FskSetRFPower_4
??SX1276FskSetRFPower_0:
        SXTB     R4,R4
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R4,R0
        BGE      ??SX1276FskSetRFPower_7
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        MOVS     R4,R0
??SX1276FskSetRFPower_7:
        SXTB     R4,R4
        CMP      R4,#+15
        BLT      ??SX1276FskSetRFPower_8
        MOVS     R0,#+14
        MOVS     R4,R0
??SX1276FskSetRFPower_8:
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+9]
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        SXTB     R4,R4
        MOVS     R0,R4
        ADDS     R0,R0,#+1
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        LDR      R1,??DataTable11
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
??SX1276FskSetRFPower_4:
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+9]
        MOVS     R0,#+9
        BL       SX1276Write
        LDR      R0,??DataTable16
        STRB     R4,[R0, #+12]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x33428f00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetRFPower:
        PUSH     {R7,LR}
        LDR      R0,??DataTable11
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable11
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+77
        MOVS     R0,#+77
        BL       SX1276Read
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+24
        BPL      ??SX1276FskGetRFPower_0
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+77
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        CMP      R0,#+7
        BNE      ??SX1276FskGetRFPower_1
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ADDS     R0,R0,#+5
        LDR      R1,??DataTable16
        STRB     R0,[R1, #+12]
        B        ??SX1276FskGetRFPower_2
??SX1276FskGetRFPower_1:
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ADDS     R0,R0,#+2
        LDR      R1,??DataTable16
        STRB     R0,[R1, #+12]
        B        ??SX1276FskGetRFPower_2
??SX1276FskGetRFPower_0:
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable16
        STRB     R0,[R1, #+12]
??SX1276FskGetRFPower_2:
        MOVS     R0,#+12
        LDR      R1,??DataTable16
        LDRSB    R0,[R1, R0]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskComputeRxBw:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
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
        LDR      R1,??DataTable9  ;; 0x417e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x417e8480

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
        LDR      R1,??DataTable18  ;; 0x416312d0
        ADD      R2,SP,#+8
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        MOVS     R0,#+0
        MOVS     R5,R0
??SX1276FskComputeRxBwMantExp_0:
        UXTB     R5,R5
        CMP      R5,#+8
        BGE      ??SX1276FskComputeRxBwMantExp_1
        MOVS     R0,#+16
        MOVS     R4,R0
??SX1276FskComputeRxBwMantExp_2:
        UXTB     R4,R4
        CMP      R4,#+25
        BGE      ??SX1276FskComputeRxBwMantExp_3
        UXTB     R4,R4
        MOVS     R0,R4
        BL       __aeabi_ui2d
        STR      R0,[SP, #+0]
        STR      R1,[SP, #+4]
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
        LDR      R2,[SP, #+0]
        LDR      R3,[SP, #+4]
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable22  ;; 0x417e8480
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
        ADD      R2,SP,#+8
        LDM      R2,{R2,R3}
        BL       __aeabi_cdcmple
        BCS      ??SX1276FskComputeRxBwMantExp_4
        LDR      R0,[SP, #+16]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        LSLS     R1,R1,#+1        ;; ZeroExtS R1,R1,#+1,#+1
        LSRS     R1,R1,#+1
        ADD      R2,SP,#+8
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        LDR      R0,[SP, #+20]
        STRB     R4,[R0, #+0]
        LDR      R0,[SP, #+24]
        STRB     R5,[R0, #+0]
??SX1276FskComputeRxBwMantExp_4:
        ADDS     R4,R4,#+4
        B        ??SX1276FskComputeRxBwMantExp_2
??SX1276FskComputeRxBwMantExp_3:
        ADDS     R5,R5,#+1
        B        ??SX1276FskComputeRxBwMantExp_0
??SX1276FskComputeRxBwMantExp_1:
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetDccBw:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+18
        CMP      R4,R0
        BNE      ??SX1276FskSetDccBw_0
        MOVS     R0,R6
        MOVS     R1,#+96
        ANDS     R1,R1,R0
        STRB     R1,[R4, #+0]
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
        LDR      R0,??DataTable11
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+18
        CMP      R4,R0
        BNE      ??SX1276FskSetDccBw_7
        LDRB     R1,[R4, #+0]
        MOVS     R0,#+18
        BL       SX1276Write
        LDR      R0,??DataTable16
        STR      R5,[R0, #+16]
        B        ??SX1276FskSetDccBw_8
??SX1276FskSetDccBw_7:
        LDRB     R1,[R4, #+0]
        MOVS     R0,#+19
        BL       SX1276Write
        LDR      R0,??DataTable16
        STR      R5,[R0, #+20]
??SX1276FskSetDccBw_8:
        POP      {R0,R1,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     SX1276

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetBw:
        PUSH     {R4-R6,LR}
        MOVS     R6,R0
        MOVS     R4,#+0
        MOVS     R5,#+0
        LDRB     R0,[R6, #+0]
        ASRS     R0,R0,#+3
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??SX1276FskGetBw_0
        CMP      R0,#+2
        BEQ      ??SX1276FskGetBw_1
        BCC      ??SX1276FskGetBw_2
        B        ??SX1276FskGetBw_3
??SX1276FskGetBw_0:
        MOVS     R0,#+16
        MOVS     R5,R0
        B        ??SX1276FskGetBw_4
??SX1276FskGetBw_2:
        MOVS     R0,#+20
        MOVS     R5,R0
        B        ??SX1276FskGetBw_4
??SX1276FskGetBw_1:
        MOVS     R0,#+24
        MOVS     R5,R0
        B        ??SX1276FskGetBw_4
??SX1276FskGetBw_3:
??SX1276FskGetBw_4:
        LDRB     R0,[R6, #+0]
        LSLS     R1,R0,#+29       ;; ZeroExtS R1,R0,#+29,#+29
        LSRS     R1,R1,#+29
        MOVS     R0,R5
        UXTB     R0,R0
        BL       SX1276FskComputeRxBw
        MOVS     R4,R0
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+18
        CMP      R6,R0
        BNE      ??SX1276FskGetBw_5
        MOVS     R0,R4
        LDR      R1,??DataTable16
        STR      R0,[R1, #+16]
        B        ??SX1276FskGetBw_6
??SX1276FskGetBw_5:
        MOVS     R0,R4
        LDR      R1,??DataTable16
        STR      R0,[R1, #+20]
??SX1276FskGetBw_6:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetPacketCrcOn:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+48
        MOVS     R0,#+48
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+48
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+239
        ANDS     R1,R1,R0
        LSLS     R0,R4,#+4
        ORRS     R0,R0,R1
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+48
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+48
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+48
        BL       SX1276Write
        LDR      R0,??DataTable16
        STRB     R4,[R0, #+24]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPacketCrcOn:
        PUSH     {R7,LR}
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+48
        MOVS     R0,#+48
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+48
        LDRB     R0,[R0, #+0]
        MOVS     R1,R0
        LSLS     R1,R1,#+27       ;; ZeroExtS R1,R1,#+27,#+31
        LSRS     R1,R1,#+31
        LDR      R0,??DataTable16
        STRB     R1,[R0, #+24]
        LDR      R0,??DataTable16
        LDRB     R0,[R0, #+24]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetAfcOn:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+13
        MOVS     R0,#+13
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+13]
        MOVS     R1,#+239
        ANDS     R1,R1,R0
        LSLS     R0,R4,#+4
        ORRS     R0,R0,R1
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+13]
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+13]
        MOVS     R0,#+13
        BL       SX1276Write
        LDR      R0,??DataTable16
        STRB     R4,[R0, #+25]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetAfcOn:
        PUSH     {R7,LR}
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+13
        MOVS     R0,#+13
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+13]
        MOVS     R1,R0
        LSLS     R1,R1,#+27       ;; ZeroExtS R1,R1,#+27,#+31
        LSRS     R1,R1,#+31
        LDR      R0,??DataTable16
        STRB     R1,[R0, #+25]
        LDR      R0,??DataTable16
        LDRB     R0,[R0, #+25]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     FskSettings

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetPayloadLength:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+50
        STRB     R4,[R0, #+0]
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+50
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+50
        BL       SX1276Write
        LDR      R0,??DataTable27
        STRB     R4,[R0, #+26]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPayloadLength:
        PUSH     {R7,LR}
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+50
        MOVS     R0,#+50
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+50
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable27
        STRB     R0,[R1, #+26]
        LDR      R0,??DataTable27
        LDRB     R0,[R0, #+26]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x416312d0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetPa20dBm:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+77
        MOVS     R0,#+77
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+24
        BPL      ??SX1276FskSetPa20dBm_0
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??SX1276FskSetPa20dBm_1
        MOVS     R0,#+135
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+77
        STRB     R0,[R1, #+0]
        B        ??SX1276FskSetPa20dBm_1
??SX1276FskSetPa20dBm_0:
        MOVS     R0,#+132
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+77
        STRB     R0,[R1, #+0]
??SX1276FskSetPa20dBm_1:
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+77
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+77
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPa20dBm:
        PUSH     {R7,LR}
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+77
        MOVS     R0,#+77
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+77
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        CMP      R0,#+7
        BNE      ??SX1276FskGetPa20dBm_0
        MOVS     R0,#+1
        B        ??SX1276FskGetPa20dBm_1
??SX1276FskGetPa20dBm_0:
        MOVS     R0,#+0
??SX1276FskGetPa20dBm_1:
        UXTB     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetPAOutput:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        ORRS     R0,R0,R4
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+9]
        MOVS     R0,#+9
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPAOutput:
        PUSH     {R7,LR}
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+128
        ANDS     R0,R0,R1
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0x417e8480

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetPaRamp:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+10
        MOVS     R0,#+10
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+10]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        LSLS     R0,R4,#+28       ;; ZeroExtS R0,R4,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        LDR      R1,??DataTable26
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+10]
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+10]
        MOVS     R0,#+10
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPaRamp:
        PUSH     {R7,LR}
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+10
        MOVS     R0,#+10
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+10]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetRssiOffset:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+14
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
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+14]
        LSLS     R1,R4,#+3
        ORRS     R1,R1,R0
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+14]
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+14]
        MOVS     R0,#+14
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetRssiOffset:
        PUSH     {R7,LR}
        LDR      R0,??DataTable26
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+14
        MOVS     R0,#+14
        BL       SX1276Read
        LDR      R0,??DataTable26
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+14]
        UXTB     R0,R0
        LSRS     R0,R0,#+3
        SXTB     R0,R0
        LSLS     R1,R0,#+27
        BPL      ??SX1276FskGetRssiOffset_0
        MVNS     R1,R0
        LSLS     R0,R1,#+27       ;; ZeroExtS R0,R1,#+27,#+27
        LSRS     R0,R0,#+27
        ADDS     R0,R0,#+1
        MOVS     R1,R0
        SXTB     R1,R1
        RSBS     R0,R1,#+0
??SX1276FskGetRssiOffset_0:
        SXTB     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     SX1276

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetRawTemp:
        PUSH     {R4-R6,LR}
        MOVS     R4,#+0
        LDR      R0,??DataTable27_1
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+59
        MOVS     R0,#+59
        BL       SX1276Read
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+254
        ANDS     R1,R1,R0
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        STRB     R1,[R0, #+0]
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+59
        BL       SX1276Write
        LDR      R0,??DataTable27_1
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+1
        MOVS     R0,#+1
        BL       SX1276Read
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+1]
        MOVS     R6,R0
        MOVS     R0,#+4
        LDR      R1,??DataTable27_1
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+1]
        MOVS     R0,#+1
        BL       SX1276Write
        BL       GET_TICK_COUNT
        MOVS     R5,R0
??SX1276FskGetRawTemp_0:
        BL       GET_TICK_COUNT
        SUBS     R0,R0,R5
        CMP      R0,#+0
        BEQ      ??SX1276FskGetRawTemp_0
        LDR      R0,??DataTable27_1
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+59
        MOVS     R0,#+59
        BL       SX1276Read
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        STRB     R1,[R0, #+0]
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+59
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+59
        BL       SX1276Write
        LDR      R0,??DataTable27_1
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+60
        MOVS     R0,#+60
        BL       SX1276Read
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+60
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        MOVS     R4,R0
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+60
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??SX1276FskGetRawTemp_1
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        MULS     R4,R0,R4
??SX1276FskGetRawTemp_1:
        MOVS     R1,R6
        UXTB     R1,R1
        MOVS     R0,#+1
        BL       SX1276Write
        MOVS     R0,R4
        SXTB     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     FskSettings

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_1:
        DC32     SX1276

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskCalibreateTemp:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       SX1276FskGetRawTemp
        SUBS     R0,R4,R0
        SXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetTemp:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       SX1276FskGetRawTemp
        ADDS     R0,R0,R4
        SXTB     R0,R0
        POP      {R4,PC}          ;; return

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
// 2 426 bytes in section .text
// 
// 2 426 bytes of CODE memory
//
//Errors: none
//Warnings: 1

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  14:25:58
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\APP\sx1276-LoRaMisc.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\APP\sx1276-LoRaMisc.c -D
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
//        F:\cloneSlave\lamp_project_slave\Debug\List\sx1276-LoRaMisc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LoRaSettings
        EXTERN SX1276LR
        EXTERN SX1276Read
        EXTERN SX1276ReadBuffer
        EXTERN SX1276Write
        EXTERN SX1276WriteBuffer
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_ui2d

        PUBLIC SX1276LoRaGetErrorCoding
        PUBLIC SX1276LoRaGetFreqHopOn
        PUBLIC SX1276LoRaGetHopPeriod
        PUBLIC SX1276LoRaGetImplicitHeaderOn
        PUBLIC SX1276LoRaGetLowDatarateOptimize
        PUBLIC SX1276LoRaGetNbTrigPeaks
        PUBLIC SX1276LoRaGetPAOutput
        PUBLIC SX1276LoRaGetPa20dBm
        PUBLIC SX1276LoRaGetPaRamp
        PUBLIC SX1276LoRaGetPacketCrcOn
        PUBLIC SX1276LoRaGetPayloadLength
        PUBLIC SX1276LoRaGetPreambleLength
        PUBLIC SX1276LoRaGetRFFrequency
        PUBLIC SX1276LoRaGetRFPower
        PUBLIC SX1276LoRaGetRxPacketTimeout
        PUBLIC SX1276LoRaGetRxSingleOn
        PUBLIC SX1276LoRaGetSignalBandwidth
        PUBLIC SX1276LoRaGetSpreadingFactor
        PUBLIC SX1276LoRaGetSymbTimeout
        PUBLIC SX1276LoRaGetTxPacketTimeout
        PUBLIC SX1276LoRaSetErrorCoding
        PUBLIC SX1276LoRaSetFreqHopOn
        PUBLIC SX1276LoRaSetHopPeriod
        PUBLIC SX1276LoRaSetImplicitHeaderOn
        PUBLIC SX1276LoRaSetLowDatarateOptimize
        PUBLIC SX1276LoRaSetNbTrigPeaks
        PUBLIC SX1276LoRaSetPAOutput
        PUBLIC SX1276LoRaSetPa20dBm
        PUBLIC SX1276LoRaSetPaRamp
        PUBLIC SX1276LoRaSetPacketCrcOn
        PUBLIC SX1276LoRaSetPayloadLength
        PUBLIC SX1276LoRaSetPreambleLength
        PUBLIC SX1276LoRaSetRFFrequency
        PUBLIC SX1276LoRaSetRFPower
        PUBLIC SX1276LoRaSetRxPacketTimeout
        PUBLIC SX1276LoRaSetRxSingleOn
        PUBLIC SX1276LoRaSetSignalBandwidth
        PUBLIC SX1276LoRaSetSpreadingFactor
        PUBLIC SX1276LoRaSetSymbTimeout
        PUBLIC SX1276LoRaSetTxPacketTimeout


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetRFFrequency:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable7
        STR      R4,[R0, #+0]
        MOVS     R0,R4
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable7_1  ;; 0x404e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        MOVS     R4,R0
        MOVS     R0,R4
        LSRS     R0,R0,#+16
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+6]
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+7]
        MOVS     R0,R4
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+8]
        MOVS     R2,#+3
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+6
        MOVS     R0,#+6
        BL       SX1276WriteBuffer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetRFFrequency:
        PUSH     {R7,LR}
        MOVS     R2,#+3
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+6
        MOVS     R0,#+6
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+6]
        LSLS     R0,R0,#+16
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+7]
        LSLS     R1,R1,#+8
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+8]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable7_1  ;; 0x404e8480
        BL       __aeabi_dmul
        BL       __aeabi_d2uiz
        LDR      R1,??DataTable7
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable7
        LDR      R0,[R0, #+0]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetRFPower:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+76
        MOVS     R0,#+77
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+24
        BPL      ??SX1276LoRaSetRFPower_0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+76
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+135
        ANDS     R1,R1,R0
        CMP      R1,#+135
        BNE      ??SX1276LoRaSetRFPower_1
        SXTB     R4,R4
        CMP      R4,#+5
        BGE      ??SX1276LoRaSetRFPower_2
        MOVS     R0,#+5
        MOVS     R4,R0
??SX1276LoRaSetRFPower_2:
        SXTB     R4,R4
        CMP      R4,#+21
        BLT      ??SX1276LoRaSetRFPower_3
        MOVS     R0,#+20
        MOVS     R4,R0
??SX1276LoRaSetRFPower_3:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+9]
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        SXTB     R4,R4
        SUBS     R0,R4,#+5
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
        B        ??SX1276LoRaSetRFPower_4
??SX1276LoRaSetRFPower_1:
        SXTB     R4,R4
        CMP      R4,#+2
        BGE      ??SX1276LoRaSetRFPower_5
        MOVS     R0,#+2
        MOVS     R4,R0
??SX1276LoRaSetRFPower_5:
        SXTB     R4,R4
        CMP      R4,#+18
        BLT      ??SX1276LoRaSetRFPower_6
        MOVS     R0,#+17
        MOVS     R4,R0
??SX1276LoRaSetRFPower_6:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+9]
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        SXTB     R4,R4
        SUBS     R0,R4,#+2
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
        B        ??SX1276LoRaSetRFPower_4
??SX1276LoRaSetRFPower_0:
        SXTB     R4,R4
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        CMP      R4,R0
        BGE      ??SX1276LoRaSetRFPower_7
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        MOVS     R4,R0
??SX1276LoRaSetRFPower_7:
        SXTB     R4,R4
        CMP      R4,#+15
        BLT      ??SX1276LoRaSetRFPower_8
        MOVS     R0,#+14
        MOVS     R4,R0
??SX1276LoRaSetRFPower_8:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+112
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+9]
        LDR      R0,??DataTable8
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
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
??SX1276LoRaSetRFPower_4:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+9]
        MOVS     R0,#+9
        BL       SX1276Write
        LDR      R0,??DataTable7
        STRB     R4,[R0, #+4]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetRFPower:
        PUSH     {R7,LR}
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+76
        MOVS     R0,#+77
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+24
        BPL      ??SX1276LoRaGetRFPower_0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+76
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        CMP      R0,#+7
        BNE      ??SX1276LoRaGetRFPower_1
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ADDS     R0,R0,#+5
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+4]
        B        ??SX1276LoRaGetRFPower_2
??SX1276LoRaGetRFPower_1:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ADDS     R0,R0,#+2
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+4]
        B        ??SX1276LoRaGetRFPower_2
??SX1276LoRaGetRFPower_0:
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+4]
??SX1276LoRaGetRFPower_2:
        MOVS     R0,#+4
        LDR      R1,??DataTable7
        LDRSB    R0,[R1, R0]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetSignalBandwidth:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+29
        MOVS     R0,#+29
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+29]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        LSLS     R1,R4,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+29]
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+29]
        MOVS     R0,#+29
        BL       SX1276Write
        LDR      R0,??DataTable7
        STRB     R4,[R0, #+5]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetSignalBandwidth:
        PUSH     {R7,LR}
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+29
        MOVS     R0,#+29
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+29]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+5]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetSpreadingFactor:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTB     R4,R4
        CMP      R4,#+13
        BLT      ??SX1276LoRaSetSpreadingFactor_0
        MOVS     R0,#+12
        MOVS     R4,R0
        B        ??SX1276LoRaSetSpreadingFactor_1
??SX1276LoRaSetSpreadingFactor_0:
        UXTB     R4,R4
        CMP      R4,#+6
        BGE      ??SX1276LoRaSetSpreadingFactor_1
        MOVS     R0,#+6
        MOVS     R4,R0
??SX1276LoRaSetSpreadingFactor_1:
        UXTB     R4,R4
        CMP      R4,#+6
        BNE      ??SX1276LoRaSetSpreadingFactor_2
        MOVS     R0,#+5
        BL       SX1276LoRaSetNbTrigPeaks
        B        ??SX1276LoRaSetSpreadingFactor_3
??SX1276LoRaSetSpreadingFactor_2:
        MOVS     R0,#+3
        BL       SX1276LoRaSetNbTrigPeaks
??SX1276LoRaSetSpreadingFactor_3:
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+30
        MOVS     R0,#+30
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+30]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        LSLS     R1,R4,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+30]
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+30]
        MOVS     R0,#+30
        BL       SX1276Write
        LDR      R0,??DataTable7
        STRB     R4,[R0, #+6]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetSpreadingFactor:
        PUSH     {R7,LR}
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+30
        MOVS     R0,#+30
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+30]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+6]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     LoRaSettings

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x404e8480

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetErrorCoding:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+29
        MOVS     R0,#+29
        BL       SX1276Read
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+29]
        MOVS     R1,#+241
        ANDS     R1,R1,R0
        LSLS     R0,R4,#+1
        ORRS     R0,R0,R1
        LDR      R1,??DataTable8
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+29]
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+29]
        MOVS     R0,#+29
        BL       SX1276Write
        LDR      R0,??DataTable33
        STRB     R4,[R0, #+7]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     SX1276LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetErrorCoding:
        PUSH     {R7,LR}
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+29
        MOVS     R0,#+29
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+29]
        UXTB     R0,R0
        LSRS     R0,R0,#+1
        MOVS     R1,#+135
        ANDS     R1,R1,R0
        LDR      R0,??DataTable33
        STRB     R1,[R0, #+7]
        LDR      R0,??DataTable33
        LDRB     R0,[R0, #+7]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetPacketCrcOn:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+30
        MOVS     R0,#+30
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+30]
        MOVS     R1,#+251
        ANDS     R1,R1,R0
        LSLS     R0,R4,#+2
        ORRS     R0,R0,R1
        LDR      R1,??DataTable31
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+30]
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+30]
        MOVS     R0,#+30
        BL       SX1276Write
        LDR      R0,??DataTable33
        STRB     R4,[R0, #+8]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetPreambleLength:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R2,#+2
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+32
        MOVS     R0,#+32
        BL       SX1276ReadBuffer
        MOVS     R0,R4
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable31
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+32
        STRB     R0,[R1, #+0]
        MOVS     R0,R4
        LDR      R1,??DataTable31
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+33
        STRB     R0,[R1, #+0]
        MOVS     R2,#+2
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+32
        MOVS     R0,#+32
        BL       SX1276WriteBuffer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPreambleLength:
        PUSH     {R7,LR}
        MOVS     R2,#+2
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+32
        MOVS     R0,#+32
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+32
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        LDR      R1,??DataTable31
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+33
        LDRB     R1,[R1, #+0]
        ORRS     R0,R0,R1
        UXTH     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPacketCrcOn:
        PUSH     {R7,LR}
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+30
        MOVS     R0,#+30
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+30]
        UXTB     R0,R0
        LSRS     R0,R0,#+1
        MOVS     R1,#+2
        ANDS     R0,R0,R1
        LDR      R1,??DataTable33
        STRB     R0,[R1, #+8]
        LDR      R0,??DataTable33
        LDRB     R0,[R0, #+8]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetImplicitHeaderOn:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+29
        MOVS     R0,#+29
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+29]
        MOVS     R1,#+254
        ANDS     R1,R1,R0
        ORRS     R1,R1,R4
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+29]
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+29]
        MOVS     R0,#+29
        BL       SX1276Write
        LDR      R0,??DataTable33
        STRB     R4,[R0, #+9]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetImplicitHeaderOn:
        PUSH     {R7,LR}
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+29
        MOVS     R0,#+29
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+29]
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        LDR      R0,??DataTable33
        STRB     R1,[R0, #+9]
        LDR      R0,??DataTable33
        LDRB     R0,[R0, #+9]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetRxSingleOn:
        LDR      R1,??DataTable33
        STRB     R0,[R1, #+10]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetRxSingleOn:
        LDR      R0,??DataTable33
        LDRB     R0,[R0, #+10]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetFreqHopOn:
        LDR      R1,??DataTable33
        STRB     R0,[R1, #+11]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetFreqHopOn:
        LDR      R0,??DataTable33
        LDRB     R0,[R0, #+11]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetHopPeriod:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+36
        STRB     R4,[R0, #+0]
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+36
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+36
        BL       SX1276Write
        LDR      R0,??DataTable33
        STRB     R4,[R0, #+12]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetHopPeriod:
        PUSH     {R7,LR}
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+36
        MOVS     R0,#+36
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+36
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable33
        STRB     R0,[R1, #+12]
        LDR      R0,??DataTable33
        LDRB     R0,[R0, #+12]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetTxPacketTimeout:
        LDR      R1,??DataTable33
        STR      R0,[R1, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetTxPacketTimeout:
        LDR      R0,??DataTable33
        LDR      R0,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetRxPacketTimeout:
        LDR      R1,??DataTable33
        STR      R0,[R1, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetRxPacketTimeout:
        LDR      R0,??DataTable33
        LDR      R0,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetPayloadLength:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+34
        STRB     R4,[R0, #+0]
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+34
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+34
        BL       SX1276Write
        LDR      R0,??DataTable33
        STRB     R4,[R0, #+24]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPayloadLength:
        PUSH     {R7,LR}
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+34
        MOVS     R0,#+34
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+34
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable33
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable33
        LDRB     R0,[R0, #+24]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetPa20dBm:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+76
        MOVS     R0,#+77
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+24
        BPL      ??SX1276LoRaSetPa20dBm_0
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??SX1276LoRaSetPa20dBm_1
        MOVS     R0,#+135
        LDR      R1,??DataTable31
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+76
        STRB     R0,[R1, #+0]
        B        ??SX1276LoRaSetPa20dBm_1
??SX1276LoRaSetPa20dBm_0:
        MOVS     R0,#+132
        LDR      R1,??DataTable31
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+76
        STRB     R0,[R1, #+0]
??SX1276LoRaSetPa20dBm_1:
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+76
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+77
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPa20dBm:
        PUSH     {R7,LR}
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+76
        MOVS     R0,#+77
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+76
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        CMP      R0,#+7
        BNE      ??SX1276LoRaGetPa20dBm_0
        MOVS     R0,#+1
        B        ??SX1276LoRaGetPa20dBm_1
??SX1276LoRaGetPa20dBm_0:
        MOVS     R0,#+0
??SX1276LoRaGetPa20dBm_1:
        UXTB     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetPAOutput:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        LSLS     R0,R0,#+25       ;; ZeroExtS R0,R0,#+25,#+25
        LSRS     R0,R0,#+25
        ORRS     R0,R0,R4
        LDR      R1,??DataTable31
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+9]
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+9]
        MOVS     R0,#+9
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPAOutput:
        PUSH     {R7,LR}
        LDR      R0,??DataTable31
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+9
        MOVS     R0,#+9
        BL       SX1276Read
        LDR      R0,??DataTable31
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+128
        ANDS     R0,R0,R1
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable31:
        DC32     SX1276LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetPaRamp:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+10
        MOVS     R0,#+10
        BL       SX1276Read
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+10]
        MOVS     R1,#+240
        ANDS     R1,R1,R0
        LSLS     R0,R4,#+28       ;; ZeroExtS R0,R4,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R1
        LDR      R1,??DataTable39
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+10]
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+10]
        MOVS     R0,#+10
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPaRamp:
        PUSH     {R7,LR}
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+10
        MOVS     R0,#+10
        BL       SX1276Read
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+10]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable33:
        DC32     LoRaSettings

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetSymbTimeout:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R2,#+2
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+30
        MOVS     R0,#+30
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+30]
        MOVS     R1,#+252
        ANDS     R1,R1,R0
        UXTH     R4,R4
        MOVS     R0,R4
        ASRS     R0,R0,#+8
        LSLS     R0,R0,#+30       ;; ZeroExtS R0,R0,#+30,#+30
        LSRS     R0,R0,#+30
        ORRS     R0,R0,R1
        LDR      R1,??DataTable39
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+30]
        MOVS     R0,R4
        LDR      R1,??DataTable39
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+31]
        MOVS     R2,#+2
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+30
        MOVS     R0,#+30
        BL       SX1276WriteBuffer
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetSymbTimeout:
        PUSH     {R7,LR}
        MOVS     R2,#+2
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+30
        MOVS     R0,#+30
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+30]
        LDR      R1,??DataTable39_1  ;; 0xff03
        ANDS     R1,R1,R0
        LSLS     R0,R1,#+8
        LDR      R1,??DataTable39
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+31]
        ORRS     R0,R0,R1
        UXTH     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetLowDatarateOptimize:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+38
        MOVS     R0,#+38
        BL       SX1276Read
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+38
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+247
        ANDS     R1,R1,R0
        LSLS     R0,R4,#+3
        ORRS     R0,R0,R1
        LDR      R1,??DataTable39
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+38
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+38
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+38
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetLowDatarateOptimize:
        PUSH     {R7,LR}
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+38
        MOVS     R0,#+38
        BL       SX1276Read
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+38
        LDRB     R1,[R0, #+0]
        MOVS     R0,R1
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+31
        LSRS     R0,R0,#+31
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetNbTrigPeaks:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+48
        MOVS     R0,#+49
        BL       SX1276Read
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+48
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        ORRS     R1,R1,R4
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+48
        STRB     R1,[R0, #+0]
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+48
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+49
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetNbTrigPeaks:
        PUSH     {R7,LR}
        LDR      R0,??DataTable39
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+48
        MOVS     R0,#+49
        BL       SX1276Read
        LDR      R0,??DataTable39
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+48
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39:
        DC32     SX1276LR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable39_1:
        DC32     0xff03

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
// 1 874 bytes in section .text
// 
// 1 874 bytes of CODE memory
//
//Errors: none
//Warnings: none

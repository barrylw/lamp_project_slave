///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:48:13
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\APP\apl_debug.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\apl_debug.c -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\apl_debug.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GetTime
        EXTERN OS_MemClr
        EXTERN ReadVersion
        EXTERN SX1276LoRaSetRFPower
        EXTERN SX1276LoRa_Receive_Packet
        EXTERN SX1276LoRa_Send_Packet
        EXTERN SX1276Read
        EXTERN SX1276Write
        EXTERN SendUart
        EXTERN SetTime
        EXTERN SoftReset
        EXTERN __aeabi_idivmod
        EXTERN g_DebugRxBuffer
        EXTERN g_DebugRxFlag
        EXTERN g_SystickCounter
        EXTERN g_hopChannel
        EXTERN hal_InitRF
        EXTERN hal_long_send
        EXTERN printf
        EXTERN process_start
        EXTERN tedtbuf

        PUBLIC GetStringParameter
        PUBLIC Getu16Parameter
        PUBLIC Getu8Parameter
        PUBLIC ReadUpdateData
        PUBLIC apl_ProcessCmdLine
        PUBLIC apl_ProcessDebugCmd
        PUBLIC changeHopChannel
        PUBLIC contious_mode_rx
        PUBLIC get_reg
        PUBLIC radio_reset
        PUBLIC read_reg_all
        PUBLIC receive_packet
        PUBLIC send_packet
        PUBLIC set_power
        PUBLIC set_reg
        PUBLIC start_longSend


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp u32 hal_GetSystickCounter(void)
hal_GetSystickCounter:
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "version">`:
        DATA
        DC8 "version"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reset">`:
        DATA
        DC8 "reset"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "settime">`:
        DATA
        DC8 "settime"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "gettime">`:
        DATA
        DC8 "gettime"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "senduart">`:
        DATA
        DC8 "senduart"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "setpow">`:
        DATA
        DC8 "setpow"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "readupdate">`:
        DATA
        DC8 "readupdate"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "readreg">`:
        DATA
        DC8 "readreg"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "writereg">`:
        DATA
        DC8 "writereg"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "readft">`:
        DATA
        DC8 "readft"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "tx">`:
        DATA
        DC8 "tx"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "rx">`:
        DATA
        DC8 "rx"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "contious">`:
        DATA
        DC8 "contious"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "radioreset">`:
        DATA
        DC8 "radioreset"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "longsend">`:
        DATA
        DC8 "longsend"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "hopchannel">`:
        DATA
        DC8 "hopchannel"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "C>"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\r\\ncommand length erro...">`:
        DATA
        DC8 "\015\012command length error!\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "it has taken %d ms\\r\\n">`:
        DATA
        DC8 "it has taken %d ms\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\r\\ncommand not recogni...">`:
        DATA
        DC8 "\015\012command not recognized\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%x "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reg %x = %x\\r\\n">`:
        DATA
        DC8 "reg %x = %x\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%x  ">`:
        DATA
        DC8 "%x  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
CmdList:
        DATA
        DC32 `?<Constant "version">`, ReadVersion, `?<Constant "reset">`
        DC32 SoftReset, `?<Constant "settime">`, SetTime
        DC32 `?<Constant "gettime">`, GetTime, `?<Constant "senduart">`
        DC32 SendUart, `?<Constant "setpow">`, set_power
        DC32 `?<Constant "readupdate">`, ReadUpdateData
        DC32 `?<Constant "readreg">`, get_reg, `?<Constant "writereg">`
        DC32 set_reg, `?<Constant "readft">`, read_reg_all, `?<Constant "tx">`
        DC32 send_packet, `?<Constant "rx">`, receive_packet
        DC32 `?<Constant "contious">`, contious_mode_rx
        DC32 `?<Constant "radioreset">`, radio_reset, `?<Constant "longsend">`
        DC32 start_longSend, `?<Constant "hopchannel">`, changeHopChannel

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
apl_ProcessDebugCmd:
        PUSH     {R7,LR}
        LDR      R0,??DataTable4_1
        LDRB     R2,[R0, #+2]
        LDRB     R1,[R0, #+3]
        LSLS     R1,R1,#+24       ;; ZeroExtS R1,R1,#+24,#+16
        LSRS     R1,R1,#+16
        ORRS     R2,R2,R1
        CMP      R2,#+0
        BEQ      ??apl_ProcessDebugCmd_0
        BL       apl_ProcessCmdLine
        ADR      R0,??DataTable4_2  ;; 0x43, 0x3E, 0x00, 0x00
        BL       printf
        B        ??apl_ProcessDebugCmd_1
??apl_ProcessDebugCmd_0:
        LDR      R0,??DataTable4_3
        BL       printf
??apl_ProcessDebugCmd_1:
        MOVS     R1,#+30
        LDR      R0,??DataTable4_4
        BL       OS_MemClr
        LDR      R0,??DataTable4_1
        MOVS     R1,#+0
        STRB     R1,[R0, #+2]
        LSRS     R1,R1,#+8
        STRB     R1,[R0, #+3]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
apl_ProcessCmdLine:
        PUSH     {R1-R7,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R0,#+16
        MOV      R1,SP
        STRB     R0,[R1, #+8]
        MOVS     R7,#+1
        MOVS     R6,#+0
??apl_ProcessCmdLine_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        UXTB     R6,R6
        CMP      R6,R0
        BCS      ??apl_ProcessCmdLine_1
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R0,R6,R0
        LDR      R1,??DataTable4_5
        LDR      R0,[R1, R0]
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        MOVS     R4,R0
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R0,R6,R0
        LDR      R1,??DataTable4_5
        LDR      R0,[R1, R0]
        LDRB     R0,[R0, #+0]
        MOVS     R5,R0
??apl_ProcessCmdLine_2:
        UXTB     R5,R5
        CMP      R5,#+0
        BEQ      ??apl_ProcessCmdLine_3
        ADDS     R4,R4,#+1
        UXTB     R4,R4
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R0,R6,R0
        LDR      R1,??DataTable4_5
        LDR      R0,[R1, R0]
        LDRB     R0,[R0, R4]
        MOVS     R5,R0
        B        ??apl_ProcessCmdLine_2
??apl_ProcessCmdLine_3:
        MOVS     R0,#+1
        MOVS     R7,R0
        MOVS     R0,#+0
??apl_ProcessCmdLine_4:
        UXTB     R0,R0
        UXTB     R4,R4
        CMP      R0,R4
        BCS      ??apl_ProcessCmdLine_5
        UXTB     R0,R0
        LDR      R1,[SP, #+4]
        LDRB     R1,[R1, R0]
        UXTB     R0,R0
        LDR      R2,??DataTable4_4
        LDRB     R2,[R2, R0]
        CMP      R1,R2
        BEQ      ??apl_ProcessCmdLine_6
        MOVS     R0,#+0
        MOVS     R7,R0
        B        ??apl_ProcessCmdLine_5
??apl_ProcessCmdLine_6:
        ADDS     R0,R0,#+1
        B        ??apl_ProcessCmdLine_4
??apl_ProcessCmdLine_5:
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??apl_ProcessCmdLine_7
        MOVS     R0,#+0
        MOVS     R7,R0
??apl_ProcessCmdLine_7:
        UXTB     R7,R7
        CMP      R7,#+0
        BEQ      ??apl_ProcessCmdLine_8
        BL       hal_GetSystickCounter
        STR      R0,[SP, #+0]
        ADR      R0,??DataTable5  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R6,R0,R6
        LDR      R0,??DataTable4_5
        ADDS     R0,R0,R6
        LDR      R0,[R0, #+4]
        BLX      R0
        BL       hal_GetSystickCounter
        LDR      R1,[SP, #+0]
        SUBS     R1,R0,R1
        LDR      R0,??DataTable5_1
        BL       printf
        B        ??apl_ProcessCmdLine_1
??apl_ProcessCmdLine_8:
        ADDS     R6,R6,#+1
        B        ??apl_ProcessCmdLine_0
??apl_ProcessCmdLine_1:
        UXTB     R7,R7
        CMP      R7,#+0
        BNE      ??apl_ProcessCmdLine_9
        LDR      R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+13
        BEQ      ??apl_ProcessCmdLine_10
        LDR      R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BEQ      ??apl_ProcessCmdLine_10
        LDR      R0,??DataTable6
        BL       printf
        B        ??apl_ProcessCmdLine_9
??apl_ProcessCmdLine_10:
        ADR      R0,??DataTable5  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
??apl_ProcessCmdLine_9:
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Getu8Parameter:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+4
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R0,#+0
        MOVS     R4,R0
??Getu8Parameter_0:
        UXTH     R4,R4
        CMP      R4,#+30
        BCS      ??Getu8Parameter_1
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        LDRB     R0,[R0, R4]
        CMP      R0,#+32
        BNE      ??Getu8Parameter_2
        ADDS     R5,R5,#+1
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        UXTB     R5,R5
        CMP      R5,R0
        BNE      ??Getu8Parameter_2
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+32
        BEQ      ??Getu8Parameter_3
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+13
        BEQ      ??Getu8Parameter_3
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+10
        BNE      ??Getu8Parameter_4
??Getu8Parameter_3:
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        LDR      R1,[SP, #+4]
        STRB     R0,[R1, #+0]
        B        ??Getu8Parameter_5
??Getu8Parameter_4:
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+32
        BEQ      ??Getu8Parameter_6
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+13
        BEQ      ??Getu8Parameter_6
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+10
        BNE      ??Getu8Parameter_7
??Getu8Parameter_6:
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        MOVS     R7,R0
        MOVS     R0,#+10
        MULS     R7,R0,R7
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        BL       HexCharToInt8u
        MOVS     R6,R0
        ADDS     R6,R6,R7
        LDR      R0,[SP, #+4]
        STRB     R6,[R0, #+0]
        B        ??Getu8Parameter_5
??Getu8Parameter_7:
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+100
        MULS     R1,R2,R1
        STRB     R1,[R0, #+0]
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        BL       HexCharToInt8u
        MOVS     R7,R0
        MOVS     R0,#+10
        MULS     R7,R0,R7
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        BL       HexCharToInt8u
        MOVS     R6,R0
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,R7
        ADDS     R6,R6,R0
        LDR      R0,[SP, #+4]
        STRB     R6,[R0, #+0]
??Getu8Parameter_5:
        B        ??Getu8Parameter_8
??Getu8Parameter_2:
        ADDS     R4,R4,#+1
        B        ??Getu8Parameter_0
??Getu8Parameter_1:
        MOVS     R0,#+0
        LDR      R1,[SP, #+4]
        STRB     R0,[R1, #+0]
??Getu8Parameter_8:
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Getu16Parameter:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+8
        MOVS     R0,#+0
        MOVS     R4,#+0
        MOVS     R1,#+0
        MOV      R2,SP
        STRB     R1,[R2, #+0]
        MOVS     R1,#+0
        MOVS     R2,#+1
        MOVS     R3,#+0
        MOV      R5,SP
        STRB     R3,[R5, #+1]
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R0,R5
??Getu16Parameter_0:
        UXTH     R0,R0
        CMP      R0,#+30
        BCS      ??Getu16Parameter_1
        UXTH     R0,R0
        LDR      R5,??DataTable4_4
        LDRB     R5,[R5, R0]
        CMP      R5,#+32
        BNE      ??Getu16Parameter_2
        ADDS     R4,R4,#+1
        MOV      R5,SP
        LDRB     R5,[R5, #+12]
        UXTB     R4,R4
        CMP      R4,R5
        BNE      ??Getu16Parameter_2
        UXTH     R0,R0
        LDR      R5,??DataTable4_4
        ADDS     R5,R5,R0
        ADDS     R5,R5,#+1
        UXTH     R0,R0
        LDR      R6,??DataTable4_4
        ADDS     R6,R6,R0
        ADDS     R6,R6,#+1
        STR      R6,[SP, #+4]
??Getu16Parameter_3:
        LDRB     R6,[R5, #+0]
        CMP      R6,#+32
        BEQ      ??Getu16Parameter_4
        ADDS     R5,R5,#+1
        LDRB     R6,[R5, #+0]
        CMP      R6,#+13
        BEQ      ??Getu16Parameter_5
        LDRB     R6,[R5, #+0]
        CMP      R6,#+10
        BNE      ??Getu16Parameter_6
??Getu16Parameter_5:
        B        ??Getu16Parameter_4
??Getu16Parameter_6:
        LDR      R6,[SP, #+4]
        SUBS     R6,R5,R6
        CMP      R6,#+6
        BLT      ??Getu16Parameter_3
??Getu16Parameter_4:
        MOV      R7,SP
        MOV      R12,R7
        MOVS     R7,R5
        LDR      R6,[SP, #+4]
        SUBS     R6,R7,R6
        MOV      R7,R12
        STRB     R6,[R7, #+0]
        LDR      R6,[SP, #+4]
        LDRB     R6,[R6, #+0]
        CMP      R6,#+45
        BNE      ??Getu16Parameter_7
        MOVS     R6,#+1
        MOVS     R3,R6
??Getu16Parameter_7:
        MOV      R6,SP
        LDRB     R6,[R6, #+0]
        MOVS     R4,R6
??Getu16Parameter_8:
        UXTB     R3,R3
        UXTB     R4,R4
        CMP      R3,R4
        BCS      ??Getu16Parameter_9
        SUBS     R5,R5,#+1
        MOV      R6,SP
        LDRB     R7,[R5, #+0]
        SUBS     R7,R7,#+48
        STRB     R7,[R6, #+1]
        UXTH     R1,R1
        UXTH     R2,R2
        MOV      R6,SP
        LDRB     R6,[R6, #+1]
        MULS     R6,R2,R6
        ADDS     R1,R1,R6
        MOVS     R6,#+10
        MULS     R2,R6,R2
        SUBS     R4,R4,#+1
        B        ??Getu16Parameter_8
??Getu16Parameter_9:
        UXTB     R3,R3
        CMP      R3,#+1
        BNE      ??Getu16Parameter_10
        MOVS     R6,#+0
        SUBS     R1,R6,R1
??Getu16Parameter_10:
        MOVS     R6,#+0
        MOV      R7,SP
        STRB     R6,[R7, #+0]
        B        ??Getu16Parameter_1
??Getu16Parameter_2:
        ADDS     R0,R0,#+1
        B        ??Getu16Parameter_0
??Getu16Parameter_1:
        LDR      R5,[SP, #+8]
        STRH     R1,[R5, #+0]
        POP      {R0-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     g_SystickCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     g_DebugRxFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC8      0x43, 0x3E, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     `?<Constant "\\r\\ncommand length erro...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     g_DebugRxBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     CmdList

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GetStringParameter:
        PUSH     {R1,R4-R7,LR}
        MOVS     R1,R0
        MOVS     R2,#+0
        MOVS     R4,#+0
        MOVS     R0,#+0
        MOVS     R3,R1
        MOVS     R5,#+0
        MOVS     R2,R5
??GetStringParameter_0:
        UXTH     R2,R2
        CMP      R2,#+30
        BCS      ??GetStringParameter_1
        UXTH     R2,R2
        LDR      R5,??DataTable12
        LDRB     R5,[R5, R2]
        CMP      R5,#+32
        BNE      ??GetStringParameter_2
        ADDS     R4,R4,#+1
        MOV      R5,SP
        LDRB     R5,[R5, #+0]
        UXTB     R4,R4
        CMP      R4,R5
        BNE      ??GetStringParameter_2
??GetStringParameter_3:
        UXTH     R2,R2
        LDR      R5,??DataTable12
        ADDS     R5,R5,R2
        LDRB     R5,[R5, #+1]
        CMP      R5,#+32
        BEQ      ??GetStringParameter_4
        MOVS     R5,#+1
        B        ??GetStringParameter_5
??GetStringParameter_4:
        MOVS     R5,#+0
??GetStringParameter_5:
        UXTH     R2,R2
        LDR      R6,??DataTable12
        ADDS     R6,R6,R2
        LDRB     R6,[R6, #+1]
        CMP      R6,#+13
        BEQ      ??GetStringParameter_6
        MOVS     R6,#+1
        B        ??GetStringParameter_7
??GetStringParameter_6:
        MOVS     R6,#+0
??GetStringParameter_7:
        UXTH     R2,R2
        LDR      R7,??DataTable12
        ADDS     R7,R7,R2
        LDRB     R7,[R7, #+1]
        CMP      R7,#+10
        BEQ      ??GetStringParameter_8
        MOVS     R7,#+1
        B        ??GetStringParameter_9
??GetStringParameter_8:
        MOVS     R7,#+0
??GetStringParameter_9:
        UXTB     R5,R5
        UXTB     R6,R6
        ANDS     R6,R6,R5
        UXTB     R7,R7
        ANDS     R7,R7,R6
        CMP      R7,#+0
        BEQ      ??GetStringParameter_10
        UXTH     R2,R2
        LDR      R5,??DataTable12
        ADDS     R5,R5,R2
        LDRB     R5,[R5, #+1]
        STRB     R5,[R3, #+0]
        ADDS     R3,R3,#+1
        ADDS     R2,R2,#+1
        ADDS     R0,R0,#+1
        B        ??GetStringParameter_3
??GetStringParameter_10:
        UXTB     R0,R0
        B        ??GetStringParameter_11
??GetStringParameter_2:
        ADDS     R2,R2,#+1
        B        ??GetStringParameter_0
??GetStringParameter_1:
        UXTB     R0,R0
??GetStringParameter_11:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     `?<Constant "it has taken %d ms\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HexCharToInt8u:
        PUSH     {LR}
        MOVS     R1,R0
        UXTB     R1,R1
        CMP      R1,#+48
        BLT      ??HexCharToInt8u_0
        UXTB     R1,R1
        CMP      R1,#+58
        BGE      ??HexCharToInt8u_0
        SUBS     R1,R1,#+48
        MOVS     R0,R1
        UXTB     R0,R0
        B        ??HexCharToInt8u_1
??HexCharToInt8u_0:
        UXTB     R1,R1
        CMP      R1,#+97
        BLT      ??HexCharToInt8u_2
        UXTB     R1,R1
        CMP      R1,#+103
        BGE      ??HexCharToInt8u_2
        SUBS     R1,R1,#+87
        MOVS     R0,R1
        UXTB     R0,R0
        B        ??HexCharToInt8u_1
??HexCharToInt8u_2:
        UXTB     R1,R1
        CMP      R1,#+65
        BLT      ??HexCharToInt8u_3
        UXTB     R1,R1
        CMP      R1,#+71
        BGE      ??HexCharToInt8u_3
        SUBS     R1,R1,#+55
        MOVS     R0,R1
        UXTB     R0,R0
        B        ??HexCharToInt8u_1
??HexCharToInt8u_3:
        MOVS     R0,#+0
??HexCharToInt8u_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ReadUpdateData:
        PUSH     {R4,LR}
        SUB      SP,SP,#+40
        MOVS     R0,#+0
??ReadUpdateData_0:
        UXTB     R0,R0
        CMP      R0,#+37
        BGE      ??ReadUpdateData_1
        UXTB     R0,R0
        LDR      R1,??DataTable12_1  ;; 0x800fc00
        LDRB     R1,[R0, R1]
        UXTB     R0,R0
        MOV      R2,SP
        STRB     R1,[R2, R0]
        ADDS     R0,R0,#+1
        B        ??ReadUpdateData_0
??ReadUpdateData_1:
        MOVS     R4,#+0
??ReadUpdateData_2:
        UXTB     R4,R4
        CMP      R4,#+37
        BGE      ??ReadUpdateData_3
        UXTB     R4,R4
        MOV      R0,SP
        LDRB     R1,[R0, R4]
        ADR      R0,??DataTable12_2  ;; "%x "
        BL       printf
        ADDS     R4,R4,#+1
        B        ??ReadUpdateData_2
??ReadUpdateData_3:
        ADD      SP,SP,#+40
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     `?<Constant "\\r\\ncommand not recogni...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_power:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        SXTB     R0,R0
        BL       SX1276LoRaSetRFPower
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_reg:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R2,[R0, #+1]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable12_3
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_reg:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOVS     R1,#+2
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R1,[R0, #+2]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       SX1276Write
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R2,[R0, #+1]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable12_3
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_reg_all:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+1
        BL       Getu8Parameter
        MOVS     R1,#+2
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R4,[R0, #+1]
??read_reg_all_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4
        CMP      R0,R4
        BCC      ??read_reg_all_1
        UXTB     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+10
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??read_reg_all_2
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??read_reg_all_2
        ADR      R0,??DataTable12_4  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
??read_reg_all_2:
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        MOVS     R0,R4
        UXTB     R0,R0
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R1,[R0, #+2]
        LDR      R0,??DataTable12_5
        BL       printf
        ADDS     R4,R4,#+1
        B        ??read_reg_all_0
??read_reg_all_1:
        ADR      R0,??DataTable12_4  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_packet:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable12_6
        BL       SX1276LoRa_Send_Packet
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
receive_packet:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
contious_mode_rx:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
radio_reset:
        PUSH     {R7,LR}
        BL       hal_InitRF
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
start_longSend:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R1,SP
        LDR      R0,??DataTable12_7
        BL       process_start
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
changeHopChannel:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable12_8
        STRB     R0,[R1, #+0]
        BL       hal_InitRF
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     g_DebugRxBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x800fc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC8      "%x "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     `?<Constant "reg %x = %x\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     `?<Constant "%x  ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     tedtbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     hal_long_send

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     g_hopChannel

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
//   392 bytes in section .rodata
// 1 448 bytes in section .text
// 
// 1 448 bytes of CODE  memory
//   392 bytes of CONST memory
//
//Errors: none
//Warnings: none

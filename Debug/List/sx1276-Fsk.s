///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:29:42
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\APP\sx1276-Fsk.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\APP\sx1276-Fsk.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -lb G:\git_hub_lamp\lamp_slave_git\Debug\List\
//        --diag_suppress Pa050 -o G:\git_hub_lamp\lamp_slave_git\Debug\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0 -e --fpu=None --dlib_config "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        G:\git_hub_lamp\lamp_slave_git\APP\ -I
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        G:\git_hub_lamp\lamp_slave_git\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I G:\git_hub_lamp\lamp_slave_git\LIB\CMSIS\CM0\CoreSupport\ -I
//        G:\git_hub_lamp\lamp_slave_git\core\ -I
//        G:\git_hub_lamp\lamp_slave_git\core\sys\ -I
//        G:\git_hub_lamp\lamp_slave_git\platform\ -I
//        G:\git_hub_lamp\lamp_slave_git\core\lib\ -I
//        G:\git_hub_lamp\lamp_slave_git\tools\wpcapslip\ -I
//        G:\git_hub_lamp\lamp_slave_git\core\cfs\ -I
//        G:\git_hub_lamp\lamp_slave_git\OLED\ -I
//        G:\git_hub_lamp\lamp_slave_git\coffee_arch\ -Ol -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\sx1276-Fsk.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_GetITStatus
        EXTERN LED_PIN
        EXTERN LED_PORT
        EXTERN SX1276FskGetPacketCrcOn
        EXTERN SX1276FskRxCalibrate
        EXTERN SX1276FskSetBitrate
        EXTERN SX1276FskSetDccBw
        EXTERN SX1276FskSetFdev
        EXTERN SX1276FskSetPAOutput
        EXTERN SX1276FskSetPa20dBm
        EXTERN SX1276FskSetRFFrequency
        EXTERN SX1276FskSetRFPower
        EXTERN SX1276FskSetRssiOffset
        EXTERN SX1276Read
        EXTERN SX1276ReadBuffer
        EXTERN SX1276ReadFifo
        EXTERN SX1276Regs
        EXTERN SX1276Write
        EXTERN SX1276WriteBuffer
        EXTERN SX1276WriteFifo
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_i2d
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_uidiv
        EXTERN etimer_remodify
        EXTERN etimer_stop
        EXTERN hal_RF_process
        EXTERN hal_sRF_FSK_ITConfig
        EXTERN hal_sRF_ITConfig
        EXTERN printf
        EXTERN process_post
        EXTERN timer_rf
        EXTERN w_memcpy

        PUBLIC EXTI4_15_IRQHandler
        PUBLIC FskSettings
        PUBLIC SX1276
        PUBLIC SX1276FskGetOpMode
        PUBLIC SX1276FskGetPacketAfc
        PUBLIC SX1276FskGetPacketHeaderSize
        PUBLIC SX1276FskGetPacketPayloadSize
        PUBLIC SX1276FskGetPacketRssi
        PUBLIC SX1276FskGetPacketRxGain
        PUBLIC SX1276FskGetRFState
        PUBLIC SX1276FskGetRxPacket
        PUBLIC SX1276FskInit
        PUBLIC SX1276FskReadAfc
        PUBLIC SX1276FskReadFei
        PUBLIC SX1276FskReadRssi
        PUBLIC SX1276FskReadRxGain
        PUBLIC SX1276FskSetDefaults
        PUBLIC SX1276FskSetOpMode
        PUBLIC SX1276FskSetRFState
        PUBLIC SX1276FskSetTxPacket
        PUBLIC SX1276FskStartRx
        PUBLIC SX1276Fsk_Send_Packet
        PUBLIC SX1276Fsk_long_send_no_Packet
        PUBLIC SX1276Fsk_recrive_Packet
        PUBLIC contious_tx
        PUBLIC fill_fifo
        PUBLIC g_fsk
        PUBLIC packet_tx_data
        PUBLIC read_fifo
        PUBLIC start_continuous_mode


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void hal_ToggleLED(Led_TypeDef)
hal_ToggleLED:
        UXTB     R0,R0
        MOVS     R1,#+4
        MULS     R1,R0,R1
        LDR      R2,??DataTable13
        LDR      R1,[R2, R1]
        LDRH     R1,[R1, #+20]
        UXTB     R0,R0
        MOVS     R2,#+2
        MULS     R2,R0,R2
        LDR      R3,??DataTable13_1
        LDRH     R2,[R3, R2]
        EORS     R2,R2,R1
        UXTB     R0,R0
        MOVS     R1,#+4
        MULS     R0,R1,R0
        LDR      R1,??DataTable13
        LDR      R0,[R1, R0]
        STRH     R2,[R0, #+20]
        BX       LR               ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
FskSettings:
        DATA
        DC32 492000000, 10000, 20000
        DC8 17, 0, 0, 0
        DC32 40000, 150000
        DC8 1, 1, 255, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_fsk:
        DS8 268

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SX1276:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
RFBuffer:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
RFState:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
RxPacketSize:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
RxPacketRssiValue:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
RxPacketAfcValue:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
RxGain:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
TxPacketSize:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskInit:
        PUSH     {R7,LR}
        BL       SX1276FskSetDefaults
        MOVS     R2,#+111
        LDR      R1,??DataTable13_2
        MOVS     R0,#+1
        BL       SX1276ReadBuffer
        MOVS     R0,#+0
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+1]
        MOVS     R0,#+1
        BL       SX1276Write
        MOVS     R0,#+32
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+10]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+10]
        MOVS     R0,#+10
        BL       SX1276Write
        MOVS     R0,#+32
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+12]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+12]
        MOVS     R0,#+12
        BL       SX1276Write
        LDR      R0,??DataTable14
        LDRB     R0,[R0, #+25]
        CMP      R0,#+1
        BNE      ??SX1276FskInit_0
        MOVS     R0,#+30
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+13]
        B        ??SX1276FskInit_1
??SX1276FskInit_0:
        MOVS     R0,#+14
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+13]
??SX1276FskInit_1:
        MOVS     R0,#+30
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+38
        STRB     R0,[R1, #+0]
        MOVS     R0,#+202
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+31]
        MOVS     R0,#+255
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+16]
        MOVS     R0,#+19
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+39
        STRB     R0,[R1, #+0]
        MOVS     R0,#+105
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+40
        STRB     R0,[R1, #+0]
        MOVS     R0,#+129
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+41
        STRB     R0,[R1, #+0]
        MOVS     R0,#+126
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+42
        STRB     R0,[R1, #+0]
        MOVS     R0,#+150
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+43
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable14
        LDRB     R0,[R0, #+24]
        LSLS     R0,R0,#+4
        MOVS     R1,#+136
        ORRS     R1,R1,R0
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+48
        STRB     R1,[R0, #+0]
        BL       SX1276FskGetPacketCrcOn
        LDR      R0,??DataTable14
        LDRB     R0,[R0, #+26]
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+50
        STRB     R0,[R1, #+0]
        MOVS     R2,#+111
        LDR      R1,??DataTable13_2
        MOVS     R0,#+1
        BL       SX1276WriteBuffer
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+0]
        BL       SX1276FskSetRFFrequency
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+4]
        BL       SX1276FskSetBitrate
        LDR      R0,??DataTable14
        LDR      R0,[R0, #+8]
        BL       SX1276FskSetFdev
        LDR      R0,??DataTable14
        LDR      R2,[R0, #+16]
        MOVS     R1,#+0
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+18
        BL       SX1276FskSetDccBw
        LDR      R0,??DataTable14
        LDR      R2,[R0, #+20]
        MOVS     R1,#+0
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+19
        BL       SX1276FskSetDccBw
        MOVS     R0,#+0
        BL       SX1276FskSetRssiOffset
        MOVS     R0,#+0
        BL       SX1276FskSetPAOutput
        MOVS     R0,#+0
        BL       SX1276FskSetPa20dBm
        MOVS     R0,#+12
        LDR      R1,??DataTable14
        LDRSB    R0,[R1, R0]
        BL       SX1276FskSetRFPower
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        BL       SX1276FskRxCalibrate
        MOVS     R0,#+250
        LSLS     R0,R0,#+8        ;; #+64000
        LDR      R1,??DataTable14
        LDR      R1,[R1, #+4]
        BL       __aeabi_uidiv
        ADDS     R0,R0,#+5
        LDR      R1,??DataTable19
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable19_1  ;; 0x3e4180
        LDR      R1,??DataTable14
        LDR      R1,[R1, #+4]
        BL       __aeabi_uidiv
        ADDS     R0,R0,#+5
        LDR      R1,??DataTable19_2
        STRH     R0,[R1, #+0]
        BL       SX1276Fsk_recrive_Packet
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetDefaults:
        PUSH     {R7,LR}
        LDR      R0,??DataTable16
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+66
        MOVS     R0,#+66
        BL       SX1276Read
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetOpMode:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        LDR      R2,??DataTable16
        LDR      R2,[R2, #+0]
        LDRB     R2,[R2, #+1]
        LSLS     R2,R2,#+29       ;; ZeroExtS R2,R2,#+29,#+29
        LSRS     R2,R2,#+29
        LDR      R3,??DataTable19_3
        STRB     R2,[R3, #+0]
        LDR      R2,??DataTable19_3
        LDRB     R2,[R2, #+0]
        UXTB     R0,R0
        CMP      R0,R2
        BEQ      ??SX1276FskSetOpMode_0
        UXTB     R0,R0
        CMP      R0,#+3
        BNE      ??SX1276FskSetOpMode_1
        MOVS     R1,#+1
        B        ??SX1276FskSetOpMode_2
??SX1276FskSetOpMode_1:
        MOVS     R1,#+0
??SX1276FskSetOpMode_2:
        LDR      R2,??DataTable19_4
        LDRB     R2,[R2, #+0]
        UXTB     R1,R1
        CMP      R1,R2
        BEQ      ??SX1276FskSetOpMode_3
        LDR      R2,??DataTable19_4
        STRB     R1,[R2, #+0]
??SX1276FskSetOpMode_3:
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+248
        ANDS     R2,R2,R1
        ORRS     R0,R0,R2
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+1]
        MOVS     R0,#+1
        BL       SX1276Write
??SX1276FskSetOpMode_0:
        POP      {R0,PC}          ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??opModePrev:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??antennaSwitchTxOnPrev:
        DATA
        DC8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetOpMode:
        PUSH     {R7,LR}
        LDR      R0,??DataTable20
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+1
        MOVS     R0,#+1
        BL       SX1276Read
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+1]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskReadFei:
        PUSH     {R7,LR}
        MOVS     R2,#+2
        LDR      R0,??DataTable16
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+29
        MOVS     R0,#+29
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+29]
        LSLS     R1,R0,#+8
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+30]
        ORRS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR      R3,??DataTable21  ;; 0x404e8480
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskReadAfc:
        PUSH     {R7,LR}
        MOVS     R2,#+2
        LDR      R0,??DataTable16
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+27
        MOVS     R0,#+27
        BL       SX1276ReadBuffer
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+27]
        LSLS     R1,R0,#+8
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+28]
        ORRS     R0,R0,R1
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR      R3,??DataTable21  ;; 0x404e8480
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskReadRxGain:
        PUSH     {R7,LR}
        LDR      R0,??DataTable20
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+12
        MOVS     R0,#+12
        BL       SX1276Read
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+12]
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskReadRssi:
        PUSH     {R7,LR}
        LDR      R0,??DataTable20
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+17
        MOVS     R0,#+17
        BL       SX1276Read
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+17]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        MOVS     R3,#+192
        LSLS     R3,R3,#+24       ;; #-1073741824
        BL       __aeabi_ddiv
        POP      {R2,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPacketRxGain:
        LDR      R0,??DataTable22
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPacketRssi:
        LDR      R0,??DataTable22_1
        LDM      R0,{R0,R1}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPacketAfc:
        LDR      R0,??DataTable23
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskStartRx:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        BL       SX1276FskSetRFState
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetRxPacket:
        PUSH     {R7,LR}
        LDR      R2,??DataTable21_1
        LDRH     R2,[R2, #+0]
        STRH     R2,[R1, #+0]
        MOVS     R2,#+0
        LDR      R3,??DataTable21_1
        STRH     R2,[R3, #+0]
        LDRH     R2,[R1, #+0]
        LDR      R1,??DataTable23_1
        BL       w_memcpy
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetTxPacket:
        PUSH     {R7,LR}
        LDR      R2,??DataTable22_2
        STRH     R1,[R2, #+0]
        LDR      R1,??DataTable22_2
        LDRH     R2,[R1, #+0]
        MOVS     R1,R0
        LDR      R0,??DataTable23_1
        BL       w_memcpy
        MOVS     R0,#+8
        LDR      R1,??DataTable23_2
        STRB     R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     LED_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     LED_PIN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     SX1276Regs+0x1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPacketPayloadSize:
        PUSH     {R4,LR}
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+39
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable20
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+48
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+128
        ANDS     R1,R1,R2
        ASRS     R1,R1,#+7
        LDR      R2,??DataTable20
        LDR      R2,[R2, #+0]
        ADDS     R2,R2,#+48
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+6
        TST      R2,R3
        BEQ      ??SX1276FskGetPacketPayloadSize_0
        MOVS     R2,#+1
        B        ??SX1276FskGetPacketPayloadSize_1
??SX1276FskGetPacketPayloadSize_0:
        MOVS     R2,#+0
??SX1276FskGetPacketPayloadSize_1:
        LDR      R3,??DataTable20
        LDR      R3,[R3, #+0]
        ADDS     R3,R3,#+50
        LDRB     R3,[R3, #+0]
        LDR      R4,??DataTable20
        LDR      R4,[R4, #+0]
        ADDS     R4,R4,#+48
        LDRB     R4,[R4, #+0]
        LSLS     R4,R4,#+27
        BPL      ??SX1276FskGetPacketPayloadSize_2
        MOVS     R4,#+2
        B        ??SX1276FskGetPacketPayloadSize_3
??SX1276FskGetPacketPayloadSize_2:
        MOVS     R4,#+0
??SX1276FskGetPacketPayloadSize_3:
        ADDS     R0,R0,R1
        ADDS     R0,R0,R2
        ADDS     R0,R0,R3
        ADDS     R0,R0,R4
        UXTH     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     FskSettings

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetPacketHeaderSize:
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+37
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        LDR      R1,??DataTable20
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+38
        LDRB     R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable20
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+39
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+29       ;; ZeroExtS R1,R1,#+29,#+29
        LSRS     R1,R1,#+29
        ADDS     R1,R1,#+1
        ADDS     R0,R0,R1
        UXTH     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskGetRFState:
        LDR      R0,??DataTable23_2
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     SX1276

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276FskSetRFState:
        LDR      R1,??DataTable23_2
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
start_continuous_mode:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        MOVS     R1,#+0
        LDR      R0,??DataTable24  ;; 0x1e02
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
        LDR      R1,??DataTable24_1
        STRB     R4,[R1, #+0]
        UXTB     R4,R4
        MOVS     R2,R4
        MOVS     R1,R0
        LDR      R0,??DataTable24_2
        BL       w_memcpy
        ADDS     R4,R4,#+1
        LDR      R0,??DataTable24_3
        STRB     R4,[R0, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable24_4
        STRB     R0,[R1, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     g_fsk+0x108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0x3e4180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_2:
        DC32     g_fsk+0x10A

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_3:
        DC32     ??opModePrev

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_4:
        DC32     ??antennaSwitchTxOnPrev

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
fill_fifo:
        PUSH     {R4,LR}
        LDR      R0,??DataTable24_3
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable24_4
        LDRB     R1,[R1, #+0]
        SUBS     R4,R0,R1
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??fill_fifo_0
        UXTB     R4,R4
        CMP      R4,#+65
        BGE      ??fill_fifo_1
        MOVS     R1,R4
        UXTB     R1,R1
        LDR      R0,??DataTable24_1
        BL       SX1276WriteFifo
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,R4
        LDR      R1,??DataTable24_4
        STRB     R0,[R1, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       hal_sRF_FSK_ITConfig
        B        ??fill_fifo_2
??fill_fifo_1:
        MOVS     R1,#+64
        LDR      R0,??DataTable24_1
        BL       SX1276WriteFifo
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+64
        LDR      R1,??DataTable24_4
        STRB     R0,[R1, #+0]
        B        ??fill_fifo_2
??fill_fifo_0:
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable24_3
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BCS      ??fill_fifo_2
        UXTB     R4,R4
        CMP      R4,#+55
        BLT      ??fill_fifo_3
        MOVS     R4,#+54
        B        ??fill_fifo_4
??fill_fifo_3:
??fill_fifo_4:
        MOVS     R1,R4
        UXTB     R1,R1
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        LDR      R2,??DataTable24_1
        ADDS     R0,R2,R0
        BL       SX1276WriteFifo
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,R4
        LDR      R1,??DataTable24_4
        STRB     R0,[R1, #+0]
??fill_fifo_2:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     SX1276

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
contious_tx:
        PUSH     {R7,LR}
        MOVS     R0,#+3
        BL       SX1276FskSetOpMode
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_fifo:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??read_fifo_0
        MOVS     R1,#+1
        LDR      R0,??DataTable24_3
        BL       SX1276ReadFifo
??read_fifo_0:
        LDR      R0,??DataTable24_3
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable24_4
        LDRB     R1,[R1, #+0]
        SUBS     R5,R0,R1
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??read_fifo_1
        UXTB     R5,R5
        CMP      R5,#+65
        BGE      ??read_fifo_2
        MOVS     R1,#+0
        LDR      R0,??DataTable24  ;; 0x1e02
        BL       hal_sRF_ITConfig
        MOVS     R1,R5
        UXTB     R1,R1
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        LDR      R2,??DataTable24_1
        ADDS     R0,R2,R0
        BL       SX1276ReadFifo
        B        ??read_fifo_2
??read_fifo_1:
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable24_3
        LDRB     R1,[R1, #+0]
        SUBS     R1,R1,#+1
        CMP      R0,R1
        BGE      ??read_fifo_3
        MOVS     R1,#+34
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        LDR      R2,??DataTable24_1
        ADDS     R0,R2,R0
        BL       SX1276ReadFifo
        LDR      R0,??DataTable24_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+34
        LDR      R1,??DataTable24_4
        STRB     R0,[R1, #+0]
??read_fifo_3:
        LDR      R0,??DataTable24_3
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable24_4
        LDRB     R1,[R1, #+0]
        SUBS     R5,R0,R1
        UXTB     R5,R5
        CMP      R5,#+65
        BGE      ??read_fifo_2
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       hal_sRF_ITConfig
??read_fifo_2:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0x404e8480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_1:
        DC32     RxPacketSize

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276Fsk_Send_Packet:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        MOVS     R0,#+1
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+64
        STRB     R0,[R1, #+0]
        MOVS     R0,#+144
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+65
        STRB     R0,[R1, #+0]
        MOVS     R2,#+2
        LDR      R0,??DataTable25
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+64
        MOVS     R0,#+64
        BL       SX1276WriteBuffer
        MOVS     R0,#+138
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+53
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+53
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+53
        BL       SX1276Write
        MOVS     R1,R4
        UXTB     R1,R1
        MOVS     R0,R5
        BL       packet_tx_data
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       hal_sRF_FSK_ITConfig
        BL       fill_fifo
        MOVS     R0,#+10
        LDR      R1,??DataTable25_1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+3
        BL       SX1276FskSetOpMode
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     RxGain

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_1:
        DC32     RxPacketRssiValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_2:
        DC32     TxPacketSize

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276Fsk_long_send_no_Packet:
        PUSH     {R7,LR}
        MOVS     R0,#+10
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+53
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+53
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+53
        BL       SX1276Write
        MOVS     R0,#+3
        BL       SX1276FskSetOpMode
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     RxPacketAfcValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_1:
        DC32     RFBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_2:
        DC32     RFState

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276Fsk_recrive_Packet:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        MOVS     R1,#+0
        LDR      R0,??DataTable24  ;; 0x1e02
        BL       hal_sRF_ITConfig
        MOVS     R0,#+12
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+64
        STRB     R0,[R1, #+0]
        MOVS     R0,#+209
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+65
        STRB     R0,[R1, #+0]
        MOVS     R2,#+2
        LDR      R0,??DataTable25
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+64
        MOVS     R0,#+64
        BL       SX1276WriteBuffer
        MOVS     R0,#+162
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+53
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+53
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+53
        BL       SX1276Write
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       hal_sRF_ITConfig
        MOVS     R0,#+1
        LDR      R1,??DataTable25_1
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable24_4
        STRB     R0,[R1, #+0]
        MOVS     R0,#+5
        BL       SX1276FskSetOpMode
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     0x1e02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_1:
        DC32     g_fsk

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_2:
        DC32     g_fsk+0x1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_3:
        DC32     g_fsk+0x101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_4:
        DC32     g_fsk+0x100

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI4_15_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI4_15_IRQHandler_0
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+0
        LDR      R0,??DataTable25_2  ;; 0x1e02
        BL       hal_sRF_ITConfig
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
??EXTI4_15_IRQHandler_0:
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI4_15_IRQHandler_1
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       EXTI_ClearITPendingBit
        BL       SX1276FskReadRssi
        LDR      R2,??DataTable25_1
        LDRB     R2,[R2, #+0]
        CMP      R2,#+1
        BNE      ??EXTI4_15_IRQHandler_1
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       hal_sRF_ITConfig
        LDR      R0,??DataTable25_3
        LDRH     R1,[R0, #+0]
        LDR      R0,??DataTable25_4
        BL       etimer_remodify
        LDR      R0,??DataTable25_5
        BL       printf
        MOVS     R0,#+2
        LDR      R1,??DataTable25_1
        STRB     R0,[R1, #+0]
        LDR      R2,??DataTable25_1
        MOVS     R1,#+134
        LDR      R0,??DataTable25_6
        BL       process_post
??EXTI4_15_IRQHandler_1:
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI4_15_IRQHandler_2
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       EXTI_ClearITPendingBit
        LDR      R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE      ??EXTI4_15_IRQHandler_3
        MOVS     R1,#+0
        LDR      R0,??DataTable25_2  ;; 0x1e02
        BL       hal_sRF_ITConfig
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
??EXTI4_15_IRQHandler_3:
        LDR      R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??EXTI4_15_IRQHandler_2
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       hal_sRF_ITConfig
        LDR      R0,??DataTable25_7
        LDRH     R1,[R0, #+0]
        LDR      R0,??DataTable25_4
        BL       etimer_remodify
        LDR      R0,??DataTable25_8
        BL       printf
        MOVS     R0,#+3
        LDR      R1,??DataTable25_1
        STRB     R0,[R1, #+0]
        BL       SX1276FskReadRssi
        BL       __aeabi_d2f
        LDR      R1,??DataTable25_9
        STR      R0,[R1, #+0]
??EXTI4_15_IRQHandler_2:
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI4_15_IRQHandler_4
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       EXTI_ClearITPendingBit
        LDR      R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE      ??EXTI4_15_IRQHandler_5
        BL       fill_fifo
??EXTI4_15_IRQHandler_5:
        LDR      R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??EXTI4_15_IRQHandler_4
        MOVS     R0,#+0
        BL       read_fifo
??EXTI4_15_IRQHandler_4:
        MOVS     R0,#+2
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI4_15_IRQHandler_6
        MOVS     R0,#+2
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+0
        LDR      R0,??DataTable25_2  ;; 0x1e02
        BL       hal_sRF_ITConfig
        LDR      R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE      ??EXTI4_15_IRQHandler_7
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        MOVS     R0,#+0
        BL       hal_ToggleLED
        MOVS     R0,#+11
        LDR      R1,??DataTable25_1
        STRB     R0,[R1, #+0]
        LDR      R2,??DataTable25_1
        MOVS     R1,#+134
        LDR      R0,??DataTable25_6
        BL       process_post
??EXTI4_15_IRQHandler_7:
        LDR      R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE      ??EXTI4_15_IRQHandler_6
        MOVS     R0,#+1
        BL       SX1276FskSetOpMode
        MOVS     R0,#+1
        BL       read_fifo
        LDR      R0,??DataTable25_4
        BL       etimer_stop
        MOVS     R0,#+5
        LDR      R1,??DataTable25_1
        STRB     R0,[R1, #+0]
        LDR      R2,??DataTable25_1
        MOVS     R1,#+134
        LDR      R0,??DataTable25_6
        BL       process_post
??EXTI4_15_IRQHandler_6:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     SX1276

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     g_fsk+0xFF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_2:
        DC32     0x1e02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_3:
        DC32     g_fsk+0x108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_4:
        DC32     timer_rf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_5:
        DC32     `?<Constant "preamble det\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_6:
        DC32     hal_RF_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_7:
        DC32     g_fsk+0x10A

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_8:
        DC32     `?<Constant "sync det\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_9:
        DC32     g_fsk+0x104

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "preamble det\\r\\n">`:
        DATA
        DC8 "preamble det\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "sync det\\r\\n">`:
        DATA
        DC8 "sync det\015\012"
        DC8 0

        END
// 
//   545 bytes in section .bss
//    31 bytes in section .data
//    28 bytes in section .rodata
// 2 098 bytes in section .text
// 
// 2 098 bytes of CODE  memory
//    28 bytes of CONST memory
//   576 bytes of DATA  memory
//
//Errors: none
//Warnings: 18

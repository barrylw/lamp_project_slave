///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  14:26:05
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\APP\sx1276-LoRa.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\APP\sx1276-LoRa.c -D
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
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\sx1276-LoRa.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_GetITStatus
        EXTERN GPIO_ReadInputDataBit
        EXTERN SX1276LoRaSetErrorCoding
        EXTERN SX1276LoRaSetImplicitHeaderOn
        EXTERN SX1276LoRaSetPAOutput
        EXTERN SX1276LoRaSetPa20dBm
        EXTERN SX1276LoRaSetPacketCrcOn
        EXTERN SX1276LoRaSetPayloadLength
        EXTERN SX1276LoRaSetPreambleLength
        EXTERN SX1276LoRaSetRFFrequency
        EXTERN SX1276LoRaSetRFPower
        EXTERN SX1276LoRaSetSignalBandwidth
        EXTERN SX1276LoRaSetSpreadingFactor
        EXTERN SX1276LoRaSetSymbTimeout
        EXTERN SX1276Read
        EXTERN SX1276ReadBuffer
        EXTERN SX1276ReadFifo
        EXTERN SX1276SetReset
        EXTERN SX1276Write
        EXTERN SX1276WriteBuffer
        EXTERN SX1276WriteFifo
        EXTERN TIM_Cmd
        EXTERN TIM_SetCounter
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_i2d
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_uidiv
        EXTERN ceil
        EXTERN etimer_stop
        EXTERN g_SystickCounter
        EXTERN hal_RF_process
        EXTERN hal_sRF_ITConfig
        EXTERN pow
        EXTERN process_post
        EXTERN timer_rf
        EXTERN w_memcpy

        PUBLIC EXTI0_1_IRQHandler
        PUBLIC EXTI4_15_IRQHandler
        PUBLIC HoppingFrequencies
        PUBLIC LoRaSettings
        PUBLIC RxEndProcess
        PUBLIC SX1276LR
        PUBLIC SX1276LoRaGetOpMode
        PUBLIC SX1276LoRaGetPacketRssi
        PUBLIC SX1276LoRaGetPacketRxGain
        PUBLIC SX1276LoRaGetPacketSnr
        PUBLIC SX1276LoRaGetPayloadSymbNb
        PUBLIC SX1276LoRaGetRFState
        PUBLIC SX1276LoRaGetSymbolTs
        PUBLIC SX1276LoRaGetTimeOnAir
        PUBLIC SX1276LoRaGetTxTimeOut
        PUBLIC SX1276LoRaGetWokeUpPreambleLenth
        PUBLIC SX1276LoRaInit
        PUBLIC SX1276LoRaInitHopPeriod
        PUBLIC SX1276LoRaReadRssi
        PUBLIC SX1276LoRaReadRxGain
        PUBLIC SX1276LoRaSetOpMode
        PUBLIC SX1276LoRaSetRFState
        PUBLIC SX1276LoRaSetWokeUpPreambleLenth
        PUBLIC SX1276LoRa_CAD_Scan
        PUBLIC SX1276LoRa_Receive_Packet
        PUBLIC SX1276LoRa_Send_Packet
        PUBLIC SX1276Regs
        PUBLIC SX1276Reset
        PUBLIC SX1276StartSleep
        PUBLIC SX1276_lora_init
        PUBLIC config_GDOx_Map
        PUBLIC g_GDOx_map_conf
        PUBLIC g_RF_LoRa
        PUBLIC g_SignalBw
        PUBLIC g_hopChannel
        PUBLIC getPacketSnr
        PUBLIC get_RxPacketRssi
        PUBLIC hal_PacketRF_TxData
        PUBLIC hal_get_equal_RxPacketRssi
        PUBLIC receiveRxData


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp u32 hal_GetSystickCounter(void)
hal_GetSystickCounter:
        LDR      R0,??DataTable15
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(3)
`?<Constant {(7.799999999999999822), (1.0400000`:
        DATA
        DC32 33333333H, 401F3333H, 0CCCCCCCDH, 4024CCCCH, 33333333H, 402F3333H
        DC32 0CCCCCCCDH, 4034CCCCH, 33333333H, 403F3333H, 0CCCCCCCDH, 4044CCCCH
        DC32 0H, 404F4000H, 0H, 405F4000H, 0H, 406F4000H, 0H, 407F4000H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
HoppingFrequencies:
        DATA
        DC32 492000000, 492100000, 492200000, 492300000, 492400000, 492500000
        DC32 492600000, 492700000, 492800000, 492900000, 493000000, 493100000
        DC32 493200000, 493300000, 493400000, 493500000, 493600000, 493700000
        DC32 493800000, 493900000, 494000000, 494100000, 494200000, 494300000
        DC32 494400000, 494500000, 494600000, 494700000, 494800000, 494900000
        DC32 495000000, 495100000, 495200000, 495300000, 495400000, 495500000
        DC32 495600000, 495700000, 495800000, 495900000, 496000000, 496100000
        DC32 496200000, 496300000, 496400000, 496500000, 496600000, 496700000
        DC32 496800000, 496900000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
g_SignalBw:
        DATA
        DC32 7800, 10400, 15600, 20800, 31200, 41600, 62500, 125000, 250000
        DC32 500000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
LoRaSettings:
        DATA
        DC32 492500000
        DC8 17, 6, 9, 2, 1, 0, 0, 0, 7, 0, 0, 0
        DC32 800, 800
        DC8 254, 0, 0, 0
        DC32 32

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SX1276Regs:
        DS8 112

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SX1276LR:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
RxGain:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
RxPacketSnrEstimate:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
RxPacketRssiValue:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_GDOx_map_conf:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_wokeUpPreambleLength:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
g_hopChannel:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_RF_LoRa:
        DS8 264

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276Reset:
        PUSH     {R4,LR}
        MOVS     R0,#+1
        BL       SX1276SetReset
        BL       hal_GetSystickCounter
        MOVS     R4,R0
??SX1276Reset_0:
        BL       hal_GetSystickCounter
        MOVS     R1,R4
        ADDS     R1,R1,#+2
        CMP      R0,R1
        BCC      ??SX1276Reset_0
        MOVS     R0,#+0
        BL       SX1276SetReset
        BL       hal_GetSystickCounter
        MOVS     R4,R0
??SX1276Reset_1:
        BL       hal_GetSystickCounter
        MOVS     R1,R4
        ADDS     R1,R1,#+6
        CMP      R0,R1
        BCC      ??SX1276Reset_1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276_lora_init:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       SX1276Reset
        LDR      R0,??DataTable14
        LDR      R1,??DataTable16
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        BL       SX1276LoRaSetOpMode
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??SX1276_lora_init_0
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+1]
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+1]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+1]
        MOVS     R0,#+1
        BL       SX1276Write
        MOVS     R0,#+1
        BL       SX1276LoRaSetOpMode
        MOVS     R0,#+255
        LDR      R1,??DataTable16
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+17]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+17]
        MOVS     R0,#+18
        BL       SX1276Write
        BL       SX1276LoRaInit
??SX1276_lora_init_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetSymbolTs:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+92
        MOVS     R5,R0
        MOVS     R4,R1
        ADD      R0,SP,#+8
        LDR      R1,??DataTable16_1
        MOVS     R2,#+80
        BL       __aeabi_memcpy4
        MOV      R2,SP
        UXTB     R5,R5
        MOVS     R0,#+8
        MULS     R0,R5,R0
        ADD      R1,SP,#+8
        ADDS     R0,R1,R0
        LDM      R0,{R0,R1}
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        UXTB     R4,R4
        MOVS     R0,R4
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        BL       pow
        MOV      R2,SP
        LDM      R2,{R2,R3}
        BL       __aeabi_ddiv
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R0,R6
        MOVS     R1,R7
        ADD      SP,SP,#+92
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPayloadSymbNb:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+36
        MOVS     R4,R0
        MOV      R1,SP
        UXTB     R4,R4
        MOVS     R0,R4
        ADDS     R0,R0,#+2
        STRH     R0,[R1, #+18]
        LDR      R0,??DataTable17
        LDRB     R7,[R0, #+6]
        MOV      R0,SP
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+9]
        STRB     R1,[R0, #+17]
        MOV      R0,SP
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+25]
        STRB     R1,[R0, #+16]
        LDR      R0,??DataTable17
        LDRB     R6,[R0, #+7]
        UXTB     R6,R6
        MOVS     R0,R6
        ADDS     R0,R0,#+4
        BL       __aeabi_i2d
        STR      R0,[SP, #+8]
        STR      R1,[SP, #+12]
        MOV      R0,SP
        LDRH     R1,[R0, #+18]
        MOVS     R0,#+8
        MULS     R0,R1,R0
        UXTB     R7,R7
        MOVS     R1,#+4
        MULS     R1,R7,R1
        SUBS     R2,R0,R1
        ADDS     R2,R2,#+44
        MOV      R0,SP
        LDRB     R1,[R0, #+17]
        MOVS     R0,#+20
        MULS     R1,R0,R1
        SUBS     R0,R2,R1
        BL       __aeabi_i2d
        STR      R0,[SP, #+0]
        STR      R1,[SP, #+4]
        UXTB     R7,R7
        MOV      R0,SP
        LDRB     R1,[R0, #+16]
        MOVS     R0,#+2
        MULS     R1,R0,R1
        SUBS     R0,R7,R1
        MOVS     R1,#+4
        MULS     R0,R1,R0
        BL       __aeabi_i2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR      R0,[SP, #+0]
        LDR      R1,[SP, #+4]
        BL       __aeabi_ddiv
        BL       ceil
        LDR      R2,[SP, #+8]
        LDR      R3,[SP, #+12]
        BL       __aeabi_dmul
        ADD      R2,SP,#+24
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        ADD      R0,SP,#+24
        LDM      R0,{R0,R1}
        BL       __aeabi_d2uiz
        MOVS     R5,R0
        CMP      R5,#+0
        BEQ      ??SX1276LoRaGetPayloadSymbNb_0
        ADDS     R5,R5,#+8
        MOVS     R0,R5
        B        ??SX1276LoRaGetPayloadSymbNb_1
??SX1276LoRaGetPayloadSymbNb_0:
        MOVS     R0,#+8
??SX1276LoRaGetPayloadSymbNb_1:
        ADD      SP,SP,#+36
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetTimeOnAir:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R0,R4
        UXTB     R0,R0
        BL       SX1276LoRaGetPayloadSymbNb
        MOVS     R5,R0
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+28]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable20_1  ;; 0x40110000
        BL       __aeabi_dadd
        ADD      R2,SP,#+8
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        LDR      R0,??DataTable20
        LDRB     R1,[R0, #+6]
        LDR      R0,??DataTable20
        LDRB     R0,[R0, #+5]
        BL       SX1276LoRaGetSymbolTs
        MOV      R2,SP
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        MOVS     R0,R5
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        ADD      R0,SP,#+8
        LDM      R0,{R0,R1}
        BL       __aeabi_dadd
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,SP
        LDM      R0,{R0,R1}
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R0,R6
        MOVS     R1,R7
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaInitHopPeriod:
        PUSH     {R7,LR}
        MOVS     R0,#+255
        BL       SX1276LoRaGetPayloadSymbNb
        MOVS     R1,#+50
        BL       __aeabi_uidiv
        UXTB     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetWokeUpPreambleLenth:
        PUSH     {R3-R5,LR}
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+6]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        MOVS     R1,#+128
        LSLS     R1,R1,#+23       ;; #+1073741824
        BL       pow
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+5]
        MOVS     R1,#+4
        MULS     R0,R1,R0
        LDR      R1,??DataTable20_2
        LDR      R0,[R1, R0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable20_3  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR      R3,??DataTable21  ;; 0x40340000
        BL       __aeabi_dadd
        BL       __aeabi_d2uiz
        LDR      R1,??DataTable23
        STR      R0,[R1, #+0]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetWokeUpPreambleLenth:
        LDR      R0,??DataTable23
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetTxTimeOut:
        PUSH     {R7,LR}
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+24]
        BL       SX1276LoRaGetTimeOnAir
        MOVS     R2,#+0
        LDR      R3,??DataTable23_1  ;; 0x3ff80000
        BL       __aeabi_dmul
        BL       __aeabi_d2uiz
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetOpMode:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+1]
        MOVS     R1,#+248
        ANDS     R1,R1,R0
        ORRS     R1,R1,R4
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+1]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+1]
        MOVS     R0,#+1
        BL       SX1276Write
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetOpMode:
        PUSH     {R7,LR}
        LDR      R0,??DataTable16
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+1
        MOVS     R0,#+1
        BL       SX1276Read
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+1]
        LSLS     R0,R0,#+29       ;; ZeroExtS R0,R0,#+29,#+29
        LSRS     R0,R0,#+29
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaReadRxGain:
        PUSH     {R7,LR}
        LDR      R0,??DataTable25
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+12
        MOVS     R0,#+12
        BL       SX1276Read
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+12]
        UXTB     R0,R0
        LSRS     R0,R0,#+5
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPacketRxGain:
        LDR      R0,??DataTable25_1
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPacketSnr:
        LDR      R0,??DataTable25_2
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetPacketRssi:
        LDR      R0,??DataTable25_3
        LDM      R0,{R0,R1}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
config_GDOx_Map:
        PUSH     {R0,R1,LR}
        SUB      SP,SP,#+4
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+1]
        ORRS     R1,R1,R0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+2]
        ORRS     R0,R0,R1
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+3]
        ORRS     R1,R1,R0
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+63
        STRB     R1,[R0, #+0]
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+4
        LDRB     R1,[R1, #+5]
        ORRS     R1,R1,R0
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+64
        STRB     R1,[R0, #+0]
        MOVS     R2,#+2
        LDR      R0,??DataTable25
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+63
        MOVS     R0,#+64
        BL       SX1276WriteBuffer
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     SX1276Regs

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaReadRssi:
        PUSH     {R7,LR}
        LDR      R0,??DataTable16
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+27
        MOVS     R0,#+27
        BL       SX1276Read
        LDR      R0,??DataTable17
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable25_4  ;; 0x33428f00
        CMP      R0,R1
        BCS      ??SX1276LoRaReadRssi_0
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+27]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable25_5  ;; 0xc0648000
        BL       __aeabi_dadd
        B        ??SX1276LoRaReadRssi_1
??SX1276LoRaReadRssi_0:
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+27]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable26  ;; 0xc063a000
        BL       __aeabi_dadd
??SX1276LoRaReadRssi_1:
        POP      {R2,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     g_SystickCounter

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
getPacketSnr:
        PUSH     {R7,LR}
        MOV      R1,SP
        MOVS     R0,#+25
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??getPacketSnr_0
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MVNS     R1,R0
        ADDS     R1,R1,#+1
        MOVS     R0,R1
        ASRS     R0,R0,#+2
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        LDR      R1,??DataTable26_1
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable26_1
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        RSBS     R1,R0,#+0
        LDR      R0,??DataTable26_1
        STRB     R1,[R0, #+0]
        B        ??getPacketSnr_1
??getPacketSnr_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+2
        LDR      R1,??DataTable26_1
        STRB     R0,[R1, #+0]
??getPacketSnr_1:
        LDR      R0,??DataTable26_1
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     SX1276LR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     `?<Constant {(7.799999999999999822), (1.0400000`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_RxPacketRssi:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
        LDR      R0,??DataTable25
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+26
        MOVS     R0,#+26
        BL       SX1276Read
        LDR      R0,??DataTable17
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable25_4  ;; 0x33428f00
        CMP      R0,R1
        BCS      ??get_RxPacketRssi_0
        MOVS     R4,#+0
        LDR      R5,??DataTable25_5  ;; 0xc0648000
        B        ??get_RxPacketRssi_1
??get_RxPacketRssi_0:
        MOVS     R4,#+0
        LDR      R5,??DataTable26  ;; 0xc063a000
??get_RxPacketRssi_1:
        LDR      R0,??DataTable25_2
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        CMP      R0,#+0
        BPL      ??get_RxPacketRssi_2
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+26]
        BL       __aeabi_ui2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R6,R0
        MOVS     R7,R1
        LDR      R0,??DataTable25_2
        MOVS     R1,#+0
        LDRSB    R0,[R0, R1]
        BL       __aeabi_i2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        MOV      R2,SP
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        B        ??get_RxPacketRssi_3
??get_RxPacketRssi_2:
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+26]
        BL       __aeabi_ui2d
        ADR      R2,??DataTable26_3
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOV      R2,SP
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
??get_RxPacketRssi_3:
        MOV      R0,SP
        LDM      R0,{R0,R1}
        ADD      SP,SP,#+12
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     LoRaSettings

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_get_equal_RxPacketRssi:
        PUSH     {R7,LR}
        LDR      R0,??DataTable25_3
        LDM      R0,{R0,R1}
        BL       __aeabi_d2iz
        MOVS     R1,R0
        CMP      R1,#+0
        BPL      ??hal_get_equal_RxPacketRssi_0
        MOVS     R2,R1
        MVNS     R3,R2
        ADDS     R3,R3,#+1
        MOVS     R0,R3
        B        ??hal_get_equal_RxPacketRssi_1
??hal_get_equal_RxPacketRssi_0:
        MOVS     R2,R1
        MOVS     R0,R2
??hal_get_equal_RxPacketRssi_1:
        UXTB     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaGetRFState:
        LDR      R0,??DataTable27
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaSetRFState:
        LDR      R1,??DataTable27
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     LoRaSettings

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_1:
        DC32     0x40110000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_2:
        DC32     g_SignalBw

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_3:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRaInit:
        PUSH     {R7,LR}
        MOVS     R2,#+111
        LDR      R1,??DataTable26_2
        MOVS     R0,#+1
        BL       SX1276ReadBuffer
        MOVS     R0,#+32
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+12]
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+12]
        MOVS     R0,#+12
        BL       SX1276Write
        MOVS     R0,#+0
        BL       SX1276LoRaSetOpMode
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        BL       SX1276LoRaSetRFFrequency
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+6]
        BL       SX1276LoRaSetSpreadingFactor
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+7]
        BL       SX1276LoRaSetErrorCoding
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+8]
        BL       SX1276LoRaSetPacketCrcOn
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+5]
        BL       SX1276LoRaSetSignalBandwidth
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+9]
        BL       SX1276LoRaSetImplicitHeaderOn
        LDR      R0,??DataTable27_2  ;; 0x3ff
        BL       SX1276LoRaSetSymbTimeout
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+24]
        BL       SX1276LoRaSetPayloadLength
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+28]
        UXTH     R0,R0
        BL       SX1276LoRaSetPreambleLength
        MOVS     R0,#+0
        BL       SX1276LoRaSetPAOutput
        MOVS     R0,#+0
        BL       SX1276LoRaSetPa20dBm
        MOVS     R0,#+4
        LDR      R1,??DataTable27_1
        LDRSB    R0,[R1, R0]
        BL       SX1276LoRaSetRFPower
        MOVS     R0,#+1
        BL       SX1276LoRaSetRFState
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0x40340000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_PacketRF_TxData:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        UXTB     R5,R5
        MOVS     R2,R5
        MOVS     R1,R4
        LDR      R0,??DataTable27_3
        BL       w_memcpy
        LDR      R0,??DataTable27_4
        STRB     R5,[R0, #+0]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276StartSleep:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        LDR      R0,??DataTable27_5  ;; 0x1e02
        BL       hal_sRF_ITConfig
        MOVS     R0,#+0
        BL       SX1276LoRaSetOpMode
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     g_wokeUpPreambleLength

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_1:
        DC32     0x3ff80000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
receiveRxData:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+10]
        CMP      R0,#+1
        BNE      ??receiveRxData_0
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+15]
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+13]
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+13]
        MOVS     R0,#+13
        BL       SX1276Write
        B        ??receiveRxData_1
??receiveRxData_0:
        LDR      R0,??DataTable25
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+16
        MOVS     R0,#+16
        BL       SX1276Read
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+16]
        LDR      R1,??DataTable25
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+13]
??receiveRxData_1:
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+9]
        CMP      R0,#+0
        BNE      ??receiveRxData_2
        LDR      R0,??DataTable25
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+19
        MOVS     R0,#+19
        BL       SX1276Read
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+19]
        LDR      R1,??DataTable27_6
        STRB     R0,[R1, #+0]
        B        ??receiveRxData_3
??receiveRxData_2:
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+34
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable27_6
        STRB     R0,[R1, #+0]
??receiveRxData_3:
        LDR      R0,??DataTable27_6
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable27_3
        BL       SX1276ReadFifo
        MOVS     R0,#+1
        BL       RxEndProcess
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RxEndProcess:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+3
        LDR      R1,??DataTable27
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable27_7
        STRB     R4,[R0, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable27_8
        STRB     R0,[R1, #+0]
        LDR      R2,??DataTable27
        MOVS     R1,#+134
        LDR      R0,??DataTable28
        BL       process_post
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     SX1276LR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     RxGain

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_2:
        DC32     RxPacketSnrEstimate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_3:
        DC32     RxPacketRssiValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_4:
        DC32     0x33428f00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_5:
        DC32     0xc0648000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRa_CAD_Scan:
        PUSH     {R7,LR}
        MOVS     R0,#+1
        BL       SX1276LoRaSetOpMode
        MOVS     R0,#+255
        LDR      R1,??DataTable27_9
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+17]
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+17]
        MOVS     R1,#+250
        ANDS     R1,R1,R0
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+17]
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+17]
        MOVS     R0,#+17
        BL       SX1276Write
        LDR      R0,??DataTable28_1
        LDR      R0,[R0, #+0]
        BL       SX1276LoRaSetRFFrequency
        MOVS     R0,#+128
        LDR      R1,??DataTable28_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable28_2
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable28_2
        LDM      R0,{R0,R1}
        BL       config_GDOx_Map
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       hal_sRF_ITConfig
        MOVS     R0,#+7
        BL       SX1276LoRaSetOpMode
        MOVS     R0,#+11
        LDR      R1,??DataTable27
        STRB     R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     0xc063a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_1:
        DC32     RxPacketSnrEstimate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_2:
        DC32     SX1276Regs+0x1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_3:
        DC32     0x295E9E1B,0x3FF110CB

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRa_Send_Packet:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R0,#+1
        BL       SX1276LoRaSetOpMode
        MOVS     R0,#+255
        LDR      R1,??DataTable27_9
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+17]
        MOVS     R1,#+255
        MOVS     R0,#+18
        BL       SX1276Write
        MOVS     R1,#+0
        LDR      R0,??DataTable27_5  ;; 0x1e02
        BL       hal_sRF_ITConfig
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+11]
        CMP      R0,#+0
        BEQ      ??SX1276LoRa_Send_Packet_0
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+17]
        MOVS     R1,#+245
        ANDS     R1,R1,R0
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+17]
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+12]
        LDR      R1,??DataTable27_9
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+36
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable27_9
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+28
        MOVS     R0,#+28
        BL       SX1276Read
        LDR      R0,??DataTable28_3
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+4
        MULS     R0,R1,R0
        LDR      R1,??DataTable28_1
        LDR      R0,[R1, R0]
        BL       SX1276LoRaSetRFFrequency
        MOVS     R0,#+2
        BL       SX1276LoRaSetOpMode
        MOVS     R0,#+64
        LDR      R1,??DataTable28_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable28_2
        STRB     R0,[R1, #+2]
        B        ??SX1276LoRa_Send_Packet_1
??SX1276LoRa_Send_Packet_0:
        LDR      R0,??DataTable27_1
        LDR      R0,[R0, #+0]
        BL       SX1276LoRaSetRFFrequency
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+17]
        MOVS     R1,#+247
        ANDS     R1,R1,R0
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+17]
        MOVS     R0,#+0
        LDR      R1,??DataTable27_9
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+36
        STRB     R0,[R1, #+0]
        MOVS     R0,#+64
        LDR      R1,??DataTable28_2
        STRB     R0,[R1, #+0]
??SX1276LoRa_Send_Packet_1:
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+36
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+36
        BL       SX1276Write
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+17]
        MOVS     R0,#+17
        BL       SX1276Write
        LDR      R0,??DataTable28_2
        LDM      R0,{R0,R1}
        BL       config_GDOx_Map
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+34
        STRB     R4,[R0, #+0]
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+34
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+34
        BL       SX1276Write
        MOVS     R0,#+0
        LDR      R1,??DataTable27_9
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+14]
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+14]
        MOVS     R0,#+14
        BL       SX1276Write
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+14]
        LDR      R1,??DataTable27_9
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+13]
        LDR      R0,??DataTable27_9
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+13]
        MOVS     R0,#+13
        BL       SX1276Write
        MOVS     R0,#+7
        BL       SX1276LoRaSetRFState
        MOVS     R1,R4
        UXTB     R1,R1
        MOVS     R0,R5
        BL       hal_PacketRF_TxData
        MOVS     R1,R4
        UXTB     R1,R1
        LDR      R0,??DataTable27_3
        BL       SX1276WriteFifo
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       hal_sRF_ITConfig
        LDR      R0,??DataTable27_1
        LDRB     R0,[R0, #+11]
        CMP      R0,#+0
        BEQ      ??SX1276LoRa_Send_Packet_2
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       hal_sRF_ITConfig
??SX1276LoRa_Send_Packet_2:
        MOVS     R0,#+3
        BL       SX1276LoRaSetOpMode
        LDR      R2,??DataTable27
        MOVS     R1,#+134
        LDR      R0,??DataTable30
        BL       process_post
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     g_RF_LoRa+0x100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_1:
        DC32     LoRaSettings

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_2:
        DC32     0x3ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_3:
        DC32     g_RF_LoRa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_4:
        DC32     g_RF_LoRa+0x102

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_5:
        DC32     0x1e02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_6:
        DC32     g_RF_LoRa+0x101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_7:
        DC32     g_RF_LoRa+0xFF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_8:
        DC32     g_RF_LoRa+0x103

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_9:
        DC32     SX1276LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276LoRa_Receive_Packet:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+1
        BL       SX1276LoRaSetOpMode
        MOVS     R0,#+255
        LDR      R1,??DataTable29
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+17]
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+17]
        MOVS     R1,#+143
        ANDS     R1,R1,R0
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+17]
        MOVS     R0,#+0
        LDR      R1,??DataTable28_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        LDR      R1,??DataTable28_2
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable30_1
        LDRB     R0,[R0, #+11]
        CMP      R0,#+0
        BEQ      ??SX1276LoRa_Receive_Packet_0
        LDR      R0,??DataTable30_1
        LDRB     R0,[R0, #+12]
        LDR      R1,??DataTable29
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+36
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+17]
        MOVS     R1,#+253
        ANDS     R1,R1,R0
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        STRB     R1,[R0, #+17]
        LDR      R0,??DataTable29
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+28
        MOVS     R0,#+28
        BL       SX1276Read
        LDR      R0,??DataTable28_3
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+4
        MULS     R0,R1,R0
        LDR      R1,??DataTable28_1
        LDR      R0,[R1, R0]
        BL       SX1276LoRaSetRFFrequency
        MOVS     R0,#+0
        LDR      R1,??DataTable28_2
        STRB     R0,[R1, #+2]
        B        ??SX1276LoRa_Receive_Packet_1
??SX1276LoRa_Receive_Packet_0:
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+0]
        BL       SX1276LoRaSetRFFrequency
        MOVS     R0,#+0
        LDR      R1,??DataTable29
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+36
        STRB     R0,[R1, #+0]
??SX1276LoRa_Receive_Packet_1:
        LDR      R0,??DataTable30_1
        LDRB     R0,[R0, #+10]
        CMP      R0,#+1
        BNE      ??SX1276LoRa_Receive_Packet_2
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+17]
        MOVS     R0,#+17
        BL       SX1276Write
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+36
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+36
        BL       SX1276Write
        LDR      R0,??DataTable28_2
        LDM      R0,{R0,R1}
        BL       config_GDOx_Map
        BL       SX1276LoRaGetWokeUpPreambleLenth
        LDR      R1,??DataTable30_1
        STR      R0,[R1, #+28]
        LDR      R0,??DataTable30_1
        LDR      R0,[R0, #+28]
        UXTH     R0,R0
        BL       SX1276LoRaSetPreambleLength
        MOVS     R0,#+6
        BL       SX1276LoRaSetOpMode
        B        ??SX1276LoRa_Receive_Packet_3
??SX1276LoRa_Receive_Packet_2:
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+15]
        LDR      R1,??DataTable29
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+13]
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+13]
        MOVS     R0,#+13
        BL       SX1276Write
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+17]
        MOVS     R0,#+17
        BL       SX1276Write
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+36
        LDRB     R1,[R0, #+0]
        MOVS     R0,#+36
        BL       SX1276Write
        LDR      R0,??DataTable28_2
        LDM      R0,{R0,R1}
        BL       config_GDOx_Map
        MOVS     R0,#+32
        LDR      R1,??DataTable30_1
        STR      R0,[R1, #+28]
        MOVS     R0,#+32
        BL       SX1276LoRaSetPreambleLength
        MOVS     R0,#+5
        BL       SX1276LoRaSetOpMode
??SX1276LoRa_Receive_Packet_3:
        MOVS     R0,#+2
        LDR      R1,??DataTable30_2
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable30_1
        LDRB     R0,[R0, #+11]
        CMP      R0,#+0
        BEQ      ??SX1276LoRa_Receive_Packet_4
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       hal_sRF_ITConfig
??SX1276LoRa_Receive_Packet_4:
        MOVS     R1,#+1
        MOVS     R0,#+2
        BL       hal_sRF_ITConfig
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       hal_sRF_ITConfig
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28:
        DC32     hal_RF_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28_1:
        DC32     HoppingFrequencies

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28_2:
        DC32     g_GDOx_map_conf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable28_3:
        DC32     g_hopChannel

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI0_1_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R0,#+2
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI0_1_IRQHandler_0
        MOVS     R1,#+0
        LDR      R0,??DataTable30_3  ;; 0x1e02
        BL       hal_sRF_ITConfig
        MOVS     R0,#+2
        BL       EXTI_ClearITPendingBit
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       EXTI_ClearITPendingBit
        LDR      R0,??DataTable30_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BEQ      ??EXTI0_1_IRQHandler_1
        CMP      R0,#+11
        BEQ      ??EXTI0_1_IRQHandler_2
        CMP      R0,#+14
        BEQ      ??EXTI0_1_IRQHandler_3
        B        ??EXTI0_1_IRQHandler_4
??EXTI0_1_IRQHandler_1:
        MOVS     R1,#+0
        MOVS     R0,#+2
        BL       hal_sRF_ITConfig
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       hal_sRF_ITConfig
        MOVS     R1,#+8
        MOVS     R0,#+18
        BL       SX1276Write
        LDR      R0,??DataTable30_4
        BL       etimer_stop
        MOVS     R0,#+8
        LDR      R1,??DataTable30_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        BL       SX1276LoRaSetOpMode
        LDR      R2,??DataTable30_2
        MOVS     R1,#+134
        LDR      R0,??DataTable30
        BL       process_post
        B        ??EXTI0_1_IRQHandler_0
??EXTI0_1_IRQHandler_3:
        LDR      R0,??DataTable30_4
        BL       etimer_stop
        MOVS     R1,#+64
        MOVS     R0,#+18
        BL       SX1276Write
        LDR      R0,??DataTable29
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+18
        MOVS     R0,#+18
        BL       SX1276Read
        BL       get_RxPacketRssi
        LDR      R2,??DataTable30_5
        STM      R2!,{R0,R1}
        SUBS     R2,R2,#+8
        BL       getPacketSnr
        LDR      R1,??DataTable30_6
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable29
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+18]
        LSLS     R0,R0,#+26
        BPL      ??EXTI0_1_IRQHandler_5
        MOVS     R1,#+32
        MOVS     R0,#+18
        BL       SX1276Write
        MOVS     R0,#+4
        LDR      R1,??DataTable30_2
        STRB     R0,[R1, #+0]
        LDR      R2,??DataTable30_2
        MOVS     R1,#+134
        LDR      R0,??DataTable30
        BL       process_post
        B        ??EXTI0_1_IRQHandler_2
??EXTI0_1_IRQHandler_5:
        LDR      R0,??DataTable30_7
        LDRB     R0,[R0, #+0]
        BL       receiveRxData
??EXTI0_1_IRQHandler_2:
        MOVS     R1,#+4
        MOVS     R0,#+18
        BL       SX1276Write
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ReadInputDataBit
        CMP      R0,#+1
        BNE      ??EXTI0_1_IRQHandler_6
        MOVS     R1,#+1
        MOVS     R0,#+18
        BL       SX1276Write
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
??EXTI0_1_IRQHandler_6:
        B        ??EXTI0_1_IRQHandler_0
??EXTI0_1_IRQHandler_4:
??EXTI0_1_IRQHandler_0:
        MOVS     R0,#+1
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI0_1_IRQHandler_7
        MOVS     R0,#+1
        BL       EXTI_ClearITPendingBit
??EXTI0_1_IRQHandler_7:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable29:
        DC32     SX1276LR

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
EXTI4_15_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI4_15_IRQHandler_0
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       EXTI_ClearITPendingBit
        LDR      R0,??DataTable30_8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+18
        MOVS     R0,#+18
        BL       SX1276Read
        LDR      R0,??DataTable30_8
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+18]
        LSLS     R0,R0,#+30
        BPL      ??EXTI4_15_IRQHandler_0
        MOVS     R1,#+2
        MOVS     R0,#+18
        BL       SX1276Write
        BL       SX1276LoRaReadRxGain
        LDR      R1,??DataTable30_9
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable30_8
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+28
        MOVS     R0,#+28
        BL       SX1276Read
        LDR      R0,??DataTable30_10
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable30_8
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+28]
        ADDS     R0,R0,R1
        LSLS     R0,R0,#+26       ;; ZeroExtS R0,R0,#+26,#+26
        LSRS     R0,R0,#+26
        MOVS     R1,#+50
        BL       __aeabi_idivmod
        MOVS     R0,#+4
        MULS     R1,R0,R1
        LDR      R0,??DataTable30_11
        LDR      R0,[R0, R1]
        BL       SX1276LoRaSetRFFrequency
??EXTI4_15_IRQHandler_0:
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI4_15_IRQHandler_1
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       hal_sRF_ITConfig
        MOVS     R1,#+16
        MOVS     R0,#+18
        BL       SX1276Write
        LDR      R0,??DataTable30_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE      ??EXTI4_15_IRQHandler_2
        MOVS     R0,#+14
        LDR      R1,??DataTable30_2
        STRB     R0,[R1, #+0]
        LDR      R2,??DataTable30_2
        MOVS     R1,#+134
        LDR      R0,??DataTable30
        BL       process_post
??EXTI4_15_IRQHandler_2:
        MOVS     R0,#+1
        LDR      R1,??DataTable30_12
        STRB     R0,[R1, #+0]
??EXTI4_15_IRQHandler_1:
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        BL       EXTI_GetITStatus
        CMP      R0,#+0
        BEQ      ??EXTI4_15_IRQHandler_3
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+1
        LDR      R0,??DataTable30_13  ;; 0x40002000
        BL       TIM_Cmd
        MOVS     R1,#+0
        LDR      R0,??DataTable30_13  ;; 0x40002000
        BL       TIM_SetCounter
??EXTI4_15_IRQHandler_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     hal_RF_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_1:
        DC32     LoRaSettings

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_2:
        DC32     g_RF_LoRa+0x100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_3:
        DC32     0x1e02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_4:
        DC32     timer_rf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_5:
        DC32     RxPacketRssiValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_6:
        DC32     RxPacketSnrEstimate

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_7:
        DC32     g_RF_LoRa+0x105

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_8:
        DC32     SX1276LR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_9:
        DC32     RxGain

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_10:
        DC32     g_hopChannel

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_11:
        DC32     HoppingFrequencies

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_12:
        DC32     g_RF_LoRa+0x103

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_13:
        DC32     0x40002000

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
//   402 bytes in section .bss
//    73 bytes in section .data
//   280 bytes in section .rodata
// 2 870 bytes in section .text
// 
// 2 870 bytes of CODE  memory
//   280 bytes of CONST memory
//   475 bytes of DATA  memory
//
//Errors: none
//Warnings: none

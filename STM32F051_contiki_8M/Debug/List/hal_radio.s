///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:48:16
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\APP\hal_radio.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\hal_radio.c -D
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
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\hal_radio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_Init
        EXTERN GPIO_Init
        EXTERN GPIO_PinAFConfig
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN GPIO_WriteBit
        EXTERN LED_PIN
        EXTERN LED_PORT
        EXTERN RCC_AHBPeriphClockCmd
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SPI_Cmd
        EXTERN SPI_I2S_DeInit
        EXTERN SPI_I2S_GetFlagStatus
        EXTERN SPI_Init
        EXTERN SPI_ReceiveData8
        EXTERN SPI_RxFIFOThresholdConfig
        EXTERN SPI_SendData8
        EXTERN SX1276LoRaGetPacketRssi
        EXTERN SX1276LoRaGetPacketSnr
        EXTERN SX1276LoRaGetRFState
        EXTERN SX1276LoRa_Receive_Packet
        EXTERN SX1276LoRa_Send_Packet
        EXTERN SX1276_lora_init
        EXTERN SYSCFG_EXTILineConfig
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN etimer_set
        EXTERN etimer_stop
        EXTERN g_RF_LoRa
        EXTERN printf
        EXTERN tedtbuf

        PUBLIC GPIO_int_Config
        PUBLIC SX1276Read
        PUBLIC SX1276ReadBuffer
        PUBLIC SX1276ReadFifo
        PUBLIC SX1276SetReset
        PUBLIC SX1276Write
        PUBLIC SX1276WriteBuffer
        PUBLIC SX1276WriteFifo
        PUBLIC g_slaveMode
        PUBLIC hal_InitRF
        PUBLIC hal_Init_RF_pins
        PUBLIC hal_RF_process
        PUBLIC hal_long_send
        PUBLIC hal_sRF_FSK_ITConfig
        PUBLIC hal_sRF_ITConfig
        PUBLIC hal_sRF_InitSPI
        PUBLIC hal_sRF_SPI_Config
        PUBLIC hal_sRF_Transmit
        PUBLIC oledPrintf
        PUBLIC spiReadWriteByte
        PUBLIC test_send_timer
        PUBLIC timer_rf


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void hal_ToggleLED(Led_TypeDef)
hal_ToggleLED:
        UXTB     R0,R0
        MOVS     R1,#+4
        MULS     R1,R0,R1
        LDR      R2,??DataTable5
        LDR      R1,[R2, R1]
        LDRH     R1,[R1, #+20]
        UXTB     R0,R0
        MOVS     R2,#+2
        MULS     R2,R0,R2
        LDR      R3,??DataTable3
        LDRH     R2,[R3, R2]
        EORS     R2,R2,R1
        UXTB     R0,R0
        MOVS     R1,#+4
        MULS     R1,R0,R1
        LDR      R3,??DataTable5
        LDR      R1,[R3, R1]
        STRH     R2,[R1, #+20]
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
g_slaveMode:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
txcount:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
rxCount:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
oledPrintf:
        DS8 52

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timer_rf:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
hal_RF_process:
        DATA
        DC32 0H, `?<Constant "radio_process ">`, process_thread_hal_RF_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_hal_RF_process:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R4,R2
        MOVS     R1,#+1
        LDRH     R0,[R6, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_RF_process_0
        CMP      R0,#+62
        BEQ      ??process_thread_hal_RF_process_1
        B        ??process_thread_hal_RF_process_2
??process_thread_hal_RF_process_0:
        MOVS     R1,#+0
        MOVS     R0,#+62
        STRH     R0,[R6, #+0]
??process_thread_hal_RF_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??process_thread_hal_RF_process_3
        MOVS     R0,#+1
        B        ??process_thread_hal_RF_process_4
??process_thread_hal_RF_process_3:
        UXTB     R7,R7
        CMP      R7,#+134
        BEQ      .+4
        B        ??process_thread_hal_RF_process_5
        LDRB     R0,[R4, #+0]
        CMP      R0,#+7
        BNE      ??process_thread_hal_RF_process_6
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        LDR      R0,??DataTable5_1
        BL       etimer_set
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_6:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+8
        BNE      ??process_thread_hal_RF_process_7
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_7:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+14
        BNE      ??process_thread_hal_RF_process_8
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        LDR      R0,??DataTable5_1
        BL       etimer_set
        LDR      R0,??DataTable5_2
        BL       printf
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_8:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+2
        BNE      ??process_thread_hal_RF_process_0
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_RF_process_0
        MOVS     R0,#+1
        BL       hal_ToggleLED
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+0]
        BL       SX1276LoRaGetPacketRssi
        MOVS     R2,R0
        MOVS     R3,R1
        LDR      R0,??DataTable6_1
        BL       printf
        BL       SX1276LoRaGetPacketSnr
        SXTB     R0,R0
        MOVS     R1,R0
        LDR      R0,??DataTable6_2
        BL       printf
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idivmod
        STR      R1,[SP, #+0]
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idiv
        MOVS     R3,R0
        MOVS     R5,R3
        LDR      R0,??DataTable6_3
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idivmod
        MOVS     R2,R1
        MOVS     R3,R5
        STR      R2,[SP, #+4]
        MOVS     R5,R3
        LDR      R0,??DataTable6_3
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idiv
        MOVS     R1,R0
        MOVS     R3,R5
        LDR      R2,[SP, #+4]
        LDR      R0,??DataTable6_4
        BL       printf
        MOVS     R5,#+0
??process_thread_hal_RF_process_9:
        LDR      R0,??DataTable6_5
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??process_thread_hal_RF_process_10
        UXTB     R5,R5
        LDR      R0,??DataTable6_6
        LDRB     R1,[R0, R5]
        ADR      R0,??DataTable6_7  ;; "%x "
        BL       printf
        ADDS     R5,R5,#+1
        B        ??process_thread_hal_RF_process_9
??process_thread_hal_RF_process_10:
        ADR      R0,??DataTable6_8  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        LDR      R0,??DataTable6_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      .+4
        B        ??process_thread_hal_RF_process_0
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable6_10
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable6_10
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable6_5
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable6_10
        BL       SX1276LoRa_Send_Packet
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_5:
        UXTB     R7,R7
        CMP      R7,#+136
        BEQ      .+4
        B        ??process_thread_hal_RF_process_0
        LDR      R0,??DataTable5_1
        CMP      R4,R0
        BEQ      .+4
        B        ??process_thread_hal_RF_process_0
        BL       SX1276LoRaGetRFState
        CMP      R0,#+7
        BNE      ??process_thread_hal_RF_process_11
        LDR      R0,??DataTable6_11
        BL       printf
??process_thread_hal_RF_process_11:
        BL       SX1276LoRaGetRFState
        CMP      R0,#+14
        BNE      ??process_thread_hal_RF_process_12
        LDR      R0,??DataTable7
        BL       printf
??process_thread_hal_RF_process_12:
        BL       hal_sRF_InitSPI
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R6, #+0]
        MOVS     R0,#+3
??process_thread_hal_RF_process_4:
        POP      {R1-R7,PC}       ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
test_send_timer:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
hal_long_send:
        DATA
        DC32 0H, `?<Constant "long_send_process ">`
        DC32 process_thread_hal_long_send
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_hal_long_send:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_long_send_0
        CMP      R0,#+232
        BEQ      ??process_thread_hal_long_send_1
        B        ??process_thread_hal_long_send_2
??process_thread_hal_long_send_0:
        UXTB     R5,R5
        CMP      R5,#+129
        BNE      ??process_thread_hal_long_send_3
        CMP      R6,#+0
        BEQ      ??process_thread_hal_long_send_3
        LDRB     R0,[R6, #+0]
        LDR      R1,??DataTable7_1
        STRB     R0,[R1, #+0]
??process_thread_hal_long_send_3:
        LDR      R0,??DataTable7_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_long_send_4
        LDR      R0,??DataTable7_3
        BL       printf
        MOVS     R0,#+0
        LDR      R1,??DataTable7_2
        STRB     R0,[R1, #+0]
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        LDR      R0,??DataTable7_4
        BL       etimer_set
??process_thread_hal_long_send_4:
        MOVS     R1,#+0
        MOVS     R0,#+232
        STRH     R0,[R4, #+0]
??process_thread_hal_long_send_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??process_thread_hal_long_send_5
        MOVS     R0,#+1
        B        ??process_thread_hal_long_send_6
??process_thread_hal_long_send_5:
        UXTB     R5,R5
        CMP      R5,#+136
        BNE      ??process_thread_hal_long_send_3
        LDR      R0,??DataTable6_3
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable6_3
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable6_3
        LDRH     R0,[R0, #+0]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable6_10
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable6_3
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable6_10
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable7_1
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable6_10
        BL       SX1276LoRa_Send_Packet
        MOVS     R1,#+250
        LSLS     R1,R1,#+3        ;; #+2000
        LDR      R0,??DataTable7_4
        BL       etimer_set
        B        ??process_thread_hal_long_send_3
??process_thread_hal_long_send_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_hal_long_send_6:
        POP      {R4-R6,PC}       ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??length:
        DATA
        DC8 50

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??first:
        DATA
        DC8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiReadWriteByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
??spiReadWriteByte_0:
        MOVS     R1,#+2
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??spiReadWriteByte_0
        MOVS     R1,R4
        UXTB     R1,R1
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_SendData8
??spiReadWriteByte_1:
        MOVS     R1,#+1
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??spiReadWriteByte_1
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_ReceiveData8
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     LED_PIN

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276WriteBuffer:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R7,R2
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_ResetBits
        MOVS     R0,#+128
        ORRS     R0,R0,R5
        UXTB     R0,R0
        BL       spiReadWriteByte
        MOVS     R6,#+0
??SX1276WriteBuffer_0:
        UXTB     R6,R6
        UXTB     R7,R7
        CMP      R6,R7
        BCS      ??SX1276WriteBuffer_1
        UXTB     R6,R6
        LDRB     R0,[R4, R6]
        BL       spiReadWriteByte
        ADDS     R6,R6,#+1
        B        ??SX1276WriteBuffer_0
??SX1276WriteBuffer_1:
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_SetBits
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276ReadBuffer:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R7,R2
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_ResetBits
        MOVS     R0,R5
        UXTB     R0,R0
        BL       spiReadWriteByte
        MOVS     R6,#+0
??SX1276ReadBuffer_0:
        UXTB     R6,R6
        UXTB     R7,R7
        CMP      R6,R7
        BCS      ??SX1276ReadBuffer_1
        MOVS     R0,#+255
        BL       spiReadWriteByte
        UXTB     R6,R6
        STRB     R0,[R4, R6]
        ADDS     R6,R6,#+1
        B        ??SX1276ReadBuffer_0
??SX1276ReadBuffer_1:
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_SetBits
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     LED_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     timer_rf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     `?<Constant "rx start\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     g_RF_LoRa+0xFF

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276Write:
        PUSH     {R0,R1,R4,LR}
        MOVS     R4,R0
        MOVS     R2,#+1
        ADD      R1,SP,#+4
        MOVS     R0,R4
        UXTB     R0,R0
        BL       SX1276WriteBuffer
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276Read:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R2,#+1
        MOVS     R1,R5
        MOVS     R0,R4
        UXTB     R0,R0
        BL       SX1276ReadBuffer
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276WriteFifo:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R2,R5
        UXTB     R2,R2
        MOVS     R1,R4
        MOVS     R0,#+0
        BL       SX1276WriteBuffer
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276ReadFifo:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R2,R5
        UXTB     R2,R2
        MOVS     R1,R4
        MOVS     R0,#+0
        BL       SX1276ReadBuffer
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276SetReset:
        PUSH     {R4,LR}
        MOVS     R4,R0
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??SX1276SetReset_0
        MOVS     R2,#+0
        MOVS     R1,#+128
        LDR      R0,??DataTable9_1  ;; 0x48001400
        BL       GPIO_WriteBit
        B        ??SX1276SetReset_1
??SX1276SetReset_0:
        MOVS     R2,#+1
        MOVS     R1,#+128
        LDR      R0,??DataTable9_1  ;; 0x48001400
        BL       GPIO_WriteBit
??SX1276SetReset_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     rxCount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     `?<Constant "rssi = %f\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     `?<Constant "snr = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     txcount

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     `?<Constant "%x %x %x %x ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     g_RF_LoRa+0x101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     g_RF_LoRa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC8      "%x "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     g_slaveMode

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     tedtbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     `?<Constant "tx time out\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_sRF_ITConfig:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R5,R0
        MOVS     R4,R1
        STR      R5,[SP, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOV      R0,SP
        STRB     R4,[R0, #+6]
        MOV      R0,SP
        BL       EXTI_Init
        POP      {R0-R2,R4,R5,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_sRF_FSK_ITConfig:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R5,R0
        MOVS     R4,R1
        STR      R5,[SP, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+12
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOV      R0,SP
        STRB     R4,[R0, #+6]
        MOV      R0,SP
        BL       EXTI_Init
        POP      {R0-R2,R4,R5,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_Init_RF_pins:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R1,#+1
        MOVS     R0,#+140
        LSLS     R0,R0,#+15       ;; #+4587520
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+0
        MOVS     R0,#+157
        LSLS     R0,R0,#+8        ;; #+40192
        BL       hal_sRF_ITConfig
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOV      R1,SP
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_Init
        MOVS     R0,#+2
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOVS     R0,#+224
        LSLS     R0,R0,#+8        ;; #+57344
        STR      R0,[SP, #+0]
        MOV      R1,SP
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_Init
        MOVS     R2,#+0
        MOVS     R1,#+13
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+0
        MOVS     R1,#+14
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+0
        MOVS     R1,#+15
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_PinAFConfig
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOV      R1,SP
        LDR      R0,??DataTable9_1  ;; 0x48001400
        BL       GPIO_Init
        MOVS     R2,#+1
        MOVS     R1,#+128
        LDR      R0,??DataTable9_1  ;; 0x48001400
        BL       GPIO_WriteBit
        MOVS     R0,#+157
        LSLS     R0,R0,#+8        ;; #+40192
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+2
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOV      R1,SP
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_Init
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     `?<Constant "rx time out\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     ??length

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     ??first

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     `?<Constant "start the tx timer!\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     test_send_timer

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_int_Config:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+128
        LSLS     R0,R0,#+8        ;; #+32768
        BL       EXTI_ClearITPendingBit
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       EXTI_ClearITPendingBit
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        BL       EXTI_ClearITPendingBit
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R1,#+12
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R1,#+11
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R1,#+10
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R1,#+0
        MOVS     R0,#+157
        LSLS     R0,R0,#+8        ;; #+40192
        BL       hal_sRF_ITConfig
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_sRF_SPI_Config:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable9  ;; 0x48000400
        BL       GPIO_SetBits
        MOVS     R1,#+0
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_Cmd
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_I2S_DeInit
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+7        ;; #+16384
        BL       RCC_APB1PeriphClockCmd
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOVS     R0,#+130
        LSLS     R0,R0,#+1        ;; #+260
        MOV      R1,SP
        STRH     R0,[R1, #+2]
        MOVS     R0,#+224
        LSLS     R0,R0,#+3        ;; #+1792
        MOV      R1,SP
        STRH     R0,[R1, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+8]
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        MOV      R1,SP
        STRH     R0,[R1, #+10]
        MOVS     R0,#+16
        MOV      R1,SP
        STRH     R0,[R1, #+12]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+14]
        MOVS     R0,#+7
        MOV      R1,SP
        STRH     R0,[R1, #+16]
        MOV      R1,SP
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_Init
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_RxFIFOThresholdConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable8  ;; 0x40003800
        BL       SPI_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_sRF_InitSPI:
        PUSH     {R7,LR}
        BL       hal_Init_RF_pins
        BL       hal_sRF_SPI_Config
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_sRF_Transmit:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,R5
        UXTB     R1,R1
        MOVS     R0,R4
        BL       SX1276LoRa_Send_Packet
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitRF:
        PUSH     {R7,LR}
        LDR      R0,??DataTable9_2
        BL       etimer_stop
        BL       hal_sRF_InitSPI
        BL       GPIO_int_Config
        MOVS     R0,#+1
        BL       SX1276_lora_init
        LDR      R0,??DataTable9_3
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x48000400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x48001400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     timer_rf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     `?<Constant "reset RF\\r\\n">`

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "radio_process ">`:
        DATA
        DC8 "radio_process "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "long_send_process ">`:
        DATA
        DC8 "long_send_process "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "rx start\\r\\n">`:
        DATA
        DC8 "rx start\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "rssi = %f\\r\\n">`:
        DATA
        DC8 "rssi = %f\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "snr = %d\\r\\n">`:
        DATA
        DC8 "snr = %d\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%x %x %x %x ">`:
        DATA
        DC8 "%x %x %x %x "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%x "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "tx time out\\r\\n">`:
        DATA
        DC8 "tx time out\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "rx time out\\r\\n">`:
        DATA
        DC8 "rx time out\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "start the tx timer!\\r\\n">`:
        DATA
        DC8 "start the tx timer!\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reset RF\\r\\n">`:
        DATA
        DC8 "reset RF\015\012"
        DC8 0

        END
// 
//    89 bytes in section .bss
//    34 bytes in section .data
//   164 bytes in section .rodata
// 1 518 bytes in section .text
// 
// 1 518 bytes of CODE  memory
//   164 bytes of CONST memory
//   123 bytes of DATA  memory
//
//Errors: none
//Warnings: 1

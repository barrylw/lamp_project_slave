///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:23
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\hal_radio.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\hal_radio.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -D USE_LORA_MODE
//        -lb E:\svnProject\street_lamp_new\Debug\List\ --diag_suppress Pa050
//        -o E:\svnProject\street_lamp_new\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        E:\svnProject\street_lamp_new\APP\ -I
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        E:\svnProject\street_lamp_new\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I E:\svnProject\street_lamp_new\LIB\CMSIS\CM0\CoreSupport\ -I
//        E:\svnProject\street_lamp_new\core\ -I
//        E:\svnProject\street_lamp_new\core\sys\ -I
//        E:\svnProject\street_lamp_new\platform\ -I
//        E:\svnProject\street_lamp_new\core\lib\ -I
//        E:\svnProject\street_lamp_new\tools\wpcapslip\ -I
//        E:\svnProject\street_lamp_new\core\cfs\ -I
//        E:\svnProject\street_lamp_new\OLED\ -I
//        E:\svnProject\street_lamp_new\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\hal_radio.s
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
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SPI_Cmd
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
        EXTERN etimer_set
        EXTERN etimer_stop
        EXTERN g_RF_LoRa
        EXTERN printf

        PUBLIC GPIO_int_Config
        PUBLIC SX1276Read
        PUBLIC SX1276ReadBuffer
        PUBLIC SX1276ReadFifo
        PUBLIC SX1276SetReset
        PUBLIC SX1276Write
        PUBLIC SX1276WriteBuffer
        PUBLIC SX1276WriteFifo
        PUBLIC bordcast_addr
        PUBLIC cmd_op_light
        PUBLIC cmd_read_data
        PUBLIC `cmp`
        PUBLIC get_phy_ptr
        PUBLIC hal_InitRF
        PUBLIC hal_Init_RF_pins
        PUBLIC hal_RF_process
        PUBLIC hal_sRF_FSK_ITConfig
        PUBLIC hal_sRF_ITConfig
        PUBLIC hal_sRF_InitSPI
        PUBLIC hal_sRF_SPI_Config
        PUBLIC hal_sRF_Transmit
        PUBLIC local_addr
        PUBLIC spiReadWriteByte
        PUBLIC timer_rf


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void hal_ToggleLED(Led_TypeDef)
hal_ToggleLED:
        UXTB     R0,R0
        MOVS     R1,#+4
        MULS     R1,R0,R1
        LDR      R2,??DataTable4
        LDR      R1,[R2, R1]
        LDRH     R1,[R1, #+20]
        UXTB     R0,R0
        MOVS     R2,#+2
        MULS     R2,R0,R2
        LDR      R3,??DataTable4_1
        LDRH     R2,[R3, R2]
        EORS     R2,R2,R1
        UXTB     R0,R0
        MOVS     R1,#+4
        MULS     R1,R0,R1
        LDR      R3,??DataTable4
        LDR      R1,[R3, R1]
        STRH     R2,[R1, #+20]
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timer_rf:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
local_addr:
        DATA
        DC8 11, 154, 9, 3, 0, 17, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
bordcast_addr:
        DATA
        DC8 255, 255, 255, 255, 255, 255, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmd_op_light:
        DATA
        DC8 52, 51, 51, 147

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmd_read_data:
        DATA
        DC8 66, 51, 51, 148

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
`cmp`:
        PUSH     {R4,R5,LR}
        MOVS     R3,R0
        MOVS     R0,#+0
??cmp_0:
        UXTB     R0,R0
        UXTB     R2,R2
        CMP      R0,R2
        BCS      ??cmp_1
        UXTB     R0,R0
        LDRB     R4,[R3, R0]
        UXTB     R0,R0
        LDRB     R5,[R1, R0]
        EORS     R5,R5,R4
        CMP      R5,#+1
        BNE      ??cmp_2
        MOVS     R0,#+0
        B        ??cmp_3
??cmp_2:
        ADDS     R0,R0,#+1
        B        ??cmp_0
??cmp_1:
        MOVS     R0,#+1
??cmp_3:
        POP      {R4,R5,PC}       ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
hal_RF_process:
        DATA
        DC32 0H, `?<Constant "radio_process ">`, process_thread_hal_RF_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_hal_RF_process:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_RF_process_0
        CMP      R0,#+98
        BEQ      ??process_thread_hal_RF_process_1
        B        ??process_thread_hal_RF_process_2
??process_thread_hal_RF_process_0:
        MOVS     R1,#+0
        MOVS     R0,#+98
        STRH     R0,[R4, #+0]
??process_thread_hal_RF_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??process_thread_hal_RF_process_3
        MOVS     R0,#+1
        B        ??process_thread_hal_RF_process_4
??process_thread_hal_RF_process_3:
        UXTB     R6,R6
        CMP      R6,#+134
        BNE      ??process_thread_hal_RF_process_5
        LDRB     R0,[R7, #+0]
        CMP      R0,#+7
        BNE      ??process_thread_hal_RF_process_6
        MOVS     R1,#+250
        LSLS     R1,R1,#+4        ;; #+4000
        LDR      R0,??DataTable5
        BL       etimer_set
        LDR      R0,??DataTable4_2
        BL       printf
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_6:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+8
        BNE      ??process_thread_hal_RF_process_7
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        LDR      R0,??DataTable4_3
        BL       printf
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_7:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+14
        BNE      ??process_thread_hal_RF_process_8
        MOVS     R1,#+250
        LSLS     R1,R1,#+4        ;; #+4000
        LDR      R0,??DataTable5
        BL       etimer_set
        LDR      R0,??DataTable5_1
        BL       printf
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_8:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+4
        BNE      ??process_thread_hal_RF_process_9
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        LDR      R0,??DataTable5_2
        BL       printf
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_9:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+3
        BNE      ??process_thread_hal_RF_process_0
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        BL       SX1276LoRaGetPacketSnr
        MOVS     R5,R0
        BL       SX1276LoRaGetPacketRssi
        SXTB     R5,R5
        STR      R5,[SP, #+0]
        MOVS     R2,R0
        MOVS     R3,R1
        LDR      R0,??DataTable6
        BL       printf
        MOVS     R5,#+0
??process_thread_hal_RF_process_10:
        LDR      R0,??DataTable6_1
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??process_thread_hal_RF_process_11
        UXTB     R5,R5
        LDR      R0,??DataTable6_2
        LDRB     R1,[R0, R5]
        ADR      R0,??DataTable6_3  ;; "%X "
        BL       printf
        ADDS     R5,R5,#+1
        B        ??process_thread_hal_RF_process_10
??process_thread_hal_RF_process_11:
        ADR      R0,??DataTable6_4  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        LDR      R0,??DataTable6_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_RF_process_0
        MOVS     R0,#+1
        BL       hal_ToggleLED
        MOVS     R0,#+0
        LDR      R1,??DataTable6_5
        STRB     R0,[R1, #+0]
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_5:
        UXTB     R6,R6
        CMP      R6,#+136
        BNE      ??process_thread_hal_RF_process_0
        LDR      R0,??DataTable5
        CMP      R7,R0
        BNE      ??process_thread_hal_RF_process_0
        BL       SX1276LoRaGetRFState
        CMP      R0,#+7
        BNE      ??process_thread_hal_RF_process_12
        LDR      R0,??DataTable7
        BL       printf
??process_thread_hal_RF_process_12:
        BL       SX1276LoRaGetRFState
        CMP      R0,#+14
        BNE      ??process_thread_hal_RF_process_13
        LDR      R0,??DataTable7_1
        BL       printf
??process_thread_hal_RF_process_13:
        BL       hal_sRF_InitSPI
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_hal_RF_process_4:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_phy_ptr:
        LDR      R0,??DataTable6_2
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiReadWriteByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
??spiReadWriteByte_0:
        MOVS     R1,#+2
        LDR      R0,??DataTable8  ;; 0x40013000
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??spiReadWriteByte_0
        MOVS     R1,R4
        UXTB     R1,R1
        LDR      R0,??DataTable8  ;; 0x40013000
        BL       SPI_SendData8
??spiReadWriteByte_1:
        MOVS     R1,#+1
        LDR      R0,??DataTable8  ;; 0x40013000
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??spiReadWriteByte_1
        LDR      R0,??DataTable8  ;; 0x40013000
        BL       SPI_ReceiveData8
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276WriteBuffer:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R7,R2
        MOVS     R1,#+16
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
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
        MOVS     R1,#+16
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SX1276ReadBuffer:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R7,R2
        MOVS     R1,#+16
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
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
        MOVS     R1,#+16
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        POP      {R0,R4-R7,PC}    ;; return

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
        LSLS     R1,R1,#+6        ;; #+8192
        LDR      R0,??DataTable8_1  ;; 0x48000800
        BL       GPIO_WriteBit
        B        ??SX1276SetReset_1
??SX1276SetReset_0:
        MOVS     R2,#+1
        MOVS     R1,#+128
        LSLS     R1,R1,#+6        ;; #+8192
        LDR      R0,??DataTable8_1  ;; 0x48000800
        BL       GPIO_WriteBit
??SX1276SetReset_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     LED_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     LED_PIN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     `?<Constant "tx start\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     `?<Constant "tx done\\r\\n">`

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
        MOVS     R0,#+160
        LSLS     R0,R0,#+12       ;; #+655360
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+0
        LDR      R0,??DataTable8_2  ;; 0x1e02
        BL       hal_sRF_ITConfig
        MOVS     R0,#+16
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
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
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
        STR      R0,[SP, #+0]
        MOV      R1,SP
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_Init
        MOVS     R2,#+0
        MOVS     R1,#+5
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_PinAFConfig
        MOVS     R2,#+0
        MOVS     R1,#+6
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_PinAFConfig
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_PinAFConfig
        MOVS     R0,#+128
        LSLS     R0,R0,#+6        ;; #+8192
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
        LDR      R0,??DataTable8_1  ;; 0x48000800
        BL       GPIO_Init
        MOVS     R2,#+1
        MOVS     R1,#+128
        LSLS     R1,R1,#+6        ;; #+8192
        LDR      R0,??DataTable8_1  ;; 0x48000800
        BL       GPIO_WriteBit
        LDR      R0,??DataTable8_2  ;; 0x1e02
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
??DataTable5:
        DC32     timer_rf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     `?<Constant "rx start\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     `?<Constant "CRC error\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_int_Config:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphClockCmd
        LDR      R0,??DataTable8_3  ;; 0xe02
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R1,#+9
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R1,#+10
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R1,#+11
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R1,#+0
        LDR      R0,??DataTable8_2  ;; 0x1e02
        BL       hal_sRF_ITConfig
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     `?<Constant "rssi = %f  snr = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     g_RF_LoRa+0x101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     g_RF_LoRa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC8      "%X "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     g_RF_LoRa+0xFF

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_sRF_SPI_Config:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R1,#+16
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        MOVS     R1,#+0
        LDR      R0,??DataTable8  ;; 0x40013000
        BL       SPI_Cmd
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       RCC_APB2PeriphClockCmd
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
        LDR      R0,??DataTable8  ;; 0x40013000
        BL       SPI_Init
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable8  ;; 0x40013000
        BL       SPI_RxFIFOThresholdConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable8  ;; 0x40013000
        BL       SPI_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     `?<Constant "tx time out\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     `?<Constant "rx time out\\r\\n">`

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
        LDR      R0,??DataTable8_4
        BL       etimer_stop
        BL       hal_sRF_InitSPI
        BL       GPIO_int_Config
        MOVS     R0,#+1
        BL       SX1276_lora_init
        LDR      R0,??DataTable8_5
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x48000800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x1e02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0xe02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     timer_rf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
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
`?<Constant "tx start\\r\\n">`:
        DATA
        DC8 "tx start\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "tx done\\r\\n">`:
        DATA
        DC8 "tx done\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "rx start\\r\\n">`:
        DATA
        DC8 "rx start\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "CRC error\\r\\n">`:
        DATA
        DC8 "CRC error\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "rssi = %f  snr = %d\\r\\n">`:
        DATA
        DC8 "rssi = %f  snr = %d\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%X "

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
`?<Constant "reset RF\\r\\n">`:
        DATA
        DC8 "reset RF\015\012"
        DC8 0

        END
// 
//    16 bytes in section .bss
//    40 bytes in section .data
//   140 bytes in section .rodata
// 1 262 bytes in section .text
// 
// 1 262 bytes of CODE  memory
//   140 bytes of CONST memory
//    56 bytes of DATA  memory
//
//Errors: none
//Warnings: none

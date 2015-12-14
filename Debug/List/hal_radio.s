///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:10
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\APP\hal_radio.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\APP\hal_radio.c -D
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
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\hal_radio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Delayms
        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_Init
        EXTERN FLASH_ErasePage
        EXTERN FLASH_Write_chars
        EXTERN GPIO_Init
        EXTERN GPIO_PinAFConfig
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN GPIO_WriteBit
        EXTERN GetCRC16
        EXTERN LED_PIN
        EXTERN LED_PORT
        EXTERN MemCpy
        EXTERN MemSet
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
        EXTERN aplVersion
        EXTERN apl_update_process
        EXTERN `cmp`
        EXTERN currentUIP
        EXTERN etimer_set
        EXTERN etimer_stop
        EXTERN g_RF_LoRa
        EXTERN getSum
        EXTERN get_light_time
        EXTERN printf
        EXTERN process_post
        EXTERN read_8209c_energyP
        EXTERN read_UIP
        EXTERN read_pow_factor
        EXTERN rn8209c_papameter
        EXTERN set_PWM
        EXTERN w_memcpy

        PUBLIC GPIO_int_Config
        PUBLIC PHY_data_indication
        PUBLIC SX1276Read
        PUBLIC SX1276ReadBuffer
        PUBLIC SX1276ReadFifo
        PUBLIC SX1276SetReset
        PUBLIC SX1276Write
        PUBLIC SX1276WriteBuffer
        PUBLIC SX1276WriteFifo
        PUBLIC analyze_645_packet
        PUBLIC apl_ProcessRadioCmd
        PUBLIC bordcast_addr
        PUBLIC cmd_broadcast
        PUBLIC cmd_op_light
        PUBLIC cmd_read_data
        PUBLIC cmd_read_uid
        PUBLIC cmd_update
        PUBLIC hal_InitRF
        PUBLIC hal_Init_RF_pins
        PUBLIC hal_RF_process
        PUBLIC hal_RF_reset
        PUBLIC hal_sRF_FSK_ITConfig
        PUBLIC hal_sRF_ITConfig
        PUBLIC hal_sRF_InitSPI
        PUBLIC hal_sRF_SPI_Config
        PUBLIC hal_sRF_Transmit
        PUBLIC local_addr
        PUBLIC read_addr
        PUBLIC read_version
        PUBLIC set_addr
        PUBLIC spiReadWriteByte
        PUBLIC timer_RFreset
        PUBLIC timer_rf


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void hal_ToggleLED(Led_TypeDef)
hal_ToggleLED:
        UXTB     R0,R0
        MOVS     R1,#+4
        MULS     R1,R0,R1
        LDR      R2,??DataTable0
        LDR      R1,[R2, R1]
        LDRH     R1,[R1, #+20]
        UXTB     R0,R0
        MOVS     R2,#+2
        MULS     R2,R0,R2
        LDR      R3,??DataTable0_1
        LDRH     R2,[R3, R2]
        EORS     R2,R2,R1
        UXTB     R0,R0
        MOVS     R1,#+4
        MULS     R1,R0,R1
        LDR      R3,??DataTable0
        LDR      R1,[R3, R1]
        STRH     R2,[R1, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     LED_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     LED_PIN

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timer_rf:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
local_addr:
        DATA
        DC8 255, 255, 255, 255, 255, 254, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
bordcast_addr:
        DATA
        DC8 153, 153, 153, 153, 153, 153, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmd_broadcast:
        DATA
        DC8 1, 0, 0, 105

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmd_update:
        DATA
        DC8 1, 0, 0, 106

        SECTION `.data`:DATA:REORDER:NOROOT(2)
read_version:
        DATA
        DC8 2, 0, 0, 106

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmd_read_data:
        DATA
        DC8 15, 0, 0, 97

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmd_op_light:
        DATA
        DC8 1, 0, 0, 96

        SECTION `.data`:DATA:REORDER:NOROOT(2)
cmd_read_uid:
        DATA
        DC8 15, 0, 0, 96

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
analyze_645_packet:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
apl_ProcessRadioCmd:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+24
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+104
        BEQ      .+4
        B        ??apl_ProcessRadioCmd_1
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+7]
        CMP      R0,#+104
        BEQ      .+4
        B        ??apl_ProcessRadioCmd_1
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+9]
        LDR      R1,??apl_ProcessRadioCmd_0
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+11]
        CMP      R0,#+22
        BEQ      .+4
        B        ??apl_ProcessRadioCmd_1
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R1,[R0, #+9]
        ADDS     R1,R1,#+10
        UXTB     R1,R1
        LDR      R0,??apl_ProcessRadioCmd_0
        BL       getSum
        LDR      R1,??apl_ProcessRadioCmd_0
        LDRB     R1,[R1, #+9]
        LDR      R2,??apl_ProcessRadioCmd_0
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+10]
        UXTB     R0,R0
        CMP      R0,R1
        BEQ      .+4
        B        ??apl_ProcessRadioCmd_1
        MOVS     R0,#+0
??apl_ProcessRadioCmd_2:
        LDR      R1,??apl_ProcessRadioCmd_0
        LDRB     R1,[R1, #+9]
        UXTB     R0,R0
        CMP      R0,R1
        BCS      ??apl_ProcessRadioCmd_3
        UXTB     R0,R0
        LDR      R1,??apl_ProcessRadioCmd_0
        ADDS     R1,R1,R0
        LDRB     R1,[R1, #+10]
        SUBS     R1,R1,#+51
        UXTB     R0,R0
        LDR      R2,??apl_ProcessRadioCmd_0
        ADDS     R2,R2,R0
        STRB     R1,[R2, #+10]
        ADDS     R0,R0,#+1
        B        ??apl_ProcessRadioCmd_2
??apl_ProcessRadioCmd_3:
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+9]
        ADDS     R0,R0,#+12
        MOVS     R6,R0
        MOVS     R2,#+18
        UXTB     R6,R6
        LDR      R0,??apl_ProcessRadioCmd_0
        ADDS     R1,R0,R6
        MOV      R0,SP
        BL       MemCpy
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+24
        BPL      .+4
        B        ??apl_ProcessRadioCmd_1
        MOVS     R2,#+6
        LDR      R1,??apl_ProcessRadioCmd_0+0x4
        LDR      R0,??apl_ProcessRadioCmd_0+0x8
        BL       `cmp`
        CMP      R0,#+1
        BEQ      ??apl_ProcessRadioCmd_4
        MOVS     R2,#+6
        LDR      R1,??apl_ProcessRadioCmd_0+0x4
        LDR      R0,??apl_ProcessRadioCmd_0+0xC
        BL       `cmp`
        CMP      R0,#+1
        BEQ      .+4
        B        ??apl_ProcessRadioCmd_1
??apl_ProcessRadioCmd_4:
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+8]
        LSLS     R0,R0,#+27       ;; ZeroExtS R0,R0,#+27,#+27
        LSRS     R0,R0,#+27
        UXTB     R0,R0
        CMP      R0,#+17
        BNE      .+4
        B        ??apl_ProcessRadioCmd_5
        CMP      R0,#+20
        BEQ      .+4
        B        ??apl_ProcessRadioCmd_6
??apl_ProcessRadioCmd_7:
        MOVS     R2,#+4
        LDR      R1,??apl_ProcessRadioCmd_0+0x10
        LDR      R0,??apl_ProcessRadioCmd_0+0x14
        BL       `cmp`
        CMP      R0,#+1
        BNE      ??apl_ProcessRadioCmd_8
        MOVS     R2,#+6
        LDR      R1,??apl_ProcessRadioCmd_0+0x4
        LDR      R0,??apl_ProcessRadioCmd_0+0x8
        BL       `cmp`
        CMP      R0,#+1
        BNE      ??apl_ProcessRadioCmd_8
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+14]
        MOVS     R4,R0
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??apl_ProcessRadioCmd_9
        MOVS     R1,#+2
        LDR      R0,??apl_ProcessRadioCmd_0+0x18  ;; 0x48000400
        BL       GPIO_SetBits
        MOVS     R0,R4
        UXTB     R0,R0
        BL       set_PWM
        B        ??apl_ProcessRadioCmd_10
??apl_ProcessRadioCmd_9:
        MOVS     R1,#+2
        LDR      R0,??apl_ProcessRadioCmd_0+0x18  ;; 0x48000400
        BL       GPIO_ResetBits
        MOVS     R0,R4
        UXTB     R0,R0
        BL       set_PWM
??apl_ProcessRadioCmd_10:
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+8]
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??apl_ProcessRadioCmd_0
        STRB     R1,[R0, #+8]
        MOVS     R0,#+4
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+9]
        MOVS     R2,#+4
        LDR      R1,??apl_ProcessRadioCmd_0+0x14
        LDR      R0,??apl_ProcessRadioCmd_0+0x10
        BL       MemCpy
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R1,[R0, #+9]
        ADDS     R1,R1,#+10
        UXTB     R1,R1
        LDR      R0,??apl_ProcessRadioCmd_0
        BL       getSum
        LDR      R1,??apl_ProcessRadioCmd_0
        LDRB     R1,[R1, #+9]
        LDR      R2,??apl_ProcessRadioCmd_0
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+10]
        MOVS     R0,#+22
        LDR      R1,??apl_ProcessRadioCmd_0
        LDRB     R1,[R1, #+9]
        LDR      R2,??apl_ProcessRadioCmd_0
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+11]
        MOVS     R2,#+6
        MOV      R1,SP
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+9]
        LDR      R3,??apl_ProcessRadioCmd_0
        ADDS     R0,R3,R0
        ADDS     R0,R0,#+12
        BL       MemCpy
        MOVS     R2,#+6
        MOV      R1,SP
        ADDS     R1,R1,#+12
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+9]
        LDR      R3,??apl_ProcessRadioCmd_0
        ADDS     R0,R3,R0
        ADDS     R0,R0,#+18
        BL       MemCpy
        MOVS     R2,#+6
        MOV      R1,SP
        ADDS     R1,R1,#+6
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+9]
        LDR      R3,??apl_ProcessRadioCmd_0
        ADDS     R0,R3,R0
        ADDS     R0,R0,#+24
        BL       MemCpy
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R1,[R0, #+9]
        ADDS     R1,R1,#+30
        UXTB     R1,R1
        LDR      R0,??apl_ProcessRadioCmd_0
        BL       SX1276LoRa_Send_Packet
        B        ??apl_ProcessRadioCmd_11
??apl_ProcessRadioCmd_8:
        MOVS     R2,#+4
        LDR      R1,??apl_ProcessRadioCmd_0+0x10
        LDR      R0,??apl_ProcessRadioCmd_0+0x1C
        BL       `cmp`
        CMP      R0,#+1
        BNE      ??apl_ProcessRadioCmd_12
        MOVS     R2,#+6
        LDR      R1,??apl_ProcessRadioCmd_0+0x4
        LDR      R0,??apl_ProcessRadioCmd_0+0xC
        BL       `cmp`
        CMP      R0,#+1
        BNE      ??apl_ProcessRadioCmd_12
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+14]
        MOVS     R4,R0
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??apl_ProcessRadioCmd_13
        MOVS     R1,#+2
        LDR      R0,??apl_ProcessRadioCmd_0+0x18  ;; 0x48000400
        BL       GPIO_SetBits
        MOVS     R0,R4
        UXTB     R0,R0
        BL       set_PWM
        B        ??apl_ProcessRadioCmd_11
??apl_ProcessRadioCmd_13:
        MOVS     R1,#+2
        LDR      R0,??apl_ProcessRadioCmd_0+0x18  ;; 0x48000400
        BL       GPIO_ResetBits
        MOVS     R0,R4
        UXTB     R0,R0
        BL       set_PWM
        B        ??apl_ProcessRadioCmd_11
??apl_ProcessRadioCmd_12:
        MOVS     R2,#+4
        LDR      R1,??apl_ProcessRadioCmd_0+0x10
        LDR      R0,??DataTable1
        BL       `cmp`
        CMP      R0,#+1
        BNE      ??apl_ProcessRadioCmd_11
        LDR      R2,??DataTable1_1
        MOVS     R1,#+134
        LDR      R0,??DataTable1_2
        BL       process_post
        MOVS     R2,#+6
        LDR      R1,??apl_ProcessRadioCmd_0+0x4
        LDR      R0,??apl_ProcessRadioCmd_0+0x8
        BL       `cmp`
??apl_ProcessRadioCmd_11:
        B        ??apl_ProcessRadioCmd_1
??apl_ProcessRadioCmd_5:
        MOVS     R2,#+4
        LDR      R1,??apl_ProcessRadioCmd_0+0x10
        LDR      R0,??DataTable1_3
        BL       `cmp`
        CMP      R0,#+1
        BEQ      .+4
        B        ??apl_ProcessRadioCmd_14
        MOVS     R2,#+4
        LDR      R1,??apl_ProcessRadioCmd_0+0x10
        LDR      R0,??DataTable1_3
        BL       `cmp`
        CMP      R0,#+1
        BEQ      .+4
        B        ??apl_ProcessRadioCmd_15
        LDR      R0,??apl_ProcessRadioCmd_0
        LDRB     R0,[R0, #+8]
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??apl_ProcessRadioCmd_0
        STRB     R1,[R0, #+8]
        MOVS     R0,#+28
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+9]
        MOVS     R2,#+4
        LDR      R1,??DataTable1_3
        LDR      R0,??apl_ProcessRadioCmd_0+0x10
        BL       MemCpy
        LDR      R0,??DataTable1_4
        LDRB     R0,[R0, #+0]
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+14]
        MOVS     R0,#+0
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+15]
        MOVS     R0,#+0
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+16]
        MOVS     R0,#+0
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+17]
        MOVS     R0,#+0
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+18]
        LDR      R0,??DataTable1_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??apl_ProcessRadioCmd_16
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+4]
        MOVS     R0,#+0
        LDR      R1,??DataTable1_5
        STR      R0,[R1, #+8]
        B        ??apl_ProcessRadioCmd_17
??apl_ProcessRadioCmd_16:
        MOVS     R0,#+20
        BL       Delayms
        BL       read_UIP
??apl_ProcessRadioCmd_17:
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+19]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+8
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+20]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+4]
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+21]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+4]
        LSRS     R0,R0,#+8
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+22]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+4]
        LSRS     R0,R0,#+16
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+23]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+4]
        LSRS     R0,R0,#+24
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+8]
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+25]
        LDR      R0,??DataTable1_5
        LDR      R0,[R0, #+8]
        LSRS     R0,R0,#+8
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+26]
        LDR      R0,??DataTable1_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??apl_ProcessRadioCmd_18
        MOVS     R0,#+0
        LDR      R1,??apl_ProcessRadioCmd_0
        STRB     R0,[R1, #+27]
        B        ??apl_ProcessRadioCmd_19
        Nop      
        DATA
??apl_ProcessRadioCmd_0:
        DC32     g_RF_LoRa
        DC32     g_RF_LoRa+0x1
        DC32     local_addr
        DC32     bordcast_addr
        DC32     g_RF_LoRa+0xA
        DC32     cmd_op_light
        DC32     0x48000400
        DC32     cmd_broadcast
        THUMB
??apl_ProcessRadioCmd_18:
        BL       read_pow_factor
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+27]
??apl_ProcessRadioCmd_19:
        MOVS     R0,#+0
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+28]
        MOVS     R0,#+0
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+29]
        BL       read_8209c_energyP
        MOVS     R0,#+0
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+30]
        MOVS     R0,#+0
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+31]
        MOVS     R0,#+0
        LDR      R1,??DataTable1_7
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable1_8
        STRB     R0,[R1, #+0]
        BL       get_light_time
        MOVS     R5,R0
        MOVS     R0,R5
        LDR      R1,??DataTable1_9
        STRB     R0,[R1, #+0]
        MOVS     R0,R5
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable1_10
        STRB     R0,[R1, #+0]
        MOVS     R0,R5
        LSRS     R0,R0,#+16
        LDR      R1,??DataTable1_11
        STRB     R0,[R1, #+0]
        MOVS     R0,R5
        LSRS     R0,R0,#+24
        LDR      R1,??DataTable1_12
        STRB     R0,[R1, #+0]
        MOVS     R0,#+10
??apl_ProcessRadioCmd_20:
        UXTH     R0,R0
        CMP      R0,#+38
        BGE      ??apl_ProcessRadioCmd_21
        UXTH     R0,R0
        LDR      R1,??DataTable1_6
        LDRB     R1,[R1, R0]
        ADDS     R1,R1,#+51
        UXTH     R0,R0
        LDR      R2,??DataTable1_6
        STRB     R1,[R2, R0]
        ADDS     R0,R0,#+1
        B        ??apl_ProcessRadioCmd_20
??apl_ProcessRadioCmd_21:
        LDR      R0,??DataTable1_6
        LDRB     R1,[R0, #+9]
        ADDS     R1,R1,#+10
        UXTB     R1,R1
        LDR      R0,??DataTable1_6
        BL       getSum
        LDR      R1,??DataTable1_13
        STRB     R0,[R1, #+0]
        MOVS     R0,#+22
        LDR      R1,??DataTable1_14
        STRB     R0,[R1, #+0]
        MOVS     R2,#+6
        MOV      R1,SP
        LDR      R0,??DataTable1_15
        BL       MemCpy
        MOVS     R2,#+6
        MOV      R1,SP
        ADDS     R1,R1,#+12
        LDR      R0,??DataTable1_16
        BL       MemCpy
        MOVS     R2,#+6
        MOV      R1,SP
        ADDS     R1,R1,#+6
        LDR      R0,??DataTable1_17
        BL       MemCpy
        LDR      R0,??DataTable1_6
        LDRB     R1,[R0, #+9]
        ADDS     R1,R1,#+30
        UXTB     R1,R1
        LDR      R0,??DataTable1_6
        BL       SX1276LoRa_Send_Packet
        B        ??apl_ProcessRadioCmd_15
??apl_ProcessRadioCmd_14:
        MOVS     R2,#+4
        LDR      R1,??DataTable2
        LDR      R0,??DataTable1_18
        BL       `cmp`
        CMP      R0,#+1
        BNE      ??apl_ProcessRadioCmd_22
        MOVS     R0,#+104
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+0]
        MOVS     R2,#+6
        MOVS     R1,#+0
        LDR      R0,??DataTable2_1
        BL       MemSet
        MOVS     R0,#+104
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+7]
        MOVS     R0,#+129
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+8]
        MOVS     R0,#+13
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+9]
        MOVS     R0,#+2
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+10]
        MOVS     R0,#+0
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+11]
        MOVS     R0,#+0
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+12]
        MOVS     R0,#+106
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+13]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+14]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+15]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+2]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+16]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+3]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+17]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+4]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+18]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+5]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+19]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+6]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+20]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+7]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+21]
        LDR      R0,??DataTable2_2
        LDRB     R0,[R0, #+8]
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+22]
        MOVS     R1,#+23
        LDR      R0,??DataTable1_6
        BL       getSum
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+23]
        MOVS     R0,#+22
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+24]
        MOVS     R2,#+6
        MOV      R1,SP
        LDR      R0,??DataTable2_3
        BL       MemCpy
        MOVS     R2,#+6
        MOV      R1,SP
        ADDS     R1,R1,#+12
        LDR      R0,??DataTable2_4
        BL       MemCpy
        MOVS     R2,#+6
        MOV      R1,SP
        ADDS     R1,R1,#+6
        LDR      R0,??DataTable1_12
        BL       MemCpy
        LDR      R0,??DataTable1_6
        LDRB     R1,[R0, #+9]
        ADDS     R1,R1,#+30
        UXTB     R1,R1
        LDR      R0,??DataTable1_6
        BL       SX1276LoRa_Send_Packet
        B        ??apl_ProcessRadioCmd_15
??apl_ProcessRadioCmd_22:
        MOVS     R2,#+4
        LDR      R1,??DataTable2
        LDR      R0,??DataTable2_5
        BL       `cmp`
        CMP      R0,#+1
        BNE      ??apl_ProcessRadioCmd_15
        MOVS     R2,#+6
        LDR      R1,??DataTable2_1
        LDR      R0,??DataTable2_6
        BL       `cmp`
        CMP      R0,#+1
        BNE      ??apl_ProcessRadioCmd_15
        MOVS     R0,#+104
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+0]
        MOVS     R2,#+6
        LDR      R1,??DataTable3
        LDR      R0,??DataTable2_1
        BL       MemCpy
        MOVS     R0,#+104
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+7]
        MOVS     R0,#+129
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+8]
        MOVS     R0,#+4
        LDR      R1,??DataTable1_6
        STRB     R0,[R1, #+9]
        MOVS     R2,#+4
        LDR      R1,??DataTable2_5
        LDR      R0,??DataTable2
        BL       MemCpy
        MOVS     R0,#+0
??apl_ProcessRadioCmd_23:
        LDR      R1,??DataTable1_6
        LDRB     R1,[R1, #+9]
        UXTB     R0,R0
        CMP      R0,R1
        BCS      ??apl_ProcessRadioCmd_24
        UXTB     R0,R0
        LDR      R1,??DataTable1_6
        ADDS     R1,R1,R0
        LDRB     R1,[R1, #+10]
        ADDS     R1,R1,#+51
        UXTB     R0,R0
        LDR      R2,??DataTable1_6
        ADDS     R2,R2,R0
        STRB     R1,[R2, #+10]
        ADDS     R0,R0,#+1
        B        ??apl_ProcessRadioCmd_23
??apl_ProcessRadioCmd_24:
        LDR      R0,??DataTable1_6
        LDRB     R1,[R0, #+9]
        ADDS     R1,R1,#+10
        UXTB     R1,R1
        LDR      R0,??DataTable1_6
        BL       getSum
        LDR      R1,??DataTable1_6
        LDRB     R1,[R1, #+9]
        LDR      R2,??DataTable1_6
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+10]
        MOVS     R0,#+22
        LDR      R1,??DataTable1_6
        LDRB     R1,[R1, #+9]
        LDR      R2,??DataTable1_6
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+11]
        LDR      R0,??DataTable1_6
        LDRB     R1,[R0, #+9]
        ADDS     R1,R1,#+12
        UXTB     R1,R1
        LDR      R0,??DataTable1_6
        BL       SX1276LoRa_Send_Packet
??apl_ProcessRadioCmd_15:
        B        ??apl_ProcessRadioCmd_1
??apl_ProcessRadioCmd_6:
??apl_ProcessRadioCmd_1:
        ADD      SP,SP,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     cmd_update

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     g_RF_LoRa+0xE

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     apl_update_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     cmd_read_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     rn8209c_papameter+0x28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     currentUIP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     g_RF_LoRa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     g_RF_LoRa+0x20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     g_RF_LoRa+0x21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     g_RF_LoRa+0x22

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     g_RF_LoRa+0x23

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     g_RF_LoRa+0x24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     g_RF_LoRa+0x25

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     g_RF_LoRa+0x26

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     g_RF_LoRa+0x27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     g_RF_LoRa+0x28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     g_RF_LoRa+0x2E

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     g_RF_LoRa+0x34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     read_version

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PHY_data_indication:
        BX       LR               ;; return

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
        MOVS     R2,#+255
        ADDS     R2,R2,#+104      ;; #+359
        CMP      R0,R2
        BEQ      ??process_thread_hal_RF_process_1
        B        ??process_thread_hal_RF_process_2
??process_thread_hal_RF_process_0:
        MOVS     R1,#+0
        MOVS     R0,#+255
        ADDS     R0,R0,#+104      ;; #+359
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
        LDR      R0,??DataTable5_1
        BL       printf
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_6:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+8
        BNE      ??process_thread_hal_RF_process_7
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        LDR      R0,??DataTable5_2
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
        LDR      R0,??DataTable5_3
        BL       printf
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_8:
        LDRB     R0,[R7, #+0]
        CMP      R0,#+4
        BNE      ??process_thread_hal_RF_process_9
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        LDR      R0,??DataTable5_4
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
        LDR      R0,??DataTable5_5
        BL       printf
        MOVS     R5,#+0
??process_thread_hal_RF_process_10:
        LDR      R0,??DataTable5_6
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??process_thread_hal_RF_process_11
        UXTB     R5,R5
        LDR      R0,??DataTable5_7
        LDRB     R1,[R0, R5]
        ADR      R0,??DataTable5_8  ;; "%X "
        BL       printf
        ADDS     R5,R5,#+1
        B        ??process_thread_hal_RF_process_10
??process_thread_hal_RF_process_11:
        ADR      R0,??DataTable5_9  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        LDR      R0,??DataTable5_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_RF_process_0
        MOVS     R0,#+1
        BL       hal_ToggleLED
        MOVS     R0,#+0
        LDR      R1,??DataTable5_10
        STRB     R0,[R1, #+0]
        BL       apl_ProcessRadioCmd
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
        LDR      R0,??DataTable5_11
        BL       printf
??process_thread_hal_RF_process_12:
        BL       SX1276LoRaGetRFState
        CMP      R0,#+14
        BNE      ??process_thread_hal_RF_process_13
        LDR      R0,??DataTable6
        BL       printf
??process_thread_hal_RF_process_13:
        BL       hal_sRF_InitSPI
        BL       hal_InitRF
        B        ??process_thread_hal_RF_process_0
??process_thread_hal_RF_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_hal_RF_process_4:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     g_RF_LoRa+0xA

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     g_RF_LoRa+0x1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     aplVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     g_RF_LoRa+0x19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     g_RF_LoRa+0x1F

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     cmd_read_uid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     bordcast_addr

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timer_RFreset:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
hal_RF_reset:
        DATA
        DC32 0H, `?<Constant "radio_reset">`, process_thread_hal_RF_reset
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_hal_RF_reset:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_RF_reset_0
        MOVS     R2,#+253
        LSLS     R2,R2,#+1        ;; #+506
        SUBS     R0,R0,R2
        BEQ      ??process_thread_hal_RF_reset_1
        SUBS     R0,R0,#+18
        BEQ      ??process_thread_hal_RF_reset_2
        B        ??process_thread_hal_RF_reset_3
??process_thread_hal_RF_reset_0:
        LDR      R1,??DataTable7  ;; 0x927c0
        LDR      R0,??DataTable7_1
        BL       etimer_set
        MOVS     R1,#+0
        MOVS     R0,#+253
        LSLS     R0,R0,#+1        ;; #+506
        STRH     R0,[R4, #+0]
??process_thread_hal_RF_reset_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??process_thread_hal_RF_reset_4
        UXTB     R5,R5
        CMP      R5,#+136
        BNE      ??process_thread_hal_RF_reset_4
        LDR      R0,??DataTable7_1
        CMP      R6,R0
        BEQ      ??process_thread_hal_RF_reset_5
??process_thread_hal_RF_reset_4:
        MOVS     R0,#+1
        B        ??process_thread_hal_RF_reset_6
??process_thread_hal_RF_reset_5:
??process_thread_hal_RF_reset_7:
        BL       SX1276LoRaGetRFState
        CMP      R0,#+7
        BEQ      ??process_thread_hal_RF_reset_8
        BL       SX1276LoRaGetRFState
        CMP      R0,#+14
        BEQ      ??process_thread_hal_RF_reset_8
        BL       hal_InitRF
        B        ??process_thread_hal_RF_reset_0
??process_thread_hal_RF_reset_8:
        LDR      R0,??DataTable8
        BL       printf
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        LDR      R0,??DataTable7_1
        BL       etimer_set
        MOVS     R1,#+0
        MOVS     R0,#+131
        LSLS     R0,R0,#+2        ;; #+524
        STRH     R0,[R4, #+0]
??process_thread_hal_RF_reset_2:
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??process_thread_hal_RF_reset_9
        UXTB     R5,R5
        CMP      R5,#+136
        BNE      ??process_thread_hal_RF_reset_9
        LDR      R0,??DataTable7_1
        CMP      R6,R0
        BEQ      ??process_thread_hal_RF_reset_10
??process_thread_hal_RF_reset_9:
        MOVS     R0,#+1
        B        ??process_thread_hal_RF_reset_6
??process_thread_hal_RF_reset_10:
        B        ??process_thread_hal_RF_reset_7
??process_thread_hal_RF_reset_3:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_hal_RF_reset_6:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     local_addr

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiReadWriteByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
??spiReadWriteByte_0:
        MOVS     R1,#+2
        LDR      R0,??DataTable9  ;; 0x40013000
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??spiReadWriteByte_0
        MOVS     R1,R4
        UXTB     R1,R1
        LDR      R0,??DataTable9  ;; 0x40013000
        BL       SPI_SendData8
??spiReadWriteByte_1:
        MOVS     R1,#+1
        LDR      R0,??DataTable9  ;; 0x40013000
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??spiReadWriteByte_1
        LDR      R0,??DataTable9  ;; 0x40013000
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
        LDR      R0,??DataTable11  ;; 0x48000800
        BL       GPIO_WriteBit
        B        ??SX1276SetReset_1
??SX1276SetReset_0:
        MOVS     R2,#+1
        MOVS     R1,#+128
        LSLS     R1,R1,#+6        ;; #+8192
        LDR      R0,??DataTable11  ;; 0x48000800
        BL       GPIO_WriteBit
??SX1276SetReset_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     timer_rf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     `?<Constant "tx start\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     `?<Constant "tx done\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     `?<Constant "rx start\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     `?<Constant "CRC error\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     `?<Constant "rssi = %f  snr = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     g_RF_LoRa+0x101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     g_RF_LoRa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC8      "%X "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     g_RF_LoRa+0xFF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
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
        MOVS     R0,#+160
        LSLS     R0,R0,#+12       ;; #+655360
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+0
        LDR      R0,??DataTable11_1  ;; 0x1e02
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
        LDR      R0,??DataTable11  ;; 0x48000800
        BL       GPIO_Init
        MOVS     R2,#+1
        MOVS     R1,#+128
        LSLS     R1,R1,#+6        ;; #+8192
        LDR      R0,??DataTable11  ;; 0x48000800
        BL       GPIO_WriteBit
        LDR      R0,??DataTable11_1  ;; 0x1e02
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
??DataTable6:
        DC32     `?<Constant "rx time out\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_int_Config:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphClockCmd
        LDR      R0,??DataTable11_2  ;; 0xe02
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
        LDR      R0,??DataTable11_1  ;; 0x1e02
        BL       hal_sRF_ITConfig
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x927c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     timer_RFreset

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
        LDR      R0,??DataTable9  ;; 0x40013000
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
        LDR      R0,??DataTable9  ;; 0x40013000
        BL       SPI_Init
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable9  ;; 0x40013000
        BL       SPI_RxFIFOThresholdConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable9  ;; 0x40013000
        BL       SPI_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     `?<Constant "RF busy\\r\\n">`

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
read_addr:
        PUSH     {R2-R4,LR}
        MOVS     R4,R0
        MOVS     R2,#+8
        LDR      R1,??DataTable11_3  ;; 0x800f000
        MOV      R0,SP
        BL       w_memcpy
        MOVS     R1,#+6
        MOV      R0,SP
        ADDS     R0,R0,#+2
        BL       GetCRC16
        MOV      R1,SP
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0
        CMP      R1,R0
        BNE      ??read_addr_0
        MOVS     R2,#+6
        MOV      R1,SP
        ADDS     R1,R1,#+2
        MOVS     R0,R4
        BL       w_memcpy
        B        ??read_addr_1
??read_addr_0:
        MOVS     R2,#+6
        LDR      R1,??DataTable11_4
        MOVS     R0,R4
        BL       w_memcpy
??read_addr_1:
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_addr:
        PUSH     {R2-R4,LR}
        MOVS     R4,R0
        MOVS     R2,#+6
        MOVS     R1,R4
        MOV      R0,SP
        ADDS     R0,R0,#+2
        BL       w_memcpy
        MOVS     R1,#+6
        MOV      R0,SP
        ADDS     R0,R0,#+2
        BL       GetCRC16
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable11_3  ;; 0x800f000
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??set_addr_0
        MOVS     R2,#+8
        MOV      R1,SP
        LDR      R0,??DataTable11_3  ;; 0x800f000
        BL       FLASH_Write_chars
??set_addr_0:
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitRF:
        PUSH     {R7,LR}
        LDR      R0,??DataTable11_5
        BL       etimer_stop
        BL       hal_sRF_InitSPI
        BL       GPIO_int_Config
        MOVS     R0,#+1
        BL       SX1276_lora_init
        LDR      R0,??DataTable11_4
        BL       read_addr
        LDR      R0,??DataTable11_6
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x48000800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x1e02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0xe02

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x800f000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     local_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     timer_rf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
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
`?<Constant "radio_reset">`:
        DATA
        DC8 "radio_reset"

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
`?<Constant "RF busy\\r\\n">`:
        DATA
        DC8 "RF busy\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reset RF\\r\\n">`:
        DATA
        DC8 "reset RF\015\012"
        DC8 0

        END
// 
//    32 bytes in section .bss
//    72 bytes in section .data
//   164 bytes in section .rodata
// 2 952 bytes in section .text
// 
// 2 952 bytes of CODE  memory
//   164 bytes of CONST memory
//   104 bytes of DATA  memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:20
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_spi.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_spi.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
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
//        F:\cloneSlave\lamp_project_slave\Debug\List\stm32f0xx_spi.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_APB2PeriphResetCmd
        EXTERN RCC_GetClocksFreq
        EXTERN __aeabi_uidiv

        PUBLIC I2S_Cmd
        PUBLIC I2S_Init
        PUBLIC I2S_StructInit
        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CRCLengthConfig
        PUBLIC SPI_CalculateCRC
        PUBLIC SPI_Cmd
        PUBLIC SPI_DataSizeConfig
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_GetReceptionFIFOStatus
        PUBLIC SPI_GetTransmissionFIFOStatus
        PUBLIC SPI_I2S_ClearFlag
        PUBLIC SPI_I2S_DMACmd
        PUBLIC SPI_I2S_DeInit
        PUBLIC SPI_I2S_GetFlagStatus
        PUBLIC SPI_I2S_GetITStatus
        PUBLIC SPI_I2S_ITConfig
        PUBLIC SPI_I2S_ReceiveData16
        PUBLIC SPI_I2S_SendData16
        PUBLIC SPI_Init
        PUBLIC SPI_LastDMATransferCmd
        PUBLIC SPI_NSSInternalSoftwareConfig
        PUBLIC SPI_NSSPulseModeCmd
        PUBLIC SPI_ReceiveData8
        PUBLIC SPI_RxFIFOThresholdConfig
        PUBLIC SPI_SSOutputCmd
        PUBLIC SPI_SendData8
        PUBLIC SPI_StructInit
        PUBLIC SPI_TIModeCmd
        PUBLIC SPI_TransmitCRC


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable12  ;; 0x40013000
        CMP      R4,R0
        BNE      ??SPI_I2S_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       RCC_APB2PeriphResetCmd
        B        ??SPI_I2S_DeInit_1
??SPI_I2S_DeInit_0:
        LDR      R0,??DataTable13  ;; 0x40003800
        CMP      R4,R0
        BNE      ??SPI_I2S_DeInit_1
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+7        ;; #+16384
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+7        ;; #+16384
        BL       RCC_APB1PeriphResetCmd
??SPI_I2S_DeInit_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+224
        LSLS     R1,R1,#+3        ;; #+1792
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        MOVS     R1,#+0
        STRH     R1,[R0, #+14]
        MOVS     R1,#+7
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        LDRH     R2,[R0, #+0]
        MOVS     R3,R2
        MOVS     R2,R3
        MOVS     R3,#+193
        LSLS     R3,R3,#+6        ;; #+12352
        ANDS     R3,R3,R2
        MOVS     R2,R3
        LDRH     R3,[R1, #+0]
        LDRH     R4,[R1, #+14]
        ORRS     R4,R4,R3
        LDRH     R3,[R1, #+6]
        ORRS     R3,R3,R4
        LDRH     R4,[R1, #+8]
        ORRS     R4,R4,R3
        LDRH     R5,[R1, #+10]
        ORRS     R5,R5,R4
        LDRH     R3,[R1, #+12]
        ORRS     R3,R3,R5
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        LDRH     R2,[R0, #+4]
        MOVS     R3,R2
        MOVS     R2,R3
        LDR      R3,??DataTable14  ;; 0xf0ff
        ANDS     R3,R3,R2
        MOVS     R2,R3
        LDRH     R3,[R1, #+4]
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+4]
        LDRH     R2,[R1, #+16]
        STRH     R2,[R0, #+16]
        LDRH     R2,[R0, #+0]
        MOVS     R3,R2
        MOVS     R2,R3
        LDR      R3,??DataTable14_1  ;; 0xfffb
        ANDS     R3,R3,R2
        MOVS     R2,R3
        LDRH     R3,[R1, #+2]
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        LDRH     R2,[R0, #+28]
        LDR      R4,??DataTable14_2  ;; 0xf7ff
        ANDS     R4,R4,R2
        STRH     R4,[R0, #+28]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_StructInit:
        MOVS     R1,#+0
        STRH     R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+2]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
        MOVS     R1,#+2
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_Init:
        PUSH     {R0,R4-R7,LR}
        SUB      SP,SP,#+40
        MOVS     R7,R1
        MOVS     R6,#+0
        MOVS     R0,#+2
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOVS     R4,#+0
        MOVS     R0,#+1
        MOV      R1,SP
        STRH     R0,[R1, #+2]
        MOVS     R5,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+40]
        LDRH     R0,[R0, #+28]
        LDR      R1,??DataTable14_3  ;; 0xf040
        ANDS     R1,R1,R0
        LDR      R0,[SP, #+40]
        STRH     R1,[R0, #+28]
        MOVS     R0,#+2
        LDR      R1,[SP, #+40]
        STRH     R0,[R1, #+32]
        LDR      R0,[SP, #+40]
        LDRH     R0,[R0, #+28]
        MOVS     R6,R0
        LDR      R0,[R7, #+8]
        CMP      R0,#+2
        BNE      ??I2S_Init_0
        MOVS     R0,#+0
        MOVS     R4,R0
        MOVS     R0,#+2
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        B        ??I2S_Init_1
??I2S_Init_0:
        LDRH     R0,[R7, #+4]
        CMP      R0,#+0
        BNE      ??I2S_Init_2
        MOVS     R0,#+1
        MOV      R1,SP
        STRH     R0,[R1, #+2]
        B        ??I2S_Init_3
??I2S_Init_2:
        MOVS     R0,#+2
        MOV      R1,SP
        STRH     R0,[R1, #+2]
??I2S_Init_3:
        ADD      R0,SP,#+8
        BL       RCC_GetClocksFreq
        LDR      R0,[SP, #+8]
        STR      R0,[SP, #+4]
        LDRH     R0,[R7, #+6]
        MOVS     R1,#+128
        LSLS     R1,R1,#+2        ;; #+512
        CMP      R0,R1
        BNE      ??I2S_Init_4
        LDR      R0,[SP, #+4]
        LSRS     R0,R0,#+8
        MOVS     R1,#+10
        MULS     R0,R1,R0
        LDR      R1,[R7, #+8]
        BL       __aeabi_uidiv
        ADDS     R0,R0,#+5
        UXTH     R0,R0
        MOVS     R5,R0
        B        ??I2S_Init_5
??I2S_Init_4:
        LDR      R0,[SP, #+4]
        MOV      R1,SP
        LDRH     R2,[R1, #+2]
        MOVS     R1,#+32
        MULS     R1,R2,R1
        BL       __aeabi_uidiv
        MOVS     R1,#+10
        MULS     R0,R1,R0
        LDR      R1,[R7, #+8]
        BL       __aeabi_uidiv
        ADDS     R0,R0,#+5
        UXTH     R0,R0
        MOVS     R5,R0
??I2S_Init_5:
        MOVS     R0,R5
        MOVS     R1,#+10
        BL       __aeabi_uidiv
        MOVS     R5,R0
        MOVS     R0,R5
        MOVS     R1,R0
        LSLS     R1,R1,#+31       ;; ZeroExtS R1,R1,#+31,#+31
        LSRS     R1,R1,#+31
        MOVS     R4,R1
        MOV      R0,SP
        UXTH     R4,R4
        SUBS     R1,R5,R4
        LSRS     R1,R1,#+1
        STRH     R1,[R0, #+0]
        LSLS     R4,R4,#+8
??I2S_Init_1:
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        CMP      R0,#+2
        BLT      ??I2S_Init_6
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        CMP      R0,#+255
        BLE      ??I2S_Init_7
??I2S_Init_6:
        MOVS     R0,#+2
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        MOVS     R4,R0
??I2S_Init_7:
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        LDRH     R1,[R7, #+6]
        ORRS     R1,R1,R4
        ORRS     R1,R1,R0
        LDR      R0,[SP, #+40]
        STRH     R1,[R0, #+32]
        LDRH     R0,[R7, #+0]
        LDRH     R2,[R7, #+2]
        LDRH     R3,[R7, #+4]
        LDRH     R1,[R7, #+12]
        ORRS     R1,R1,R3
        ORRS     R1,R1,R2
        ORRS     R1,R1,R0
        MOVS     R0,#+128
        LSLS     R0,R0,#+4        ;; #+2048
        ORRS     R0,R0,R1
        ORRS     R0,R0,R6
        MOVS     R6,R0
        LDR      R0,[SP, #+40]
        STRH     R6,[R0, #+28]
        ADD      SP,SP,#+44
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SPI_Cmd_0
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+64
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        B        ??SPI_Cmd_1
??SPI_Cmd_0:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable14_4  ;; 0xffbf
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
??SPI_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_TIModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SPI_TIModeCmd_0
        LDRH     R2,[R0, #+4]
        MOVS     R3,#+16
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+4]
        B        ??SPI_TIModeCmd_1
??SPI_TIModeCmd_0:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable14_5  ;; 0xffef
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
??SPI_TIModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2S_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2S_Cmd_0
        LDRH     R2,[R0, #+28]
        MOVS     R3,#+128
        LSLS     R3,R3,#+3        ;; #+1024
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+28]
        B        ??I2S_Cmd_1
??I2S_Cmd_0:
        LDRH     R2,[R0, #+28]
        LDR      R3,??DataTable14_6  ;; 0xfbff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+28]
??I2S_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_DataSizeConfig:
        MOVS     R2,#+0
        LDRH     R3,[R0, #+4]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable14  ;; 0xf0ff
        ANDS     R2,R2,R3
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_RxFIFOThresholdConfig:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable14_7  ;; 0xefff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_BiDirectionalLineConfig:
        PUSH     {LR}
        UXTH     R1,R1
        MOVS     R2,#+128
        LSLS     R2,R2,#+7        ;; #+16384
        CMP      R1,R2
        BNE      ??SPI_BiDirectionalLineConfig_0
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+7        ;; #+16384
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        B        ??SPI_BiDirectionalLineConfig_1
??SPI_BiDirectionalLineConfig_0:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable14_8  ;; 0xbfff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
??SPI_BiDirectionalLineConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_NSSInternalSoftwareConfig:
        PUSH     {LR}
        UXTH     R1,R1
        LDR      R2,??DataTable14_9  ;; 0xfeff
        CMP      R1,R2
        BEQ      ??SPI_NSSInternalSoftwareConfig_0
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+1        ;; #+256
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        B        ??SPI_NSSInternalSoftwareConfig_1
??SPI_NSSInternalSoftwareConfig_0:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable14_9  ;; 0xfeff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
??SPI_NSSInternalSoftwareConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_SSOutputCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SPI_SSOutputCmd_0
        LDRH     R2,[R0, #+4]
        MOVS     R3,#+4
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+4]
        B        ??SPI_SSOutputCmd_1
??SPI_SSOutputCmd_0:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable14_1  ;; 0xfffb
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
??SPI_SSOutputCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_NSSPulseModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SPI_NSSPulseModeCmd_0
        LDRH     R2,[R0, #+4]
        MOVS     R3,#+8
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+4]
        B        ??SPI_NSSPulseModeCmd_1
??SPI_NSSPulseModeCmd_0:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable14_10  ;; 0xfff7
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
??SPI_NSSPulseModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_SendData8:
        MOVS     R2,#+0
        MOVS     R2,R0
        ADDS     R2,R2,#+12
        STRB     R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_SendData16:
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_ReceiveData8:
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R0,R1
        ADDS     R0,R0,#+12
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ReceiveData16:
        LDRH     R0,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_CRCLengthConfig:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable14_2  ;; 0xf7ff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
        LDRH     R2,[R0, #+0]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_CalculateCRC:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??SPI_CalculateCRC_0
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+6        ;; #+8192
        ORRS     R3,R3,R2
        STRH     R3,[R0, #+0]
        B        ??SPI_CalculateCRC_1
??SPI_CalculateCRC_0:
        LDRH     R2,[R0, #+0]
        LDR      R3,??DataTable14_11  ;; 0xdfff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+0]
??SPI_CalculateCRC_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_TransmitCRC:
        LDRH     R1,[R0, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+5        ;; #+4096
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetCRC:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        UXTB     R1,R1
        CMP      R1,#+1
        BEQ      ??SPI_GetCRC_0
        LDRH     R3,[R2, #+24]
        MOVS     R0,R3
        B        ??SPI_GetCRC_1
??SPI_GetCRC_0:
        LDRH     R3,[R2, #+20]
        MOVS     R0,R3
??SPI_GetCRC_1:
        UXTH     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetCRCPolynomial:
        LDRH     R0,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_DMACmd:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??SPI_I2S_DMACmd_0
        LDRH     R3,[R0, #+4]
        ORRS     R3,R3,R1
        STRH     R3,[R0, #+4]
        B        ??SPI_I2S_DMACmd_1
??SPI_I2S_DMACmd_0:
        LDRH     R3,[R0, #+4]
        BICS     R3,R3,R1
        STRH     R3,[R0, #+4]
??SPI_I2S_DMACmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_LastDMATransferCmd:
        LDRH     R2,[R0, #+4]
        LDR      R3,??DataTable14_12  ;; 0x9fff
        ANDS     R3,R3,R2
        STRH     R3,[R0, #+4]
        LDRH     R2,[R0, #+4]
        ORRS     R2,R2,R1
        STRH     R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     0xf0ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     0xfffb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     0xf7ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     0xf040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     0xffbf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_5:
        DC32     0xffef

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_6:
        DC32     0xfbff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_7:
        DC32     0xefff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_8:
        DC32     0xbfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_9:
        DC32     0xfeff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_10:
        DC32     0xfff7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_11:
        DC32     0xdfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_12:
        DC32     0x9fff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ITConfig:
        PUSH     {R4,R5,LR}
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,R1
        UXTB     R5,R5
        LSRS     R5,R5,#+4
        UXTB     R5,R5
        MOVS     R3,R5
        MOVS     R5,#+1
        LSLS     R5,R5,R3
        MOVS     R4,R5
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??SPI_I2S_ITConfig_0
        LDRH     R5,[R0, #+4]
        ORRS     R5,R5,R4
        STRH     R5,[R0, #+4]
        B        ??SPI_I2S_ITConfig_1
??SPI_I2S_ITConfig_0:
        LDRH     R5,[R0, #+4]
        BICS     R5,R5,R4
        STRH     R5,[R0, #+4]
??SPI_I2S_ITConfig_1:
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetTransmissionFIFOStatus:
        LDRH     R1,[R0, #+8]
        MOVS     R0,#+192
        LSLS     R0,R0,#+5        ;; #+6144
        ANDS     R0,R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_GetReceptionFIFOStatus:
        LDRH     R1,[R0, #+8]
        MOVS     R0,#+192
        LSLS     R0,R0,#+3        ;; #+1536
        ANDS     R0,R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_GetFlagStatus:
        PUSH     {LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        LDRH     R3,[R2, #+8]
        TST      R3,R1
        BEQ      ??SPI_I2S_GetFlagStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B        ??SPI_I2S_GetFlagStatus_1
??SPI_I2S_GetFlagStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??SPI_I2S_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_ClearFlag:
        UXTH     R1,R1
        MVNS     R2,R1
        STRH     R2,[R0, #+8]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_I2S_GetITStatus:
        PUSH     {R4-R7,LR}
        MOVS     R3,R0
        MOVS     R0,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R2,#+1
        LSLS     R7,R1,#+28       ;; ZeroExtS R7,R1,#+28,#+28
        LSRS     R7,R7,#+28
        LSLS     R2,R2,R7
        MOVS     R4,R2
        MOVS     R2,R1
        UXTB     R2,R2
        LSRS     R2,R2,#+4
        UXTB     R2,R2
        MOVS     R5,R2
        MOVS     R7,#+1
        MOVS     R2,R5
        MOVS     R5,R7
        LSLS     R5,R5,R2
        LDRH     R2,[R3, #+4]
        ANDS     R2,R2,R5
        MOVS     R6,R2
        LDRH     R2,[R3, #+8]
        TST      R2,R4
        BEQ      ??SPI_I2S_GetITStatus_0
        UXTH     R6,R6
        CMP      R6,#+0
        BEQ      ??SPI_I2S_GetITStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??SPI_I2S_GetITStatus_1
??SPI_I2S_GetITStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??SPI_I2S_GetITStatus_1:
        UXTB     R0,R0
        POP      {R4-R7,PC}       ;; return

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
// 1 118 bytes in section .text
// 
// 1 118 bytes of CODE memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:18
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_i2c.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_i2c.c
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
//        F:\cloneSlave\lamp_project_slave\Debug\List\stm32f0xx_i2c.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC I2C_10BitAddressHeaderCmd
        PUBLIC I2C_10BitAddressingModeCmd
        PUBLIC I2C_AcknowledgeConfig
        PUBLIC I2C_AutoEndCmd
        PUBLIC I2C_CalculatePEC
        PUBLIC I2C_ClearFlag
        PUBLIC I2C_ClearITPendingBit
        PUBLIC I2C_ClockTimeoutCmd
        PUBLIC I2C_Cmd
        PUBLIC I2C_DMACmd
        PUBLIC I2C_DeInit
        PUBLIC I2C_DualAddressCmd
        PUBLIC I2C_ExtendedClockTimeoutCmd
        PUBLIC I2C_GeneralCallCmd
        PUBLIC I2C_GenerateSTART
        PUBLIC I2C_GenerateSTOP
        PUBLIC I2C_GetAddressMatched
        PUBLIC I2C_GetFlagStatus
        PUBLIC I2C_GetITStatus
        PUBLIC I2C_GetPEC
        PUBLIC I2C_GetTransferDirection
        PUBLIC I2C_ITConfig
        PUBLIC I2C_IdleClockTimeoutCmd
        PUBLIC I2C_Init
        PUBLIC I2C_MasterRequestConfig
        PUBLIC I2C_NumberOfBytesConfig
        PUBLIC I2C_OwnAddress2Config
        PUBLIC I2C_PECRequestCmd
        PUBLIC I2C_ReadRegister
        PUBLIC I2C_ReceiveData
        PUBLIC I2C_ReloadCmd
        PUBLIC I2C_SMBusAlertCmd
        PUBLIC I2C_SendData
        PUBLIC I2C_SlaveAddressConfig
        PUBLIC I2C_SlaveByteControlCmd
        PUBLIC I2C_SoftwareResetCmd
        PUBLIC I2C_StopModeCmd
        PUBLIC I2C_StretchClockCmd
        PUBLIC I2C_StructInit
        PUBLIC I2C_TimeoutAConfig
        PUBLIC I2C_TimeoutBConfig
        PUBLIC I2C_TransferHandling


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable16  ;; 0x40005400
        CMP      R4,R0
        BNE      ??I2C_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+14       ;; #+2097152
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+14       ;; #+2097152
        BL       RCC_APB1PeriphResetCmd
        B        ??I2C_DeInit_1
??I2C_DeInit_0:
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+15       ;; #+4194304
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+15       ;; #+4194304
        BL       RCC_APB1PeriphResetCmd
??I2C_DeInit_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Init:
        PUSH     {R4}
        MOVS     R2,#+0
        LDR      R3,[R0, #+0]
        MOVS     R4,#+1
        BICS     R3,R3,R4
        STR      R3,[R0, #+0]
        LDR      R3,[R0, #+0]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable16_1  ;; 0xcfe0ff
        ANDS     R2,R2,R3
        MOVS     R4,R2
        LDR      R3,[R1, #+4]
        LDR      R2,[R1, #+8]
        LSLS     R2,R2,#+8
        ORRS     R2,R2,R3
        ORRS     R2,R2,R4
        STR      R2,[R0, #+0]
        LDR      R3,[R1, #+0]
        LDR      R4,??DataTable16_2  ;; 0xf0ffffff
        ANDS     R4,R4,R3
        STR      R4,[R0, #+16]
        LDR      R3,[R0, #+0]
        MOVS     R4,#+1
        ORRS     R4,R4,R3
        STR      R4,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R2,R3
        STR      R2,[R0, #+8]
        STR      R2,[R0, #+12]
        LDR      R3,[R1, #+24]
        LDR      R4,[R1, #+16]
        ORRS     R4,R4,R3
        MOVS     R2,R4
        STR      R2,[R0, #+8]
        LDR      R3,[R0, #+8]
        MOVS     R4,#+128
        LSLS     R4,R4,#+8        ;; #+32768
        ORRS     R4,R4,R3
        STR      R4,[R0, #+8]
        LDR      R3,[R1, #+12]
        MOVS     R2,R3
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        LDR      R3,[R0, #+4]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable18  ;; 0x7ff7fff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        LDR      R2,[R1, #+20]
        ORRS     R2,R2,R3
        STR      R2,[R0, #+4]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        STR      R1,[R0, #+20]
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_Cmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??I2C_Cmd_1
??I2C_Cmd_0:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        BICS     R2,R2,R3
        STR      R2,[R0, #+0]
??I2C_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SoftwareResetCmd:
        LDR      R1,[R0, #+0]
        MOVS     R2,#+1
        BICS     R1,R1,R2
        STR      R1,[R0, #+0]
        LDR      R1,[R0, #+0]
        LDR      R2,[R0, #+0]
        MOVS     R3,#+1
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ITConfig:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??I2C_ITConfig_0
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,R1
        STR      R3,[R0, #+0]
        B        ??I2C_ITConfig_1
??I2C_ITConfig_0:
        LDR      R3,[R0, #+0]
        BICS     R3,R3,R1
        STR      R3,[R0, #+0]
??I2C_ITConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_StretchClockCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_StretchClockCmd_0
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable20  ;; 0xfffdffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??I2C_StretchClockCmd_1
??I2C_StretchClockCmd_0:
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+10       ;; #+131072
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
??I2C_StretchClockCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_StopModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_StopModeCmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+11       ;; #+262144
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??I2C_StopModeCmd_1
??I2C_StopModeCmd_0:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable21  ;; 0xfffbffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
??I2C_StopModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DualAddressCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_DualAddressCmd_0
        LDR      R2,[R0, #+12]
        MOVS     R3,#+128
        LSLS     R3,R3,#+8        ;; #+32768
        ORRS     R3,R3,R2
        STR      R3,[R0, #+12]
        B        ??I2C_DualAddressCmd_1
??I2C_DualAddressCmd_0:
        LDR      R2,[R0, #+12]
        LDR      R3,??DataTable22  ;; 0xffff7fff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+12]
??I2C_DualAddressCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_OwnAddress2Config:
        PUSH     {R4-R6}
        MOVS     R3,#+0
        LDR      R4,[R0, #+12]
        MOVS     R3,R4
        MOVS     R4,R3
        LDR      R3,??DataTable23  ;; 0xfffff801
        ANDS     R3,R3,R4
        MOVS     R6,R3
        UXTH     R1,R1
        MOVS     R4,#+254
        ANDS     R4,R4,R1
        UXTB     R2,R2
        LSLS     R5,R2,#+8
        MOVS     R3,#+224
        LSLS     R3,R3,#+3        ;; #+1792
        ANDS     R3,R3,R5
        ORRS     R3,R3,R4
        ORRS     R3,R3,R6
        STR      R3,[R0, #+12]
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GeneralCallCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_GeneralCallCmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+12       ;; #+524288
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??I2C_GeneralCallCmd_1
??I2C_GeneralCallCmd_0:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable23_1  ;; 0xfff7ffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
??I2C_GeneralCallCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SlaveByteControlCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_SlaveByteControlCmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+9        ;; #+65536
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??I2C_SlaveByteControlCmd_1
??I2C_SlaveByteControlCmd_0:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable23_2  ;; 0xfffeffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
??I2C_SlaveByteControlCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SlaveAddressConfig:
        MOVS     R2,#+0
        LDR      R3,[R0, #+4]
        MOVS     R2,R3
        LSRS     R2,R2,#+10
        LSLS     R2,R2,#+10
        MOVS     R3,R2
        UXTH     R1,R1
        LSLS     R2,R1,#+22       ;; ZeroExtS R2,R1,#+22,#+22
        LSRS     R2,R2,#+22
        ORRS     R2,R2,R3
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_10BitAddressingModeCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_10BitAddressingModeCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+4        ;; #+2048
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??I2C_10BitAddressingModeCmd_1
??I2C_10BitAddressingModeCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable23_3  ;; 0xfffff7ff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??I2C_10BitAddressingModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_AutoEndCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_AutoEndCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+18       ;; #+33554432
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??I2C_AutoEndCmd_1
??I2C_AutoEndCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable23_4  ;; 0xfdffffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??I2C_AutoEndCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ReloadCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_ReloadCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+17       ;; #+16777216
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??I2C_ReloadCmd_1
??I2C_ReloadCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable23_5  ;; 0xfeffffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??I2C_ReloadCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_NumberOfBytesConfig:
        MOVS     R2,#+0
        LDR      R3,[R0, #+4]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable23_6  ;; 0xff00ffff
        ANDS     R2,R2,R3
        MOVS     R3,R2
        UXTB     R1,R1
        LSLS     R2,R1,#+16
        ORRS     R2,R2,R3
        STR      R2,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_MasterRequestConfig:
        PUSH     {LR}
        UXTH     R1,R1
        CMP      R1,#+0
        BNE      ??I2C_MasterRequestConfig_0
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable23_7  ;; 0xfffffbff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??I2C_MasterRequestConfig_1
??I2C_MasterRequestConfig_0:
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+3        ;; #+1024
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
??I2C_MasterRequestConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GenerateSTART:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_GenerateSTART_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+6        ;; #+8192
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??I2C_GenerateSTART_1
??I2C_GenerateSTART_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable23_8  ;; 0xffffdfff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??I2C_GenerateSTART_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GenerateSTOP:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_GenerateSTOP_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+7        ;; #+16384
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??I2C_GenerateSTOP_1
??I2C_GenerateSTOP_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable23_9  ;; 0xffffbfff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??I2C_GenerateSTOP_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_10BitAddressHeaderCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_10BitAddressHeaderCmd_0
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+5        ;; #+4096
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??I2C_10BitAddressHeaderCmd_1
??I2C_10BitAddressHeaderCmd_0:
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable23_10  ;; 0xffffefff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
??I2C_10BitAddressHeaderCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_AcknowledgeConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_AcknowledgeConfig_0
        LDR      R2,[R0, #+4]
        LDR      R3,??DataTable22  ;; 0xffff7fff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+4]
        B        ??I2C_AcknowledgeConfig_1
??I2C_AcknowledgeConfig_0:
        LDR      R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+8        ;; #+32768
        ORRS     R3,R3,R2
        STR      R3,[R0, #+4]
??I2C_AcknowledgeConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     0x40005400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     0xcfe0ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     0xf0ffffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetAddressMatched:
        LDR      R0,[R0, #+24]
        MOVS     R1,R0
        LSRS     R1,R1,#+16
        MOVS     R0,#+254
        ANDS     R0,R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetTransferDirection:
        PUSH     {R4,LR}
        MOVS     R1,R0
        MOVS     R2,#+0
        MOVS     R0,#+0
        LDR      R3,[R1, #+24]
        MOVS     R4,#+128
        LSLS     R4,R4,#+9        ;; #+65536
        ANDS     R3,R3,R4
        MOVS     R2,R3
        CMP      R2,#+0
        BNE      ??I2C_GetTransferDirection_0
        MOVS     R3,#+0
        MOVS     R0,R3
        B        ??I2C_GetTransferDirection_1
??I2C_GetTransferDirection_0:
        MOVS     R3,#+128
        LSLS     R3,R3,#+3        ;; #+1024
        MOVS     R0,R3
??I2C_GetTransferDirection_1:
        UXTH     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_TransferHandling:
        PUSH     {R4-R7}
        LDR      R4,[SP, #+16]
        MOVS     R5,#+0
        LDR      R6,[R0, #+4]
        MOVS     R5,R6
        MOVS     R6,R5
        LDR      R5,??DataTable23_11  ;; 0xfc009800
        ANDS     R5,R5,R6
        MOVS     R7,R5
        UXTH     R1,R1
        LSLS     R6,R1,#+22       ;; ZeroExtS R6,R1,#+22,#+22
        LSRS     R6,R6,#+22
        UXTB     R2,R2
        LSLS     R5,R2,#+16
        ORRS     R5,R5,R6
        ORRS     R5,R5,R3
        ORRS     R5,R5,R4
        ORRS     R5,R5,R7
        STR      R5,[R0, #+4]
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SMBusAlertCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_SMBusAlertCmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+15       ;; #+4194304
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??I2C_SMBusAlertCmd_1
??I2C_SMBusAlertCmd_0:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable23_12  ;; 0xffbfffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
??I2C_SMBusAlertCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x7ff7fff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ClockTimeoutCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_ClockTimeoutCmd_0
        LDR      R2,[R0, #+20]
        MOVS     R3,#+128
        LSLS     R3,R3,#+8        ;; #+32768
        ORRS     R3,R3,R2
        STR      R3,[R0, #+20]
        B        ??I2C_ClockTimeoutCmd_1
??I2C_ClockTimeoutCmd_0:
        LDR      R2,[R0, #+20]
        LDR      R3,??DataTable22  ;; 0xffff7fff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+20]
??I2C_ClockTimeoutCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ExtendedClockTimeoutCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_ExtendedClockTimeoutCmd_0
        LDR      R2,[R0, #+20]
        MOVS     R3,#+128
        LSLS     R3,R3,#+24       ;; #-2147483648
        ORRS     R3,R3,R2
        STR      R3,[R0, #+20]
        B        ??I2C_ExtendedClockTimeoutCmd_1
??I2C_ExtendedClockTimeoutCmd_0:
        LDR      R2,[R0, #+20]
        LSLS     R2,R2,#+1        ;; ZeroExtS R2,R2,#+1,#+1
        LSRS     R2,R2,#+1
        STR      R2,[R0, #+20]
??I2C_ExtendedClockTimeoutCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_IdleClockTimeoutCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_IdleClockTimeoutCmd_0
        LDR      R2,[R0, #+20]
        MOVS     R3,#+128
        LSLS     R3,R3,#+5        ;; #+4096
        ORRS     R3,R3,R2
        STR      R3,[R0, #+20]
        B        ??I2C_IdleClockTimeoutCmd_1
??I2C_IdleClockTimeoutCmd_0:
        LDR      R2,[R0, #+20]
        LDR      R3,??DataTable23_10  ;; 0xffffefff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+20]
??I2C_IdleClockTimeoutCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     0xfffdffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_TimeoutAConfig:
        MOVS     R2,#+0
        LDR      R3,[R0, #+20]
        MOVS     R2,R3
        LSRS     R2,R2,#+12
        LSLS     R2,R2,#+12
        MOVS     R3,R2
        UXTH     R1,R1
        LSLS     R2,R1,#+20       ;; ZeroExtS R2,R1,#+20,#+20
        LSRS     R2,R2,#+20
        ORRS     R2,R2,R3
        STR      R2,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_TimeoutBConfig:
        PUSH     {R4}
        MOVS     R2,#+0
        LDR      R3,[R0, #+20]
        MOVS     R2,R3
        MOVS     R3,R2
        LDR      R2,??DataTable23_13  ;; 0xf000ffff
        ANDS     R2,R2,R3
        MOVS     R4,R2
        LSLS     R3,R1,#+16
        LDR      R2,??DataTable23_14  ;; 0xfff0000
        ANDS     R2,R2,R3
        ORRS     R2,R2,R4
        STR      R2,[R0, #+20]
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0xfffbffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_CalculatePEC:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_CalculatePEC_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+16       ;; #+8388608
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??I2C_CalculatePEC_1
??I2C_CalculatePEC_0:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable23_15  ;; 0xff7fffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
??I2C_CalculatePEC_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0xffff7fff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_PECRequestCmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??I2C_PECRequestCmd_0
        LDR      R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+19       ;; #+67108864
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        B        ??I2C_PECRequestCmd_1
??I2C_PECRequestCmd_0:
        LDR      R2,[R0, #+0]
        LDR      R3,??DataTable23_16  ;; 0xfbffffff
        ANDS     R3,R3,R2
        STR      R3,[R0, #+0]
??I2C_PECRequestCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0xfffff801

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_1:
        DC32     0xfff7ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_2:
        DC32     0xfffeffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_3:
        DC32     0xfffff7ff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_4:
        DC32     0xfdffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_5:
        DC32     0xfeffffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_6:
        DC32     0xff00ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_7:
        DC32     0xfffffbff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_8:
        DC32     0xffffdfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_9:
        DC32     0xffffbfff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_10:
        DC32     0xffffefff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_11:
        DC32     0xfc009800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_12:
        DC32     0xffbfffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_13:
        DC32     0xf000ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_14:
        DC32     0xfff0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_15:
        DC32     0xff7fffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_16:
        DC32     0xfbffffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetPEC:
        LDR      R0,[R0, #+32]
        UXTB     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ReadRegister:
        SUB      SP,SP,#+4
        MOVS     R2,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        STR      R2,[SP, #+0]
        LDR      R0,[SP, #+0]
        UXTB     R1,R1
        ADDS     R0,R0,R1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SendData:
        UXTB     R1,R1
        STR      R1,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ReceiveData:
        LDR      R0,[R0, #+36]
        UXTB     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DMACmd:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??I2C_DMACmd_0
        LDR      R3,[R0, #+0]
        ORRS     R3,R3,R1
        STR      R3,[R0, #+0]
        B        ??I2C_DMACmd_1
??I2C_DMACmd_0:
        LDR      R3,[R0, #+0]
        BICS     R3,R3,R1
        STR      R3,[R0, #+0]
??I2C_DMACmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetFlagStatus:
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R3,#+0
        MOVS     R0,#+0
        LDR      R4,[R2, #+24]
        MOVS     R3,R4
        ANDS     R3,R3,R1
        CMP      R3,#+0
        BEQ      ??I2C_GetFlagStatus_0
        MOVS     R4,#+1
        MOVS     R0,R4
        B        ??I2C_GetFlagStatus_1
??I2C_GetFlagStatus_0:
        MOVS     R4,#+0
        MOVS     R0,R4
??I2C_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ClearFlag:
        STR      R1,[R0, #+28]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetITStatus:
        PUSH     {R4-R6,LR}
        MOVS     R2,R0
        MOVS     R3,#+0
        MOVS     R0,#+0
        MOVS     R4,#+0
        MOVS     R5,#+252
        LSLS     R5,R5,#+6        ;; #+16128
        ANDS     R5,R5,R1
        CMP      R5,#+0
        BEQ      ??I2C_GetITStatus_0
        LDR      R5,[R2, #+0]
        MOVS     R6,#+128
        ANDS     R5,R5,R6
        MOVS     R4,R5
        B        ??I2C_GetITStatus_1
??I2C_GetITStatus_0:
        MOVS     R5,#+192
        ANDS     R5,R5,R1
        CMP      R5,#+0
        BEQ      ??I2C_GetITStatus_2
        LDR      R5,[R2, #+0]
        MOVS     R6,#+64
        ANDS     R5,R5,R6
        MOVS     R4,R5
        B        ??I2C_GetITStatus_1
??I2C_GetITStatus_2:
        LDR      R5,[R2, #+0]
        ANDS     R5,R5,R1
        MOVS     R4,R5
??I2C_GetITStatus_1:
        LDR      R5,[R2, #+24]
        MOVS     R3,R5
        ANDS     R3,R3,R1
        CMP      R3,#+0
        BEQ      ??I2C_GetITStatus_3
        CMP      R4,#+0
        BEQ      ??I2C_GetITStatus_3
        MOVS     R5,#+1
        MOVS     R0,R5
        B        ??I2C_GetITStatus_4
??I2C_GetITStatus_3:
        MOVS     R5,#+0
        MOVS     R0,R5
??I2C_GetITStatus_4:
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ClearITPendingBit:
        STR      R1,[R0, #+28]
        BX       LR               ;; return

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
// 1 362 bytes in section .text
// 
// 1 362 bytes of CODE memory
//
//Errors: none
//Warnings: none

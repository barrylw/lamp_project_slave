///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       13/Dec/2015  23:36:21
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\APP\PHY.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\APP\PHY.c -D USE_STDPERIPH_DRIVER -D
//        STM32F030X8 -D AUTOSTART_ENABLE -D USE_LORA_MODE -D PRINTF_DEBUG -lb
//        G:\git_hub_lamp\lamp_slave_git\Debug\List\ --diag_suppress Pa050 -o
//        G:\git_hub_lamp\lamp_slave_git\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
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
//        G:\git_hub_lamp\lamp_slave_git\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\PHY.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SX1276LoRaGetRFState
        EXTERN g_RF_LoRa
        EXTERN hal_InitLED
        EXTERN hal_InitMemoryVariable
        EXTERN hal_InitNVIC
        EXTERN hal_InitRCC
        EXTERN hal_InitRF
        EXTERN hal_InitTIMER
        EXTERN hal_InitTimerVariable
        EXTERN hal_InitUART
        EXTERN hal_InitUartVariable
        EXTERN hal_Init_Flash
        EXTERN hal_sRF_Transmit

        PUBLIC InitHardware
        PUBLIC InitPhyVariable
        PUBLIC PD_DATA_Request
        PUBLIC PHY_DATA_Indication
        PUBLIC Phy_GetAttr
        PUBLIC Phy_RxData
        PUBLIC Phy_SetAttr
        PUBLIC get_CCA_result
        PUBLIC phyVersion
        PUBLIC phy_attr


        SECTION `.rodata`:CONST:REORDER:ROOT(2)
phyVersion:
        DATA
        DC8 66, 82, 50, 51, 25, 3, 20, 1, 1, 0, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
phy_attr:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InitHardware:
        PUSH     {R7,LR}
        BL       hal_InitRCC
        BL       hal_InitNVIC
        BL       hal_InitLED
        BL       hal_InitUART
        BL       hal_InitTIMER
        BL       hal_Init_Flash
        BL       hal_InitRF
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InitPhyVariable:
        PUSH     {R7,LR}
        BL       hal_InitMemoryVariable
        BL       hal_InitUartVariable
        BL       hal_InitTimerVariable
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PD_DATA_Request:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
        MOVS     R2,R6
        UXTB     R2,R2
        MOVS     R1,R5
        UXTB     R1,R1
        MOVS     R0,R4
        BL       hal_sRF_Transmit
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_CCA_result:
        MOVS     R1,R0
        MOVS     R0,#+0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Phy_RxData:
        PUSH     {LR}
        LDR      R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??Phy_RxData_0
        MOVS     R0,#+0
        LDR      R1,??DataTable3
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        B        ??Phy_RxData_1
??Phy_RxData_0:
        MOVS     R0,#+0
??Phy_RxData_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PHY_DATA_Indication:
        PUSH     {R4,LR}
        LDR      R3,??DataTable3_1
        LDRB     R3,[R3, #+0]
        STRB     R3,[R0, #+0]
        MOVS     R3,#+0
??PHY_DATA_Indication_0:
        LDR      R4,??DataTable3_1
        LDRB     R4,[R4, #+0]
        UXTH     R3,R3
        UXTH     R4,R4
        CMP      R3,R4
        BCS      ??PHY_DATA_Indication_1
        UXTH     R3,R3
        LDR      R4,??DataTable3_2
        LDRB     R4,[R4, R3]
        UXTH     R3,R3
        STRB     R4,[R1, R3]
        ADDS     R3,R3,#+1
        B        ??PHY_DATA_Indication_0
??PHY_DATA_Indication_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Phy_GetAttr:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        UXTB     R5,R5
        CMP      R5,#+0
        BEQ      ??Phy_GetAttr_0
        CMP      R5,#+2
        BEQ      ??Phy_GetAttr_1
        BCC      ??Phy_GetAttr_2
        CMP      R5,#+4
        BEQ      ??Phy_GetAttr_3
        BCC      ??Phy_GetAttr_4
        B        ??Phy_GetAttr_5
??Phy_GetAttr_0:
        LDR      R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        STRB     R0,[R4, #+0]
        MOVS     R0,#+8
        B        ??Phy_GetAttr_6
??Phy_GetAttr_2:
        LDR      R0,??DataTable3_3
        LDRB     R0,[R0, #+1]
        STRB     R0,[R4, #+0]
        MOVS     R0,#+8
        B        ??Phy_GetAttr_6
??Phy_GetAttr_1:
        LDR      R0,??DataTable3_3
        LDRB     R0,[R0, #+2]
        STRB     R0,[R4, #+0]
        MOVS     R0,#+8
        B        ??Phy_GetAttr_6
??Phy_GetAttr_4:
        LDR      R0,??DataTable3_3
        LDRB     R0,[R0, #+3]
        STRB     R0,[R4, #+0]
        MOVS     R0,#+8
        B        ??Phy_GetAttr_6
??Phy_GetAttr_3:
        BL       SX1276LoRaGetRFState
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+7
        BEQ      ??Phy_GetAttr_7
        UXTB     R6,R6
        CMP      R6,#+14
        BNE      ??Phy_GetAttr_8
??Phy_GetAttr_7:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
        B        ??Phy_GetAttr_9
??Phy_GetAttr_8:
        MOVS     R0,#+1
        STRB     R0,[R4, #+0]
??Phy_GetAttr_9:
        MOVS     R0,#+8
        B        ??Phy_GetAttr_6
??Phy_GetAttr_5:
        MOVS     R0,#+10
??Phy_GetAttr_6:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Phy_SetAttr:
        PUSH     {LR}
        MOVS     R2,R0
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??Phy_SetAttr_0
        CMP      R2,#+2
        BEQ      ??Phy_SetAttr_1
        BCC      ??Phy_SetAttr_2
        CMP      R2,#+3
        BEQ      ??Phy_SetAttr_3
        B        ??Phy_SetAttr_4
??Phy_SetAttr_0:
        LDR      R0,??DataTable3_3
        STRB     R1,[R0, #+0]
        MOVS     R0,#+8
        B        ??Phy_SetAttr_5
??Phy_SetAttr_2:
        LDR      R0,??DataTable3_3
        STRB     R1,[R0, #+1]
        MOVS     R0,#+8
        B        ??Phy_SetAttr_5
??Phy_SetAttr_1:
        LDR      R0,??DataTable3_3
        STRB     R1,[R0, #+2]
        MOVS     R0,#+8
        B        ??Phy_SetAttr_5
??Phy_SetAttr_3:
        LDR      R0,??DataTable3_3
        STRB     R1,[R0, #+3]
        MOVS     R0,#+8
        B        ??Phy_SetAttr_5
??Phy_SetAttr_4:
        MOVS     R0,#+10
??Phy_SetAttr_5:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     g_RF_LoRa+0xFF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     g_RF_LoRa+0x101

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     g_RF_LoRa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     phy_attr

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
//   4 bytes in section .bss
//  12 bytes in section .rodata
// 316 bytes in section .text
// 
// 316 bytes of CODE  memory
//  12 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: none

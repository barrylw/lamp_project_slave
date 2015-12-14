///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  14:25:52
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_cec.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_cec.c
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
//        F:\cloneSlave\lamp_project_slave\Debug\List\stm32f0xx_cec.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC CEC_ClearFlag
        PUBLIC CEC_ClearITPendingBit
        PUBLIC CEC_Cmd
        PUBLIC CEC_DeInit
        PUBLIC CEC_EndOfMessage
        PUBLIC CEC_GetFlagStatus
        PUBLIC CEC_GetITStatus
        PUBLIC CEC_ITConfig
        PUBLIC CEC_Init
        PUBLIC CEC_ListenModeCmd
        PUBLIC CEC_OwnAddressClear
        PUBLIC CEC_OwnAddressConfig
        PUBLIC CEC_ReceiveData
        PUBLIC CEC_SendData
        PUBLIC CEC_StartOfMessage
        PUBLIC CEC_StructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+23       ;; #+1073741824
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_Init:
        MOVS     R2,#+0
        LDR      R1,??DataTable13  ;; 0x40007804
        LDR      R1,[R1, #+0]
        MOVS     R2,R1
        MOVS     R1,R2
        LDR      R2,??DataTable13_1  ;; 0x7000fe00
        ANDS     R2,R2,R1
        MOVS     R1,R2
        LDR      R2,[R0, #+0]
        LDR      R3,[R0, #+4]
        ORRS     R3,R3,R2
        LDR      R2,[R0, #+8]
        ORRS     R2,R2,R3
        LDR      R3,[R0, #+12]
        ORRS     R3,R3,R2
        LDR      R2,[R0, #+16]
        ORRS     R2,R2,R3
        LDR      R3,[R0, #+20]
        ORRS     R3,R3,R2
        LDR      R2,[R0, #+24]
        ORRS     R2,R2,R3
        ORRS     R2,R2,R1
        LDR      R1,??DataTable13  ;; 0x40007804
        STR      R2,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_StructInit:
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
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_Cmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??CEC_Cmd_0
        LDR      R1,??DataTable13_2  ;; 0x40007800
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        ORRS     R2,R2,R1
        LDR      R1,??DataTable13_2  ;; 0x40007800
        STR      R2,[R1, #+0]
        B        ??CEC_Cmd_1
??CEC_Cmd_0:
        LDR      R1,??DataTable13_2  ;; 0x40007800
        LDR      R1,[R1, #+0]
        MOVS     R2,#+1
        BICS     R1,R1,R2
        LDR      R2,??DataTable13_2  ;; 0x40007800
        STR      R1,[R2, #+0]
??CEC_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ListenModeCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??CEC_ListenModeCmd_0
        LDR      R1,??DataTable13  ;; 0x40007804
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        LSLS     R2,R2,#+24       ;; #-2147483648
        ORRS     R2,R2,R1
        LDR      R1,??DataTable13  ;; 0x40007804
        STR      R2,[R1, #+0]
        B        ??CEC_ListenModeCmd_1
??CEC_ListenModeCmd_0:
        LDR      R1,??DataTable13  ;; 0x40007804
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+1        ;; ZeroExtS R1,R1,#+1,#+1
        LSRS     R1,R1,#+1
        LDR      R2,??DataTable13  ;; 0x40007804
        STR      R1,[R2, #+0]
??CEC_ListenModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_OwnAddressConfig:
        MOVS     R1,R0
        MOVS     R2,#+0
        MOVS     R3,#+1
        MOVS     R0,R1
        ADDS     R0,R0,#+16
        LSLS     R3,R3,R0
        MOVS     R2,R3
        LDR      R0,??DataTable13  ;; 0x40007804
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,R2
        LDR      R3,??DataTable13  ;; 0x40007804
        STR      R0,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_OwnAddressClear:
        MOVS     R0,#+0
        LDR      R1,??DataTable13  ;; 0x40007804
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_SendData:
        UXTB     R0,R0
        LDR      R1,??DataTable13_3  ;; 0x40007808
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ReceiveData:
        LDR      R0,??DataTable13_4  ;; 0x4000780c
        LDR      R0,[R0, #+0]
        UXTB     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_StartOfMessage:
        LDR      R0,??DataTable13_2  ;; 0x40007800
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_2  ;; 0x40007800
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_EndOfMessage:
        LDR      R0,??DataTable13_2  ;; 0x40007800
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_2  ;; 0x40007800
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ITConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??CEC_ITConfig_0
        LDR      R2,??DataTable13_5  ;; 0x40007814
        LDR      R2,[R2, #+0]
        UXTH     R0,R0
        ORRS     R2,R2,R0
        LDR      R3,??DataTable13_5  ;; 0x40007814
        STR      R2,[R3, #+0]
        B        ??CEC_ITConfig_1
??CEC_ITConfig_0:
        MOVS     R2,R0
        UXTH     R2,R2
        MVNS     R0,R2
        LDR      R2,??DataTable13_5  ;; 0x40007814
        LDR      R2,[R2, #+0]
        UXTH     R0,R0
        ANDS     R2,R2,R0
        LDR      R3,??DataTable13_5  ;; 0x40007814
        STR      R2,[R3, #+0]
??CEC_ITConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_GetFlagStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable13_6  ;; 0x40007810
        LDR      R2,[R2, #+0]
        UXTH     R1,R1
        ANDS     R2,R2,R1
        CMP      R2,#+0
        BEQ      ??CEC_GetFlagStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??CEC_GetFlagStatus_1
??CEC_GetFlagStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??CEC_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ClearFlag:
        LDR      R1,??DataTable13_6  ;; 0x40007810
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_GetITStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        MOVS     R2,#+0
        LDR      R3,??DataTable13_5  ;; 0x40007814
        LDR      R3,[R3, #+0]
        UXTH     R1,R1
        ANDS     R3,R3,R1
        MOVS     R2,R3
        LDR      R3,??DataTable13_6  ;; 0x40007810
        LDR      R3,[R3, #+0]
        UXTH     R1,R1
        ANDS     R3,R3,R1
        CMP      R3,#+0
        BEQ      ??CEC_GetITStatus_0
        CMP      R2,#+0
        BEQ      ??CEC_GetITStatus_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B        ??CEC_GetITStatus_1
??CEC_GetITStatus_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??CEC_GetITStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ClearITPendingBit:
        UXTH     R0,R0
        LDR      R1,??DataTable13_6  ;; 0x40007810
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x40007804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0x7000fe00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     0x40007800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     0x40007808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     0x4000780c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     0x40007814

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     0x40007810

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
// 420 bytes in section .text
// 
// 420 bytes of CODE memory
//
//Errors: none
//Warnings: none

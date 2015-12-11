///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:29:36
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_cec.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_cec.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_cec.s
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
        LDR      R0,??DataTable13  ;; 0x40007804
        STR      R2,[R0, #+0]
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
        LDR      R0,??DataTable13_2  ;; 0x40007800
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_2  ;; 0x40007800
        STR      R1,[R0, #+0]
        B        ??CEC_Cmd_1
??CEC_Cmd_0:
        LDR      R0,??DataTable13_2  ;; 0x40007800
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_2  ;; 0x40007800
        STR      R0,[R1, #+0]
??CEC_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_ListenModeCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??CEC_ListenModeCmd_0
        LDR      R0,??DataTable13  ;; 0x40007804
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13  ;; 0x40007804
        STR      R1,[R0, #+0]
        B        ??CEC_ListenModeCmd_1
??CEC_ListenModeCmd_0:
        LDR      R0,??DataTable13  ;; 0x40007804
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+1        ;; ZeroExtS R0,R0,#+1,#+1
        LSRS     R0,R0,#+1
        LDR      R1,??DataTable13  ;; 0x40007804
        STR      R0,[R1, #+0]
??CEC_ListenModeCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CEC_OwnAddressConfig:
        MOVS     R1,#+0
        MOVS     R2,#+1
        ADDS     R0,R0,#+16
        LSLS     R2,R2,R0
        MOVS     R1,R2
        LDR      R0,??DataTable13  ;; 0x40007804
        LDR      R0,[R0, #+0]
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13  ;; 0x40007804
        STR      R1,[R0, #+0]
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
        LDR      R1,??DataTable13_5  ;; 0x40007814
        LDR      R1,[R1, #+0]
        UXTH     R0,R0
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_5  ;; 0x40007814
        STR      R1,[R0, #+0]
        B        ??CEC_ITConfig_1
??CEC_ITConfig_0:
        MOVS     R1,R0
        UXTH     R1,R1
        MVNS     R0,R1
        LDR      R1,??DataTable13_5  ;; 0x40007814
        LDR      R1,[R1, #+0]
        UXTH     R0,R0
        ANDS     R1,R1,R0
        LDR      R0,??DataTable13_5  ;; 0x40007814
        STR      R1,[R0, #+0]
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
        MOVS     R0,#+1
        B        ??CEC_GetFlagStatus_1
??CEC_GetFlagStatus_0:
        MOVS     R0,#+0
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
        MOVS     R0,#+1
        B        ??CEC_GetITStatus_1
??CEC_GetITStatus_0:
        MOVS     R0,#+0
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
// 408 bytes in section .text
// 
// 408 bytes of CODE memory
//
//Errors: none
//Warnings: none

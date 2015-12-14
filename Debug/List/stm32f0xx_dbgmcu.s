///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:19
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_dbgmcu.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_dbgmcu.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
//        G:\gitclone\lamp_project_slave\Debug\List\ --diag_suppress Pa050 -o
//        G:\gitclone\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        G:\gitclone\lamp_project_slave\APP\ -I
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\CoreSupport\ -I
//        G:\gitclone\lamp_project_slave\core\ -I
//        G:\gitclone\lamp_project_slave\core\sys\ -I
//        G:\gitclone\lamp_project_slave\platform\ -I
//        G:\gitclone\lamp_project_slave\core\lib\ -I
//        G:\gitclone\lamp_project_slave\tools\wpcapslip\ -I
//        G:\gitclone\lamp_project_slave\core\cfs\ -I
//        G:\gitclone\lamp_project_slave\OLED\ -I
//        G:\gitclone\lamp_project_slave\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  
//        G:\gitclone\lamp_project_slave\Debug\List\stm32f0xx_dbgmcu.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC DBGMCU_APB1PeriphConfig
        PUBLIC DBGMCU_APB2PeriphConfig
        PUBLIC DBGMCU_Config
        PUBLIC DBGMCU_GetDEVID
        PUBLIC DBGMCU_GetREVID


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DBGMCU_GetREVID:
        LDR      R0,??DataTable4  ;; 0x40015800
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DBGMCU_GetDEVID:
        LDR      R0,??DataTable4  ;; 0x40015800
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+20       ;; ZeroExtS R0,R0,#+20,#+20
        LSRS     R0,R0,#+20
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DBGMCU_Config:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??DBGMCU_Config_0
        LDR      R2,??DataTable4_1  ;; 0x40015804
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable4_1  ;; 0x40015804
        STR      R2,[R3, #+0]
        B        ??DBGMCU_Config_1
??DBGMCU_Config_0:
        LDR      R2,??DataTable4_1  ;; 0x40015804
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable4_1  ;; 0x40015804
        STR      R2,[R3, #+0]
??DBGMCU_Config_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DBGMCU_APB1PeriphConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??DBGMCU_APB1PeriphConfig_0
        LDR      R2,??DataTable4_2  ;; 0x40015808
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable4_2  ;; 0x40015808
        STR      R2,[R3, #+0]
        B        ??DBGMCU_APB1PeriphConfig_1
??DBGMCU_APB1PeriphConfig_0:
        LDR      R2,??DataTable4_2  ;; 0x40015808
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable4_2  ;; 0x40015808
        STR      R2,[R3, #+0]
??DBGMCU_APB1PeriphConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DBGMCU_APB2PeriphConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??DBGMCU_APB2PeriphConfig_0
        LDR      R2,??DataTable4_3  ;; 0x4001580c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,R0
        LDR      R3,??DataTable4_3  ;; 0x4001580c
        STR      R2,[R3, #+0]
        B        ??DBGMCU_APB2PeriphConfig_1
??DBGMCU_APB2PeriphConfig_0:
        LDR      R2,??DataTable4_3  ;; 0x4001580c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR      R3,??DataTable4_3  ;; 0x4001580c
        STR      R2,[R3, #+0]
??DBGMCU_APB2PeriphConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40015800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40015804

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x40015808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x4001580c

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
// 130 bytes in section .text
// 
// 130 bytes of CODE memory
//
//Errors: none
//Warnings: none

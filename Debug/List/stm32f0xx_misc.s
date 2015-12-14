///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:19
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_misc.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_misc.c
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
//        F:\cloneSlave\lamp_project_slave\Debug\List\stm32f0xx_misc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC NVIC_Init
        PUBLIC NVIC_SystemLPConfig
        PUBLIC SysTick_CLKSourceConfig


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_Init:
        PUSH     {R4,LR}
        MOVS     R1,#+0
        LDRB     R2,[R0, #+2]
        CMP      R2,#+0
        BEQ      ??NVIC_Init_0
        LDRB     R2,[R0, #+0]
        ASRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable2  ;; 0xe000e400
        LDR      R2,[R3, R2]
        MOVS     R1,R2
        MOVS     R2,#+255
        LDRB     R3,[R0, #+0]
        LSLS     R3,R3,#+30       ;; ZeroExtS R3,R3,#+30,#+30
        LSRS     R3,R3,#+30
        MOVS     R4,#+8
        MULS     R3,R4,R3
        LSLS     R2,R2,R3
        BICS     R1,R1,R2
        MOVS     R4,R1
        LDRB     R1,[R0, #+1]
        LSLS     R1,R1,#+6
        UXTB     R1,R1
        LDRB     R2,[R0, #+0]
        LSLS     R2,R2,#+30       ;; ZeroExtS R2,R2,#+30,#+30
        LSRS     R2,R2,#+30
        MOVS     R3,#+8
        MULS     R2,R3,R2
        LSLS     R1,R1,R2
        ORRS     R1,R1,R4
        LDRB     R2,[R0, #+0]
        ASRS     R2,R2,#+2
        MOVS     R3,#+4
        MULS     R2,R3,R2
        LDR      R3,??DataTable2  ;; 0xe000e400
        STR      R1,[R3, R2]
        MOVS     R2,#+1
        LDRB     R3,[R0, #+0]
        LSLS     R3,R3,#+27       ;; ZeroExtS R3,R3,#+27,#+27
        LSRS     R3,R3,#+27
        LSLS     R2,R2,R3
        LDR      R3,??DataTable2_1  ;; 0xe000e100
        STR      R2,[R3, #+0]
        B        ??NVIC_Init_1
??NVIC_Init_0:
        MOVS     R2,#+1
        LDRB     R3,[R0, #+0]
        LSLS     R3,R3,#+27       ;; ZeroExtS R3,R3,#+27,#+27
        LSRS     R3,R3,#+27
        LSLS     R2,R2,R3
        LDR      R3,??DataTable2_2  ;; 0xe000e180
        STR      R2,[R3, #+0]
??NVIC_Init_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NVIC_SystemLPConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??NVIC_SystemLPConfig_0
        LDR      R2,??DataTable2_3  ;; 0xe000ed10
        LDR      R2,[R2, #+0]
        UXTB     R0,R0
        ORRS     R2,R2,R0
        LDR      R3,??DataTable2_3  ;; 0xe000ed10
        STR      R2,[R3, #+0]
        B        ??NVIC_SystemLPConfig_1
??NVIC_SystemLPConfig_0:
        LDR      R2,??DataTable2_3  ;; 0xe000ed10
        LDR      R2,[R2, #+0]
        UXTB     R0,R0
        BICS     R2,R2,R0
        LDR      R3,??DataTable2_3  ;; 0xe000ed10
        STR      R2,[R3, #+0]
??NVIC_SystemLPConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_CLKSourceConfig:
        PUSH     {LR}
        CMP      R0,#+4
        BNE      ??SysTick_CLKSourceConfig_0
        LDR      R1,??DataTable2_4  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        ORRS     R2,R2,R1
        LDR      R1,??DataTable2_4  ;; 0xe000e010
        STR      R2,[R1, #+0]
        B        ??SysTick_CLKSourceConfig_1
??SysTick_CLKSourceConfig_0:
        LDR      R1,??DataTable2_4  ;; 0xe000e010
        LDR      R1,[R1, #+0]
        MOVS     R2,#+4
        BICS     R1,R1,R2
        LDR      R2,??DataTable2_4  ;; 0xe000e010
        STR      R1,[R2, #+0]
??SysTick_CLKSourceConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0xe000ed10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0xe000e010

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
// 196 bytes in section .text
// 
// 196 bytes of CODE memory
//
//Errors: none
//Warnings: none

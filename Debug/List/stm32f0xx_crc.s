///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:16
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_crc.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_crc.c
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
//        F:\cloneSlave\lamp_project_slave\Debug\List\stm32f0xx_crc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC CRC_CalcBlockCRC
        PUBLIC CRC_CalcCRC
        PUBLIC CRC_DeInit
        PUBLIC CRC_GetCRC
        PUBLIC CRC_GetIDRegister
        PUBLIC CRC_ResetDR
        PUBLIC CRC_ReverseInputDataSelect
        PUBLIC CRC_ReverseOutputDataCmd
        PUBLIC CRC_SetIDRegister
        PUBLIC CRC_SetInitRegister


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_DeInit:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??DataTable9  ;; 0x40023000
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable9_1  ;; 0x40023004
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
        LDR      R1,??DataTable9_2  ;; 0x40023010
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR      R1,??DataTable9_3  ;; 0x40023008
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_ResetDR:
        MOVS     R0,#+1
        LDR      R1,??DataTable9_3  ;; 0x40023008
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_ReverseInputDataSelect:
        MOVS     R1,#+0
        LDR      R2,??DataTable9_3  ;; 0x40023008
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+96
        BICS     R1,R1,R2
        ORRS     R1,R1,R0
        LDR      R2,??DataTable9_3  ;; 0x40023008
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_ReverseOutputDataCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??CRC_ReverseOutputDataCmd_0
        LDR      R1,??DataTable9_3  ;; 0x40023008
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        ORRS     R2,R2,R1
        LDR      R1,??DataTable9_3  ;; 0x40023008
        STR      R2,[R1, #+0]
        B        ??CRC_ReverseOutputDataCmd_1
??CRC_ReverseOutputDataCmd_0:
        LDR      R1,??DataTable9_3  ;; 0x40023008
        LDR      R1,[R1, #+0]
        MOVS     R2,#+128
        BICS     R1,R1,R2
        LDR      R2,??DataTable9_3  ;; 0x40023008
        STR      R1,[R2, #+0]
??CRC_ReverseOutputDataCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_SetInitRegister:
        LDR      R1,??DataTable9_2  ;; 0x40023010
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_CalcCRC:
        MOVS     R1,R0
        LDR      R0,??DataTable9  ;; 0x40023000
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable9  ;; 0x40023000
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_CalcBlockCRC:
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R3,#+0
        MOVS     R0,#+0
        MOVS     R3,R0
??CRC_CalcBlockCRC_0:
        CMP      R3,R1
        BCS      ??CRC_CalcBlockCRC_1
        MOVS     R0,#+4
        MULS     R0,R3,R0
        LDR      R0,[R2, R0]
        LDR      R4,??DataTable9  ;; 0x40023000
        STR      R0,[R4, #+0]
        ADDS     R3,R3,#+1
        B        ??CRC_CalcBlockCRC_0
??CRC_CalcBlockCRC_1:
        LDR      R0,??DataTable9  ;; 0x40023000
        LDR      R0,[R0, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_GetCRC:
        LDR      R0,??DataTable9  ;; 0x40023000
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_SetIDRegister:
        LDR      R1,??DataTable9_1  ;; 0x40023004
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
CRC_GetIDRegister:
        LDR      R0,??DataTable9_1  ;; 0x40023004
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x40023000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x40023004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x40023010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x40023008

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
// 182 bytes in section .text
// 
// 182 bytes of CODE memory
//
//Errors: none
//Warnings: none

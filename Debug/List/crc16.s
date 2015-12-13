///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       13/Dec/2015  23:36:16
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\core\lib\crc16.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\core\lib\crc16.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\crc16.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC crc16_add
        PUBLIC crc16_data


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
crc16_add:
        MOVS     R2,R0
        MOVS     R0,R1
        UXTB     R2,R2
        EORS     R0,R0,R2
        MOVS     R1,R0
        UXTH     R1,R1
        LSRS     R1,R1,#+8
        LSLS     R0,R0,#+8
        ORRS     R0,R0,R1
        MOVS     R1,#+255
        LSLS     R1,R1,#+8        ;; #+65280
        ANDS     R1,R1,R0
        LSLS     R1,R1,#+4
        EORS     R1,R1,R0
        MOVS     R0,R1
        MOVS     R1,R0
        UXTH     R1,R1
        LSRS     R1,R1,#+8
        UXTB     R1,R1
        LSRS     R1,R1,#+4
        UXTB     R1,R1
        EORS     R1,R1,R0
        MOVS     R0,R1
        MOVS     R1,R0
        UXTH     R1,R1
        LSRS     R1,R1,#+5
        MOVS     R3,#+255
        LSLS     R3,R3,#+3        ;; #+2040
        ANDS     R3,R3,R1
        EORS     R3,R3,R0
        MOVS     R0,R3
        UXTH     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
crc16_data:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R6,R2
        MOVS     R0,#+0
        MOVS     R5,R0
??crc16_data_0:
        CMP      R5,R7
        BGE      ??crc16_data_1
        MOVS     R1,R6
        UXTH     R1,R1
        LDRB     R0,[R4, #+0]
        BL       crc16_add
        MOVS     R6,R0
        ADDS     R4,R4,#+1
        ADDS     R5,R5,#+1
        B        ??crc16_data_0
??crc16_data_1:
        MOVS     R0,R6
        UXTH     R0,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 106 bytes in section .text
// 
// 106 bytes of CODE memory
//
//Errors: none
//Warnings: none

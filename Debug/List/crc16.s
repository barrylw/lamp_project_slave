///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:14
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\core\lib\crc16.c
//    Command line =  
//        E:\svnProject\street_lamp_new\core\lib\crc16.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -lb E:\svnProject\street_lamp_new\Debug\List\
//        --diag_suppress Pa050 -o E:\svnProject\street_lamp_new\Debug\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0 -e --fpu=None --dlib_config "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        E:\svnProject\street_lamp_new\APP\ -I
//        E:\svnProject\street_lamp_new\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        E:\svnProject\street_lamp_new\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I E:\svnProject\street_lamp_new\LIB\CMSIS\CM0\CoreSupport\ -I
//        E:\svnProject\street_lamp_new\core\ -I
//        E:\svnProject\street_lamp_new\core\sys\ -I
//        E:\svnProject\street_lamp_new\platform\ -I
//        E:\svnProject\street_lamp_new\core\lib\ -I
//        E:\svnProject\street_lamp_new\tools\wpcapslip\ -I
//        E:\svnProject\street_lamp_new\core\cfs\ -I
//        E:\svnProject\street_lamp_new\OLED\ -I
//        E:\svnProject\street_lamp_new\coffee_arch\ -Ol -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\crc16.s
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
        MOVS     R2,#+255
        LSLS     R2,R2,#+3        ;; #+2040
        ANDS     R2,R2,R1
        EORS     R2,R2,R0
        MOVS     R0,R2
        UXTH     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
crc16_data:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R0,R2
        MOVS     R5,#+0
        B        ??crc16_data_0
??crc16_data_1:
        MOVS     R1,R0
        UXTH     R1,R1
        LDRB     R0,[R4, #+0]
        BL       crc16_add
        ADDS     R4,R4,#+1
        ADDS     R5,R5,#+1
??crc16_data_0:
        CMP      R5,R6
        BLT      ??crc16_data_1
        UXTH     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 100 bytes in section .text
// 
// 100 bytes of CODE memory
//
//Errors: none
//Warnings: none
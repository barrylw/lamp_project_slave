///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:14
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\core\lib\ringbuf.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\core\lib\ringbuf.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
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
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\ringbuf.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC ringbuf_elements
        PUBLIC ringbuf_get
        PUBLIC ringbuf_init
        PUBLIC ringbuf_put
        PUBLIC ringbuf_size


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ringbuf_init:
        STR      R1,[R0, #+0]
        SUBS     R3,R2,#+1
        STRB     R3,[R0, #+4]
        MOVS     R3,#+0
        STRB     R3,[R0, #+5]
        MOVS     R3,#+0
        STRB     R3,[R0, #+6]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ringbuf_put:
        PUSH     {LR}
        MOVS     R2,R0
        LDRB     R0,[R2, #+5]
        LDRB     R3,[R2, #+6]
        SUBS     R0,R0,R3
        LDRB     R3,[R2, #+4]
        ANDS     R3,R3,R0
        LDRB     R0,[R2, #+4]
        CMP      R3,R0
        BNE      ??ringbuf_put_0
        MOVS     R0,#+0
        B        ??ringbuf_put_1
??ringbuf_put_0:
        LDRB     R0,[R2, #+5]
        LDR      R3,[R2, #+0]
        STRB     R1,[R3, R0]
        LDRB     R0,[R2, #+5]
        ADDS     R0,R0,#+1
        LDRB     R3,[R2, #+4]
        ANDS     R3,R3,R0
        STRB     R3,[R2, #+5]
        MOVS     R0,#+1
??ringbuf_put_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ringbuf_get:
        PUSH     {LR}
        MOVS     R1,R0
        LDRB     R0,[R1, #+5]
        LDRB     R3,[R1, #+6]
        SUBS     R0,R0,R3
        LDRB     R3,[R1, #+4]
        ANDS     R3,R3,R0
        CMP      R3,#+1
        BLT      ??ringbuf_get_0
        LDRB     R0,[R1, #+6]
        LDR      R3,[R1, #+0]
        LDRB     R0,[R3, R0]
        MOVS     R2,R0
        LDRB     R0,[R1, #+6]
        ADDS     R0,R0,#+1
        LDRB     R3,[R1, #+4]
        ANDS     R3,R3,R0
        STRB     R3,[R1, #+6]
        UXTB     R2,R2
        MOVS     R0,R2
        B        ??ringbuf_get_1
??ringbuf_get_0:
        MOVS     R0,#+0
        MVNS     R0,R0            ;; #-1
??ringbuf_get_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ringbuf_size:
        LDRB     R0,[R0, #+4]
        ADDS     R0,R0,#+1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ringbuf_elements:
        LDRB     R1,[R0, #+5]
        LDRB     R2,[R0, #+6]
        SUBS     R1,R1,R2
        LDRB     R0,[R0, #+4]
        ANDS     R0,R0,R1
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
// 126 bytes in section .text
// 
// 126 bytes of CODE memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:27
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\core\lib\ringbuf.c
//    Command line =  
//        E:\svnProject\street_lamp_new\core\lib\ringbuf.c -D
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\ringbuf.s
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
        SUBS     R1,R2,#+1
        STRB     R1,[R0, #+4]
        MOVS     R1,#+0
        STRB     R1,[R0, #+5]
        MOVS     R1,#+0
        STRB     R1,[R0, #+6]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ringbuf_put:
        PUSH     {LR}
        LDRB     R2,[R0, #+5]
        LDRB     R3,[R0, #+6]
        SUBS     R2,R2,R3
        LDRB     R3,[R0, #+4]
        ANDS     R3,R3,R2
        LDRB     R2,[R0, #+4]
        CMP      R3,R2
        BNE      ??ringbuf_put_0
        MOVS     R0,#+0
        B        ??ringbuf_put_1
??ringbuf_put_0:
        LDRB     R2,[R0, #+5]
        LDR      R3,[R0, #+0]
        STRB     R1,[R3, R2]
        LDRB     R1,[R0, #+5]
        ADDS     R1,R1,#+1
        LDRB     R2,[R0, #+4]
        ANDS     R2,R2,R1
        STRB     R2,[R0, #+5]
        MOVS     R0,#+1
??ringbuf_put_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ringbuf_get:
        PUSH     {LR}
        LDRB     R1,[R0, #+5]
        LDRB     R2,[R0, #+6]
        SUBS     R1,R1,R2
        LDRB     R2,[R0, #+4]
        ANDS     R2,R2,R1
        CMP      R2,#+1
        BLT      ??ringbuf_get_0
        LDRB     R1,[R0, #+6]
        LDR      R2,[R0, #+0]
        LDRB     R1,[R2, R1]
        LDRB     R2,[R0, #+6]
        ADDS     R2,R2,#+1
        LDRB     R3,[R0, #+4]
        ANDS     R3,R3,R2
        STRB     R3,[R0, #+6]
        UXTB     R1,R1
        MOVS     R0,R1
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
// 120 bytes in section .text
// 
// 120 bytes of CODE memory
//
//Errors: none
//Warnings: none

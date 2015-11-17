///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:21:08
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\NWK.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\NWK.c -D USE_STDPERIPH_DRIVER -D
//        STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -D USE_LORA_MODE -lb
//        E:\svnProject\street_lamp_new\Debug\List\ --diag_suppress Pa050 -o
//        E:\svnProject\street_lamp_new\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
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
//        E:\svnProject\street_lamp_new\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\NWK.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_idivmod
        EXTERN w_memcpy
        EXTERN w_memset

        PUBLIC PHY_data_indication
        PUBLIC compress_addr_list
        PUBLIC dempress_addr_list


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
nwk_frame:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
nwk_length:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
compress_addr_list:
        PUSH     {R1,R4-R7,LR}
        SUB      SP,SP,#+16
        MOVS     R5,R0
        MOVS     R6,R2
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
        MOVS     R4,R6
        MOVS     R2,#+6
        MOVS     R1,R5
        MOVS     R0,R4
        BL       w_memcpy
        ADDS     R4,R4,#+6
        MOVS     R7,#+0
??compress_addr_list_0:
        UXTB     R7,R7
        MOV      R0,SP
        LDRB     R0,[R0, #+16]
        SUBS     R0,R0,#+6
        CMP      R7,R0
        BGE      ??compress_addr_list_1
        UXTB     R7,R7
        LDRB     R0,[R5, R7]
        UXTB     R7,R7
        ADDS     R1,R5,R7
        LDRB     R1,[R1, #+6]
        EORS     R1,R1,R0
        LSLS     R0,R1,#+1
        STR      R0,[SP, #+0]
        UXTB     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+6
        BL       __aeabi_idivmod
        ADD      R2,SP,#+4
        LDR      R0,[SP, #+0]
        STRB     R0,[R2, R1]
        UXTB     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+6
        BL       __aeabi_idivmod
        CMP      R1,#+5
        BNE      ??compress_addr_list_2
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+5]
        ADDS     R0,R0,#+1
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
??compress_addr_list_3:
        UXTB     R0,R0
        CMP      R0,#+6
        BGE      ??compress_addr_list_2
        UXTB     R0,R0
        ADD      R1,SP,#+4
        LDRB     R1,[R1, R0]
        CMP      R1,#+0
        BEQ      ??compress_addr_list_4
        UXTB     R0,R0
        ADD      R1,SP,#+4
        LDRB     R1,[R1, R0]
        STRB     R1,[R4, #+0]
        ADDS     R4,R4,#+1
??compress_addr_list_4:
        ADDS     R0,R0,#+1
        B        ??compress_addr_list_3
??compress_addr_list_2:
        ADDS     R7,R7,#+1
        B        ??compress_addr_list_0
??compress_addr_list_1:
        SUBS     R0,R4,R6
        UXTB     R0,R0
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dempress_addr_list:
        PUSH     {R0,R1,R3-R7,LR}
        SUB      SP,SP,#+16
        MOVS     R6,R2
        ADD      R0,SP,#+4
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
        MOVS     R4,#+0
        MOVS     R0,#+5
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        LDR      R5,[SP, #+20]
        ADDS     R6,R6,#+1
        MOVS     R2,#+6
        LDR      R1,[SP, #+16]
        LDR      R0,[SP, #+20]
        BL       w_memcpy
        ADDS     R5,R5,#+6
        MOVS     R0,#+0
??dempress_addr_list_0:
        UXTB     R0,R0
        LDR      R1,[SP, #+16]
        ADDS     R1,R1,R0
        LDRB     R1,[R1, #+6]
        LSLS     R1,R1,#+31
        BPL      ??dempress_addr_list_1
        SUBS     R6,R6,#+1
        UXTB     R6,R6
        CMP      R6,#+0
        BNE      ??dempress_addr_list_1
        ADDS     R0,R0,#+7
        LDR      R1,[SP, #+24]
        STRB     R0,[R1, #+0]
        MOVS     R7,#+6
        B        ??dempress_addr_list_2
??dempress_addr_list_1:
        ADDS     R0,R0,#+1
        B        ??dempress_addr_list_0
??dempress_addr_list_2:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+0]
        CMP      R7,R0
        BGE      ??dempress_addr_list_3
        LDR      R0,[SP, #+16]
        LDRB     R0,[R0, R7]
        LSLS     R0,R0,#+31
        BPL      ??dempress_addr_list_4
        MOVS     R0,#+0
        MOVS     R4,R0
        MOVS     R0,R7
??dempress_addr_list_5:
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0
        CMP      R1,R0
        BCS      ??dempress_addr_list_6
        UXTB     R0,R0
        LDR      R1,[SP, #+16]
        LDRB     R1,[R1, R0]
        UXTB     R4,R4
        RSBS     R2,R4,#+0
        ADD      R3,SP,#+4
        ADDS     R2,R3,R2
        STRB     R1,[R2, #+5]
        UXTB     R4,R4
        RSBS     R1,R4,#+0
        ADD      R2,SP,#+4
        ADDS     R1,R2,R1
        LDRB     R1,[R1, #+5]
        UXTB     R1,R1
        LSRS     R1,R1,#+1
        UXTB     R4,R4
        RSBS     R2,R4,#+0
        ADD      R3,SP,#+4
        ADDS     R2,R3,R2
        STRB     R1,[R2, #+5]
        ADDS     R4,R4,#+1
        SUBS     R0,R0,#+1
        B        ??dempress_addr_list_5
??dempress_addr_list_6:
        MOVS     R0,#+0
??dempress_addr_list_7:
        UXTB     R0,R0
        CMP      R0,#+6
        BGE      ??dempress_addr_list_8
        SUBS     R1,R5,#+6
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0
        ADD      R2,SP,#+4
        LDRB     R2,[R2, R0]
        EORS     R2,R2,R1
        STRB     R2,[R5, #+0]
        ADDS     R5,R5,#+1
        ADDS     R0,R0,#+1
        B        ??dempress_addr_list_7
??dempress_addr_list_8:
        MOVS     R0,R7
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R2,#+6
        MOVS     R1,#+0
        ADD      R0,SP,#+4
        BL       w_memset
??dempress_addr_list_4:
        ADDS     R7,R7,#+1
        B        ??dempress_addr_list_2
??dempress_addr_list_3:
        LDR      R0,[SP, #+20]
        SUBS     R0,R5,R0
        UXTB     R0,R0
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PHY_data_indication:
        LDR      R2,??DataTable0
        STR      R0,[R2, #+0]
        MOVS     R2,R1
        LDR      R3,??DataTable0_1
        STRB     R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     nwk_frame

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     nwk_length

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        END
// 
//   5 bytes in section .bss
//  16 bytes in section .rodata
// 378 bytes in section .text
// 
// 378 bytes of CODE  memory
//  16 bytes of CONST memory
//   5 bytes of DATA  memory
//
//Errors: none
//Warnings: 5

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       30/Nov/2015  10:27:10
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

        EXTERN APL_data_indication
        EXTERN __aeabi_idivmod
        EXTERN printf
        EXTERN w_memcpy
        EXTERN w_memset

        PUBLIC NWK_data_indication
        PUBLIC NWK_init
        PUBLIC cmp_addr
        PUBLIC cmp_buf
        PUBLIC compress_addr_list
        PUBLIC dempress_addr_list
        PUBLIC last_info
        PUBLIC local_addr
        PUBLIC nwk_frame_ptr


        SECTION `.data`:DATA:REORDER:NOROOT(1)
LOCAL_NID:
        DATA
        DC8 18, 52

        SECTION `.data`:DATA:REORDER:NOROOT(1)
broadcast_addr:
        DATA
        DC8 255, 255

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
nwk_frame_buf:
        DS8 48

        SECTION `.data`:DATA:REORDER:NOROOT(2)
nwk_frame_ptr:
        DATA
        DC32 nwk_frame_buf

        SECTION `.data`:DATA:REORDER:NOROOT(2)
last_info:
        DATA
        DC8 2, 255, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
local_addr:
        DATA
        DC8 1, 2, 3, 4, 5, 6, 7, 8

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
cmp_buf:
        PUSH     {R4,R5,LR}
        MOVS     R3,R0
        MOVS     R0,#+0
??cmp_buf_0:
        UXTB     R0,R0
        UXTB     R2,R2
        CMP      R0,R2
        BCS      ??cmp_buf_1
        UXTB     R0,R0
        LDRB     R4,[R3, R0]
        UXTB     R0,R0
        LDRB     R5,[R1, R0]
        CMP      R4,R5
        BEQ      ??cmp_buf_2
        MOVS     R0,#+0
        B        ??cmp_buf_3
??cmp_buf_2:
        ADDS     R0,R0,#+1
        B        ??cmp_buf_0
??cmp_buf_1:
        MOVS     R0,#+1
??cmp_buf_3:
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cmp_addr:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        UXTB     R5,R5
        CMP      R5,#+2
        BNE      ??cmp_addr_0
        MOVS     R2,#+2
        LDR      R1,??DataTable1
        MOVS     R0,R4
        BL       cmp_buf
        CMP      R0,#+0
        BNE      ??cmp_addr_1
        MOVS     R2,#+2
        LDR      R1,??DataTable1_1
        MOVS     R0,R4
        BL       cmp_buf
        CMP      R0,#+0
        BNE      ??cmp_addr_2
        MOVS     R0,#+0
        B        ??cmp_addr_3
??cmp_addr_2:
        MOVS     R0,#+1
??cmp_addr_3:
        UXTB     R0,R0
        B        ??cmp_addr_4
??cmp_addr_1:
        MOVS     R0,#+1
        B        ??cmp_addr_4
??cmp_addr_0:
        UXTB     R5,R5
        CMP      R5,#+6
        BNE      ??cmp_addr_5
        MOVS     R2,#+6
        LDR      R1,??DataTable1_2
        MOVS     R0,R4
        BL       cmp_buf
        B        ??cmp_addr_4
??cmp_addr_5:
        MOVS     R0,#+0
??cmp_addr_4:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
NWK_init:
        PUSH     {R7,LR}
        MOVS     R2,#+47
        MOVS     R1,#+0
        LDR      R0,??DataTable1_3
        BL       w_memset
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     local_addr+0x6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     broadcast_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     local_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     nwk_frame_buf

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
NWK_data_indication:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+4
        MOVS     R4,#+0
        MOVS     R6,#+0
        MOVS     R2,#+5
        LDR      R1,[SP, #+4]
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        BL       w_memcpy
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        MOVS     R4,R0
        MOVS     R2,#+2
        LDR      R1,??DataTable2
        MOVS     R0,R4
        ADDS     R0,R0,#+3
        BL       cmp_buf
        CMP      R0,#+0
        BNE      ??NWK_data_indication_1
        MOVS     R2,#+2
        LDR      R1,??DataTable2_1
        MOVS     R0,R4
        ADDS     R0,R0,#+3
        BL       cmp_buf
        CMP      R0,#+0
        BNE      ??NWK_data_indication_1
        LDR      R0,??DataTable2_2
        BL       printf
        B        ??NWK_data_indication_2
??NWK_data_indication_1:
        LDRB     R0,[R4, #+2]
        LDR      R1,??DataTable2_3
        STRB     R0,[R1, #+1]
        LDRB     R0,[R4, #+1]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        LDR      R1,??DataTable2_3
        STRB     R0,[R1, #+0]
        LDRB     R0,[R4, #+0]
        LSLS     R1,R0,#+30       ;; ZeroExtS R1,R0,#+30,#+30
        LSRS     R1,R1,#+30
        LDR      R0,??DataTable2_4
        BL       printf
        LDRB     R0,[R4, #+0]
        MOVS     R1,R0
        LSLS     R1,R1,#+29       ;; ZeroExtS R1,R1,#+29,#+31
        LSRS     R1,R1,#+31
        LDR      R0,??DataTable2_5
        BL       printf
        LDRB     R0,[R4, #+0]
        MOVS     R1,R0
        LSLS     R1,R1,#+28       ;; ZeroExtS R1,R1,#+28,#+31
        LSRS     R1,R1,#+31
        LDR      R0,??DataTable2_6
        BL       printf
        LDRB     R0,[R4, #+0]
        MOVS     R1,R0
        LSLS     R1,R1,#+26       ;; ZeroExtS R1,R1,#+26,#+31
        LSRS     R1,R1,#+31
        LDR      R0,??DataTable2_7
        BL       printf
        LDRB     R0,[R4, #+0]
        MOVS     R1,R0
        UXTB     R1,R1
        LSRS     R1,R1,#+6
        UXTB     R1,R1
        LDR      R0,??DataTable2_8
        BL       printf
        LDRB     R0,[R4, #+1]
        LSLS     R1,R0,#+28       ;; ZeroExtS R1,R0,#+28,#+28
        LSRS     R1,R1,#+28
        LDR      R0,??DataTable2_9
        BL       printf
        LDRB     R0,[R4, #+1]
        MOVS     R1,R0
        UXTB     R1,R1
        LSRS     R1,R1,#+7
        UXTB     R1,R1
        LDR      R0,??DataTable2_10
        BL       printf
        LDRB     R1,[R4, #+2]
        LDR      R0,??DataTable2_11
        BL       printf
        LDRB     R2,[R4, #+4]
        LDRB     R1,[R4, #+3]
        LDR      R0,??DataTable2_12
        BL       printf
        LDRB     R1,[R4, #+5]
        LDR      R0,??DataTable2_13
        BL       printf
        LDRB     R1,[R4, #+6]
        LDR      R0,??DataTable2_14
        BL       printf
        LDRB     R0,[R4, #+1]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??NWK_data_indication_3
        MOVS     R7,#+5
        B        ??NWK_data_indication_4
??NWK_data_indication_3:
        MOVS     R7,#+7
??NWK_data_indication_4:
        LDRB     R0,[R4, #+1]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??NWK_data_indication_5
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+5]
        STRB     R0,[R4, #+5]
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+6]
        STRB     R0,[R4, #+6]
        MOVS     R0,#+7
        MOVS     R7,R0
        B        ??NWK_data_indication_6
??NWK_data_indication_5:
        MOVS     R0,#+5
        MOVS     R7,R0
??NWK_data_indication_6:
        LDRB     R0,[R4, #+0]
        UXTB     R0,R0
        LSRS     R0,R0,#+6
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      .+4
        B        ??NWK_data_indication_7
        UXTB     R7,R7
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, R7]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        LDRB     R1,[R4, #+7]
        MOVS     R2,#+240
        ANDS     R2,R2,R1
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        ORRS     R0,R0,R2
        STRB     R0,[R4, #+7]
        UXTB     R7,R7
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, R7]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        LDRB     R1,[R4, #+7]
        LSLS     R1,R1,#+28       ;; ZeroExtS R1,R1,#+28,#+28
        LSRS     R1,R1,#+28
        LSLS     R0,R0,#+4
        ORRS     R0,R0,R1
        STRB     R0,[R4, #+7]
        UXTB     R7,R7
        LDR      R0,[SP, #+4]
        ADDS     R0,R0,R7
        ADDS     R0,R0,#+1
        MOVS     R6,R0
        LDRB     R0,[R4, #+0]
        MOVS     R1,R0
        LSLS     R1,R1,#+26       ;; ZeroExtS R1,R1,#+26,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BEQ      ??NWK_data_indication_8
        MOVS     R0,#+6
        LDR      R1,??NWK_data_indication_0
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+44
        STRB     R0,[R1, #+0]
        MOV      R3,SP
        LDRB     R0,[R4, #+7]
        LSLS     R2,R0,#+28       ;; ZeroExtS R2,R0,#+28,#+28
        LSRS     R2,R2,#+28
        LDR      R0,??NWK_data_indication_0
        LDR      R1,[R0, #+0]
        ADDS     R1,R1,#+8
        MOVS     R0,R6
        BL       dempress_addr_list
        LDR      R1,??NWK_data_indication_0
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+45
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        ADDS     R6,R6,R0
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        SUBS     R0,R0,R7
        SUBS     R0,R0,#+1
        LDR      R1,??NWK_data_indication_0
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+46
        STRB     R0,[R1, #+0]
        B        ??NWK_data_indication_9
??NWK_data_indication_8:
        LDRB     R0,[R4, #+0]
        MOVS     R1,R0
        LSLS     R1,R1,#+27       ;; ZeroExtS R1,R1,#+27,#+31
        LSRS     R1,R1,#+31
        CMP      R1,#+0
        BNE      ??NWK_data_indication_10
        MOVS     R0,#+6
        B        ??NWK_data_indication_11
??NWK_data_indication_10:
        MOVS     R0,#+2
??NWK_data_indication_11:
        LDR      R1,??NWK_data_indication_0
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+44
        STRB     R0,[R1, #+0]
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+44
        LDRB     R0,[R0, #+0]
        LDRB     R1,[R4, #+7]
        LSLS     R1,R1,#+28       ;; ZeroExtS R1,R1,#+28,#+28
        LSRS     R1,R1,#+28
        ADDS     R1,R1,#+2
        MULS     R0,R1,R0
        LDR      R1,??NWK_data_indication_0
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+45
        STRB     R0,[R1, #+0]
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+45
        LDRB     R2,[R0, #+0]
        MOVS     R1,R6
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+8
        BL       w_memcpy
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+45
        LDRB     R0,[R0, #+0]
        ADDS     R6,R6,R0
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        LDR      R1,??NWK_data_indication_0
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+45
        LDRB     R1,[R1, #+0]
        SUBS     R0,R0,R1
        SUBS     R0,R0,R7
        SUBS     R0,R0,#+1
        LDR      R1,??NWK_data_indication_0
        LDR      R1,[R1, #+0]
        ADDS     R1,R1,#+46
        STRB     R0,[R1, #+0]
??NWK_data_indication_9:
        LDR      R0,??DataTable2_15
        BL       printf
        MOVS     R5,#+0
??NWK_data_indication_12:
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+45
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??NWK_data_indication_13
        UXTB     R5,R5
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,R5
        LDRB     R1,[R0, #+8]
        ADR      R0,??DataTable2_16  ;; "%X "
        BL       printf
        ADDS     R5,R5,#+1
        B        ??NWK_data_indication_12
??NWK_data_indication_13:
        ADR      R0,??DataTable2_17  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        LDR      R0,??DataTable2_18
        BL       printf
        MOVS     R5,#+0
??NWK_data_indication_14:
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+46
        LDRB     R0,[R0, #+0]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??NWK_data_indication_15
        LDRB     R1,[R6, #+0]
        ADR      R0,??DataTable2_16  ;; "%X "
        BL       printf
        ADDS     R6,R6,#+1
        ADDS     R5,R5,#+1
        B        ??NWK_data_indication_14
??NWK_data_indication_15:
        ADR      R0,??DataTable2_17  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+44
        LDRB     R1,[R0, #+0]
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+44
        LDRB     R0,[R0, #+0]
        LDR      R2,??NWK_data_indication_0
        LDR      R2,[R2, #+0]
        ADDS     R0,R2,R0
        ADDS     R0,R0,#+8
        BL       cmp_addr
        CMP      R0,#+0
        BEQ      ??NWK_data_indication_16
        MOVS     R1,R6
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        BL       APL_data_indication
        B        ??NWK_data_indication_7
??NWK_data_indication_16:
        LDRB     R0,[R4, #+7]
        LSLS     R0,R0,#+28       ;; ZeroExtS R0,R0,#+28,#+28
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ      ??NWK_data_indication_2
??NWK_data_indication_17:
        LDRB     R0,[R4, #+1]
        UXTB     R0,R0
        LSRS     R0,R0,#+7
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??NWK_data_indication_18
        LDRB     R0,[R4, #+7]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        LDRB     R1,[R4, #+7]
        LSLS     R1,R1,#+28       ;; ZeroExtS R1,R1,#+28,#+28
        LSRS     R1,R1,#+28
        CMP      R0,R1
        BCS      ??NWK_data_indication_19
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+44
        LDRB     R1,[R0, #+0]
        LDRB     R0,[R4, #+7]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        UXTB     R0,R0
        ADDS     R0,R0,#+2
        LDR      R2,??NWK_data_indication_0
        LDR      R2,[R2, #+0]
        ADDS     R2,R2,#+44
        LDRB     R2,[R2, #+0]
        MULS     R0,R2,R0
        LDR      R2,??NWK_data_indication_0
        LDR      R2,[R2, #+0]
        ADDS     R0,R2,R0
        ADDS     R0,R0,#+8
        BL       cmp_addr
        CMP      R0,#+0
        BEQ      ??NWK_data_indication_20
        MOVS     R1,R6
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        BL       APL_data_indication
        B        ??NWK_data_indication_7
??NWK_data_indication_20:
        B        ??NWK_data_indication_2
??NWK_data_indication_19:
        B        ??NWK_data_indication_2
??NWK_data_indication_18:
        LDRB     R0,[R4, #+7]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??NWK_data_indication_21
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+44
        LDRB     R1,[R0, #+0]
        LDRB     R0,[R4, #+7]
        UXTB     R0,R0
        LSRS     R0,R0,#+4
        UXTB     R0,R0
        ADDS     R0,R0,#+2
        LDR      R2,??NWK_data_indication_0
        LDR      R2,[R2, #+0]
        ADDS     R2,R2,#+44
        LDRB     R2,[R2, #+0]
        MULS     R0,R2,R0
        LDR      R2,??NWK_data_indication_0
        LDR      R2,[R2, #+0]
        ADDS     R0,R2,R0
        ADDS     R0,R0,#+8
        BL       cmp_addr
        CMP      R0,#+0
        BEQ      ??NWK_data_indication_22
        MOVS     R1,R6
        LDR      R0,??NWK_data_indication_0
        LDR      R0,[R0, #+0]
        BL       APL_data_indication
        B        ??NWK_data_indication_7
??NWK_data_indication_22:
        B        ??NWK_data_indication_2
??NWK_data_indication_21:
        B        ??NWK_data_indication_2
??NWK_data_indication_7:
??NWK_data_indication_2:
        POP      {R0-R2,R4-R7,PC}  ;; return
        Nop      
        DATA
??NWK_data_indication_0:
        DC32     nwk_frame_ptr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     LOCAL_NID

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     broadcast_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     `?<Constant "NID error \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     last_info

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     `?<Constant "nwk packet type = %X\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     `?<Constant "nwk packet sour_addr ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     `?<Constant "nwk packet des_addr t...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     `?<Constant "nwk packet cpre type ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     `?<Constant "nwk packet route type...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     `?<Constant "nwk packet  version =...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     `?<Constant "nwk packet direction ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     `?<Constant "nwk packet number = %X\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     `?<Constant "nwk packet NID = %X%X\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     `?<Constant "nwk packet tx_RSSI = ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     `?<Constant "nwk packet rx_RSSI = ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     `?<Constant "addr list: ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC8      "%X "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     `?<Constant "data list: ">`

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

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "NID error \\r\\n">`:
        DATA
        DC8 "NID error \015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet type = %X\\r\\n">`:
        DATA
        DC8 "nwk packet type = %X\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet sour_addr ...">`:
        DATA
        DC8 "nwk packet sour_addr type = %X\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet des_addr t...">`:
        DATA
        DC8 "nwk packet des_addr type = %X\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet cpre type ...">`:
        DATA
        DC8 "nwk packet cpre type = %X\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet route type...">`:
        DATA
        DC8 "nwk packet route type = %X\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet  version =...">`:
        DATA
        DC8 "nwk packet  version = %X\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet direction ...">`:
        DATA
        DC8 "nwk packet direction = %X\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet number = %X\\r\\n">`:
        DATA
        DC8 "nwk packet number = %X\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet NID = %X%X\\r\\n">`:
        DATA
        DC8 "nwk packet NID = %X%X\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet tx_RSSI = ...">`:
        DATA
        DC8 "nwk packet tx_RSSI = %X\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "nwk packet rx_RSSI = ...">`:
        DATA
        DC8 "nwk packet rx_RSSI = %X\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "addr list: ">`:
        DATA
        DC8 "addr list: "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "%X "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "data list: ">`:
        DATA
        DC8 "data list: "

        END
// 
//    48 bytes in section .bss
//    20 bytes in section .data
//   380 bytes in section .rodata
// 1 414 bytes in section .text
// 
// 1 414 bytes of CODE  memory
//   380 bytes of CONST memory
//    68 bytes of DATA  memory
//
//Errors: none
//Warnings: 6

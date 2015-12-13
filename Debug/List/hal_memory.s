///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       13/Dec/2015  23:36:18
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\APP\hal_memory.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\APP\hal_memory.c -D
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\hal_memory.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN OS_CPU_SR_Restore
        EXTERN OS_CPU_SR_Save

        PUBLIC OSMemCreate
        PUBLIC OSMemFreeList
        PUBLIC OSMemGet
        PUBLIC OSMemPut
        PUBLIC OSMemQuery
        PUBLIC OSMemTbl
        PUBLIC OS_MemClr
        PUBLIC OS_MemCopy
        PUBLIC hal_InitMemoryVariable


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
OSMemFreeList:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
OSMemTbl:
        DS8 100

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitMemoryVariable:
        PUSH     {R7,LR}
        BL       OS_MemInit
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OS_MemInit:
        PUSH     {R3-R5,LR}
        MOVS     R1,#+100
        LDR      R0,??DataTable1
        BL       OS_MemClr
        MOVS     R0,#+0
        MOVS     R5,R0
??OS_MemInit_0:
        UXTH     R5,R5
        CMP      R5,#+4
        BCS      ??OS_MemInit_1
        UXTH     R5,R5
        MOVS     R0,#+20
        MULS     R0,R5,R0
        LDR      R1,??DataTable1
        ADDS     R0,R1,R0
        MOVS     R4,R0
        UXTH     R5,R5
        MOVS     R0,#+20
        MULS     R0,R5,R0
        LDR      R1,??DataTable1
        ADDS     R0,R1,R0
        ADDS     R0,R0,#+20
        STR      R0,[R4, #+4]
        ADDS     R5,R5,#+1
        B        ??OS_MemInit_0
??OS_MemInit_1:
        UXTH     R5,R5
        MOVS     R0,#+20
        MULS     R0,R5,R0
        LDR      R1,??DataTable1
        ADDS     R0,R1,R0
        MOVS     R4,R0
        MOVS     R0,#+0
        STR      R0,[R4, #+4]
        LDR      R0,??DataTable1
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OSMemCreate:
        PUSH     {R0-R7,LR}
        SUB      SP,SP,#+12
        MOVS     R6,#+0
        BL       OS_CPU_SR_Save
        MOVS     R6,R0
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        MOVS     R7,R0
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??OSMemCreate_0
        LDR      R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+4]
        LDR      R1,??DataTable1_1
        STR      R0,[R1, #+0]
??OSMemCreate_0:
        MOVS     R0,R6
        BL       OS_CPU_SR_Restore
        CMP      R7,#+0
        BNE      ??OSMemCreate_1
        MOVS     R0,#+90
        LDR      R1,[SP, #+24]
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        B        ??OSMemCreate_2
??OSMemCreate_1:
        LDR      R0,[SP, #+12]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+12]
        MOVS     R4,R0
        LDR      R0,[SP, #+16]
        SUBS     R0,R0,#+1
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        MOVS     R5,R0
??OSMemCreate_3:
        LDR      R0,[SP, #+4]
        CMP      R5,R0
        BCS      ??OSMemCreate_4
        LDR      R0,[SP, #+20]
        ADDS     R4,R4,R0
        LDR      R0,[SP, #+0]
        STR      R4,[R0, #+0]
        STR      R4,[SP, #+0]
        ADDS     R5,R5,#+1
        B        ??OSMemCreate_3
??OSMemCreate_4:
        MOVS     R0,#+0
        LDR      R1,[SP, #+0]
        STR      R0,[R1, #+0]
        LDR      R0,[SP, #+12]
        STR      R0,[R7, #+0]
        LDR      R0,[SP, #+12]
        STR      R0,[R7, #+4]
        LDR      R0,[SP, #+16]
        STR      R0,[R7, #+16]
        LDR      R0,[SP, #+16]
        STR      R0,[R7, #+12]
        LDR      R0,[SP, #+20]
        STR      R0,[R7, #+8]
        MOVS     R0,#+0
        LDR      R1,[SP, #+24]
        STRB     R0,[R1, #+0]
        MOVS     R0,R7
??OSMemCreate_2:
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     OSMemTbl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     OSMemFreeList

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OSMemGet:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R6,#+0
        BL       OS_CPU_SR_Save
        MOVS     R6,R0
        LDR      R0,[R4, #+16]
        CMP      R0,#+0
        BEQ      ??OSMemGet_0
        LDR      R0,[R4, #+4]
        MOVS     R5,R0
        LDR      R0,[R5, #+0]
        STR      R0,[R4, #+4]
        LDR      R0,[R4, #+16]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+16]
        MOVS     R0,R6
        BL       OS_CPU_SR_Restore
        MOVS     R0,#+0
        STRB     R0,[R7, #+0]
        MOVS     R0,R5
        B        ??OSMemGet_1
??OSMemGet_0:
        MOVS     R0,R6
        BL       OS_CPU_SR_Restore
        MOVS     R0,#+93
        STRB     R0,[R7, #+0]
        MOVS     R0,#+0
??OSMemGet_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OSMemPut:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+0
        BL       OS_CPU_SR_Save
        MOVS     R6,R0
        LDR      R0,[R5, #+16]
        LDR      R1,[R5, #+12]
        CMP      R0,R1
        BCC      ??OSMemPut_0
        MOVS     R0,R6
        BL       OS_CPU_SR_Restore
        MOVS     R0,#+94
        B        ??OSMemPut_1
??OSMemPut_0:
        LDR      R0,[R5, #+4]
        STR      R0,[R4, #+0]
        STR      R4,[R5, #+4]
        LDR      R0,[R5, #+16]
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+16]
        MOVS     R0,R6
        BL       OS_CPU_SR_Restore
        MOVS     R0,#+0
??OSMemPut_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OSMemQuery:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+0
        BL       OS_CPU_SR_Save
        MOVS     R6,R0
        LDR      R0,[R5, #+0]
        STR      R0,[R4, #+0]
        LDR      R0,[R5, #+4]
        STR      R0,[R4, #+4]
        LDR      R0,[R5, #+8]
        STR      R0,[R4, #+8]
        LDR      R0,[R5, #+12]
        STR      R0,[R4, #+12]
        LDR      R0,[R5, #+16]
        STR      R0,[R4, #+16]
        MOVS     R0,R6
        BL       OS_CPU_SR_Restore
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+16]
        SUBS     R0,R0,R1
        STR      R0,[R4, #+20]
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OS_MemCopy:
        PUSH     {LR}
??OS_MemCopy_0:
        UXTH     R2,R2
        CMP      R2,#+0
        BEQ      ??OS_MemCopy_1
        LDRB     R3,[R1, #+0]
        STRB     R3,[R0, #+0]
        ADDS     R1,R1,#+1
        ADDS     R0,R0,#+1
        SUBS     R2,R2,#+1
        B        ??OS_MemCopy_0
??OS_MemCopy_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
OS_MemClr:
        PUSH     {LR}
??OS_MemClr_0:
        UXTH     R1,R1
        CMP      R1,#+0
        BEQ      ??OS_MemClr_1
        MOVS     R2,#+0
        STRB     R2,[R0, #+0]
        ADDS     R0,R0,#+1
        SUBS     R1,R1,#+1
        B        ??OS_MemClr_0
??OS_MemClr_1:
        POP      {PC}             ;; return

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
// 104 bytes in section .bss
// 432 bytes in section .text
// 
// 432 bytes of CODE memory
// 104 bytes of DATA memory
//
//Errors: none
//Warnings: none

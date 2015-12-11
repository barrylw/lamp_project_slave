///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:29:29
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\core\loader\elfloader.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\core\loader\elfloader.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -lb G:\git_hub_lamp\lamp_slave_git\Debug\List\
//        --diag_suppress Pa050 -o G:\git_hub_lamp\lamp_slave_git\Debug\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M0 -e --fpu=None --dlib_config "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
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
//        G:\git_hub_lamp\lamp_slave_git\coffee_arch\ -Ol -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\elfloader.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN cfs_read
        EXTERN cfs_seek
        EXTERN elfloader_arch_allocate_ram
        EXTERN elfloader_arch_allocate_rom
        EXTERN elfloader_arch_relocate
        EXTERN elfloader_arch_write_rom
        EXTERN memcmp
        EXTERN memcpy
        EXTERN memset
        EXTERN strcmp
        EXTERN strncmp
        EXTERN symtab_lookup

        PUBLIC elfloader_autostart_processes
        PUBLIC elfloader_init
        PUBLIC elfloader_load
        PUBLIC elfloader_unknown


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
elfloader_unknown:
        DS8 32

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
elfloader_autostart_processes:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
bss:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
`data`:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
rodata:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
text:
        DS8 12

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "autostart_processes">`:
        DATA
        DC8 "autostart_processes"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".text">`:
        DATA
        DC8 ".text"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".rel.text">`:
        DATA
        DC8 ".rel.text"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".rela.text">`:
        DATA
        DC8 ".rela.text"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".data">`:
        DATA
        DC8 ".data"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".rodata">`:
        DATA
        DC8 ".rodata"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".rel.rodata">`:
        DATA
        DC8 ".rel.rodata"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".rela.rodata">`:
        DATA
        DC8 ".rela.rodata"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".rel.data">`:
        DATA
        DC8 ".rel.data"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".rela.data">`:
        DATA
        DC8 ".rela.data"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant ".bss">`:
        DATA
        DC8 ".bss"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
elf_magic_header:
        DATA
        DC8 127, 69, 76, 70, 1, 1, 1, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
seek_read:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R6,R3
        MOVS     R2,#+0
        MOVS     R0,R4
        BL       cfs_seek
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
        BL       cfs_read
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_local_symbol:
        PUSH     {R1,R3-R7,LR}
        SUB      SP,SP,#+52
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R4,R6
        LDR      R7,[SP, #+80]
        B        ??find_local_symbol_0
??find_local_symbol_1:
        ADDS     R4,R4,#+16
??find_local_symbol_0:
        MOV      R0,SP
        LDRH     R0,[R0, #+56]
        ADDS     R0,R6,R0
        CMP      R4,R0
        BCS      ??find_local_symbol_2
        MOVS     R3,#+16
        MOV      R2,SP
        MOVS     R1,R4
        MOVS     R0,R5
        BL       seek_read
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ      ??find_local_symbol_1
        MOVS     R3,#+30
        ADD      R2,SP,#+16
        LDR      R0,[SP, #+0]
        ADDS     R1,R7,R0
        MOVS     R0,R5
        BL       seek_read
        LDR      R1,[SP, #+52]
        ADD      R0,SP,#+16
        BL       strcmp
        CMP      R0,#+0
        BNE      ??find_local_symbol_1
        MOV      R0,SP
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??find_local_symbol_3
        LDR      R0,??DataTable3
??find_local_symbol_4:
        LDR      R1,[SP, #+4]
        LDR      R0,[R0, #+8]
        ADDS     R0,R0,R1
        B        ??find_local_symbol_5
??find_local_symbol_3:
        MOV      R0,SP
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_1
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??find_local_symbol_6
        LDR      R0,??DataTable3_1
        B        ??find_local_symbol_4
??find_local_symbol_6:
        MOV      R0,SP
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_2
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??find_local_symbol_7
        LDR      R0,??DataTable3_2
        B        ??find_local_symbol_4
??find_local_symbol_7:
        MOV      R0,SP
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??find_local_symbol_8
        LDR      R0,??DataTable3_3
        B        ??find_local_symbol_4
??find_local_symbol_8:
        MOVS     R0,#+0
        B        ??find_local_symbol_5
??find_local_symbol_2:
        MOVS     R0,#+0
??find_local_symbol_5:
        ADD      SP,SP,#+60
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
relocate_section:
        PUSH     {R1-R7,LR}
        SUB      SP,SP,#+64
        MOVS     R7,R0
        MOVS     R6,#+0
        ADD      R0,SP,#+116
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??relocate_section_0
        MOVS     R6,#+12
        B        ??relocate_section_1
??relocate_section_0:
        MOVS     R6,#+8
??relocate_section_1:
        LDR      R5,[SP, #+64]
        B        ??relocate_section_2
??relocate_section_3:
        ADD      R0,SP,#+4
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_1
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??relocate_section_4
        LDR      R0,??DataTable3_1
        B        ??relocate_section_5
??relocate_section_4:
        ADD      R0,SP,#+4
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_2
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??relocate_section_6
        LDR      R0,??DataTable3_2
        B        ??relocate_section_5
??relocate_section_6:
        ADD      R0,SP,#+4
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??relocate_section_7
        LDR      R0,??DataTable3_3
        B        ??relocate_section_5
??relocate_section_7:
        MOVS     R2,#+30
        ADD      R1,SP,#+32
        LDR      R0,??DataTable3_4
        BL       memcpy
        MOVS     R0,#+0
        LDR      R1,??DataTable3_4
        STRB     R0,[R1, #+29]
        MOVS     R0,#+5
        B        ??relocate_section_8
??relocate_section_9:
        ADD      R0,SP,#+4
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??relocate_section_10
        LDR      R0,??DataTable3
??relocate_section_11:
        LDR      R4,[R0, #+8]
??relocate_section_12:
        ADD      R0,SP,#+116
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??relocate_section_13
        MOVS     R3,#+4
        ADD      R2,SP,#+20
        ADDS     R2,R2,#+8
        LDR      R0,[SP, #+72]
        LDR      R1,[SP, #+20]
        ADDS     R1,R0,R1
        MOVS     R0,R7
        BL       seek_read
??relocate_section_13:
        STR      R4,[SP, #+0]
        ADD      R3,SP,#+20
        LDR      R2,[SP, #+96]
        LDR      R1,[SP, #+72]
        MOVS     R0,R7
        BL       elfloader_arch_relocate
        ADDS     R5,R5,R6
??relocate_section_2:
        LDR      R0,[SP, #+64]
        ADD      R1,SP,#+68
        LDRH     R1,[R1, #+0]
        ADDS     R0,R0,R1
        CMP      R5,R0
        BCS      ??relocate_section_14
        MOVS     R3,R6
        ADD      R2,SP,#+20
        MOVS     R1,R5
        MOVS     R0,R7
        BL       seek_read
        MOVS     R3,#+16
        ADD      R2,SP,#+4
        LDR      R0,[SP, #+108]
        LDR      R1,[SP, #+24]
        LSRS     R1,R1,#+8
        MOVS     R4,#+16
        MULS     R1,R4,R1
        ADDS     R1,R0,R1
        MOVS     R0,R7
        BL       seek_read
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BEQ      ??relocate_section_9
        MOVS     R3,#+30
        ADD      R2,SP,#+32
        LDR      R0,[SP, #+104]
        LDR      R1,[SP, #+4]
        ADDS     R1,R0,R1
        MOVS     R0,R7
        BL       seek_read
        ADD      R0,SP,#+32
        BL       symtab_lookup
        MOVS     R4,R0
        CMP      R4,#+0
        BNE      ??relocate_section_15
        LDR      R0,[SP, #+104]
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+112
        LDRH     R3,[R0, #+0]
        LDR      R2,[SP, #+108]
        ADD      R1,SP,#+32
        MOVS     R0,R7
        BL       find_local_symbol
        MOVS     R4,R0
??relocate_section_15:
        CMP      R4,#+0
        BNE      ??relocate_section_12
        ADD      R0,SP,#+4
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BEQ      .+4
        B        ??relocate_section_3
        LDR      R0,??DataTable3
??relocate_section_5:
        LDR      R4,[R0, #+8]
        B        ??relocate_section_12
??relocate_section_10:
        ADD      R0,SP,#+4
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_1
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??relocate_section_16
        LDR      R0,??DataTable3_1
        B        ??relocate_section_11
??relocate_section_16:
        ADD      R0,SP,#+4
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_2
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??relocate_section_17
        LDR      R0,??DataTable3_2
        B        ??relocate_section_11
??relocate_section_17:
        ADD      R0,SP,#+4
        LDRH     R0,[R0, #+14]
        LDR      R1,??DataTable3_3
        LDRB     R1,[R1, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??relocate_section_18
        LDR      R0,??DataTable3_3
        B        ??relocate_section_11
??relocate_section_18:
        MOVS     R0,#+6
        B        ??relocate_section_8
??relocate_section_14:
        MOVS     R0,#+0
??relocate_section_8:
        ADD      SP,SP,#+76
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_program_processes:
        PUSH     {R2,R4-R7,LR}
        SUB      SP,SP,#+48
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R3
        MOVS     R4,R6
        B        ??find_program_processes_0
??find_program_processes_1:
        ADDS     R4,R4,#+16
??find_program_processes_0:
        MOV      R0,SP
        LDRH     R0,[R0, #+48]
        ADDS     R0,R6,R0
        CMP      R4,R0
        BCS      ??find_program_processes_2
        MOVS     R3,#+16
        MOV      R2,SP
        MOVS     R1,R4
        MOVS     R0,R5
        BL       seek_read
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BEQ      ??find_program_processes_1
        MOVS     R3,#+30
        ADD      R2,SP,#+16
        LDR      R0,[SP, #+0]
        ADDS     R1,R7,R0
        MOVS     R0,R5
        BL       seek_read
        LDR      R1,??DataTable3_5
        ADD      R0,SP,#+16
        BL       strcmp
        CMP      R0,#+0
        BNE      ??find_program_processes_1
        LDR      R0,[SP, #+4]
        LDR      R1,??DataTable3_1
        LDR      R1,[R1, #+8]
        ADDS     R0,R1,R0
        B        ??find_program_processes_3
??find_program_processes_2:
        MOVS     R0,#+0
??find_program_processes_3:
        ADD      SP,SP,#+52
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
elfloader_init:
        MOVS     R0,#+0
        LDR      R1,??DataTable3_6
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     bss

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     `data`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     rodata

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     text

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     elfloader_unknown

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     `?<Constant "autostart_processes">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     elfloader_autostart_processes

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
elfloader_load:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+204
        MOVS     R7,R0
        MOVS     R4,#+255
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+44]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+54]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+40]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+50]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+36]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+46]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+28]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+26]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+32]
        MOVS     R0,#+0
        LDR      R1,??elfloader_load_0
        STRB     R0,[R1, #+0]
        MOVS     R3,#+52
        ADD      R2,SP,#+112
        MOVS     R1,#+0
        MOVS     R0,R7
        BL       seek_read
        MOVS     R2,#+7
        LDR      R1,??elfloader_load_0+0x4
        ADD      R0,SP,#+112
        BL       memcmp
        CMP      R0,#+0
        BEQ      ??elfloader_load_1
        MOVS     R0,#+1
        B        ??elfloader_load_2
??elfloader_load_1:
        LDR      R6,[SP, #+144]
        MOVS     R3,#+40
        ADD      R2,SP,#+72
        MOVS     R1,R6
        MOVS     R0,R7
        BL       seek_read
        MOV      R0,SP
        ADD      R1,SP,#+112
        LDRH     R1,[R1, #+46]
        STRH     R1,[R0, #+2]
        MOV      R0,SP
        ADD      R1,SP,#+112
        LDRH     R1,[R1, #+48]
        STRH     R1,[R0, #+4]
        MOVS     R3,#+40
        ADD      R2,SP,#+164
        LDR      R0,[SP, #+144]
        MOV      R1,SP
        LDRH     R1,[R1, #+2]
        ADD      R5,SP,#+112
        LDRH     R5,[R5, #+50]
        MULS     R1,R5,R1
        ADDS     R1,R0,R1
        MOVS     R0,R7
        BL       seek_read
        LDR      R0,[SP, #+180]
        STR      R0,[SP, #+56]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOV      R1,SP
        STRH     R0,[R1, #+24]
        MOV      R1,SP
        STRH     R0,[R1, #+34]
        MOV      R1,SP
        STRH     R0,[R1, #+48]
        MOV      R1,SP
        STRH     R0,[R1, #+38]
        MOV      R1,SP
        STRH     R0,[R1, #+52]
        MOV      R1,SP
        STRH     R0,[R1, #+42]
        MOV      R1,SP
        STRH     R0,[R1, #+30]
        MOVS     R0,#+255
        LDR      R1,??elfloader_load_0+0x8
        STRB     R0,[R1, #+0]
        LDR      R1,??elfloader_load_0+0xC
        STRB     R0,[R1, #+0]
        LDR      R1,??elfloader_load_0+0x10
        STRB     R0,[R1, #+0]
        LDR      R1,??elfloader_load_0+0x14
        STRB     R0,[R1, #+0]
        LDR      R6,[SP, #+144]
        MOVS     R5,#+0
        B        ??elfloader_load_3
??elfloader_load_4:
        MOVS     R2,#+4
        LDR      R1,??elfloader_load_0+0x18
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_5
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+32]
        MOVS     R0,R5
        LDR      R1,??elfloader_load_0+0x14
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??elfloader_load_0+0x14
        STR      R0,[R1, #+4]
??elfloader_load_5:
        MOV      R0,SP
        LDRH     R0,[R0, #+2]
        ADDS     R6,R6,R0
        ADDS     R5,R5,#+1
??elfloader_load_3:
        MOV      R0,SP
        LDRH     R0,[R0, #+4]
        CMP      R5,R0
        BLT      .+4
        B        ??elfloader_load_6
        MOVS     R3,#+40
        ADD      R2,SP,#+72
        MOVS     R1,R6
        MOVS     R0,R7
        BL       seek_read
        LDR      R0,[SP, #+56]
        LDR      R1,[SP, #+72]
        ADDS     R1,R0,R1
        MOVS     R3,#+12
        ADD      R2,SP,#+60
        MOVS     R0,R7
        BL       seek_read
        LDR      R0,[SP, #+76]
        CMP      R0,#+2
        BNE      ??elfloader_load_7
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+28]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+24]
        B        ??elfloader_load_5
??elfloader_load_7:
        LDR      R0,[SP, #+76]
        CMP      R0,#+3
        BNE      ??elfloader_load_8
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+26]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+0]
        B        ??elfloader_load_5
??elfloader_load_8:
        MOVS     R2,#+5
        LDR      R1,??DataTable4
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_9
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+44]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+30]
        MOVS     R0,R5
        LDR      R1,??elfloader_load_0+0x8
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRH     R0,[R0, #+44]
        LDR      R1,??elfloader_load_0+0x8
        STR      R0,[R1, #+4]
        B        ??elfloader_load_5
??elfloader_load_9:
        MOVS     R2,#+9
        LDR      R1,??DataTable4_1
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_10
        MOVS     R4,#+0
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+54]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+42]
        B        ??elfloader_load_5
??elfloader_load_10:
        MOVS     R2,#+10
        LDR      R1,??DataTable4_2
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_11
        MOVS     R4,#+1
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+54]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+42]
        B        ??elfloader_load_5
??elfloader_load_11:
        MOVS     R2,#+5
        LDR      R1,??DataTable4_3
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_12
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+40]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+52]
        MOVS     R0,R5
        LDR      R1,??elfloader_load_0+0x10
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRH     R0,[R0, #+40]
        LDR      R1,??elfloader_load_0+0x10
        STR      R0,[R1, #+4]
        B        ??elfloader_load_5
??elfloader_load_12:
        MOVS     R2,#+7
        LDR      R1,??DataTable4_4
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_13
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+36]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+48]
        MOVS     R0,R5
        LDR      R1,??elfloader_load_0+0xC
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRH     R0,[R0, #+36]
        LDR      R1,??elfloader_load_0+0xC
        STR      R0,[R1, #+4]
        B        ??elfloader_load_5
??elfloader_load_13:
        MOVS     R2,#+11
        LDR      R1,??DataTable4_5
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_14
        MOVS     R4,#+0
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+46]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+34]
        B        ??elfloader_load_5
??elfloader_load_14:
        MOVS     R2,#+12
        LDR      R1,??DataTable4_6
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_15
        MOVS     R4,#+1
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+46]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+34]
        B        ??elfloader_load_5
??elfloader_load_15:
        MOVS     R2,#+9
        LDR      R1,??DataTable4_7
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BNE      ??elfloader_load_16
        MOVS     R4,#+0
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+50]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+38]
        B        ??elfloader_load_5
??elfloader_load_16:
        MOVS     R2,#+10
        LDR      R1,??DataTable4_8
        ADD      R0,SP,#+60
        BL       strncmp
        CMP      R0,#+0
        BEQ      .+4
        B        ??elfloader_load_4
        MOVS     R4,#+1
        MOV      R0,SP
        LDR      R1,[SP, #+88]
        STRH     R1,[R0, #+50]
        MOV      R0,SP
        LDR      R1,[SP, #+92]
        STRH     R1,[R0, #+38]
        B        ??elfloader_load_5
        DATA
??elfloader_load_0:
        DC32     elfloader_unknown
        DC32     elf_magic_header
        DC32     text
        DC32     rodata
        DC32     `data`
        DC32     bss
        DC32     `?<Constant ".bss">`
        THUMB
??elfloader_load_6:
        MOV      R0,SP
        LDRH     R0,[R0, #+24]
        CMP      R0,#+0
        BNE      ??elfloader_load_17
        MOVS     R0,#+2
        B        ??elfloader_load_2
??elfloader_load_17:
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??elfloader_load_18
        MOVS     R0,#+3
        B        ??elfloader_load_2
??elfloader_load_18:
        MOV      R0,SP
        LDRH     R0,[R0, #+30]
        CMP      R0,#+0
        BNE      ??elfloader_load_19
        MOVS     R0,#+4
        B        ??elfloader_load_2
??elfloader_load_19:
        MOV      R0,SP
        LDRH     R0,[R0, #+32]
        MOV      R1,SP
        LDRH     R1,[R1, #+52]
        ADDS     R0,R0,R1
        BL       elfloader_arch_allocate_ram
        LDR      R1,??DataTable4_9
        STR      R0,[R1, #+8]
        MOV      R0,SP
        LDRH     R0,[R0, #+32]
        LDR      R1,??DataTable4_9
        LDR      R1,[R1, #+8]
        ADDS     R0,R1,R0
        LDR      R1,??DataTable4_10
        STR      R0,[R1, #+8]
        MOV      R0,SP
        LDRH     R0,[R0, #+30]
        MOV      R1,SP
        LDRH     R1,[R1, #+48]
        ADDS     R0,R0,R1
        BL       elfloader_arch_allocate_rom
        LDR      R1,??DataTable4_11
        STR      R0,[R1, #+8]
        MOV      R0,SP
        LDRH     R0,[R0, #+30]
        LDR      R1,??DataTable4_11
        LDR      R1,[R1, #+8]
        ADDS     R0,R1,R0
        LDR      R1,??DataTable4_12
        STR      R0,[R1, #+8]
        MOV      R0,SP
        LDRH     R0,[R0, #+42]
        CMP      R0,#+0
        BEQ      ??elfloader_load_20
        UXTB     R4,R4
        STR      R4,[SP, #+20]
        MOV      R0,SP
        LDRH     R0,[R0, #+24]
        STR      R0,[SP, #+16]
        MOV      R0,SP
        LDRH     R0,[R0, #+28]
        STR      R0,[SP, #+12]
        MOV      R0,SP
        LDRH     R0,[R0, #+26]
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+56]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable4_11
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+0]
        MOV      R0,SP
        LDRH     R3,[R0, #+44]
        MOV      R0,SP
        LDRH     R2,[R0, #+42]
        MOV      R0,SP
        LDRH     R1,[R0, #+54]
        MOVS     R0,R7
        BL       relocate_section
        CMP      R0,#+0
        BNE      ??elfloader_load_2
??elfloader_load_20:
        MOV      R0,SP
        LDRH     R0,[R0, #+34]
        CMP      R0,#+0
        BEQ      ??elfloader_load_21
        UXTB     R4,R4
        STR      R4,[SP, #+20]
        MOV      R0,SP
        LDRH     R0,[R0, #+24]
        STR      R0,[SP, #+16]
        MOV      R0,SP
        LDRH     R0,[R0, #+28]
        STR      R0,[SP, #+12]
        MOV      R0,SP
        LDRH     R0,[R0, #+26]
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+56]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable4_12
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+0]
        MOV      R0,SP
        LDRH     R3,[R0, #+36]
        MOV      R0,SP
        LDRH     R2,[R0, #+34]
        MOV      R0,SP
        LDRH     R1,[R0, #+46]
        MOVS     R0,R7
        BL       relocate_section
        CMP      R0,#+0
        BNE      ??elfloader_load_2
??elfloader_load_21:
        MOV      R0,SP
        LDRH     R0,[R0, #+38]
        CMP      R0,#+0
        BEQ      ??elfloader_load_22
        UXTB     R4,R4
        STR      R4,[SP, #+20]
        MOV      R0,SP
        LDRH     R0,[R0, #+24]
        STR      R0,[SP, #+16]
        MOV      R0,SP
        LDRH     R0,[R0, #+28]
        STR      R0,[SP, #+12]
        MOV      R0,SP
        LDRH     R0,[R0, #+26]
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+56]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable4_10
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+0]
        MOV      R0,SP
        LDRH     R3,[R0, #+40]
        MOV      R0,SP
        LDRH     R2,[R0, #+38]
        MOV      R0,SP
        LDRH     R1,[R0, #+50]
        MOVS     R0,R7
        BL       relocate_section
        CMP      R0,#+0
        BNE      ??elfloader_load_2
??elfloader_load_22:
        LDR      R0,??DataTable4_11
        LDR      R3,[R0, #+8]
        MOV      R0,SP
        LDRH     R2,[R0, #+30]
        MOV      R0,SP
        LDRH     R1,[R0, #+44]
        MOVS     R0,R7
        BL       elfloader_arch_write_rom
        LDR      R0,??DataTable4_12
        LDR      R3,[R0, #+8]
        MOV      R0,SP
        LDRH     R2,[R0, #+48]
        MOV      R0,SP
        LDRH     R1,[R0, #+36]
        MOVS     R0,R7
        BL       elfloader_arch_write_rom
        MOV      R0,SP
        LDRH     R2,[R0, #+32]
        MOVS     R1,#+0
        LDR      R0,??DataTable4_9
        LDR      R0,[R0, #+8]
        BL       memset
        MOV      R0,SP
        LDRH     R3,[R0, #+52]
        LDR      R0,??DataTable4_10
        LDR      R2,[R0, #+8]
        MOV      R0,SP
        LDRH     R1,[R0, #+40]
        MOVS     R0,R7
        BL       seek_read
        MOV      R0,SP
        LDRH     R0,[R0, #+26]
        STR      R0,[SP, #+0]
        MOV      R0,SP
        LDRH     R3,[R0, #+24]
        MOV      R0,SP
        LDRH     R2,[R0, #+28]
        LDR      R1,??DataTable4_13
        MOVS     R0,R7
        BL       find_local_symbol
        CMP      R0,#+0
        BEQ      ??elfloader_load_23
        LDR      R1,??DataTable4_14
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        B        ??elfloader_load_2
??elfloader_load_23:
        MOV      R0,SP
        LDRH     R3,[R0, #+26]
        MOV      R0,SP
        LDRH     R2,[R0, #+24]
        MOV      R0,SP
        LDRH     R1,[R0, #+28]
        MOVS     R0,R7
        BL       find_program_processes
        CMP      R0,#+0
??elfloader_load_24:
        MOVS     R0,#+7
??elfloader_load_2:
        ADD      SP,SP,#+204
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     `?<Constant ".text">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     `?<Constant ".rel.text">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     `?<Constant ".rela.text">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     `?<Constant ".data">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     `?<Constant ".rodata">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     `?<Constant ".rel.rodata">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     `?<Constant ".rela.rodata">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     `?<Constant ".rel.data">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     `?<Constant ".rela.data">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     bss

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     `data`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     text

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     rodata

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     `?<Constant "autostart_processes">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     elfloader_autostart_processes

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
//    84 bytes in section .bss
//   136 bytes in section .rodata
// 1 800 bytes in section .text
// 
// 1 800 bytes of CODE  memory
//   136 bytes of CONST memory
//    84 bytes of DATA  memory
//
//Errors: none
//Warnings: none

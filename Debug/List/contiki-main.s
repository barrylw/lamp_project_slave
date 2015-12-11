///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:28:36
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\APP\contiki-main.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\APP\contiki-main.c -D
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\contiki-main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN InitHardware
        EXTERN InitPhyVariable
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SYSCFG_MemoryRemapConfig
        EXTERN apl_update_process
        EXTERN etimer_process
        EXTERN gpio_per_init
        EXTERN hal_RF_process
        EXTERN hal_RF_reset
        EXTERN hal_urat_process
        EXTERN init_update
        EXTERN printf
        EXTERN process_init
        EXTERN process_run
        EXTERN process_start
        EXTERN start_time_detect_process

        PUBLIC InitVariable
        PUBLIC VectorTable
        PUBLIC commpress_buf
        PUBLIC currentADC
        PUBLIC decommpress_buf
        PUBLIC len
        PUBLIC main
        PUBLIC result_buf
        PUBLIC tedtbuf
        PUBLIC test_phy_packet


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
tedtbuf:
        DS8 152

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InitVariable:
        PUSH     {R7,LR}
        BL       InitPhyVariable
        POP      {R0,PC}          ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
test_phy_packet:
        DATA
        DC8 0, 0, 37, 18, 52, 3, 11, 145, 0, 0, 0, 1, 11, 145, 0, 0, 0, 2, 11
        DC8 145, 0, 0, 0, 3, 11, 145, 0, 0, 0, 4, 11, 145, 0, 0, 0, 5, 1, 2, 3
        DC8 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
commpress_buf:
        DATA
        DC8 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 20, 21, 0, 1, 2, 3, 36, 37, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
decommpress_buf:
        DATA
        DC8 0, 1, 2, 3, 4, 5, 32, 33, 96, 97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
result_buf:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
len:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
currentADC:
        DS8 2

        ASEGN `.noinit`:DATA:NOROOT,020000000H
        SECTION_GROUP VectorTable
VectorTable:
        DS8 192

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
main:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        B        ??main_0
??main_1:
        LSLS     R1,R0,#+2
        LDR      R2,??DataTable0  ;; 0x8001000
        LDR      R1,[R1, R2]
        MOVS     R2,#+4
        MULS     R2,R0,R2
        MOVS     R3,#+128
        LSLS     R3,R3,#+22       ;; #+536870912
        STR      R1,[R3, R2]
        ADDS     R0,R0,#+1
??main_0:
        CMP      R0,#+48
        BCC      ??main_1
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+3
        BL       SYSCFG_MemoryRemapConfig
        MOVS     R0,#+0
        B        ??main_2
??main_3:
        MOVS     R1,R0
        ADDS     R1,R1,#+1
        UXTB     R0,R0
        LDR      R2,??DataTable0_1
        STRB     R1,[R2, R0]
        ADDS     R0,R0,#+1
??main_2:
        UXTB     R0,R0
        CMP      R0,#+150
        BLT      ??main_3
        BL       InitVariable
        BL       InitHardware
        BL       gpio_per_init
        BL       init_update
        LDR      R0,??DataTable0_2
        BL       printf
        BL       process_init
        MOVS     R1,#+0
        LDR      R0,??DataTable0_3
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_4
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_5
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_6
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_7
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_8
        BL       process_start
??main_4:
??main_5:
        BL       process_run
        CMP      R0,#+1
        BGE      ??main_5
        B        ??main_4
        REQUIRE VectorTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x8001000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     tedtbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     `?<Constant "start app\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     etimer_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     hal_urat_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     hal_RF_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     hal_RF_reset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     start_time_detect_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     apl_update_process

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "start app\\r\\n">`:
        DATA
        DC8 "start app\015\012"

        END
// 
// 175 bytes in section .bss
//  80 bytes in section .data
// 192 bytes in section .noinit (abs)
//  12 bytes in section .rodata
// 192 bytes in section .text
// 
// 192 bytes of CODE  memory
//  12 bytes of CONST memory
// 255 bytes of DATA  memory (+ 192 bytes shared)
//
//Errors: none
//Warnings: 1

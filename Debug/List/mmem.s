///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:16
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\gitclone\lamp_project_slave\core\lib\mmem.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\core\lib\mmem.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
//        G:\gitclone\lamp_project_slave\Debug\List\ --diag_suppress Pa050 -o
//        G:\gitclone\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        G:\gitclone\lamp_project_slave\APP\ -I
//        G:\gitclone\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\inc\ -I
//        G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I G:\gitclone\lamp_project_slave\LIB\CMSIS\CM0\CoreSupport\ -I
//        G:\gitclone\lamp_project_slave\core\ -I
//        G:\gitclone\lamp_project_slave\core\sys\ -I
//        G:\gitclone\lamp_project_slave\platform\ -I
//        G:\gitclone\lamp_project_slave\core\lib\ -I
//        G:\gitclone\lamp_project_slave\tools\wpcapslip\ -I
//        G:\gitclone\lamp_project_slave\core\cfs\ -I
//        G:\gitclone\lamp_project_slave\OLED\ -I
//        G:\gitclone\lamp_project_slave\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  G:\gitclone\lamp_project_slave\Debug\List\mmem.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN list_add
        EXTERN list_init
        EXTERN list_remove
        EXTERN memmove

        PUBLIC avail_memory
        PUBLIC mmem_alloc
        PUBLIC mmem_free
        PUBLIC mmem_init


        SECTION `.data`:DATA:REORDER:NOROOT(2)
mmemlist:
        DATA
        DC32 mmemlist_list

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute void *mmemlist_list
mmemlist_list:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
avail_memory:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
memory:
        DS8 4096

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
mmem_alloc:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        CMP      R0,R5
        BCS      ??mmem_alloc_0
        MOVS     R0,#+0
        B        ??mmem_alloc_1
??mmem_alloc_0:
        MOVS     R1,R4
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        BL       list_add
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        LDR      R1,??DataTable2
        LDR      R1,[R1, #+0]
        RSBS     R2,R1,#+0
        LDR      R1,??DataTable2_2
        ADDS     R1,R1,R2
        ADDS     R0,R1,R0
        STR      R0,[R4, #+8]
        STR      R5,[R4, #+4]
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,R5
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
??mmem_alloc_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
mmem_free:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        LDR      R0,[R5, #+0]
        CMP      R0,#+0
        BEQ      ??mmem_free_0
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        LDR      R1,??DataTable2
        LDR      R1,[R1, #+0]
        RSBS     R2,R1,#+0
        LDR      R1,??DataTable2_2
        ADDS     R1,R1,R2
        ADDS     R0,R1,R0
        LDR      R1,[R5, #+0]
        LDR      R1,[R1, #+8]
        SUBS     R2,R0,R1
        LDR      R0,[R5, #+0]
        LDR      R1,[R0, #+8]
        LDR      R0,[R5, #+8]
        BL       memmove
        LDR      R0,[R5, #+0]
        MOVS     R4,R0
??mmem_free_1:
        CMP      R4,#+0
        BEQ      ??mmem_free_0
        LDR      R0,[R5, #+4]
        RSBS     R1,R0,#+0
        LDR      R0,[R4, #+8]
        ADDS     R0,R0,R1
        STR      R0,[R4, #+8]
        LDR      R4,[R4, #+0]
        B        ??mmem_free_1
??mmem_free_0:
        LDR      R0,??DataTable2
        LDR      R0,[R0, #+0]
        LDR      R1,[R5, #+4]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
        MOVS     R1,R5
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        BL       list_remove
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
mmem_init:
        PUSH     {R7,LR}
        LDR      R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        BL       list_init
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        LDR      R1,??DataTable2
        STR      R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     avail_memory

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     mmemlist

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     memory

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
// 4 104 bytes in section .bss
//     4 bytes in section .data
//   182 bytes in section .text
// 
//   182 bytes of CODE memory
// 4 108 bytes of DATA memory
//
//Errors: none
//Warnings: none

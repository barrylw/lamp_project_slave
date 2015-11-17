///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:18
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\contiki-main.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\contiki-main.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -D USE_LORA_MODE -lb
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\contiki-main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN InitHardware
        EXTERN InitPhyVariable
        EXTERN etimer_process
        EXTERN hal_ADC_Init
        EXTERN hal_RF_process
        EXTERN hal_init_PWM
        EXTERN hal_urat_process
        EXTERN init_zero_detect
        EXTERN printf
        EXTERN process_init
        EXTERN process_run
        EXTERN process_start
        EXTERN relay_gpio_init
        EXTERN rn8209c_init
        EXTERN start_time_detect_process

        PUBLIC InitVariable
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
        DC8 0, 0, 34, 18, 52, 3, 11, 145, 0, 0, 0, 1, 11, 145, 0, 0, 0, 2, 11
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

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
main:
        PUSH     {R7,LR}
        MOVS     R0,#+0
??main_0:
        UXTB     R0,R0
        CMP      R0,#+150
        BGE      ??main_1
        MOVS     R1,R0
        ADDS     R1,R1,#+1
        UXTB     R0,R0
        LDR      R2,??DataTable0
        STRB     R1,[R2, R0]
        ADDS     R0,R0,#+1
        B        ??main_0
??main_1:
        BL       InitVariable
        BL       InitHardware
        BL       relay_gpio_init
        BL       rn8209c_init
        BL       hal_init_PWM
        BL       init_zero_detect
        BL       hal_ADC_Init
        LDR      R0,??DataTable0_1
        BL       printf
        BL       process_init
        MOVS     R1,#+0
        LDR      R0,??DataTable0_2
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_3
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_4
        BL       process_start
        MOVS     R1,#+0
        LDR      R0,??DataTable0_5
        BL       process_start
??main_2:
??main_3:
        BL       process_run
        CMP      R0,#+1
        BGE      ??main_3
        B        ??main_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     tedtbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     `?<Constant "start app\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     etimer_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     hal_urat_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     hal_RF_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     start_time_detect_process

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
//  12 bytes in section .rodata
// 136 bytes in section .text
// 
// 136 bytes of CODE  memory
//  12 bytes of CONST memory
// 255 bytes of DATA  memory
//
//Errors: none
//Warnings: 1

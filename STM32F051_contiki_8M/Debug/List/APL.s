///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       15/Sep/2015  15:48:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\meterModuleFSK\STM32F051_contiki_8M\APP\APL.c
//    Command line =  
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\APL.c -D
//        USE_STDPERIPH_DRIVER -D STM32F051X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -D USE_LORA_MODE -lb
//        F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\ --diag_suppress
//        Pa050 -o F:\meterModuleFSK\STM32F051_contiki_8M\Debug\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\APP\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\LIB\STM32F0xx_StdPeriph_Driver\inc\
//        -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I F:\meterModuleFSK\STM32F051_contiki_8M\LIB\CMSIS\CM0\CoreSupport\
//        -I F:\meterModuleFSK\STM32F051_contiki_8M\core\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\sys\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\platform\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\lib\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\tools\wpcapslip\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\core\cfs\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\OLED\ -I
//        F:\meterModuleFSK\STM32F051_contiki_8M\coffee_arch\ -On --vla -I
//        "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\CMSIS\Include\"
//    List file    =  F:\meterModuleFSK\STM32F051_contiki_8M\Debug\List\APL.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN CRC16_CCITT_Table
        EXTERN FLASH_ErasePage
        EXTERN FLASH_Write_chars
        EXTERN GetCRC16
        EXTERN MemCpy
        EXTERN MemSet
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN g_UartRxBuffer
        EXTERN phyVersion
        EXTERN printf

        PUBLIC APLTASK
        PUBLIC FLASH_Write_update_page
        PUBLIC InitAplVariable
        PUBLIC ReadVersion
        PUBLIC SoftReset
        PUBLIC aplVersion
        PUBLIC apl_ProcessUartCmd
        PUBLIC check_update_packect_state
        PUBLIC check_update_state
        PUBLIC copy_update_datas
        PUBLIC frame645_instance
        PUBLIC getSum
        PUBLIC get_update_packets
        PUBLIC init_update
        PUBLIC modify_update_flash_params
        PUBLIC printf_params
        PUBLIC read_update_flash_params
        PUBLIC reset_update_params
        PUBLIC set_update_packetState
        PUBLIC update_instance
        PUBLIC update_software_check


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SystemReset(void)
NVIC_SystemReset:
        PUSH     {LR}
        DSB      
        LDR      R0,??DataTable5  ;; 0x5fa0004
        LDR      R1,??DataTable5_1  ;; 0xe000ed0c
        STR      R0,[R1, #+0]
        DSB      
??NVIC_SystemReset_0:
        B        ??NVIC_SystemReset_0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
frame645_instance:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
update_instance:
        DS8 36

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_updateBuffer:
        DS8 1024

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%x  ">`:
        DATA
        DC8 "%x  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "APL Version=%c%c%c%c-...">`:
        DATA
        DC8 "APL Version=%c%c%c%c-%02x%02x%02x-V%02x.%02x\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "PHY Version=%c%c%c%c-...">`:
        DATA
        DC8 "PHY Version=%c%c%c%c-%02x%02x%02x-V%02x.%02x\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:ROOT(2)
aplVersion:
        DATA
        DC8 66, 82, 50, 51, 48, 1, 20, 0, 1, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
modify_update_flash_params:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+44
        MOVS     R4,R0
        LDR      R0,??DataTable5_2  ;; 0x800fc00
        STR      R0,[SP, #+0]
        MOVS     R5,#+0
        LDR      R0,??DataTable5_2  ;; 0x800fc00
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??modify_update_flash_params_0
        LSLS     R0,R4,#+31
        BPL      ??modify_update_flash_params_1
        LDR      R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+1]
??modify_update_flash_params_1:
        LSLS     R0,R4,#+30
        BPL      ??modify_update_flash_params_2
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+2]
??modify_update_flash_params_2:
        LSLS     R0,R4,#+29
        BPL      ??modify_update_flash_params_3
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+3]
??modify_update_flash_params_3:
        LSLS     R0,R4,#+27
        BPL      ??modify_update_flash_params_4
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+4]
??modify_update_flash_params_4:
        LSLS     R0,R4,#+28
        BPL      ??modify_update_flash_params_5
        MOVS     R2,#+30
        LDR      R1,??DataTable7
        ADD      R0,SP,#+4
        ADDS     R0,R0,#+5
        BL       MemCpy
??modify_update_flash_params_5:
        MOVS     R1,#+35
        ADD      R0,SP,#+4
        BL       GetCRC16
        MOVS     R5,R0
        MOVS     R0,R5
        ADD      R1,SP,#+4
        ADDS     R1,R1,#+35
        STRB     R0,[R1, #+0]
        MOVS     R0,R5
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        ADD      R1,SP,#+4
        ADDS     R1,R1,#+36
        STRB     R0,[R1, #+0]
        MOVS     R2,#+37
        ADD      R1,SP,#+4
        MOV      R0,SP
        BL       FLASH_Write_chars
        UXTB     R0,R0
        B        ??modify_update_flash_params_6
??modify_update_flash_params_0:
        MOVS     R0,#+1
??modify_update_flash_params_6:
        ADD      SP,SP,#+44
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_update_flash_params:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+40
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
??read_update_flash_params_0:
        UXTB     R0,R0
        CMP      R0,#+37
        BGE      ??read_update_flash_params_1
        UXTB     R0,R0
        LDR      R1,??DataTable5_2  ;; 0x800fc00
        LDRB     R1,[R0, R1]
        UXTB     R0,R0
        MOV      R2,SP
        STRB     R1,[R2, R0]
        ADDS     R0,R0,#+1
        B        ??read_update_flash_params_0
??read_update_flash_params_1:
        MOVS     R1,#+35
        MOV      R0,SP
        BL       GetCRC16
        MOVS     R6,R0
        MOV      R0,SP
        ADDS     R0,R0,#+36
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R1,R0,R1
        MOV      R0,SP
        ADDS     R0,R0,#+35
        LDRB     R0,[R0, #+0]
        ADDS     R0,R1,R0
        UXTH     R6,R6
        UXTH     R0,R0
        CMP      R6,R0
        BEQ      ??read_update_flash_params_2
        MOVS     R0,#+3
        B        ??read_update_flash_params_3
??read_update_flash_params_2:
        UXTB     R4,R4
        MOVS     R0,R4
        CMP      R0,#+1
        BEQ      ??read_update_flash_params_4
        CMP      R0,#+2
        BEQ      ??read_update_flash_params_5
        CMP      R0,#+4
        BEQ      ??read_update_flash_params_6
        CMP      R0,#+8
        BEQ      ??read_update_flash_params_7
        CMP      R0,#+16
        BEQ      ??read_update_flash_params_8
        B        ??read_update_flash_params_9
??read_update_flash_params_4:
        MOVS     R0,#+0
??read_update_flash_params_10:
        UXTB     R0,R0
        CMP      R0,#+2
        BGE      ??read_update_flash_params_11
        UXTB     R0,R0
        MOV      R1,SP
        LDRB     R1,[R1, R0]
        UXTB     R0,R0
        STRB     R1,[R5, R0]
        ADDS     R0,R0,#+1
        B        ??read_update_flash_params_10
??read_update_flash_params_11:
        B        ??read_update_flash_params_12
??read_update_flash_params_5:
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        STRB     R0,[R5, #+0]
        B        ??read_update_flash_params_12
??read_update_flash_params_6:
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        STRB     R0,[R5, #+0]
        B        ??read_update_flash_params_12
??read_update_flash_params_8:
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        STRB     R0,[R5, #+0]
        B        ??read_update_flash_params_12
??read_update_flash_params_7:
        MOVS     R0,#+0
??read_update_flash_params_13:
        UXTB     R0,R0
        CMP      R0,#+30
        BGE      ??read_update_flash_params_14
        MOV      R1,SP
        LDRB     R1,[R1, #+5]
        UXTB     R0,R0
        STRB     R1,[R5, R0]
        ADDS     R0,R0,#+1
        B        ??read_update_flash_params_13
??read_update_flash_params_14:
        B        ??read_update_flash_params_12
??read_update_flash_params_9:
??read_update_flash_params_12:
        MOVS     R0,#+0
??read_update_flash_params_3:
        ADD      SP,SP,#+40
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
reset_update_params:
        PUSH     {R4,LR}
        SUB      SP,SP,#+48
        LDR      R0,??DataTable5_2  ;; 0x800fc00
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STRB     R0,[R1, #+2]
        MOVS     R0,#+3
        LDR      R1,??DataTable5_3
        STRB     R0,[R1, #+3]
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STRB     R0,[R1, #+4]
        MOVS     R2,#+30
        MOVS     R1,#+0
        LDR      R0,??DataTable7
        BL       MemSet
        LDR      R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+4
        STRB     R0,[R1, #+4]
        MOVS     R2,#+30
        MOVS     R1,#+0
        ADD      R0,SP,#+4
        ADDS     R0,R0,#+5
        BL       MemSet
        MOVS     R1,#+35
        ADD      R0,SP,#+4
        BL       GetCRC16
        MOVS     R4,R0
        MOVS     R0,R4
        ADD      R1,SP,#+4
        ADDS     R1,R1,#+35
        STRB     R0,[R1, #+0]
        MOVS     R0,R4
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        ADD      R1,SP,#+4
        ADDS     R1,R1,#+36
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable5_2  ;; 0x800fc00
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??reset_update_params_0
        MOVS     R2,#+37
        ADD      R1,SP,#+4
        MOV      R0,SP
        BL       FLASH_Write_chars
??reset_update_params_0:
        ADD      SP,SP,#+48
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
update_software_check:
        PUSH     {R4-R6,LR}
        MOVS     R1,R0
        LDR      R5,??DataTable11  ;; 0xffff
        SUBS     R4,R1,#+2
        LDR      R3,??DataTable11_1  ;; 0x8008000
??update_software_check_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTH     R0,R0
        CMP      R0,#+0
        BEQ      ??update_software_check_1
        MOVS     R0,R5
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        UXTH     R5,R5
        LDRB     R6,[R3, #+0]
        EORS     R6,R6,R5
        UXTB     R5,R6
        MOVS     R6,#+2
        MULS     R5,R6,R5
        LDR      R6,??DataTable11_2
        LDRH     R5,[R6, R5]
        EORS     R5,R5,R0
        ADDS     R3,R3,#+1
        B        ??update_software_check_0
??update_software_check_1:
        MOVS     R0,R5
        LDR      R5,??DataTable11  ;; 0xffff
        EORS     R5,R5,R0
        LDRB     R0,[R3, #+0]
        MOVS     R2,R0
        ADDS     R3,R3,#+1
        UXTH     R2,R2
        LDRB     R0,[R3, #+0]
        MOVS     R6,#+128
        LSLS     R6,R6,#+1        ;; #+256
        MULS     R0,R6,R0
        ADDS     R2,R2,R0
        ADDS     R3,R3,#+1
        UXTH     R5,R5
        UXTH     R2,R2
        CMP      R5,R2
        BNE      ??update_software_check_2
        MOVS     R0,#+0
        B        ??update_software_check_3
??update_software_check_2:
        MOVS     R0,#+1
??update_software_check_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
init_update:
        PUSH     {R7,LR}
        MOVS     R0,#+4
        LDR      R1,??DataTable5_3
        STRB     R0,[R1, #+3]
        LDR      R1,??DataTable11_3
        MOVS     R0,#+4
        BL       read_update_flash_params
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BEQ      ??init_update_0
        BCC      ??init_update_1
        CMP      R0,#+3
        BEQ      ??init_update_2
        BCC      ??init_update_3
        B        ??init_update_1
??init_update_0:
        MOV      R1,SP
        MOVS     R0,#+1
        BL       read_update_flash_params
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable5_3
        STRH     R0,[R1, #+0]
        MOV      R1,SP
        MOVS     R0,#+1
        BL       read_update_flash_params
        LDR      R0,??DataTable5_3
        LDRH     R0,[R0, #+0]
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+8
        ADDS     R0,R0,R1
        LDR      R1,??DataTable5_3
        STRH     R0,[R1, #+0]
        LDR      R1,??DataTable11_4
        MOVS     R0,#+2
        BL       read_update_flash_params
        LDR      R1,??DataTable10
        MOVS     R0,#+8
        BL       read_update_flash_params
        LDR      R0,??DataTable5_3
        LDRB     R0,[R0, #+2]
        CMP      R0,#+0
        BNE      ??init_update_4
        BL       reset_update_params
??init_update_4:
        B        ??init_update_5
??init_update_3:
        BL       reset_update_params
        B        ??init_update_5
??init_update_2:
        MOVS     R0,#+0
        LDR      R1,??DataTable5_3
        STRB     R0,[R1, #+2]
        MOVS     R2,#+30
        MOVS     R1,#+0
        LDR      R0,??DataTable10
        BL       MemSet
        B        ??init_update_5
??init_update_1:
        BL       reset_update_params
??init_update_5:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x5fa0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0xe000ed0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x800fc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     update_instance

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
APLTASK:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
InitAplVariable:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
getSum:
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
??getSum_0:
        UXTB     R3,R3
        UXTB     R1,R1
        CMP      R3,R1
        BCS      ??getSum_1
        UXTB     R3,R3
        LDRB     R4,[R2, R3]
        ADDS     R0,R0,R4
        ADDS     R3,R3,#+1
        B        ??getSum_0
??getSum_1:
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_update_packets:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+128
        BL       __aeabi_idiv
        MOVS     R5,R0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+128
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BEQ      ??get_update_packets_0
        ADDS     R5,R5,#+1
??get_update_packets_0:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_update_packetState:
        PUSH     {R4-R7,LR}
        MOVS     R4,R0
        UXTB     R4,R4
        SUBS     R0,R4,#+1
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable12
        ADDS     R5,R1,R0
        UXTB     R4,R4
        SUBS     R0,R4,#+1
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable12
        ADDS     R0,R1,R0
        LDRB     R6,[R0, #+5]
        MOVS     R7,#+1
        UXTB     R4,R4
        SUBS     R0,R4,#+1
        MOVS     R1,#+8
        BL       __aeabi_idivmod
        LSLS     R7,R7,R1
        ORRS     R7,R7,R6
        STRB     R7,[R5, #+5]
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
check_update_packect_state:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        UXTB     R4,R4
        SUBS     R0,R4,#+1
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable12
        ADDS     R0,R1,R0
        LDRB     R5,[R0, #+5]
        MOVS     R6,#+1
        UXTB     R4,R4
        SUBS     R0,R4,#+1
        MOVS     R1,#+8
        BL       __aeabi_idivmod
        LSLS     R6,R6,R1
        TST      R5,R6
        BEQ      ??check_update_packect_state_0
        MOVS     R0,#+1
        B        ??check_update_packect_state_1
??check_update_packect_state_0:
        MOVS     R0,#+0
??check_update_packect_state_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     update_instance+0x5

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
check_update_state:
        PUSH     {R3-R5,LR}
        LDR      R0,??DataTable12
        LDRH     R0,[R0, #+0]
        BL       get_update_packets
        MOVS     R4,R0
        MOVS     R5,#+0
??check_update_state_0:
        UXTB     R5,R5
        UXTB     R4,R4
        CMP      R5,R4
        BCS      ??check_update_state_1
        MOVS     R0,R5
        ADDS     R0,R0,#+1
        UXTB     R0,R0
        BL       check_update_packect_state
        CMP      R0,#+0
        BNE      ??check_update_state_2
        MOVS     R0,#+1
        B        ??check_update_state_3
??check_update_state_2:
        ADDS     R5,R5,#+1
        B        ??check_update_state_0
??check_update_state_1:
        MOVS     R0,#+0
??check_update_state_3:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
copy_update_datas:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+4]
        LDRB     R2,[R0, #+3]
        UXTH     R2,R2
        LDR      R0,??DataTable12_1
        LDR      R1,[R0, #+4]
        ADDS     R1,R1,#+4
        UXTB     R4,R4
        MOVS     R0,#+128
        MULS     R0,R4,R0
        LDR      R3,??DataTable13
        ADDS     R0,R3,R0
        SUBS     R0,R0,#+128
        BL       MemCpy
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Write_update_page:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        UXTB     R4,R4
        SUBS     R0,R4,#+1
        MOVS     R1,#+8
        BL       __aeabi_idiv
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        MULS     R0,R1,R0
        LDR      R1,??DataTable11_1  ;; 0x8008000
        ADDS     R0,R0,R1
        STR      R0,[SP, #+0]
        UXTB     R4,R4
        CMP      R4,#+129
        BNE      ??FLASH_Write_update_page_0
        MOVS     R0,#+129
        MOVS     R4,R0
??FLASH_Write_update_page_0:
        MOVS     R0,#+0
??FLASH_Write_update_page_1:
        UXTH     R0,R0
        MOVS     R1,#+128
        LSLS     R1,R1,#+3        ;; #+1024
        CMP      R0,R1
        BGE      ??FLASH_Write_update_page_2
        LDR      R1,[SP, #+0]
        UXTH     R0,R0
        LDRB     R1,[R1, R0]
        UXTH     R0,R0
        LDR      R2,??DataTable13
        STRB     R1,[R2, R0]
        ADDS     R0,R0,#+1
        B        ??FLASH_Write_update_page_1
??FLASH_Write_update_page_2:
        MOVS     R7,#+0
??FLASH_Write_update_page_3:
        UXTB     R7,R7
        UXTB     R5,R5
        CMP      R7,R5
        BCS      ??FLASH_Write_update_page_4
        UXTB     R4,R4
        SUBS     R0,R4,#+1
        MOVS     R1,#+8
        BL       __aeabi_idivmod
        MOVS     R0,#+128
        MULS     R1,R0,R1
        UXTB     R7,R7
        ADDS     R0,R1,R7
        LDR      R1,??DataTable13
        UXTB     R7,R7
        LDRB     R2,[R6, R7]
        STRB     R2,[R1, R0]
        ADDS     R7,R7,#+1
        B        ??FLASH_Write_update_page_3
??FLASH_Write_update_page_4:
        LDR      R0,[SP, #+0]
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??FLASH_Write_update_page_5
        MOVS     R2,#+128
        LSLS     R2,R2,#+3        ;; #+1024
        LDR      R1,??DataTable13
        MOV      R0,SP
        BL       FLASH_Write_chars
        B        ??FLASH_Write_update_page_6
??FLASH_Write_update_page_5:
        MOVS     R0,#+2
??FLASH_Write_update_page_6:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     update_instance+0x5

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
printf_params:
        PUSH     {R4,LR}
        SUB      SP,SP,#+40
        LDR      R0,??DataTable12
        LDRH     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable12
        LDRH     R0,[R0, #+0]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+2]
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+3]
        MOV      R1,SP
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+4]
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R2,#+30
        LDR      R1,??DataTable13_1
        MOV      R0,SP
        ADDS     R0,R0,#+5
        BL       MemCpy
        MOVS     R4,#+0
??printf_params_0:
        UXTB     R4,R4
        CMP      R4,#+35
        BGE      ??printf_params_1
        UXTB     R4,R4
        MOV      R0,SP
        LDRB     R1,[R0, R4]
        LDR      R0,??DataTable13_2
        BL       printf
        ADDS     R4,R4,#+1
        B        ??printf_params_0
??printf_params_1:
        ADR      R0,??DataTable13_3  ;; "\n"
        BL       printf
        ADD      SP,SP,#+40
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x8008000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     CRC16_CCITT_Table

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     update_instance+0x3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     update_instance+0x2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
apl_ProcessUartCmd:
        PUSH     {R4,LR}
        LDR      R0,??DataTable13_4
        LDRB     R0,[R0, #+8]
        LDR      R1,??DataTable12_1
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable13_4
        LDRB     R0,[R0, #+9]
        LDR      R1,??DataTable12_1
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable13_5
        LDR      R1,??DataTable12_1
        STR      R0,[R1, #+4]
        LDR      R0,??DataTable13_4
        LDRB     R0,[R0, #+9]
        LDR      R1,??DataTable13_4
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+10]
        LDR      R1,??DataTable12_1
        STRB     R0,[R1, #+8]
        LDR      R0,??DataTable12_1
        LDRB     R1,[R0, #+1]
        ADDS     R1,R1,#+10
        UXTB     R1,R1
        LDR      R0,??DataTable13_4
        BL       getSum
        LDR      R1,??DataTable12_1
        LDRB     R1,[R1, #+8]
        UXTB     R0,R0
        CMP      R0,R1
        BNE      ??apl_ProcessUartCmd_0
        LDR      R0,??DataTable12_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??apl_ProcessUartCmd_0
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+4]
        LDRB     R0,[R0, #+3]
        LDR      R1,??DataTable13_6
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+4]
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable12_1
        LDR      R1,[R1, #+4]
        LDRB     R1,[R1, #+2]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        MOVS     R4,R0
        MOVS     R0,R4
        UXTH     R0,R0
        BL       get_update_packets
        LDR      R1,??DataTable13_6
        LDRB     R1,[R1, #+2]
        CMP      R0,R1
        BCC      ??apl_ProcessUartCmd_1
??apl_ProcessUartCmd_2:
        LDR      R0,??DataTable13_6
        LDRB     R0,[R0, #+4]
        LDR      R1,??DataTable12_1
        LDR      R1,[R1, #+4]
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??apl_ProcessUartCmd_3
        LDR      R0,??DataTable13_6
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BNE      ??apl_ProcessUartCmd_4
        LDR      R0,??DataTable13_6
        LDRB     R0,[R0, #+2]
        BL       check_update_packect_state
        CMP      R0,#+1
        BNE      ??apl_ProcessUartCmd_5
        B        ??apl_ProcessUartCmd_1
??apl_ProcessUartCmd_4:
        B        ??apl_ProcessUartCmd_1
??apl_ProcessUartCmd_3:
        LDR      R0,??DataTable13_6
        STRH     R4,[R0, #+0]
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+4]
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable13_6
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        LDR      R1,??DataTable13_6
        STRB     R0,[R1, #+3]
??apl_ProcessUartCmd_5:
        LDR      R0,??DataTable12_1
        LDR      R0,[R0, #+4]
        LDRB     R2,[R0, #+4]
        LDR      R0,??DataTable12_1
        LDR      R1,[R0, #+4]
        ADDS     R1,R1,#+5
        LDR      R0,??DataTable13_6
        LDRB     R0,[R0, #+2]
        BL       FLASH_Write_update_page
        CMP      R0,#+0
        BNE      ??apl_ProcessUartCmd_0
        LDR      R0,??DataTable13_6
        LDRB     R0,[R0, #+3]
        CMP      R0,#+0
        BNE      ??apl_ProcessUartCmd_6
        MOVS     R0,#+1
        LDR      R1,??DataTable13_6
        STRB     R0,[R1, #+3]
??apl_ProcessUartCmd_6:
        LDR      R0,??DataTable13_6
        LDRB     R0,[R0, #+2]
        BL       set_update_packetState
        BL       check_update_state
        CMP      R0,#+0
        BNE      ??apl_ProcessUartCmd_7
        LDR      R0,??DataTable13_6
        LDRH     R0,[R0, #+0]
        BL       update_software_check
        CMP      R0,#+0
        BNE      ??apl_ProcessUartCmd_8
        MOVS     R0,#+2
        LDR      R1,??DataTable13_6
        STRB     R0,[R1, #+3]
        MOVS     R0,#+31
        BL       modify_update_flash_params
        BL       SoftReset
        B        ??apl_ProcessUartCmd_0
??apl_ProcessUartCmd_8:
        BL       reset_update_params
        B        ??apl_ProcessUartCmd_0
??apl_ProcessUartCmd_7:
        MOVS     R0,#+31
        BL       modify_update_flash_params
        BL       printf_params
??apl_ProcessUartCmd_0:
??apl_ProcessUartCmd_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     update_instance

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     frame645_instance

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ReadVersion:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+1]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+5]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+6]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+7]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable13_7
        LDRB     R0,[R0, #+8]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+8]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+7]
        STR      R0,[SP, #+20]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+8]
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+4]
        STR      R0,[SP, #+12]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+5]
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+6]
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+24
        LDRB     R3,[R0, #+3]
        MOV      R0,SP
        LDRB     R2,[R0, #+24]
        ADD      R0,SP,#+24
        LDRB     R1,[R0, #+1]
        LDR      R0,??DataTable13_8
        BL       printf
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+1]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+5]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+6]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+7]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable13_9
        LDRB     R0,[R0, #+8]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+8]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+7]
        STR      R0,[SP, #+20]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+8]
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+4]
        STR      R0,[SP, #+12]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+5]
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+6]
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+24
        LDRB     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+24
        LDRB     R3,[R0, #+3]
        MOV      R0,SP
        LDRB     R2,[R0, #+24]
        ADD      R0,SP,#+24
        LDRB     R1,[R0, #+1]
        LDR      R0,??DataTable13_10
        BL       printf
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     g_updateBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     update_instance+0x5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     `?<Constant "%x  ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC8      "\n",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     g_UartRxBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     g_UartRxBuffer+0xA

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     update_instance

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     aplVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     `?<Constant "APL Version=%c%c%c%c-...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     phyVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     `?<Constant "PHY Version=%c%c%c%c-...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SoftReset:
        PUSH     {R7,LR}
        CPSID    I
        BL       NVIC_SystemReset
        POP      {R0,PC}          ;; return

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
// 1 072 bytes in section .bss
//   118 bytes in section .rodata
// 1 848 bytes in section .text
// 
// 1 848 bytes of CODE  memory
//   118 bytes of CONST memory
// 1 072 bytes of DATA  memory
//
//Errors: none
//Warnings: none

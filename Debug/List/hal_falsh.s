///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       12/Dec/2015  17:38:28
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\APP\hal_falsh.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\APP\hal_falsh.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        PRINTF_DEBUG -D USE_LORA_MODE -lb
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\hal_falsh.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FLASH_ClearFlag
        EXTERN FLASH_ErasePage
        EXTERN FLASH_ProgramHalfWord
        EXTERN FLASH_Unlock
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod

        PUBLIC FLASH_Init
        PUBLIC FLASH_Write_chars
        PUBLIC flash_erase_page
        PUBLIC hal_Init_Flash


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Init:
        PUSH     {R7,LR}
        BL       FLASH_Unlock
        MOVS     R0,#+53
        BL       FLASH_ClearFlag
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_Init_Flash:
        PUSH     {R7,LR}
        BL       FLASH_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
flash_erase_page:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       FLASH_ErasePage
        MOVS     R5,R0
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Write_chars:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        CPSID    I
        MOVS     R4,#+0
??FLASH_Write_chars_0:
        UXTH     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+2
        BL       __aeabi_idiv
        UXTH     R4,R4
        CMP      R4,R0
        BGE      ??FLASH_Write_chars_1
        UXTH     R4,R4
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDRB     R0,[R6, R0]
        UXTH     R4,R4
        MOVS     R1,#+2
        MULS     R1,R4,R1
        ADDS     R1,R6,R1
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOV      R0,SP
        LDRH     R1,[R0, #+0]
        MOVS     R0,R5
        BL       FLASH_ProgramHalfWord
        CMP      R0,#+4
        BNE      ??FLASH_Write_chars_2
        LDRH     R0,[R5, #+0]
        MOV      R1,SP
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??FLASH_Write_chars_3
        CPSIE    I
        MOVS     R0,#+2
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_3:
        ADDS     R5,R5,#+2
        ADDS     R4,R4,#+1
        B        ??FLASH_Write_chars_0
??FLASH_Write_chars_2:
        CPSIE    I
        MOVS     R0,#+1
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_1:
        UXTH     R7,R7
        MOVS     R0,R7
        MOVS     R1,#+2
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??FLASH_Write_chars_5
        CPSIE    I
        MOVS     R0,#+0
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_5:
        MOV      R0,SP
        UXTH     R7,R7
        ADDS     R1,R6,R7
        SUBS     R1,R1,#+1
        LDRB     R1,[R1, #+0]
        STRH     R1,[R0, #+0]
        MOV      R0,SP
        LDRH     R1,[R0, #+0]
        MOVS     R0,R5
        BL       FLASH_ProgramHalfWord
        CMP      R0,#+4
        BNE      ??FLASH_Write_chars_6
        LDRH     R0,[R5, #+0]
        MOV      R1,SP
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??FLASH_Write_chars_7
        CPSIE    I
        MOVS     R0,#+2
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_7:
        CPSIE    I
        MOVS     R0,#+0
        B        ??FLASH_Write_chars_4
??FLASH_Write_chars_6:
        CPSIE    I
        MOVS     R0,#+1
??FLASH_Write_chars_4:
        POP      {R1,R4-R7,PC}    ;; return

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
// 214 bytes in section .text
// 
// 214 bytes of CODE memory
//
//Errors: none
//Warnings: none

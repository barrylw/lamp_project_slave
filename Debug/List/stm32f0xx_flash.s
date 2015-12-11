///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:29:38
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_flash.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_flash.c
//        -D USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
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
//    List file    =  
//        G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_flash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC FLASH_ClearFlag
        PUBLIC FLASH_EraseAllPages
        PUBLIC FLASH_ErasePage
        PUBLIC FLASH_GetFlagStatus
        PUBLIC FLASH_GetPrefetchBufferStatus
        PUBLIC FLASH_GetStatus
        PUBLIC FLASH_ITConfig
        PUBLIC FLASH_Lock
        PUBLIC FLASH_OB_BOOTConfig
        PUBLIC FLASH_OB_EnableWRP
        PUBLIC FLASH_OB_Erase
        PUBLIC FLASH_OB_GetRDP
        PUBLIC FLASH_OB_GetUser
        PUBLIC FLASH_OB_GetWRP
        PUBLIC FLASH_OB_Launch
        PUBLIC FLASH_OB_Lock
        PUBLIC FLASH_OB_ProgramData
        PUBLIC FLASH_OB_RDPConfig
        PUBLIC FLASH_OB_SRAMParityConfig
        PUBLIC FLASH_OB_Unlock
        PUBLIC FLASH_OB_UserConfig
        PUBLIC FLASH_OB_VDDAConfig
        PUBLIC FLASH_OB_WriteUser
        PUBLIC FLASH_PrefetchBufferCmd
        PUBLIC FLASH_ProgramHalfWord
        PUBLIC FLASH_ProgramWord
        PUBLIC FLASH_SetLatency
        PUBLIC FLASH_Unlock
        PUBLIC FLASH_WaitForLastOperation


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_SetLatency:
        MOVS     R1,#+0
        LDR      R2,??DataTable13  ;; 0x40022000
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        MOVS     R2,#+1
        BICS     R1,R1,R2
        ORRS     R0,R0,R1
        MOVS     R1,R0
        LDR      R0,??DataTable13  ;; 0x40022000
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_PrefetchBufferCmd:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+0
        BEQ      ??FLASH_PrefetchBufferCmd_0
        LDR      R0,??DataTable13  ;; 0x40022000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13  ;; 0x40022000
        STR      R1,[R0, #+0]
        B        ??FLASH_PrefetchBufferCmd_1
??FLASH_PrefetchBufferCmd_0:
        LDR      R0,??DataTable13  ;; 0x40022000
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable13  ;; 0x40022000
        STR      R0,[R1, #+0]
??FLASH_PrefetchBufferCmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetPrefetchBufferStatus:
        PUSH     {LR}
        MOVS     R0,#+0
        LDR      R1,??DataTable13  ;; 0x40022000
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+26
        BPL      ??FLASH_GetPrefetchBufferStatus_0
        MOVS     R0,#+1
        B        ??FLASH_GetPrefetchBufferStatus_1
??FLASH_GetPrefetchBufferStatus_0:
        MOVS     R0,#+0
??FLASH_GetPrefetchBufferStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Unlock:
        PUSH     {LR}
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL      ??FLASH_Unlock_0
        LDR      R0,??DataTable13_2  ;; 0x45670123
        LDR      R1,??DataTable13_3  ;; 0x40022004
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable13_4  ;; 0xcdef89ab
        LDR      R1,??DataTable13_3  ;; 0x40022004
        STR      R0,[R1, #+0]
??FLASH_Unlock_0:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Lock:
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ErasePage:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_ErasePage_0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable13_5  ;; 0x40022014
        STR      R4,[R0, #+0]
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+2
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_ErasePage_0:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_EraseAllPages:
        PUSH     {R4,LR}
        MOVS     R4,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R4,R0
        UXTB     R4,R4
        CMP      R4,#+4
        BNE      ??FLASH_EraseAllPages_0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R4,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+4
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_EraseAllPages_0:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ProgramWord:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+4
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+4
        BNE      ??FLASH_ProgramWord_0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        MOVS     R0,R4
        STRH     R0,[R5, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+4
        BNE      ??FLASH_ProgramWord_1
        ADDS     R5,R5,#+2
        STR      R5,[SP, #+0]
        MOVS     R0,R4
        LSRS     R0,R0,#+16
        LDR      R1,[SP, #+0]
        STRH     R0,[R1, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
        B        ??FLASH_ProgramWord_0
??FLASH_ProgramWord_1:
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_ProgramWord_0:
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ProgramHalfWord:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+4
        BNE      ??FLASH_ProgramHalfWord_0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        STRH     R4,[R5, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_ProgramHalfWord_0:
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_Unlock:
        PUSH     {LR}
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+22
        BMI      ??FLASH_OB_Unlock_0
        LDR      R0,??DataTable13_2  ;; 0x45670123
        LDR      R1,??DataTable18  ;; 0x40022008
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable13_4  ;; 0xcdef89ab
        LDR      R1,??DataTable18  ;; 0x40022008
        STR      R0,[R1, #+0]
??FLASH_OB_Unlock_0:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_Lock:
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        LDR      R1,??DataTable17  ;; 0xfffffdff
        ANDS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_Launch:
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+6        ;; #+8192
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_Erase:
        PUSH     {R3-R5,LR}
        MOVS     R4,#+170
        MOVS     R5,#+4
        BL       FLASH_OB_GetRDP
        CMP      R0,#+0
        BEQ      ??FLASH_OB_Erase_0
        MOVS     R4,#+0
??FLASH_OB_Erase_0:
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_OB_Erase_1
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+32
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_OB_Erase_2
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+32
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable18_1  ;; 0x1ffff800
        STRH     R4,[R0, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+5
        BEQ      ??FLASH_OB_Erase_1
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
        B        ??FLASH_OB_Erase_1
??FLASH_OB_Erase_2:
        UXTB     R5,R5
        CMP      R5,#+5
        BEQ      ??FLASH_OB_Erase_1
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_Erase_1:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_EnableWRP:
        PUSH     {R4-R6,LR}
        LDR      R4,??DataTable19  ;; 0xffff
        LDR      R5,??DataTable19  ;; 0xffff
        MOVS     R6,#+4
        MVNS     R1,R0
        MOVS     R0,R1
        MOVS     R1,R0
        UXTB     R1,R1
        MOVS     R4,R1
        LSRS     R0,R0,#+8
        UXTB     R0,R0
        MOVS     R5,R0
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+4
        BNE      ??FLASH_OB_EnableWRP_0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        STR      R1,[R0, #+0]
        UXTH     R4,R4
        CMP      R4,#+255
        BEQ      ??FLASH_OB_EnableWRP_1
        LDR      R0,??DataTable22  ;; 0x1ffff808
        STRH     R4,[R0, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
??FLASH_OB_EnableWRP_1:
        UXTB     R6,R6
        CMP      R6,#+4
        BNE      ??FLASH_OB_EnableWRP_2
        UXTH     R5,R5
        CMP      R5,#+255
        BEQ      ??FLASH_OB_EnableWRP_2
        LDR      R0,??DataTable23  ;; 0x1ffff80a
        STRH     R5,[R0, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
??FLASH_OB_EnableWRP_2:
        UXTB     R6,R6
        CMP      R6,#+5
        BEQ      ??FLASH_OB_EnableWRP_0
        LDR      R0,??DataTable13_1  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable13_1  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_EnableWRP_0:
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x40022000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0x40022010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     0x45670123

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     0x40022004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     0xcdef89ab

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     0x40022014

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_RDPConfig:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_OB_RDPConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+32
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+64
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_OB_RDPConfig_1
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+32
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        UXTB     R4,R4
        LDR      R0,??DataTable18_1  ;; 0x1ffff800
        STRH     R4,[R0, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+5
        BEQ      ??FLASH_OB_RDPConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
        B        ??FLASH_OB_RDPConfig_0
??FLASH_OB_RDPConfig_1:
        UXTB     R5,R5
        CMP      R5,#+5
        BEQ      ??FLASH_OB_RDPConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+32
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_RDPConfig_0:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_UserConfig:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R6,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+4
        BNE      ??FLASH_OB_UserConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        UXTB     R4,R4
        UXTB     R7,R7
        ORRS     R7,R7,R4
        UXTB     R5,R5
        MOVS     R0,#+248
        ORRS     R0,R0,R5
        ORRS     R0,R0,R7
        LDR      R1,??DataTable27_1  ;; 0x1ffff802
        STRH     R0,[R1, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+5
        BEQ      ??FLASH_OB_UserConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_UserConfig_0:
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_BOOTConfig:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_OB_BOOTConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        UXTB     R4,R4
        MOVS     R0,#+239
        ORRS     R0,R0,R4
        LDR      R1,??DataTable27_1  ;; 0x1ffff802
        STRH     R0,[R1, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+5
        BEQ      ??FLASH_OB_BOOTConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_BOOTConfig_0:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_VDDAConfig:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_OB_VDDAConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        UXTB     R4,R4
        MOVS     R0,#+223
        ORRS     R0,R0,R4
        LDR      R1,??DataTable27_1  ;; 0x1ffff802
        STRH     R0,[R1, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+5
        BEQ      ??FLASH_OB_VDDAConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_VDDAConfig_0:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     0xfffffdff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_SRAMParityConfig:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_OB_SRAMParityConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        UXTB     R4,R4
        MOVS     R0,#+191
        ORRS     R0,R0,R4
        LDR      R1,??DataTable27_1  ;; 0x1ffff802
        STRH     R0,[R1, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+5
        BEQ      ??FLASH_OB_SRAMParityConfig_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_SRAMParityConfig_0:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x40022008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     0x1ffff800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_WriteUser:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??FLASH_OB_WriteUser_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        UXTB     R4,R4
        MOVS     R0,#+136
        ORRS     R0,R0,R4
        LDR      R1,??DataTable27_1  ;; 0x1ffff802
        STRH     R0,[R1, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R5,R0
        UXTB     R5,R5
        CMP      R5,#+5
        BEQ      ??FLASH_OB_WriteUser_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_WriteUser_0:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_ProgramData:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,#+4
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+4
        BNE      ??FLASH_OB_ProgramData_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        ORRS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
        UXTB     R4,R4
        STRH     R4,[R5, #+0]
        MOVS     R0,#+176
        LSLS     R0,R0,#+12       ;; #+720896
        BL       FLASH_WaitForLastOperation
        MOVS     R6,R0
        UXTB     R6,R6
        CMP      R6,#+5
        BEQ      ??FLASH_OB_ProgramData_0
        LDR      R0,??DataTable27  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVS     R1,#+16
        BICS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_OB_ProgramData_0:
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetUser:
        LDR      R0,??DataTable27_2  ;; 0x4002201c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+8
        UXTB     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetWRP:
        LDR      R0,??DataTable27_3  ;; 0x40022020
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0x1ffff808

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_OB_GetRDP:
        PUSH     {LR}
        MOVS     R0,#+0
        LDR      R1,??DataTable27_2  ;; 0x4002201c
        LDR      R1,[R1, #+0]
        MOVS     R2,#+6
        ANDS     R2,R2,R1
        CMP      R2,#+0
        BEQ      ??FLASH_OB_GetRDP_0
        MOVS     R0,#+1
        B        ??FLASH_OB_GetRDP_1
??FLASH_OB_GetRDP_0:
        MOVS     R0,#+0
??FLASH_OB_GetRDP_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0x1ffff80a

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ITConfig:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??FLASH_ITConfig_0
        LDR      R1,??DataTable27  ;; 0x40022010
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR      R1,??DataTable27  ;; 0x40022010
        STR      R0,[R1, #+0]
        B        ??FLASH_ITConfig_1
??FLASH_ITConfig_0:
        LDR      R1,??DataTable27  ;; 0x40022010
        LDR      R1,[R1, #+0]
        BICS     R1,R1,R0
        LDR      R0,??DataTable27  ;; 0x40022010
        STR      R1,[R0, #+0]
??FLASH_ITConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetFlagStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable27_4  ;; 0x4002200c
        LDR      R2,[R2, #+0]
        ANDS     R1,R1,R2
        CMP      R1,#+0
        BEQ      ??FLASH_GetFlagStatus_0
        MOVS     R0,#+1
        B        ??FLASH_GetFlagStatus_1
??FLASH_GetFlagStatus_0:
        MOVS     R0,#+0
??FLASH_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ClearFlag:
        LDR      R1,??DataTable27_4  ;; 0x4002200c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetStatus:
        PUSH     {LR}
        MOVS     R0,#+4
        LDR      R1,??DataTable27_4  ;; 0x4002200c
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+31
        BPL      ??FLASH_GetStatus_0
        MOVS     R0,#+1
        B        ??FLASH_GetStatus_1
??FLASH_GetStatus_0:
        LDR      R0,??DataTable27_4  ;; 0x4002200c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL      ??FLASH_GetStatus_2
        MOVS     R0,#+2
        B        ??FLASH_GetStatus_1
??FLASH_GetStatus_2:
        LDR      R0,??DataTable27_4  ;; 0x4002200c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL      ??FLASH_GetStatus_3
        MOVS     R0,#+3
        B        ??FLASH_GetStatus_1
??FLASH_GetStatus_3:
        MOVS     R0,#+4
??FLASH_GetStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     0x40022010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_1:
        DC32     0x1ffff802

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_2:
        DC32     0x4002201c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_3:
        DC32     0x40022020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_4:
        DC32     0x4002200c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_WaitForLastOperation:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+4
        BL       FLASH_GetStatus
        MOVS     R5,R0
        B        ??FLASH_WaitForLastOperation_0
??FLASH_WaitForLastOperation_1:
        BL       FLASH_GetStatus
        MOVS     R5,R0
        SUBS     R4,R4,#+1
??FLASH_WaitForLastOperation_0:
        UXTB     R5,R5
        CMP      R5,#+1
        BNE      ??FLASH_WaitForLastOperation_2
        CMP      R4,#+0
        BNE      ??FLASH_WaitForLastOperation_1
??FLASH_WaitForLastOperation_2:
        CMP      R4,#+0
        BNE      ??FLASH_WaitForLastOperation_3
        MOVS     R5,#+5
??FLASH_WaitForLastOperation_3:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

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
// 1 666 bytes in section .text
// 
// 1 666 bytes of CODE memory
//
//Errors: none
//Warnings: none

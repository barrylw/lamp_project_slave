///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  20:29:37
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_dma.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\LIB\STM32F0xx_StdPeriph_Driver\src\stm32f0xx_dma.c
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\stm32f0xx_dma.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC DMA_ClearFlag
        PUBLIC DMA_ClearITPendingBit
        PUBLIC DMA_Cmd
        PUBLIC DMA_DeInit
        PUBLIC DMA_GetCurrDataCounter
        PUBLIC DMA_GetFlagStatus
        PUBLIC DMA_GetITStatus
        PUBLIC DMA_ITConfig
        PUBLIC DMA_Init
        PUBLIC DMA_SetCurrDataCounter
        PUBLIC DMA_StructInit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_DeInit:
        PUSH     {LR}
        LDR      R1,[R0, #+0]
        LDR      R2,??DataTable6  ;; 0xfffe
        ANDS     R2,R2,R1
        STR      R2,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        LDR      R1,??DataTable6_1  ;; 0x40020008
        CMP      R0,R1
        BNE      ??DMA_DeInit_0
        LDR      R0,??DataTable6_2  ;; 0x40020004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+15
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_2  ;; 0x40020004
        STR      R1,[R0, #+0]
        B        ??DMA_DeInit_1
??DMA_DeInit_0:
        LDR      R1,??DataTable6_3  ;; 0x4002001c
        CMP      R0,R1
        BNE      ??DMA_DeInit_2
        LDR      R0,??DataTable6_2  ;; 0x40020004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+240
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_2  ;; 0x40020004
        STR      R1,[R0, #+0]
        B        ??DMA_DeInit_1
??DMA_DeInit_2:
        LDR      R1,??DataTable6_4  ;; 0x40020030
        CMP      R0,R1
        BNE      ??DMA_DeInit_3
        LDR      R0,??DataTable6_2  ;; 0x40020004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+240
        LSLS     R1,R1,#+4        ;; #+3840
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_2  ;; 0x40020004
        STR      R1,[R0, #+0]
        B        ??DMA_DeInit_1
??DMA_DeInit_3:
        LDR      R1,??DataTable6_5  ;; 0x40020044
        CMP      R0,R1
        BNE      ??DMA_DeInit_4
        LDR      R0,??DataTable6_2  ;; 0x40020004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+240
        LSLS     R1,R1,#+8        ;; #+61440
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_2  ;; 0x40020004
        STR      R1,[R0, #+0]
        B        ??DMA_DeInit_1
??DMA_DeInit_4:
        LDR      R1,??DataTable6_6  ;; 0x40020058
        CMP      R0,R1
        BNE      ??DMA_DeInit_1
        LDR      R0,??DataTable6_2  ;; 0x40020004
        LDR      R0,[R0, #+0]
        MOVS     R1,#+240
        LSLS     R1,R1,#+12       ;; #+983040
        ORRS     R1,R1,R0
        LDR      R0,??DataTable6_2  ;; 0x40020004
        STR      R1,[R0, #+0]
??DMA_DeInit_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        LDR      R2,[R0, #+0]
        MOVS     R3,R2
        MOVS     R2,R3
        LDR      R3,??DataTable6_7  ;; 0xffff800f
        ANDS     R3,R3,R2
        MOVS     R2,R3
        LDR      R3,[R1, #+8]
        LDR      R4,[R1, #+32]
        ORRS     R4,R4,R3
        LDR      R3,[R1, #+16]
        ORRS     R3,R3,R4
        LDR      R4,[R1, #+20]
        ORRS     R4,R4,R3
        LDR      R3,[R1, #+24]
        ORRS     R3,R3,R4
        LDR      R4,[R1, #+28]
        ORRS     R4,R4,R3
        LDR      R5,[R1, #+36]
        ORRS     R5,R5,R4
        LDR      R3,[R1, #+40]
        ORRS     R3,R3,R5
        ORRS     R3,R3,R2
        STR      R3,[R0, #+0]
        LDR      R2,[R1, #+12]
        STR      R2,[R0, #+4]
        LDR      R2,[R1, #+0]
        STR      R2,[R0, #+8]
        LDR      R1,[R1, #+4]
        STR      R1,[R0, #+12]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        MOVS     R1,#+0
        STR      R1,[R0, #+16]
        MOVS     R1,#+0
        STR      R1,[R0, #+20]
        MOVS     R1,#+0
        STR      R1,[R0, #+24]
        MOVS     R1,#+0
        STR      R1,[R0, #+28]
        MOVS     R1,#+0
        STR      R1,[R0, #+32]
        MOVS     R1,#+0
        STR      R1,[R0, #+36]
        MOVS     R1,#+0
        STR      R1,[R0, #+40]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_Cmd:
        PUSH     {LR}
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??DMA_Cmd_0
        LDR      R1,[R0, #+0]
        MOVS     R2,#+1
        ORRS     R2,R2,R1
        STR      R2,[R0, #+0]
        B        ??DMA_Cmd_1
??DMA_Cmd_0:
        LDR      R1,[R0, #+0]
        LDR      R2,??DataTable6  ;; 0xfffe
        ANDS     R2,R2,R1
        STR      R2,[R0, #+0]
??DMA_Cmd_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_SetCurrDataCounter:
        UXTH     R1,R1
        STR      R1,[R0, #+4]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetCurrDataCounter:
        LDR      R0,[R0, #+4]
        UXTH     R0,R0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ITConfig:
        PUSH     {LR}
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??DMA_ITConfig_0
        LDR      R2,[R0, #+0]
        ORRS     R1,R1,R2
        STR      R1,[R0, #+0]
        B        ??DMA_ITConfig_1
??DMA_ITConfig_0:
        LDR      R2,[R0, #+0]
        BICS     R2,R2,R1
        STR      R2,[R0, #+0]
??DMA_ITConfig_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetFlagStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable6_8  ;; 0x40020000
        LDR      R2,[R2, #+0]
        ANDS     R1,R1,R2
        CMP      R1,#+0
        BEQ      ??DMA_GetFlagStatus_0
        MOVS     R0,#+1
        B        ??DMA_GetFlagStatus_1
??DMA_GetFlagStatus_0:
        MOVS     R0,#+0
??DMA_GetFlagStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ClearFlag:
        LDR      R1,??DataTable6_2  ;; 0x40020004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_GetITStatus:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR      R2,??DataTable6_8  ;; 0x40020000
        LDR      R2,[R2, #+0]
        ANDS     R1,R1,R2
        CMP      R1,#+0
        BEQ      ??DMA_GetITStatus_0
        MOVS     R0,#+1
        B        ??DMA_GetITStatus_1
??DMA_GetITStatus_0:
        MOVS     R0,#+0
??DMA_GetITStatus_1:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA_ClearITPendingBit:
        LDR      R1,??DataTable6_2  ;; 0x40020004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0xfffe

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x40020008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x4002001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x40020030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x40020044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x40020058

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0xffff800f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     0x40020000

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
// 408 bytes in section .text
// 
// 408 bytes of CODE memory
//
//Errors: none
//Warnings: none

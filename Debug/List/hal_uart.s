///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  21:56:15
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\gitclone\lamp_project_slave\APP\hal_uart.c
//    Command line =  
//        G:\gitclone\lamp_project_slave\APP\hal_uart.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D USE_LORA_MODE -D PRINTF_DEBUG
//        -lb G:\gitclone\lamp_project_slave\Debug\List\ --diag_suppress Pa050
//        -o G:\gitclone\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
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
//    List file    =  G:\gitclone\lamp_project_slave\Debug\List\hal_uart.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN DMA_ClearITPendingBit
        EXTERN DMA_Cmd
        EXTERN DMA_DeInit
        EXTERN DMA_GetITStatus
        EXTERN DMA_ITConfig
        EXTERN DMA_Init
        EXTERN GPIO_Init
        EXTERN GPIO_PinAFConfig
        EXTERN IWDG_ReloadCounter
        EXTERN OSMemCreate
        EXTERN OSMemGet
        EXTERN OSMemPut
        EXTERN OSMemQuery
        EXTERN OS_MemClr
        EXTERN OS_MemCopy
        EXTERN RCC_AHBPeriphClockCmd
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SYSCFG_DMAChannelRemapConfig
        EXTERN USART_Cmd
        EXTERN USART_DMACmd
        EXTERN USART_GetITStatus
        EXTERN USART_ITConfig
        EXTERN USART_Init
        EXTERN USART_ReceiveData
        EXTERN WWDG_SetCounter
        EXTERN __aeabi_uidiv
        EXTERN __aeabi_uidivmod
        EXTERN apl_ProcessDebugCmd
        EXTERN etimer_remodify
        EXTERN etimer_set
        EXTERN etimer_stop
        EXTERN g_SystickCounter
        EXTERN getSum
        EXTERN hal_InitMemoryVariable
        EXTERN process_post
        EXTERN read_addr
        EXTERN set_addr
        EXTERN vsnprintf

        PUBLIC COM_BAUD
        PUBLIC COM_RX_AF
        PUBLIC COM_RX_BUFFER_SIZE
        PUBLIC COM_RX_PIN
        PUBLIC COM_RX_PIN_SOURCE
        PUBLIC COM_RX_PORT
        PUBLIC COM_RX_PORT_CLK
        PUBLIC COM_TX_AF
        PUBLIC COM_TX_PIN
        PUBLIC COM_TX_PIN_SOURCE
        PUBLIC COM_TX_PORT
        PUBLIC COM_TX_PORT_CLK
        PUBLIC COM_USART
        PUBLIC COM_USART_CLK
        PUBLIC DMA1_Channel4_5_IRQHandler
        PUBLIC USART1_IRQHandler
        PUBLIC `__iar_default_requirements$$_Printf<unknown>printf`
`__iar_default_requirements$$_Printf<unknown>printf` EQU 0
        PUBLIC apl_ProcessDDCmd
        PUBLIC g_DebugRxBuffer
        PUBLIC g_DebugRxFlag
        PUBLIC g_DebugRx_state
        PUBLIC g_DebugTx_state
        PUBLIC g_Print
        PUBLIC g_UartRxBuffer
        PUBLIC g_UartRxFlag
        PUBLIC g_UartRx_state
        PUBLIC g_UartTxBuffer
        PUBLIC g_UartTxFlag
        PUBLIC g_UartTx_state
        PUBLIC hal_DebugDMATx
        PUBLIC hal_InitCOM
        PUBLIC hal_InitPrintVariable
        PUBLIC hal_InitUART
        PUBLIC hal_InitUartVariable
        PUBLIC hal_urat_process
        PUBLIC printf
        PUBLIC timer_debug_uart_rx
        PUBLIC timer_debug_uart_tx
        PUBLIC timer_uart_rx
        PUBLIC timer_uart_tx


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp u32 hal_GetSystickCounter(void)
hal_GetSystickCounter:
        LDR      R0,??DataTable3
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
COM_USART:
        DATA
        DC32 40004400H, 40013800H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "uart_process">`:
        DATA
        DC8 "uart_process"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "print timeout error!\\r\\n">`:
        DATA
        DC8 "print timeout error!\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
COM_BAUD:
        DATA
        DC32 4800, 115200

        SECTION `.data`:DATA:REORDER:NOROOT(2)
COM_TX_PORT:
        DATA
        DC32 48000000H, 48000400H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
COM_RX_PORT:
        DATA
        DC32 48000000H, 48000400H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
COM_USART_CLK:
        DATA
        DC32 131072, 16384

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
COM_TX_PORT_CLK:
        DATA
        DC32 131072, 262144

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
COM_RX_PORT_CLK:
        DATA
        DC32 131072, 262144

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
COM_TX_PIN:
        DATA
        DC16 4, 64

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
COM_RX_PIN:
        DATA
        DC16 8, 128

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
COM_TX_PIN_SOURCE:
        DATA
        DC8 2, 6

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
COM_RX_PIN_SOURCE:
        DATA
        DC8 3, 7

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
COM_TX_AF:
        DATA
        DC8 1, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
COM_RX_AF:
        DATA
        DC8 1, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
COM_RX_BUFFER_SIZE:
        DATA
        DC16 255, 30

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_DebugRxBuffer:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_Print:
        DS8 1208

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_UartTxBuffer:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_UartRxBuffer:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_UartTxFlag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_UartRxFlag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_DebugRxFlag:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
g_UartTx_state:
        DATA
        DC8 2

        SECTION `.data`:DATA:REORDER:NOROOT(0)
g_UartRx_state:
        DATA
        DC8 6

        SECTION `.data`:DATA:REORDER:NOROOT(0)
g_DebugTx_state:
        DATA
        DC8 10

        SECTION `.data`:DATA:REORDER:NOROOT(0)
g_DebugRx_state:
        DATA
        DC8 13

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timer_uart_tx:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timer_uart_rx:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timer_debug_uart_tx:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
timer_debug_uart_rx:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
hal_urat_process:
        DATA
        DC32 0H, `?<Constant "uart_process">`, process_thread_hal_urat_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_hal_urat_process:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_hal_urat_process_0
        CMP      R0,#+109
        BEQ      ??process_thread_hal_urat_process_1
        B        ??process_thread_hal_urat_process_2
??process_thread_hal_urat_process_0:
        MOVS     R1,#+0
        MOVS     R0,#+109
        STRH     R0,[R4, #+0]
??process_thread_hal_urat_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??process_thread_hal_urat_process_3
        MOVS     R0,#+1
        B        ??process_thread_hal_urat_process_4
??process_thread_hal_urat_process_3:
        UXTB     R5,R5
        CMP      R5,#+134
        BNE      ??process_thread_hal_urat_process_5
        LDRB     R0,[R6, #+0]
        CMP      R0,#+8
        BNE      ??process_thread_hal_urat_process_6
        MOVS     R1,#+157
        LDR      R0,??DataTable3_1
        BL       etimer_set
        B        ??process_thread_hal_urat_process_0
??process_thread_hal_urat_process_6:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+9
        BNE      ??process_thread_hal_urat_process_7
        MOVS     R0,#+10
        LDR      R1,??DataTable3_2
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable3_1
        BL       etimer_stop
        B        ??process_thread_hal_urat_process_0
??process_thread_hal_urat_process_7:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+12
        BNE      ??process_thread_hal_urat_process_0
        MOVS     R0,#+13
        LDR      R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        BL       apl_ProcessDebugCmd
        B        ??process_thread_hal_urat_process_0
??process_thread_hal_urat_process_5:
        UXTB     R5,R5
        CMP      R5,#+136
        BNE      ??process_thread_hal_urat_process_0
        LDR      R0,??DataTable3_1
        CMP      R6,R0
        BNE      ??process_thread_hal_urat_process_8
        MOVS     R0,#+10
        LDR      R1,??DataTable3_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        BL       hal_InitCOM
        MOVS     R1,#+22
        LDR      R0,??DataTable4
        BL       hal_DebugDMATx
??process_thread_hal_urat_process_8:
        LDR      R0,??DataTable3_4
        CMP      R6,R0
        BNE      ??process_thread_hal_urat_process_0
        MOVS     R0,#+13
        LDR      R1,??DataTable3_2
        STRB     R0,[R1, #+0]
        MOVS     R0,#+1
        BL       hal_InitCOM
        MOVS     R1,#+22
        LDR      R0,??DataTable4
        BL       hal_DebugDMATx
        B        ??process_thread_hal_urat_process_0
??process_thread_hal_urat_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_hal_urat_process_4:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
apl_ProcessDDCmd:
        PUSH     {R7,LR}
        LDR      R0,??DataTable4_1
        LDRH     R0,[R0, #+2]
        SUBS     R1,R0,#+3
        UXTB     R1,R1
        LDR      R0,??DataTable4_2
        BL       getSum
        LDR      R1,??DataTable4_1
        LDRH     R1,[R1, #+2]
        LDR      R2,??DataTable4_3
        ADDS     R1,R2,R1
        SUBS     R1,R1,#+1
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0
        CMP      R0,R1
        BNE      ??apl_ProcessDDCmd_0
        LDR      R0,??DataTable4_3
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BEQ      ??apl_ProcessDDCmd_1
        CMP      R0,#+2
        BEQ      ??apl_ProcessDDCmd_2
        B        ??apl_ProcessDDCmd_3
??apl_ProcessDDCmd_1:
        LDR      R0,??DataTable4_4
        BL       set_addr
        LDR      R0,??DataTable4_4
        BL       read_addr
        MOVS     R0,#+221
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+0]
        MOVS     R0,#+221
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+1]
        MOVS     R0,#+7
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+2]
        MOVS     R0,#+1
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable4_3
        LDRB     R1,[R0, #+2]
        ADDS     R1,R1,#+1
        UXTB     R1,R1
        LDR      R0,??DataTable4_2
        BL       getSum
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+10]
        MOVS     R1,#+11
        LDR      R0,??DataTable4_3
        BL       hal_DebugDMATx
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1
        STRH     R0,[R1, #+0]
        MOVS     R0,#+13
        LDR      R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B        ??apl_ProcessDDCmd_3
??apl_ProcessDDCmd_2:
        LDR      R0,??DataTable4_4
        BL       read_addr
        MOVS     R0,#+221
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+0]
        MOVS     R0,#+221
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+1]
        MOVS     R0,#+7
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+2]
        MOVS     R0,#+2
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable4_3
        LDRB     R1,[R0, #+2]
        ADDS     R1,R1,#+1
        UXTB     R1,R1
        LDR      R0,??DataTable4_2
        BL       getSum
        LDR      R1,??DataTable4_3
        STRB     R0,[R1, #+10]
        MOVS     R1,#+11
        LDR      R0,??DataTable4_3
        BL       hal_DebugDMATx
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1
        STRH     R0,[R1, #+0]
        MOVS     R0,#+13
        LDR      R1,??DataTable3_3
        STRB     R0,[R1, #+0]
        B        ??apl_ProcessDDCmd_3
??apl_ProcessDDCmd_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1
        STRH     R0,[R1, #+0]
        MOVS     R0,#+13
        LDR      R1,??DataTable3_3
        STRB     R0,[R1, #+0]
??apl_ProcessDDCmd_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitUartVariable:
        PUSH     {R7,LR}
        BL       hal_InitPrintVariable
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitPrintVariable:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R1,#+200
        LSLS     R1,R1,#+2        ;; #+800
        LDR      R0,??DataTable4_5
        BL       OS_MemClr
        MOVS     R1,#+200
        LSLS     R1,R1,#+1        ;; #+400
        LDR      R0,??DataTable4_6
        BL       OS_MemClr
        MOVS     R0,#+0
        LDR      R1,??DataTable4_7
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR      R1,??DataTable4_7
        STRB     R0,[R1, #+1]
??hal_InitPrintVariable_0:
        MOV      R3,SP
        MOVS     R2,#+16
        MOVS     R1,#+50
        LDR      R0,??DataTable4_5
        BL       OSMemCreate
        LDR      R1,??DataTable4_8
        STR      R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??hal_InitPrintVariable_1
        BL       hal_InitMemoryVariable
??hal_InitPrintVariable_1:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??hal_InitPrintVariable_0
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     g_SystickCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     timer_debug_uart_tx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     g_DebugTx_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     g_DebugRx_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     timer_debug_uart_rx

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitUART:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        BL       hal_InitCOM
        MOVS     R0,#+1
        BL       hal_InitCOM
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_InitCOM:
        PUSH     {R4,LR}
        SUB      SP,SP,#+32
        MOVS     R4,R0
        MOVS     R1,#+1
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable4_9
        LDR      R2,[R2, R0]
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R3,??DataTable4_10
        LDR      R0,[R3, R0]
        ORRS     R0,R0,R2
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphClockCmd
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??hal_InitCOM_0
        MOVS     R1,#+1
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable5
        LDR      R0,[R2, R0]
        BL       RCC_APB1PeriphClockCmd
        B        ??hal_InitCOM_1
??hal_InitCOM_0:
        MOVS     R1,#+1
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable5
        LDR      R0,[R2, R0]
        BL       RCC_APB2PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       SYSCFG_DMAChannelRemapConfig
??hal_InitCOM_1:
        UXTB     R4,R4
        LDR      R0,??DataTable5_1
        LDRB     R2,[R0, R4]
        UXTB     R4,R4
        LDR      R0,??DataTable5_2
        LDRB     R1,[R0, R4]
        UXTH     R1,R1
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R3,??DataTable5_3
        LDR      R0,[R3, R0]
        BL       GPIO_PinAFConfig
        UXTB     R4,R4
        LDR      R0,??DataTable5_4
        LDRB     R2,[R0, R4]
        UXTB     R4,R4
        LDR      R0,??DataTable5_5
        LDRB     R1,[R0, R4]
        UXTH     R1,R1
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R3,??DataTable6
        LDR      R0,[R3, R0]
        BL       GPIO_PinAFConfig
        UXTB     R4,R4
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDR      R1,??DataTable6_1
        LDRH     R0,[R1, R0]
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??hal_InitCOM_2
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        B        ??hal_InitCOM_3
??hal_InitCOM_2:
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
??hal_InitCOM_3:
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOV      R1,SP
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable5_3
        LDR      R0,[R2, R0]
        BL       GPIO_Init
        UXTB     R4,R4
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDR      R1,??DataTable6_2
        LDRH     R0,[R1, R0]
        STR      R0,[SP, #+0]
        MOV      R1,SP
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable6
        LDR      R0,[R2, R0]
        BL       GPIO_Init
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R1,??DataTable6_3
        LDR      R0,[R1, R0]
        STR      R0,[SP, #+8]
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        MOVS     R0,#+128
        LSLS     R0,R0,#+3        ;; #+1024
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        MOVS     R0,#+12
        STR      R0,[SP, #+24]
        ADD      R1,SP,#+8
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable7
        LDR      R0,[R2, R0]
        BL       USART_Init
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??hal_InitCOM_4
        MOVS     R2,#+1
        LDR      R1,??DataTable6_4  ;; 0x50105
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R3,??DataTable7
        LDR      R0,[R3, R0]
        BL       USART_ITConfig
??hal_InitCOM_4:
        MOVS     R1,#+1
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R2,??DataTable7
        LDR      R0,[R2, R0]
        BL       USART_Cmd
        UXTB     R4,R4
        CMP      R4,#+1
        BNE      ??hal_InitCOM_5
        MOVS     R2,#+1
        MOVS     R1,#+128
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R3,??DataTable7
        LDR      R0,[R3, R0]
        BL       USART_DMACmd
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_AHBPeriphClockCmd
??hal_InitCOM_5:
        ADD      SP,SP,#+32
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     `?<Constant "print timeout error!\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     g_DebugRxFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     g_DebugRxBuffer+0x2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     g_DebugRxBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     g_DebugRxBuffer+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     g_Print+0x194

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     g_Print+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     g_Print

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     g_Print+0x4B4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     COM_TX_PORT_CLK

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     COM_RX_PORT_CLK

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
printf:
        PUSH     {R0-R3}
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+236
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+2]
        MOVS     R4,#+0
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R5,#+0
        ADD      R6,SP,#+32
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R7,#+0
        ADD      R0,SP,#+260
        STR      R0,[SP, #+4]
        LDR      R3,[SP, #+4]
        LDR      R2,[SP, #+256]
        MOVS     R1,#+200
        ADD      R0,SP,#+32
        BL       vsnprintf
        MOVS     R4,R0
        MOV      R0,SP
        STRH     R4,[R0, #+2]
        UXTH     R4,R4
        CMP      R4,#+0
        BNE      .+4
        B        ??printf_0
        UXTH     R4,R4
        CMP      R4,#+201
        BCC      .+4
        B        ??printf_0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+12
        BL       __aeabi_uidivmod
        CMP      R1,#+0
        BEQ      ??printf_1
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+12
        BL       __aeabi_uidiv
        ADDS     R0,R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        B        ??printf_2
??printf_1:
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+12
        BL       __aeabi_uidiv
        MOV      R1,SP
        STRB     R0,[R1, #+1]
??printf_2:
        MOVS     R0,#+0
        MOVS     R5,R0
        BL       hal_GetSystickCounter
        MOVS     R7,R0
??printf_3:
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??printf_4
        BL       hal_GetSystickCounter
        SUBS     R0,R0,R7
        CMP      R0,#+101
        BCS      ??printf_4
        BL       IWDG_ReloadCounter
        MOVS     R0,#+127
        BL       WWDG_SetCounter
        ADD      R1,SP,#+8
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        BL       OSMemQuery
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??printf_3
        LDR      R0,[SP, #+24]
        CMP      R0,#+0
        BEQ      ??printf_3
        MOV      R1,SP
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        BL       OSMemGet
        ADDS     R0,R0,#+4
        LDR      R1,??DataTable8_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+8
        MULS     R1,R2,R1
        LDR      R2,??DataTable8_1
        ADDS     R1,R2,R1
        STR      R0,[R1, #+4]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??printf_3
        UXTH     R4,R4
        CMP      R4,#+13
        BCC      ??printf_5
        MOVS     R2,#+12
        MOVS     R1,R6
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+0]
        MOVS     R3,#+8
        MULS     R0,R3,R0
        LDR      R3,??DataTable8_1
        ADDS     R0,R3,R0
        LDR      R0,[R0, #+4]
        BL       OS_MemCopy
        MOVS     R0,#+12
        LDR      R1,??DataTable8_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+8
        MULS     R1,R2,R1
        LDR      R2,??DataTable8_1
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+8]
        SUBS     R4,R4,#+12
        ADDS     R6,R6,#+12
        B        ??printf_6
??printf_5:
        MOVS     R2,R4
        UXTH     R2,R2
        MOVS     R1,R6
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+0]
        MOVS     R3,#+8
        MULS     R0,R3,R0
        LDR      R3,??DataTable8_1
        ADDS     R0,R3,R0
        LDR      R0,[R0, #+4]
        BL       OS_MemCopy
        MOVS     R0,R4
        LDR      R1,??DataTable8_1
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+8
        MULS     R1,R2,R1
        LDR      R2,??DataTable8_1
        ADDS     R1,R2,R1
        STRB     R0,[R1, #+8]
??printf_6:
        BL       hal_GetSystickCounter
        MOVS     R7,R0
        ADDS     R5,R5,#+1
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8_1
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+50
        BLT      ??printf_3
        MOVS     R0,#+0
        LDR      R1,??DataTable8_1
        STRB     R0,[R1, #+0]
        B        ??printf_3
??printf_4:
        LDR      R0,??DataTable8_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+8
        BEQ      ??printf_0
        MOVS     R0,#+8
        LDR      R1,??DataTable8_2
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+1]
        MOVS     R1,#+8
        MULS     R0,R1,R0
        LDR      R1,??DataTable8_1
        ADDS     R0,R1,R0
        LDRB     R1,[R0, #+8]
        UXTH     R1,R1
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+1]
        MOVS     R2,#+8
        MULS     R0,R2,R0
        LDR      R2,??DataTable8_1
        ADDS     R0,R2,R0
        LDR      R0,[R0, #+4]
        BL       hal_DebugDMATx
        LDR      R2,??DataTable8_2
        MOVS     R1,#+134
        LDR      R0,??DataTable8_3
        BL       process_post
??printf_0:
        MOV      R0,SP
        LDRH     R0,[R0, #+2]
        ADD      SP,SP,#+236
        LDR      R1,[SP, #+16]
        POP      {R4-R7}
        ADD      SP,SP,#+20
        BX       R1               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     COM_USART_CLK

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     COM_TX_AF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     COM_TX_PIN_SOURCE

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     COM_TX_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     COM_RX_AF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     COM_RX_PIN_SOURCE

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_DebugDMATx:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+44
        MOVS     R5,R0
        MOVS     R4,R1
        UXTH     R4,R4
        CMP      R4,#+0
        BEQ      ??hal_DebugDMATx_0
        UXTH     R4,R4
        CMP      R4,#+201
        BLT      ??hal_DebugDMATx_1
        MOVS     R0,#+200
        MOVS     R4,R0
??hal_DebugDMATx_1:
        LDR      R0,??DataTable8_4  ;; 0x40020044
        BL       DMA_DeInit
        LDR      R0,??DataTable8_5  ;; 0x40013828
        STR      R0,[SP, #+0]
        STR      R5,[SP, #+4]
        MOVS     R0,#+16
        STR      R0,[SP, #+8]
        UXTH     R4,R4
        STR      R4,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        MOVS     R0,#+128
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+24]
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        MOVS     R0,#+0
        STR      R0,[SP, #+32]
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        STR      R0,[SP, #+36]
        MOVS     R0,#+0
        STR      R0,[SP, #+40]
        MOV      R1,SP
        LDR      R0,??DataTable8_4  ;; 0x40020044
        BL       DMA_Init
        MOVS     R2,#+1
        MOVS     R1,#+10
        LDR      R0,??DataTable8_4  ;; 0x40020044
        BL       DMA_ITConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable8_4  ;; 0x40020044
        BL       DMA_Cmd
??hal_DebugDMATx_0:
        ADD      SP,SP,#+44
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     COM_RX_PORT

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     COM_TX_PIN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     COM_RX_PIN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     COM_BAUD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x50105

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART1_IRQHandler:
        PUSH     {R4,LR}
        LDR      R1,??DataTable8_6  ;; 0x50105
        LDR      R0,??DataTable8_7  ;; 0x40013800
        BL       USART_GetITStatus
        CMP      R0,#+0
        BEQ      ??USART1_IRQHandler_0
        LDR      R0,??DataTable8_7  ;; 0x40013800
        BL       USART_ReceiveData
        MOVS     R4,R0
        LDR      R0,??DataTable8_8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+30
        BLT      ??USART1_IRQHandler_1
        MOVS     R0,#+0
        LDR      R1,??DataTable8_8
        STRH     R0,[R1, #+0]
??USART1_IRQHandler_1:
        UXTB     R4,R4
        CMP      R4,#+8
        BNE      ??USART1_IRQHandler_2
        LDR      R0,??DataTable8_8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??USART1_IRQHandler_0
        LDR      R0,??DataTable8_8
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR      R1,??DataTable8_8
        STRH     R0,[R1, #+0]
        B        ??USART1_IRQHandler_0
??USART1_IRQHandler_2:
        LDR      R0,??DataTable8_8
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable8_9
        STRB     R4,[R1, R0]
        LDR      R0,??DataTable8_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8_8
        STRH     R0,[R1, #+0]
        UXTB     R4,R4
        CMP      R4,#+13
        BEQ      ??USART1_IRQHandler_3
        UXTB     R4,R4
        CMP      R4,#+10
        BNE      ??USART1_IRQHandler_0
??USART1_IRQHandler_3:
        MOVS     R0,#+12
        LDR      R1,??DataTable8_10
        STRB     R0,[R1, #+0]
        LDR      R2,??DataTable8_10
        MOVS     R1,#+134
        LDR      R0,??DataTable8_3
        BL       process_post
        LDR      R0,??DataTable8_8
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable8_8
        STRH     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR      R1,??DataTable8_8
        STRH     R0,[R1, #+0]
??USART1_IRQHandler_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     COM_USART

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DMA1_Channel4_5_IRQHandler:
        PUSH     {R4,LR}
        MOVS     R4,#+0
        MOVS     R0,#+128
        LSLS     R0,R0,#+6        ;; #+8192
        BL       DMA_GetITStatus
        CMP      R0,#+0
        BEQ      ??DMA1_Channel4_5_IRQHandler_0
        MOVS     R0,#+128
        LSLS     R0,R0,#+6        ;; #+8192
        BL       DMA_ClearITPendingBit
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+1]
        MOVS     R1,#+8
        MULS     R0,R1,R0
        LDR      R1,??DataTable8_1
        ADDS     R0,R1,R0
        LDR      R1,[R0, #+4]
        SUBS     R1,R1,#+4
        LDR      R0,??DataTable8
        LDR      R0,[R0, #+0]
        BL       OSMemPut
        MOVS     R4,R0
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??DMA1_Channel4_5_IRQHandler_0
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+1]
        ADDS     R0,R0,#+1
        LDR      R1,??DataTable8_1
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+1]
        CMP      R0,#+50
        BLT      ??DMA1_Channel4_5_IRQHandler_1
        MOVS     R0,#+0
        LDR      R1,??DataTable8_1
        STRB     R0,[R1, #+1]
??DMA1_Channel4_5_IRQHandler_1:
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable8_1
        LDRB     R1,[R1, #+0]
        CMP      R0,R1
        BEQ      ??DMA1_Channel4_5_IRQHandler_2
        MOVS     R0,#+8
        LDR      R1,??DataTable8_2
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+1]
        MOVS     R1,#+8
        MULS     R0,R1,R0
        LDR      R1,??DataTable8_1
        ADDS     R0,R1,R0
        LDRB     R1,[R0, #+8]
        UXTH     R1,R1
        LDR      R0,??DataTable8_1
        LDRB     R0,[R0, #+1]
        MOVS     R2,#+8
        MULS     R0,R2,R0
        LDR      R2,??DataTable8_1
        ADDS     R0,R2,R0
        LDR      R0,[R0, #+4]
        BL       hal_DebugDMATx
        MOVS     R1,#+157
        LDR      R0,??DataTable8_11
        BL       etimer_remodify
        B        ??DMA1_Channel4_5_IRQHandler_0
??DMA1_Channel4_5_IRQHandler_2:
        MOVS     R0,#+9
        LDR      R1,??DataTable8_2
        STRB     R0,[R1, #+0]
        LDR      R2,??DataTable8_2
        MOVS     R1,#+134
        LDR      R0,??DataTable8_3
        BL       process_post
??DMA1_Channel4_5_IRQHandler_0:
        MOVS     R0,#+128
        LSLS     R0,R0,#+8        ;; #+32768
        BL       DMA_GetITStatus
        CMP      R0,#+0
        BEQ      ??DMA1_Channel4_5_IRQHandler_3
        MOVS     R0,#+128
        LSLS     R0,R0,#+8        ;; #+32768
        BL       DMA_ClearITPendingBit
        MOVS     R0,#+10
        LDR      R1,??DataTable8_2
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable8_11
        BL       etimer_stop
??DMA1_Channel4_5_IRQHandler_3:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     g_Print+0x4B4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     g_Print

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     g_DebugTx_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     hal_urat_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x40020044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x40013828

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x50105

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     0x40013800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     g_DebugRxFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     g_DebugRxBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     g_DebugRx_state

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     timer_debug_uart_tx

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
// 2 052 bytes in section .bss
//    44 bytes in section .data
//    92 bytes in section .rodata
// 1 850 bytes in section .text
// 
// 1 850 bytes of CODE  memory
//    92 bytes of CONST memory
// 2 096 bytes of DATA  memory
//
//Errors: none
//Warnings: none

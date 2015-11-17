///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:21
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\gpio_per.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\gpio_per.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -D USE_LORA_MODE
//        -lb E:\svnProject\street_lamp_new\Debug\List\ --diag_suppress Pa050
//        -o E:\svnProject\street_lamp_new\Debug\Obj\ --no_cse --no_unroll
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\gpio_per.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN ADC_ChannelConfig
        EXTERN ADC_ClearFlag
        EXTERN ADC_Cmd
        EXTERN ADC_GetCalibrationFactor
        EXTERN ADC_GetConversionValue
        EXTERN ADC_GetFlagStatus
        EXTERN ADC_Init
        EXTERN ADC_StartOfConversion
        EXTERN ADC_StopOfConversion
        EXTERN Delayms
        EXTERN EXTI_ClearITPendingBit
        EXTERN EXTI_Init
        EXTERN FLASH_ErasePage
        EXTERN FLASH_Write_chars
        EXTERN GPIO_Init
        EXTERN GPIO_PinAFConfig
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN GetCRC16
        EXTERN RCC_ADCCLKConfig
        EXTERN RCC_AHBPeriphClockCmd
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN RTC_GetDate
        EXTERN RTC_GetTime
        EXTERN SYSCFG_EXTILineConfig
        EXTERN TIM_ARRPreloadConfig
        EXTERN TIM_ClearFlag
        EXTERN TIM_Cmd
        EXTERN TIM_CtrlPWMOutputs
        EXTERN TIM_GetITStatus
        EXTERN TIM_ITConfig
        EXTERN TIM_OC1Init
        EXTERN TIM_OC1PreloadConfig
        EXTERN TIM_TimeBaseInit
        EXTERN USART_Cmd
        EXTERN USART_GetFlagStatus
        EXTERN USART_ReceiveData
        EXTERN USART_SendData
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fmul
        EXTERN __aeabi_i2d
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_ui2f
        EXTERN __aeabi_uidiv
        EXTERN etimer_set
        EXTERN find_params
        EXTERN g_updateBuffer
        EXTERN hal_InitUART
        EXTERN paralist
        EXTERN process_post
        EXTERN process_start
        EXTERN read_flash
        EXTERN read_light_time
        EXTERN read_params_area
        EXTERN sprintf
        EXTERN sqrt
        EXTERN strlen

        PUBLIC BCD_code
        PUBLIC BCD_decode
        PUBLIC TIM14_IRQHandler
        PUBLIC config_8209c_reg
        PUBLIC drop_down_timer_init
        PUBLIC find_free_addr
        PUBLIC find_old_data
        PUBLIC format_elc_data
        PUBLIC get_light_time
        PUBLIC hal_ADC_Init
        PUBLIC hal_init_PWM
        PUBLIC init_8209c_params
        PUBLIC init_zero_detect
        PUBLIC period_save_data_process
        PUBLIC power_down_protect
        PUBLIC read_8209c_energyP
        PUBLIC read_8209c_regs
        PUBLIC read_LED_state
        PUBLIC read_PWM_volt
        PUBLIC read_UIP
        PUBLIC read_pow_factor
        PUBLIC relay_gpio_init
        PUBLIC rn8209c_checkSum
        PUBLIC rn8209c_init
        PUBLIC rn8209c_papameter
        PUBLIC rn8209c_read
        PUBLIC rn8209c_write
        PUBLIC rn8209c_write_byte
        PUBLIC save_8209c_params
        PUBLIC save_elc_datas
        PUBLIC select_length
        PUBLIC set_8209c_params
        PUBLIC set_PWM
        PUBLIC start_time_detect_process


        SECTION `.data`:DATA:REORDER:NOROOT(0)
flash_ok:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
rn8209c_papameter:
        DATA
        DC16 4026, 0, 0, 0, 0
        DC8 0, 0
        DC32 0, 0, 0H
        DC16 0, 0
        DC32 0
        DC16 0
        DC8 0, 0
        DC32 0
        DC16 0
        DC8 0, 0
        DC32 0
        DC16 0, 12800
        DC8 100, 0, 0, 0
        DC32 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
start_time_detect_process:
        DATA
        DC32 0H, `?<Constant "safe_start">`
        DC32 process_thread_start_time_detect_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_start_time_detect_process:
        PUSH     {R3-R7,LR}
        MOVS     R5,R0
        MOVS     R7,R1
        MOVS     R6,R2
        MOVS     R4,#+1
        LDRH     R0,[R5, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_start_time_detect_process_0
        CMP      R0,#+102
        BEQ      ??process_thread_start_time_detect_process_1
        B        ??process_thread_start_time_detect_process_2
??process_thread_start_time_detect_process_0:
        LDR      R1,??DataTable4  ;; 0x7530
        LDR      R0,??DataTable4_1
        BL       etimer_set
        MOVS     R4,#+0
        MOVS     R0,#+102
        STRH     R0,[R5, #+0]
??process_thread_start_time_detect_process_1:
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??process_thread_start_time_detect_process_3
        UXTB     R7,R7
        CMP      R7,#+136
        BNE      ??process_thread_start_time_detect_process_3
        LDR      R0,??DataTable4_1
        CMP      R6,R0
        BEQ      ??process_thread_start_time_detect_process_4
??process_thread_start_time_detect_process_3:
        MOVS     R0,#+1
        B        ??process_thread_start_time_detect_process_5
??process_thread_start_time_detect_process_4:
        LDR      R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??process_thread_start_time_detect_process_6
        LDR      R0,??DataTable4_3  ;; 0x800f800
        BL       find_free_addr
        LDR      R1,??DataTable4_4
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable4_4
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+255
        LSLS     R1,R1,#+2        ;; #+1020
        CMP      R0,R1
        BLT      ??process_thread_start_time_detect_process_7
        BL       read_8209c_energyP
        BL       format_elc_data
        LDR      R0,??DataTable4_3  ;; 0x800f800
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??process_thread_start_time_detect_process_8
        MOVS     R2,#+17
        LDR      R1,??DataTable4_5
        LDR      R0,??DataTable4_3  ;; 0x800f800
        BL       FLASH_Write_chars
        B        ??process_thread_start_time_detect_process_8
??process_thread_start_time_detect_process_7:
        LDR      R0,??DataTable4_4
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??process_thread_start_time_detect_process_8
        BL       read_8209c_energyP
        BL       format_elc_data
        MOVS     R2,#+17
        LDR      R1,??DataTable4_5
        LDR      R0,??DataTable4_3  ;; 0x800f800
        BL       FLASH_Write_chars
        B        ??process_thread_start_time_detect_process_8
??process_thread_start_time_detect_process_6:
        BL       read_8209c_energyP
        BL       format_elc_data
        LDR      R0,??DataTable4_3  ;; 0x800f800
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??process_thread_start_time_detect_process_8
        MOVS     R2,#+17
        LDR      R1,??DataTable4_5
        LDR      R0,??DataTable4_3  ;; 0x800f800
        BL       FLASH_Write_chars
        MOVS     R0,#+1
        LDR      R1,??DataTable4_2
        STRB     R0,[R1, #+0]
??process_thread_start_time_detect_process_8:
        MOVS     R1,#+0
        LDR      R0,??DataTable5
        BL       process_start
        BL       drop_down_timer_init
??process_thread_start_time_detect_process_2:
        MOVS     R0,#+0
        MOVS     R4,R0
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+3
??process_thread_start_time_detect_process_5:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??start_etimer:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
??length:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(2)
period_save_data_process:
        DATA
        DC32 0H, `?<Constant " ">`, process_thread_period_save_data_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_period_save_data_process:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_period_save_data_process_0
        CMP      R0,#+165
        BEQ      ??process_thread_period_save_data_process_1
        B        ??process_thread_period_save_data_process_2
??process_thread_period_save_data_process_0:
        LDR      R1,??DataTable5_1  ;; 0x927c0
        LDR      R0,??DataTable5_2
        BL       etimer_set
        MOVS     R1,#+0
        MOVS     R0,#+165
        STRH     R0,[R4, #+0]
??process_thread_period_save_data_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??process_thread_period_save_data_process_3
        UXTB     R6,R6
        CMP      R6,#+136
        BNE      ??process_thread_period_save_data_process_3
        LDR      R0,??DataTable5_2
        CMP      R5,R0
        BEQ      ??process_thread_period_save_data_process_4
??process_thread_period_save_data_process_3:
        MOVS     R0,#+1
        B        ??process_thread_period_save_data_process_5
??process_thread_period_save_data_process_4:
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+48]
        MOVS     R7,R0
        BL       read_8209c_energyP
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+50]
        MOVS     R1,#+100
        BL       __aeabi_idiv
        LDR      R1,??DataTable6
        LDRH     R1,[R1, #+48]
        SUBS     R1,R1,R7
        CMP      R0,R1
        BCS      ??process_thread_period_save_data_process_0
        BL       get_light_time
        LDR      R1,??DataTable6
        STR      R0,[R1, #+56]
        BL       save_elc_datas
        B        ??process_thread_period_save_data_process_0
??process_thread_period_save_data_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_period_save_data_process_5:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??save_timer:
        DS8 16

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
drop_down_timer_init:
        PUSH     {R5-R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        BL       RCC_APB1PeriphClockCmd
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        MOV      R1,SP
        STRH     R0,[R1, #+8]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+2]
        LDR      R0,??DataTable6_1  ;; 0xbb80
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOVS     R0,#+30
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+10]
        MOV      R1,SP
        LDR      R0,??DataTable7  ;; 0x40002000
        BL       TIM_TimeBaseInit
        MOVS     R1,#+1
        LDR      R0,??DataTable7  ;; 0x40002000
        BL       TIM_ClearFlag
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR      R0,??DataTable7  ;; 0x40002000
        BL       TIM_ITConfig
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BCD_code:
        PUSH     {R4-R7,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,#+0
??BCD_code_0:
        UXTB     R7,R7
        UXTB     R6,R6
        CMP      R7,R6
        BCS      ??BCD_code_1
        UXTB     R7,R7
        LDRB     R0,[R5, R7]
        MOVS     R1,#+10
        BL       __aeabi_idiv
        MOVS     R1,#+16
        MULS     R0,R1,R0
        MOVS     R4,R0
        UXTB     R7,R7
        LDRB     R0,[R5, R7]
        MOVS     R1,#+10
        BL       __aeabi_idivmod
        MOVS     R0,R4
        ADDS     R0,R0,R1
        UXTB     R7,R7
        STRB     R0,[R5, R7]
        ADDS     R7,R7,#+1
        B        ??BCD_code_0
??BCD_code_1:
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BCD_decode:
        PUSH     {R4,LR}
        MOVS     R2,#+0
??BCD_decode_0:
        UXTB     R2,R2
        UXTB     R1,R1
        CMP      R2,R1
        BCS      ??BCD_decode_1
        UXTB     R2,R2
        LDRB     R3,[R0, R2]
        UXTB     R3,R3
        LSRS     R3,R3,#+4
        UXTB     R3,R3
        MOVS     R4,#+10
        MULS     R3,R4,R3
        UXTB     R2,R2
        LDRB     R4,[R0, R2]
        LSLS     R4,R4,#+28       ;; ZeroExtS R4,R4,#+28,#+28
        LSRS     R4,R4,#+28
        ADDS     R3,R3,R4
        UXTB     R2,R2
        STRB     R3,[R0, R2]
        ADDS     R2,R2,#+1
        B        ??BCD_decode_0
??BCD_decode_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM14_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        LDR      R0,??DataTable7  ;; 0x40002000
        BL       TIM_GetITStatus
        CMP      R0,#+0
        BEQ      ??TIM14_IRQHandler_0
        MOVS     R1,#+1
        LDR      R0,??DataTable7  ;; 0x40002000
        BL       TIM_ClearFlag
        BL       power_down_protect
        MOVS     R1,#+0
        LDR      R0,??DataTable7  ;; 0x40002000
        BL       TIM_Cmd
        MOVS     R2,#+0
        MOVS     R1,#+131
        LDR      R0,??DataTable5
        BL       process_post
        MOVS     R1,#+0
        LDR      R0,??DataTable9
        BL       process_start
??TIM14_IRQHandler_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_ADC_Init:
        PUSH     {LR}
        SUB      SP,SP,#+36
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+0
        BL       RCC_ADCCLKConfig
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_GetCalibrationFactor
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOV      R1,SP
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_Init
        MOVS     R1,#+1
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_Cmd
        MOVS     R0,#+8
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        ADD      R1,SP,#+8
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+24]
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        ADD      R1,SP,#+8
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_Init
        MOVS     R2,#+4
        MOVS     R1,#+1
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_ChannelConfig
        LDR      R0,??DataTable9_2  ;; 0x4001240c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        ORRS     R1,R1,R0
        LDR      R0,??DataTable9_2  ;; 0x4001240c
        STR      R1,[R0, #+0]
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x7530

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     ??start_etimer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     flash_ok

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x800f800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     ??length

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     g_updateBuffer

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
init_zero_detect:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+10       ;; #+131072
        BL       RCC_AHBPeriphClockCmd
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        ADD      R1,SP,#+8
        STRB     R0,[R1, #+4]
        MOVS     R0,#+1
        ADD      R1,SP,#+8
        STRB     R0,[R1, #+7]
        MOVS     R0,#+3
        ADD      R1,SP,#+8
        STRB     R0,[R1, #+5]
        ADD      R1,SP,#+8
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_Init
        MOVS     R0,#+8
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+8
        MOVS     R0,#+0
        BL       SYSCFG_EXTILineConfig
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOV      R0,SP
        BL       EXTI_Init
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_init_PWM:
        PUSH     {LR}
        SUB      SP,SP,#+44
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        BL       RCC_AHBPeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+192
        LSLS     R0,R0,#+11       ;; #+393216
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+192
        LSLS     R0,R0,#+2        ;; #+768
        STR      R0,[SP, #+0]
        MOVS     R0,#+2
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOV      R1,SP
        LDR      R0,??DataTable10  ;; 0x48000400
        BL       GPIO_Init
        MOVS     R2,#+2
        MOVS     R1,#+9
        LDR      R0,??DataTable10  ;; 0x48000400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+2
        MOVS     R1,#+8
        LDR      R0,??DataTable10  ;; 0x48000400
        BL       GPIO_PinAFConfig
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        ADD      R1,SP,#+8
        STRH     R0,[R1, #+8]
        MOVS     R0,#+0
        ADD      R1,SP,#+8
        STRH     R0,[R1, #+2]
        MOVS     R0,#+0
        ADD      R1,SP,#+8
        STRB     R0,[R1, #+10]
        MOVS     R0,#+48
        MOV      R1,SP
        STRH     R0,[R1, #+8]
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
        STR      R0,[SP, #+12]
        ADD      R1,SP,#+8
        LDR      R0,??DataTable11  ;; 0x40014800
        BL       TIM_TimeBaseInit
        ADD      R1,SP,#+8
        LDR      R0,??DataTable12_4  ;; 0x40014400
        BL       TIM_TimeBaseInit
        MOVS     R0,#+96
        MOV      R1,SP
        STRH     R0,[R1, #+20]
        MOVS     R0,#+0
        ADD      R1,SP,#+20
        STRH     R0,[R1, #+12]
        MOVS     R0,#+1
        ADD      R1,SP,#+20
        STRH     R0,[R1, #+2]
        MOVS     R0,#+4
        ADD      R1,SP,#+20
        STRH     R0,[R1, #+4]
        MOVS     R0,#+0
        ADD      R1,SP,#+20
        STRH     R0,[R1, #+14]
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        ADD      R1,SP,#+20
        STRH     R0,[R1, #+16]
        MOVS     R0,#+0
        ADD      R1,SP,#+20
        STRH     R0,[R1, #+18]
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
        STR      R0,[SP, #+28]
        ADD      R1,SP,#+20
        LDR      R0,??DataTable11  ;; 0x40014800
        BL       TIM_OC1Init
        ADD      R1,SP,#+20
        LDR      R0,??DataTable12_4  ;; 0x40014400
        BL       TIM_OC1Init
        MOVS     R1,#+8
        LDR      R0,??DataTable11  ;; 0x40014800
        BL       TIM_OC1PreloadConfig
        MOVS     R1,#+8
        LDR      R0,??DataTable12_4  ;; 0x40014400
        BL       TIM_OC1PreloadConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable11  ;; 0x40014800
        BL       TIM_ARRPreloadConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable12_4  ;; 0x40014400
        BL       TIM_ARRPreloadConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable11  ;; 0x40014800
        BL       TIM_Cmd
        MOVS     R1,#+1
        LDR      R0,??DataTable12_4  ;; 0x40014400
        BL       TIM_Cmd
        MOVS     R1,#+1
        LDR      R0,??DataTable11  ;; 0x40014800
        BL       TIM_CtrlPWMOutputs
        MOVS     R1,#+1
        LDR      R0,??DataTable12_4  ;; 0x40014400
        BL       TIM_CtrlPWMOutputs
        ADD      SP,SP,#+44
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     period_save_data_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x927c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     ??save_timer

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_PWM:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
        UXTB     R4,R4
        CMP      R4,#+101
        BLT      ??set_PWM_0
        MOVS     R0,#+100
        B        ??set_PWM_1
??set_PWM_0:
        MOVS     R0,R4
??set_PWM_1:
        LDR      R1,??DataTable12
        STRB     R0,[R1, #+0]
        UXTB     R4,R4
        MOVS     R0,#+250
        LSLS     R0,R0,#+2        ;; #+1000
        MULS     R0,R4,R0
        MOVS     R1,#+100
        BL       __aeabi_idiv
        MOVS     R5,R0
        LDR      R0,??DataTable12_1  ;; 0x40014834
        STR      R5,[R0, #+0]
        LDR      R0,??DataTable12_5  ;; 0x40014434
        STR      R5,[R0, #+0]
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0xbb80

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_PWM_volt:
        PUSH     {R4,LR}
        MOVS     R1,#+4
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_ClearFlag
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_StartOfConversion
??read_PWM_volt_0:
        MOVS     R1,#+4
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??read_PWM_volt_0
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_StopOfConversion
        LDR      R0,??DataTable9_1  ;; 0x40012400
        BL       ADC_GetConversionValue
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,R4
        BL       __aeabi_ui2d
        ADR      R2,??DataTable12_2
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable12_3  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable12_6  ;; 0x40900000
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        MOVS     R4,R0
        MOVS     R0,R4
        UXTH     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x40002000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
relay_gpio_init:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+11       ;; #+262144
        BL       RCC_AHBPeriphClockCmd
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOV      R1,SP
        LDR      R0,??DataTable10  ;; 0x48000400
        BL       GPIO_Init
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOV      R1,SP
        LDR      R0,??DataTable10  ;; 0x48000400
        BL       GPIO_Init
        MOVS     R0,#+1
        BL       EXTI_ClearITPendingBit
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       SYSCFG_EXTILineConfig
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        ADD      R1,SP,#+8
        STRB     R0,[R1, #+4]
        MOVS     R0,#+8
        ADD      R1,SP,#+8
        STRB     R0,[R1, #+5]
        MOVS     R0,#+1
        ADD      R1,SP,#+8
        STRB     R0,[R1, #+6]
        ADD      R0,SP,#+8
        BL       EXTI_Init
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_write_byte:
        PUSH     {R4-R6,LR}
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R5,#+128
        ORRS     R5,R5,R6
??rn8209c_write_byte_0:
        MOVS     R1,#+64
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_byte_0
        UXTB     R5,R5
        MOVS     R1,R5
        UXTH     R1,R1
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_SendData
??rn8209c_write_byte_1:
        MOVS     R1,#+64
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_byte_1
        UXTB     R4,R4
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_SendData
        UXTB     R5,R5
        UXTB     R4,R4
        ADDS     R0,R5,R4
        MVNS     R5,R0
??rn8209c_write_byte_2:
        MOVS     R1,#+64
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_byte_2
        UXTB     R5,R5
        MOVS     R1,R5
        UXTH     R1,R1
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_SendData
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     start_time_detect_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x40012400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x4001240c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_write:
        PUSH     {R2,R4-R7,LR}
        SUB      SP,SP,#+8
        MOVS     R7,R0
        MOVS     R6,R1
        MOV      R0,SP
        MOVS     R1,#+128
        ORRS     R1,R1,R7
        STRB     R1,[R0, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
??rn8209c_write_0:
        MOVS     R1,#+64
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_0
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        UXTH     R1,R1
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_SendData
        MOVS     R5,#+0
??rn8209c_write_1:
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??rn8209c_write_2
??rn8209c_write_3:
        MOVS     R1,#+64
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_3
        UXTB     R5,R5
        LDRB     R1,[R6, R5]
        UXTH     R1,R1
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_SendData
        UXTB     R5,R5
        LDRB     R0,[R6, R5]
        ADDS     R4,R4,R0
        ADDS     R5,R5,#+1
        B        ??rn8209c_write_1
??rn8209c_write_2:
        MOVS     R0,R4
        UXTB     R0,R0
        MVNS     R4,R0
??rn8209c_write_4:
        MOVS     R1,#+64
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_4
        UXTB     R4,R4
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_SendData
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x48000400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_read:
        PUSH     {R0,R2,R4-R7,LR}
        SUB      SP,SP,#+4
        MOVS     R6,R1
        MOV      R0,SP
        LDRB     R4,[R0, #+4]
??rn8209c_read_0:
        MOVS     R1,#+64
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_read_0
        MOV      R0,SP
        LDRB     R1,[R0, #+4]
        UXTH     R1,R1
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_SendData
        MOVS     R5,#+0
??rn8209c_read_1:
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        UXTB     R5,R5
        CMP      R5,R0
        BCS      ??rn8209c_read_2
??rn8209c_read_3:
        MOVS     R1,#+32
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_read_3
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_ReceiveData
        UXTB     R5,R5
        STRB     R0,[R6, R5]
        UXTB     R5,R5
        LDRB     R0,[R6, R5]
        ADDS     R4,R4,R0
        ADDS     R5,R5,#+1
        B        ??rn8209c_read_1
??rn8209c_read_2:
        MOVS     R1,#+32
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_read_2
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_ReceiveData
        MOVS     R7,R0
        MOVS     R0,R4
        UXTB     R0,R0
        MVNS     R4,R0
        UXTB     R7,R7
        UXTB     R4,R4
        CMP      R7,R4
        BNE      ??rn8209c_read_4
        MOVS     R0,#+1
        B        ??rn8209c_read_5
??rn8209c_read_4:
        MOVS     R0,#+0
??rn8209c_read_5:
        UXTB     R0,R0
        POP      {R1-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x40014800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_init:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        LDR      R0,??DataTable12_7  ;; 0x40004400
        BL       USART_Cmd
        MOVS     R1,#+4
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ResetBits
        MOVS     R0,#+25
        BL       Delayms
        MOVS     R1,#+4
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        MOVS     R0,#+20
        BL       Delayms
        BL       hal_InitUART
        BL       init_8209c_params
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     rn8209c_papameter+0x34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x40014834

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0x66666666,0x400A6666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0x40014400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0x40014434

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     0x40900000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
select_length:
        PUSH     {LR}
        MOVS     R1,R0
        UXTB     R1,R1
        MOVS     R2,R1
        SUBS     R2,R2,#+7
        CMP      R2,#+1
        BLS      ??select_length_0
        SUBS     R2,R2,#+27
        CMP      R2,#+2
        BLS      ??select_length_1
        SUBS     R2,R2,#+4
        CMP      R2,#+2
        BLS      ??select_length_2
        SUBS     R2,R2,#+3
        CMP      R2,#+4
        BLS      ??select_length_1
        SUBS     R2,R2,#+7
        CMP      R2,#+2
        BLS      ??select_length_1
        SUBS     R2,R2,#+5
        BEQ      ??select_length_1
        SUBS     R2,R2,#+11
        CMP      R2,#+3
        BLS      ??select_length_0
        SUBS     R2,R2,#+4
        BEQ      ??select_length_2
        SUBS     R2,R2,#+59
        BEQ      ??select_length_1
        B        ??select_length_3
??select_length_0:
        MOVS     R2,#+1
        MOVS     R0,R2
        B        ??select_length_4
??select_length_1:
        MOVS     R2,#+3
        MOVS     R0,R2
        B        ??select_length_4
??select_length_2:
        MOVS     R2,#+4
        MOVS     R0,R2
        B        ??select_length_4
??select_length_3:
        MOVS     R2,#+2
        MOVS     R0,R2
??select_length_4:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
config_8209c_reg:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R5,R0
        MOVS     R4,R1
        MOV      R0,SP
        MOVS     R1,#+0
        STR      R1,[R0, #0]
        MOVS     R0,R4
        LSRS     R0,R0,#+24
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,R4
        LSRS     R0,R0,#+16
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOVS     R0,R4
        MOV      R1,SP
        STRB     R0,[R1, #+3]
        MOVS     R0,R5
        UXTB     R0,R0
        BL       select_length
        MOVS     R6,R0
        MOVS     R1,#+229
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        MOVS     R2,R6
        UXTB     R2,R2
        UXTB     R6,R6
        RSBS     R0,R6,#+0
        MOV      R1,SP
        ADDS     R1,R1,R0
        ADDS     R1,R1,#+4
        MOVS     R0,R5
        UXTB     R0,R0
        BL       rn8209c_write
        MOVS     R1,#+220
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        POP      {R0,R1,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_8209c_regs:
        PUSH     {R2-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R0,SP
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
        UXTB     R4,R4
        CMP      R4,#+128
        BLT      ??read_8209c_regs_0
        MOVS     R0,#+0
        B        ??read_8209c_regs_1
??read_8209c_regs_0:
        MOVS     R0,R4
        UXTB     R0,R0
        BL       select_length
        MOVS     R6,R0
        MOVS     R2,R6
        UXTB     R2,R2
        MOV      R1,SP
        MOVS     R0,R4
        UXTB     R0,R0
        BL       rn8209c_read
        CMP      R0,#+1
        BNE      ??read_8209c_regs_2
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        MULS     R0,R1,R0
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+128
        LSLS     R2,R2,#+9        ;; #+65536
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        MOV      R1,SP
        LDRB     R1,[R1, #+2]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        MOV      R1,SP
        LDRB     R1,[R1, #+3]
        ADDS     R0,R0,R1
        STR      R0,[R5, #+0]
        MOVS     R0,R6
        UXTB     R0,R0
        B        ??read_8209c_regs_1
??read_8209c_regs_2:
        MOVS     R0,#+0
??read_8209c_regs_1:
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_checkSum:
        PUSH     {R3-R5,LR}
        MOVS     R4,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R5,#+0
??rn8209c_checkSum_0:
        UXTB     R5,R5
        CMP      R5,#+24
        BGE      ??rn8209c_checkSum_1
        MOV      R1,SP
        MOVS     R0,R5
        UXTB     R0,R0
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        ADDS     R4,R4,R0
        ADDS     R5,R5,#+1
        B        ??rn8209c_checkSum_0
??rn8209c_checkSum_1:
        UXTH     R4,R4
        MVNS     R0,R4
        UXTH     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_free_addr:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R3,#+0
        MOVS     R0,R3
??find_free_addr_0:
        UXTH     R0,R0
        CMP      R0,#+60
        BGE      ??find_free_addr_1
        UXTH     R0,R0
        MOVS     R3,#+17
        MULS     R3,R0,R3
        LDRB     R3,[R1, R3]
        MOVS     R2,R3
        UXTB     R2,R2
        CMP      R2,#+255
        BEQ      ??find_free_addr_1
??find_free_addr_2:
        ADDS     R0,R0,#+1
        B        ??find_free_addr_0
??find_free_addr_1:
        MOVS     R3,#+17
        MULS     R0,R3,R0
        UXTH     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
save_8209c_params:
        PUSH     {LR}
        SUB      SP,SP,#+68
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+20]
        BL       __aeabi_f2d
        STR      R0,[SP, #+56]
        STR      R1,[SP, #+60]
        LDR      R0,??DataTable16_1
        LDR      R0,[R0, #+28]
        STR      R0,[SP, #+48]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+16]
        STR      R0,[SP, #+44]
        LDR      R0,??DataTable16_1
        LDR      R0,[R0, #+24]
        STR      R0,[SP, #+40]
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+36]
        LDR      R0,??DataTable16_1
        LDR      R0,[R0, #+20]
        STR      R0,[SP, #+32]
        LDR      R0,??DataTable16
        LDRH     R0,[R0, #+8]
        STR      R0,[SP, #+28]
        LDR      R0,??DataTable16_1
        LDR      R0,[R0, #+16]
        STR      R0,[SP, #+24]
        LDR      R0,??DataTable16
        LDRH     R0,[R0, #+6]
        STR      R0,[SP, #+20]
        LDR      R0,??DataTable16_1
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+16]
        LDR      R0,??DataTable16
        LDRH     R0,[R0, #+4]
        STR      R0,[SP, #+12]
        LDR      R0,??DataTable16_1
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+8]
        LDR      R0,??DataTable16
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable16_1
        LDR      R0,[R0, #+4]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable16
        LDRH     R3,[R0, #+40]
        LDR      R0,??DataTable16_1
        LDR      R2,[R0, #+0]
        LDR      R1,??DataTable16_2
        LDR      R0,??DataTable16_3
        BL       sprintf
        LDR      R0,??DataTable19  ;; 0x800fc00
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??save_8209c_params_0
        LDR      R0,??DataTable16_3
        BL       strlen
        MOVS     R2,R0
        UXTH     R2,R2
        LDR      R1,??DataTable16_3
        LDR      R0,??DataTable19  ;; 0x800fc00
        BL       FLASH_Write_chars
??save_8209c_params_0:
        ADD      SP,SP,#+68
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_8209c_params:
        PUSH     {R7,LR}
        LDR      R0,??DataTable16
        LDRH     R1,[R0, #+0]
        MOVS     R0,#+2
        BL       config_8209c_reg
        LDR      R0,??DataTable16
        LDRH     R1,[R0, #+2]
        MOVS     R0,#+3
        BL       config_8209c_reg
        LDR      R0,??DataTable16
        LDRH     R1,[R0, #+4]
        MOVS     R0,#+5
        BL       config_8209c_reg
        LDR      R0,??DataTable16
        LDRH     R1,[R0, #+6]
        MOVS     R0,#+7
        BL       config_8209c_reg
        LDR      R0,??DataTable16
        LDRH     R1,[R0, #+24]
        MOVS     R0,#+32
        BL       config_8209c_reg
        MOVS     R0,#+1
        BL       Delayms
        MOV      R1,SP
        MOVS     R0,#+45
        BL       read_8209c_regs
        BL       rn8209c_checkSum
        LDR      R1,??DataTable16
        STR      R0,[R1, #+36]
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+15
        BMI      ??set_8209c_params_0
        LDR      R0,??DataTable16
        LDR      R0,[R0, #+36]
        LDR      R1,[SP, #+0]
        UXTH     R1,R1
        CMP      R0,R1
        BNE      ??set_8209c_params_0
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
??set_8209c_params_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_old_data:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        UXTH     R5,R5
        MOVS     R4,R5
??find_old_data_0:
        CMP      R4,#+0
        BMI      ??find_old_data_1
        MOVS     R2,#+17
        LDR      R1,??DataTable16_3
        UXTH     R5,R5
        LDR      R0,??DataTable19_1  ;; 0x800f7ef
        ADDS     R0,R5,R0
        BL       read_flash
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+15]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+16]
        ADDS     R0,R0,R1
        MOVS     R6,R0
        MOVS     R1,#+15
        LDR      R0,??DataTable16_3
        BL       GetCRC16
        UXTH     R6,R6
        CMP      R0,R6
        BNE      ??find_old_data_2
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+10]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16
        STRH     R0,[R1, #+24]
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+5]
        MOVS     R1,#+0
        MULS     R1,R0,R1
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+6]
        MOVS     R2,#+0
        MULS     R2,R0,R2
        ADDS     R0,R1,R2
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+7]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R2,R1,R2
        ADDS     R0,R0,R2
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+8]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16
        STRH     R0,[R1, #+48]
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+11]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        MULS     R0,R1,R0
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+12]
        MOVS     R2,#+128
        LSLS     R2,R2,#+9        ;; #+65536
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+13]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+14]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16
        STR      R0,[R1, #+56]
        MOVS     R0,#+1
        B        ??find_old_data_3
??find_old_data_2:
        SUBS     R4,R4,#+17
        B        ??find_old_data_0
??find_old_data_1:
        MOVS     R0,#+0
??find_old_data_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
init_8209c_params:
        PUSH     {R3-R5,LR}
        LDR      R0,??DataTable19  ;; 0x800fc00
        BL       read_params_area
        LDR      R1,??DataTable19_2
        MOVS     R0,#+0
        BL       find_params
        CMP      R0,#+0
        BNE      .+4
        B        ??init_8209c_params_0
        LDR      R0,??DataTable16
        LDRH     R0,[R0, #+40]
        CMP      R0,#+1
        BEQ      .+4
        B        ??init_8209c_params_1
        LDR      R1,??DataTable19_3
        MOVS     R0,#+1
        BL       find_params
        LDR      R1,??DataTable19_4
        MOVS     R0,#+2
        BL       find_params
        LDR      R1,??DataTable20
        MOVS     R0,#+3
        BL       find_params
        LDR      R1,??DataTable20_1
        MOVS     R0,#+5
        BL       find_params
        LDR      R1,??DataTable20_2
        MOVS     R0,#+6
        BL       find_params
        LDR      R1,??DataTable20_3
        MOVS     R0,#+7
        BL       find_params
        LDR      R0,??DataTable20_4  ;; 0x800f800
        BL       find_free_addr
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,#+255
        LSLS     R0,R0,#+2        ;; #+1020
        CMP      R4,R0
        BGE      ??init_8209c_params_2
        UXTH     R4,R4
        CMP      R4,#+0
        BEQ      ??init_8209c_params_2
        MOVS     R2,#+17
        LDR      R1,??DataTable16_3
        UXTH     R4,R4
        LDR      R0,??DataTable19_1  ;; 0x800f7ef
        ADDS     R0,R4,R0
        BL       read_flash
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+15]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+16]
        ADDS     R0,R0,R1
        MOVS     R5,R0
        MOVS     R1,#+15
        LDR      R0,??DataTable16_3
        BL       GetCRC16
        UXTH     R5,R5
        CMP      R0,R5
        BNE      ??init_8209c_params_3
        MOVS     R0,#+1
        LDR      R1,??DataTable21
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+10]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16
        STRH     R0,[R1, #+24]
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+5]
        MOVS     R1,#+0
        MULS     R1,R0,R1
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+6]
        MOVS     R2,#+0
        MULS     R2,R0,R2
        ADDS     R0,R1,R2
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+7]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R2,R1,R2
        ADDS     R0,R0,R2
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+8]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16
        STRH     R0,[R1, #+48]
        LDR      R0,??DataTable16_3
        LDRB     R0,[R0, #+11]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        MULS     R0,R1,R0
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+12]
        MOVS     R2,#+128
        LSLS     R2,R2,#+9        ;; #+65536
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+13]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16_3
        LDRB     R1,[R1, #+14]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable16
        STR      R0,[R1, #+56]
        B        ??init_8209c_params_1
??init_8209c_params_3:
        MOVS     R0,#+0
        LDR      R1,??DataTable21
        STRB     R0,[R1, #+0]
        MOVS     R0,R4
        UXTH     R0,R0
        BL       find_old_data
        B        ??init_8209c_params_1
??init_8209c_params_2:
        MOVS     R0,#+0
        LDR      R1,??DataTable21
        STRB     R0,[R1, #+0]
        B        ??init_8209c_params_1
??init_8209c_params_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable16
        STRH     R0,[R1, #+40]
??init_8209c_params_1:
        BL       set_8209c_params
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     paralist

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_2:
        DC32     `?<Constant "%s%d;%s%d;%s%d;%s%d;%...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_3:
        DC32     g_updateBuffer

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
format_elc_data:
        PUSH     {R2-R4,LR}
        MOV      R1,SP
        MOVS     R0,#+0
        BL       RTC_GetDate
        ADD      R1,SP,#+4
        MOVS     R0,#+0
        BL       RTC_GetTime
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+1]
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+3]
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable24_1
        LDRH     R0,[R0, #+48]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable24_1
        LDRH     R0,[R0, #+48]
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+8]
        LDR      R0,??DataTable24_1
        LDRH     R0,[R0, #+24]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+9]
        LDR      R0,??DataTable24_1
        LDRH     R0,[R0, #+24]
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+10]
        LDR      R0,??DataTable24_1
        LDR      R0,[R0, #+56]
        LSRS     R0,R0,#+24
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+11]
        LDR      R0,??DataTable24_1
        LDR      R0,[R0, #+56]
        LSRS     R0,R0,#+16
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+12]
        LDR      R0,??DataTable24_1
        LDR      R0,[R0, #+56]
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+13]
        LDR      R0,??DataTable24_1
        LDR      R0,[R0, #+56]
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+14]
        MOVS     R1,#+15
        LDR      R0,??DataTable24
        BL       GetCRC16
        MOVS     R4,R0
        MOVS     R0,R4
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+15]
        MOVS     R0,R4
        LDR      R1,??DataTable24
        STRB     R0,[R1, #+16]
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
save_elc_datas:
        PUSH     {R4,LR}
        BL       format_elc_data
        LDR      R0,??DataTable20_4  ;; 0x800f800
        BL       find_free_addr
        MOVS     R4,R0
        UXTH     R4,R4
        LDR      R0,??DataTable24_2  ;; 0x3eb
        CMP      R4,R0
        BLT      ??save_elc_datas_0
        LDR      R0,??DataTable20_4  ;; 0x800f800
        BL       FLASH_ErasePage
        MOVS     R0,#+0
        MOVS     R4,R0
??save_elc_datas_0:
        MOVS     R2,#+17
        LDR      R1,??DataTable24
        UXTH     R4,R4
        LDR      R0,??DataTable20_4  ;; 0x800f800
        ADDS     R0,R4,R0
        BL       FLASH_Write_chars
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
power_down_protect:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        LDR      R0,??DataTable20_4  ;; 0x800f800
        BL       find_free_addr
        MOVS     R4,R0
        MOV      R1,SP
        MOVS     R0,#+32
        BL       read_8209c_regs
        LDR      R1,??DataTable24_1
        STRH     R0,[R1, #+24]
        BL       read_8209c_energyP
        BL       format_elc_data
        UXTH     R4,R4
        LDR      R0,??DataTable20_4  ;; 0x800f800
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
        MOVS     R2,#+17
        LDR      R1,??DataTable24
        LDR      R0,[SP, #+0]
        BL       FLASH_Write_chars
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0x800fc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0x800f7ef

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_2:
        DC32     rn8209c_papameter+0x28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_3:
        DC32     rn8209c_papameter+0x2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_4:
        DC32     rn8209c_papameter+0x4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_UIP:
        PUSH     {R3-R5,LR}
        MOV      R1,SP
        MOVS     R0,#+36
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+8
        BPL      ??read_UIP_0
        MOVS     R0,#+0
        B        ??read_UIP_1
??read_UIP_0:
        LDR      R0,??DataTable24_1
        LDR      R0,[R0, #+12]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable24_3  ;; 0x40a13000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
??read_UIP_1:
        LDR      R1,??DataTable24_1
        STRH     R0,[R1, #+26]
        MOV      R1,SP
        MOVS     R0,#+34
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+8
        BPL      ??read_UIP_2
        MOVS     R0,#+0
        B        ??read_UIP_3
??read_UIP_2:
        LDR      R0,??DataTable24_1
        LDR      R0,[R0, #+16]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable24_4  ;; 0x3fe00000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable24_5  ;; 0x408f4000
        BL       __aeabi_dmul
        BL       __aeabi_d2uiz
??read_UIP_3:
        LDR      R1,??DataTable24_1
        STR      R0,[R1, #+28]
        MOV      R1,SP
        MOVS     R0,#+38
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BPL      ??read_UIP_4
        LDR      R0,[SP, #+0]
        MVNS     R1,R0
        ADDS     R1,R1,#+1
        STR      R1,[SP, #+0]
??read_UIP_4:
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2f
        LDR      R1,??DataTable24_1
        LDR      R1,[R1, #+20]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??DataTable24_6  ;; 0x412e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR      R1,??DataTable24_1
        STRH     R0,[R1, #+32]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     rn8209c_papameter+0x6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_1:
        DC32     rn8209c_papameter+0xC

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_2:
        DC32     rn8209c_papameter+0x10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_3:
        DC32     rn8209c_papameter+0x14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_4:
        DC32     0x800f800

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_8209c_energyP:
        PUSH     {R7,LR}
        MOV      R1,SP
        MOVS     R0,#+32
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable24_1
        STRH     R0,[R1, #+24]
        MOV      R1,SP
        MOVS     R0,#+42
        BL       read_8209c_regs
        LDR      R0,??DataTable24_1
        LDRH     R0,[R0, #+48]
        LDR      R1,[SP, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable24_1
        STRH     R0,[R1, #+48]
        LDR      R0,??DataTable24_1
        LDRH     R0,[R0, #+48]
        LDR      R1,??DataTable24_1
        LDRH     R1,[R1, #+50]
        BL       __aeabi_idiv
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR      R3,??DataTable24_5  ;; 0x408f4000
        BL       __aeabi_dmul
        BL       __aeabi_d2uiz
        LDR      R1,??DataTable24_1
        STR      R0,[R1, #+44]
        LDR      R0,??DataTable24_1
        LDR      R0,[R0, #+44]
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     flash_ok

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_pow_factor:
        PUSH     {R2-R6,LR}
        MOV      R1,SP
        MOVS     R0,#+38
        BL       read_8209c_regs
        ADD      R1,SP,#+4
        MOVS     R0,#+40
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BPL      ??read_pow_factor_0
        LDR      R0,[SP, #+0]
        MVNS     R1,R0
        ADDS     R1,R1,#+1
        STR      R1,[SP, #+0]
??read_pow_factor_0:
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2f
        LDR      R1,??DataTable24_1
        LDR      R1,[R1, #+20]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??DataTable24_6  ;; 0x412e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BPL      ??read_pow_factor_1
        LDR      R0,[SP, #+0]
        MVNS     R1,R0
        ADDS     R1,R1,#+1
        STR      R1,[SP, #+4]
??read_pow_factor_1:
        LDR      R0,[SP, #+4]
        BL       __aeabi_ui2f
        LDR      R1,??DataTable24_1
        LDR      R1,[R1, #+20]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??DataTable24_6  ;; 0x412e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+4]
        MULS     R0,R1,R0
        LDR      R1,[SP, #+0]
        LDR      R2,[SP, #+0]
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        BL       __aeabi_ui2d
        BL       sqrt
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable24_7  ;; 0x40590000
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        MOVS     R6,R0
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_light_time:
        PUSH     {R7,LR}
        BL       read_light_time
        LDR      R1,??DataTable24_8  ;; 0xea60
        BL       __aeabi_uidiv
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_LED_state:
        PUSH     {LR}
        LDR      R0,??DataTable24_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??read_LED_state_0
        MOVS     R0,#+0
        B        ??read_LED_state_1
??read_LED_state_0:
        MOVS     R0,#+1
??read_LED_state_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     g_updateBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_1:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_2:
        DC32     0x3eb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_3:
        DC32     0x40a13000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_4:
        DC32     0x3fe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_5:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_6:
        DC32     0x412e8480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_7:
        DC32     0x40590000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_8:
        DC32     0xea60

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24_9:
        DC32     rn8209c_papameter+0x34

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "safe_start">`:
        DATA
        DC8 "safe_start"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
`?<Constant " ">`:
        DATA
        DC8 " "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%s%d;%s%d;%s%d;%s%d;%...">`:
        DATA
        DC8 "%s%d;%s%d;%s%d;%s%d;%s%d;%s%d;%s%d;%s%f;"
        DC8 0, 0, 0

        END
// 
//    34 bytes in section .bss
//    93 bytes in section .data
//    70 bytes in section .rodata
// 3 704 bytes in section .text
// 
// 3 704 bytes of CODE  memory
//    70 bytes of CONST memory
//   127 bytes of DATA  memory
//
//Errors: none
//Warnings: none

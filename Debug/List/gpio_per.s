///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:17
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\gpio_per.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\gpio_per.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -lb
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
//        E:\svnProject\street_lamp_new\coffee_arch\ -Ol -I "F:\Program Files
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
        EXTERN MemCpy
        EXTERN MemSet
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
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fmul
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_ui2f
        EXTERN __aeabi_uidiv
        EXTERN __iar_Strstr
        EXTERN atof
        EXTERN atoi
        EXTERN clear_light_time
        EXTERN etimer_set
        EXTERN hal_InitUART
        EXTERN paralist
        EXTERN printf
        EXTERN process_post
        EXTERN process_start
        EXTERN read_flash
        EXTERN read_light_time
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
        PUBLIC find_params
        PUBLIC format_elc_data
        PUBLIC g_cal_Buf
        PUBLIC get_light_time
        PUBLIC gpio_per_init
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
        PUBLIC read_params_area
        PUBLIC read_pow_factor
        PUBLIC relay_gpio_init
        PUBLIC rn8209c_checkSum
        PUBLIC rn8209c_init
        PUBLIC rn8209c_papameter
        PUBLIC rn8209c_read
        PUBLIC rn8209c_reset
        PUBLIC rn8209c_write
        PUBLIC rn8209c_write_byte
        PUBLIC save_8209c_params
        PUBLIC save_elc_datas
        PUBLIC select_length
        PUBLIC set_8209c_params
        PUBLIC set_PWM
        PUBLIC start_time_detect_process
        PUBLIC strstr


        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP strstr
        THUMB
// __intrinsic __nounwind __interwork __softfp char *strstr(char const *, char const *)
strstr:
        PUSH     {R7,LR}
        BL       __iar_Strstr
        POP      {R1,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_cal_Buf:
        DS8 1024

        SECTION `.data`:DATA:REORDER:NOROOT(0)
flash_ok:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
rn8209c_papameter:
        DATA
        DC16 4968, 6400
        DC8 0, 0
        DC16 0, 0
        DC8 0, 0
        DC16 0
        DC8 0, 0
        DC32 0, 0, 0H
        DC16 0, 0
        DC32 0
        DC16 0
        DC8 0, 0
        DC32 0, 0
        DC16 0
        DC8 100, 0
        DC32 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
gpio_per_init:
        PUSH     {R7,LR}
        BL       relay_gpio_init
        BL       hal_init_PWM
        BL       init_zero_detect
        BL       hal_ADC_Init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_params_area:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOV      R1,SP
        LDR      R2,??DataTable3
        LDR      R3,[R2, #0]
        STR      R3,[R1, #0]
        MOVS     R4,#+0
        MOVS     R2,#+128
        LSLS     R2,R2,#+3        ;; #+1024
        MOVS     R1,R0
        LDR      R0,??DataTable3_1
        BL       MemCpy
        MOV      R1,SP
        LDR      R0,??DataTable3_1
        BL       strstr
        MOVS     R4,R0
        CMP      R4,#+0
        BEQ      ??read_params_area_0
        LDR      R0,??DataTable3_1
        SUBS     R1,R4,R0
        ADDS     R1,R1,#+3
        LDRB     R0,[R4, #+3]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R0,R2,R0
        LDRB     R2,[R4, #+4]
        ADDS     R4,R0,R2
        UXTH     R1,R1
        LDR      R0,??DataTable3_1
        BL       GetCRC16
        UXTH     R4,R4
        CMP      R0,R4
        BNE      ??read_params_area_1
        MOVS     R0,#+1
        B        ??read_params_area_2
??read_params_area_1:
        MOVS     R0,#+0
        B        ??read_params_area_2
??read_params_area_0:
        MOVS     R0,#+0
??read_params_area_2:
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_params:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,#+0
        MOV      R0,SP
        MOVS     R1,#+16
        BL       __aeabi_memclr4
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R1,??DataTable4
        LDR      R1,[R1, R0]
        LDR      R0,??DataTable3_1
        BL       strstr
        MOVS     R5,R0
        CMP      R5,#+0
        BNE      ??find_params_0
        MOVS     R0,#+0
        B        ??find_params_1
??find_params_0:
        MOVS     R6,#+0
        B        ??find_params_2
??find_params_3:
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R1,??DataTable4
        LDR      R0,[R1, R0]
        BL       strlen
        UXTB     R6,R6
        ADDS     R0,R5,R0
        LDRB     R0,[R0, R6]
        UXTB     R6,R6
        MOV      R1,SP
        STRB     R0,[R1, R6]
        ADDS     R6,R6,#+1
??find_params_2:
        UXTB     R6,R6
        CMP      R6,#+15
        BGE      ??find_params_4
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R1,??DataTable4
        LDR      R0,[R1, R0]
        BL       strlen
        UXTB     R6,R6
        ADDS     R0,R5,R0
        LDRB     R0,[R0, R6]
        CMP      R0,#+59
        BNE      ??find_params_3
??find_params_4:
        UXTB     R4,R4
        CMP      R4,#+5
        BEQ      ??find_params_5
        UXTB     R4,R4
        CMP      R4,#+6
        BEQ      ??find_params_5
        UXTB     R4,R4
        CMP      R4,#+10
        BNE      ??find_params_6
??find_params_5:
        MOV      R0,SP
        BL       atoi
        STR      R0,[R7, #+0]
        B        ??find_params_7
??find_params_6:
        UXTB     R4,R4
        CMP      R4,#+7
        BNE      ??find_params_8
        MOV      R0,SP
        BL       atof
        BL       __aeabi_d2f
        STR      R0,[R7, #+0]
        B        ??find_params_7
??find_params_8:
        MOV      R0,SP
        BL       atoi
        STRH     R0,[R7, #+0]
??find_params_7:
        MOVS     R0,#+1
??find_params_1:
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

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
        LDR      R0,??DataTable4_1  ;; 0xbb80
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOVS     R0,#+40
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+10]
        MOV      R1,SP
        LDR      R0,??DataTable6  ;; 0x40002000
        BL       TIM_TimeBaseInit
        MOVS     R1,#+1
        LDR      R0,??DataTable6  ;; 0x40002000
        BL       TIM_ClearFlag
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR      R0,??DataTable6  ;; 0x40002000
        BL       TIM_ITConfig
        POP      {R0-R2,PC}       ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
period_save_data_process:
        DATA
        DC32 0H, `?<Constant " ">`, process_thread_period_save_data_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_period_save_data_process:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_period_save_data_process_0
        MOVS     R2,#+179
        LSLS     R2,R2,#+1        ;; #+358
        CMP      R0,R2
        BEQ      ??process_thread_period_save_data_process_1
        B        ??process_thread_period_save_data_process_2
??process_thread_period_save_data_process_0:
        UXTB     R5,R5
        CMP      R5,#+129
        BNE      ??process_thread_period_save_data_process_3
        LDR      R0,??DataTable5
        BL       printf
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+48]
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable5_2
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_3
        BL       printf
??process_thread_period_save_data_process_3:
        LDR      R1,??DataTable5_4  ;; 0x7530
        LDR      R0,??DataTable5_5
        BL       etimer_set
        MOVS     R1,#+0
        MOVS     R0,#+179
        LSLS     R0,R0,#+1        ;; #+358
        STRH     R0,[R4, #+0]
??process_thread_period_save_data_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??process_thread_period_save_data_process_4
        UXTB     R5,R5
        CMP      R5,#+136
        BNE      ??process_thread_period_save_data_process_4
        LDR      R0,??DataTable5_5
        CMP      R6,R0
        BEQ      ??process_thread_period_save_data_process_5
??process_thread_period_save_data_process_4:
        MOVS     R0,#+1
        B        ??process_thread_period_save_data_process_6
??process_thread_period_save_data_process_5:
        BL       get_light_time
        BL       read_8209c_energyP
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+2]
        MOVS     R1,#+100
        BL       __aeabi_idiv
        LDR      R1,??DataTable5_1
        LDRH     R1,[R1, #+48]
        LDR      R2,??DataTable5_2
        LDR      R2,[R2, #+0]
        SUBS     R1,R1,R2
        CMP      R1,R0
        BCC      ??process_thread_period_save_data_process_7
        BL       save_elc_datas
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+48]
        LDR      R1,??DataTable5_2
        STR      R0,[R1, #+0]
        LDR      R0,??DataTable6_1
        BL       printf
        B        ??process_thread_period_save_data_process_3
??process_thread_period_save_data_process_7:
        LDR      R0,??DataTable6_2
        BL       printf
        B        ??process_thread_period_save_data_process_3
??process_thread_period_save_data_process_2:
        MOVS     R1,#+0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_period_save_data_process_6:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     `?<Constant "end">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     g_cal_Buf

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??tempPulse:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??save_timer:
        DS8 16

        SECTION `.data`:DATA:REORDER:NOROOT(2)
start_time_detect_process:
        DATA
        DC32 0H, `?<Constant "safe_start">`
        DC32 process_thread_start_time_detect_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_start_time_detect_process:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R6,R2
        MOVS     R1,#+1
        LDRH     R0,[R5, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_start_time_detect_process_0
        MOVS     R2,#+255
        ADDS     R2,R2,#+146      ;; #+401
        CMP      R0,R2
        BEQ      ??process_thread_start_time_detect_process_1
        B        ??process_thread_start_time_detect_process_2
??process_thread_start_time_detect_process_0:
        BL       rn8209c_init
        LDR      R1,??DataTable5_4  ;; 0x7530
        LDR      R0,??DataTable6_3
        BL       etimer_set
        MOVS     R1,#+0
        MOVS     R0,#+255
        ADDS     R0,R0,#+146      ;; #+401
        STRH     R0,[R5, #+0]
??process_thread_start_time_detect_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??process_thread_start_time_detect_process_3
        UXTB     R4,R4
        CMP      R4,#+136
        BNE      ??process_thread_start_time_detect_process_3
        LDR      R0,??DataTable6_3
        CMP      R6,R0
        BEQ      ??process_thread_start_time_detect_process_4
??process_thread_start_time_detect_process_3:
        MOVS     R0,#+1
        B        ??process_thread_start_time_detect_process_5
??process_thread_start_time_detect_process_4:
        LDR      R0,??DataTable6_4
        BL       printf
        LDR      R0,??DataTable5_1
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BNE      ??process_thread_start_time_detect_process_6
        LDR      R0,??DataTable6_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??process_thread_start_time_detect_process_7
        LDR      R0,??DataTable6_6
        BL       printf
        LDR      R0,??DataTable6_7  ;; 0x800f800
        BL       find_free_addr
        LDR      R1,??DataTable6_8
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable6_8
        LDRH     R0,[R0, #+0]
        MOVS     R1,#+252
        LSLS     R1,R1,#+2        ;; #+1008
        CMP      R0,R1
        BLT      ??process_thread_start_time_detect_process_8
        LDR      R0,??DataTable6_9
        BL       printf
        BL       read_8209c_energyP
        BL       format_elc_data
        LDR      R0,??DataTable6_7  ;; 0x800f800
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??process_thread_start_time_detect_process_9
        MOVS     R2,#+18
        LDR      R1,??DataTable7
        LDR      R0,??DataTable6_7  ;; 0x800f800
        BL       FLASH_Write_chars
        B        ??process_thread_start_time_detect_process_9
??process_thread_start_time_detect_process_8:
        LDR      R0,??DataTable6_8
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??process_thread_start_time_detect_process_9
        LDR      R0,??DataTable7_1
        BL       printf
        BL       read_8209c_energyP
        BL       format_elc_data
        MOVS     R2,#+18
        LDR      R1,??DataTable7
        LDR      R0,??DataTable6_7  ;; 0x800f800
        BL       FLASH_Write_chars
        B        ??process_thread_start_time_detect_process_9
??process_thread_start_time_detect_process_7:
        LDR      R0,??DataTable7_2
        BL       printf
        BL       read_8209c_energyP
        BL       format_elc_data
        LDR      R0,??DataTable6_7  ;; 0x800f800
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??process_thread_start_time_detect_process_9
        MOVS     R2,#+18
        LDR      R1,??DataTable7
        LDR      R0,??DataTable6_7  ;; 0x800f800
        BL       FLASH_Write_chars
        MOVS     R0,#+1
        LDR      R1,??DataTable6_5
        STRB     R0,[R1, #+0]
??process_thread_start_time_detect_process_9:
        MOVS     R1,#+0
        LDR      R0,??DataTable8
        BL       process_start
        BL       drop_down_timer_init
        B        ??process_thread_start_time_detect_process_2
??process_thread_start_time_detect_process_6:
        ADR      R0,??DataTable9  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
??process_thread_start_time_detect_process_2:
        MOVS     R1,#+0
        MOVS     R0,#+0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+3
??process_thread_start_time_detect_process_5:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     paralist

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0xbb80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??start_etimer:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
??length:
        DS8 2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BCD_code:
        PUSH     {R4-R7,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,#+0
        B        ??BCD_code_0
??BCD_code_1:
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
??BCD_code_0:
        UXTB     R7,R7
        UXTB     R6,R6
        CMP      R7,R6
        BCC      ??BCD_code_1
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
BCD_decode:
        PUSH     {R4,LR}
        MOVS     R2,#+0
        B        ??BCD_decode_0
??BCD_decode_1:
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
??BCD_decode_0:
        UXTB     R2,R2
        UXTB     R1,R1
        CMP      R2,R1
        BCC      ??BCD_decode_1
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
TIM14_IRQHandler:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        LDR      R0,??DataTable6  ;; 0x40002000
        BL       TIM_GetITStatus
        CMP      R0,#+0
        BEQ      ??TIM14_IRQHandler_0
        MOVS     R1,#+1
        LDR      R0,??DataTable6  ;; 0x40002000
        BL       TIM_ClearFlag
        BL       power_down_protect
        LDR      R0,??DataTable9_1
        BL       printf
        MOVS     R1,#+0
        LDR      R0,??DataTable6  ;; 0x40002000
        BL       TIM_Cmd
        MOVS     R2,#+0
        MOVS     R1,#+131
        LDR      R0,??DataTable8
        BL       process_post
        MOVS     R1,#+0
        LDR      R0,??DataTable11
        BL       process_start
??TIM14_IRQHandler_0:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     `?<Constant "period save process s...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     ??tempPulse

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     `?<Constant "power on pulse = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x7530

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     ??save_timer

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
        LDR      R0,??DataTable11_1  ;; 0x40012400
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
        LDR      R0,??DataTable11_1  ;; 0x40012400
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
        LDR      R0,??DataTable11_1  ;; 0x40012400
        BL       ADC_Init
        MOVS     R2,#+4
        MOVS     R1,#+1
        LDR      R0,??DataTable11_1  ;; 0x40012400
        BL       ADC_ChannelConfig
        LDR      R0,??DataTable12  ;; 0x4001240c
        LDR      R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        ORRS     R1,R1,R0
        LDR      R0,??DataTable12  ;; 0x4001240c
        STR      R1,[R0, #+0]
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x40002000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     `?<Constant "save elc data finish\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     `?<Constant "not full the save con...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     ??start_etimer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     `?<Constant "protected time end\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     flash_ok

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     `?<Constant "flash data ok\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0x800f800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     ??length

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     `?<Constant "flash  full  erase an...">`

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
        LDR      R0,??DataTable13  ;; 0x48000400
        BL       GPIO_Init
        MOVS     R2,#+2
        MOVS     R1,#+9
        LDR      R0,??DataTable13  ;; 0x48000400
        BL       GPIO_PinAFConfig
        MOVS     R2,#+2
        MOVS     R1,#+8
        LDR      R0,??DataTable13  ;; 0x48000400
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
        LDR      R0,??DataTable14  ;; 0x40014800
        BL       TIM_TimeBaseInit
        ADD      R1,SP,#+8
        LDR      R0,??DataTable14_5  ;; 0x40014400
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
        LDR      R0,??DataTable14  ;; 0x40014800
        BL       TIM_OC1Init
        ADD      R1,SP,#+20
        LDR      R0,??DataTable14_5  ;; 0x40014400
        BL       TIM_OC1Init
        MOVS     R1,#+8
        LDR      R0,??DataTable14  ;; 0x40014800
        BL       TIM_OC1PreloadConfig
        MOVS     R1,#+8
        LDR      R0,??DataTable14_5  ;; 0x40014400
        BL       TIM_OC1PreloadConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable14  ;; 0x40014800
        BL       TIM_ARRPreloadConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable14_5  ;; 0x40014400
        BL       TIM_ARRPreloadConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable14  ;; 0x40014800
        BL       TIM_Cmd
        MOVS     R1,#+1
        LDR      R0,??DataTable14_5  ;; 0x40014400
        BL       TIM_Cmd
        MOVS     R1,#+1
        LDR      R0,??DataTable14  ;; 0x40014800
        BL       TIM_CtrlPWMOutputs
        MOVS     R1,#+1
        LDR      R0,??DataTable14_5  ;; 0x40014400
        BL       TIM_CtrlPWMOutputs
        ADD      SP,SP,#+44
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     g_cal_Buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     `?<Constant "flash  not full, write\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     `?<Constant "flash data err, erase...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_PWM:
        PUSH     {LR}
        UXTB     R0,R0
        CMP      R0,#+101
        BLT      ??set_PWM_0
        MOVS     R1,#+100
        B        ??set_PWM_1
??set_PWM_0:
        MOVS     R1,R0
??set_PWM_1:
        LDR      R2,??DataTable14_1
        STRB     R1,[R2, #+0]
        UXTB     R0,R0
        MOVS     R1,#+250
        LSLS     R1,R1,#+2        ;; #+1000
        MULS     R0,R1,R0
        MOVS     R1,#+100
        BL       __aeabi_idiv
        LDR      R1,??DataTable14_2  ;; 0x40014834
        STR      R0,[R1, #+0]
        LDR      R1,??DataTable14_6  ;; 0x40014434
        STR      R0,[R1, #+0]
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     period_save_data_process

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_PWM_volt:
        PUSH     {R7,LR}
        MOVS     R1,#+4
        LDR      R0,??DataTable11_1  ;; 0x40012400
        BL       ADC_ClearFlag
        LDR      R0,??DataTable11_1  ;; 0x40012400
        BL       ADC_StartOfConversion
??read_PWM_volt_0:
        MOVS     R1,#+4
        LDR      R0,??DataTable11_1  ;; 0x40012400
        BL       ADC_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??read_PWM_volt_0
        LDR      R0,??DataTable11_1  ;; 0x40012400
        BL       ADC_StopOfConversion
        LDR      R0,??DataTable11_1  ;; 0x40012400
        BL       ADC_GetConversionValue
        UXTH     R0,R0
        BL       __aeabi_ui2d
        ADR      R2,??DataTable14_3
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable14_4  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable14_7  ;; 0x40900000
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        UXTH     R0,R0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     `?<Constant "drop down, save ok\\r\\n">`

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
        LDR      R0,??DataTable13  ;; 0x48000400
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
        LDR      R0,??DataTable13  ;; 0x48000400
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
        PUSH     {R3-R5,LR}
        MOVS     R5,R1
        MOVS     R4,#+128
        ORRS     R4,R4,R0
??rn8209c_write_byte_0:
        MOVS     R1,#+64
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_byte_0
        UXTB     R4,R4
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_SendData
??rn8209c_write_byte_1:
        MOVS     R1,#+64
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_byte_1
        UXTB     R5,R5
        MOVS     R1,R5
        UXTH     R1,R1
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_SendData
        UXTB     R4,R4
        UXTB     R5,R5
        ADDS     R0,R4,R5
        MVNS     R4,R0
??rn8209c_write_byte_2:
        MOVS     R1,#+64
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_byte_2
        UXTB     R4,R4
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_SendData
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     start_time_detect_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x40012400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_write:
        PUSH     {R3-R7,LR}
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R5,#+128
        ORRS     R5,R5,R0
        MOVS     R4,R5
??rn8209c_write_0:
        MOVS     R1,#+64
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_0
        UXTB     R5,R5
        MOVS     R1,R5
        UXTH     R1,R1
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_SendData
        MOVS     R5,#+0
        B        ??rn8209c_write_1
??rn8209c_write_2:
        MOVS     R1,#+64
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_2
        UXTB     R5,R5
        LDRB     R1,[R6, R5]
        UXTH     R1,R1
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_SendData
        UXTB     R5,R5
        LDRB     R0,[R6, R5]
        ADDS     R4,R4,R0
        ADDS     R5,R5,#+1
??rn8209c_write_1:
        UXTB     R5,R5
        UXTB     R7,R7
        CMP      R5,R7
        BCC      ??rn8209c_write_2
        MOVS     R0,R4
        UXTB     R0,R0
        MVNS     R4,R0
??rn8209c_write_3:
        MOVS     R1,#+64
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_write_3
        UXTB     R4,R4
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_SendData
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x4001240c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_read:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R5,R4
??rn8209c_read_0:
        MOVS     R1,#+64
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_read_0
        UXTB     R4,R4
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_SendData
        MOVS     R4,#+0
        B        ??rn8209c_read_1
??rn8209c_read_2:
        MOVS     R1,#+32
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_read_2
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_ReceiveData
        UXTB     R4,R4
        STRB     R0,[R6, R4]
        UXTB     R4,R4
        LDRB     R0,[R6, R4]
        ADDS     R5,R5,R0
        ADDS     R4,R4,#+1
??rn8209c_read_1:
        UXTB     R4,R4
        UXTB     R7,R7
        CMP      R4,R7
        BCC      ??rn8209c_read_2
??rn8209c_read_3:
        MOVS     R1,#+32
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??rn8209c_read_3
        LDR      R0,??DataTable14_8  ;; 0x40004400
        BL       USART_ReceiveData
        MOVS     R1,R0
        MOVS     R0,R5
        UXTB     R0,R0
        MVNS     R5,R0
        UXTB     R1,R1
        UXTB     R5,R5
        CMP      R1,R5
        BNE      ??rn8209c_read_4
        MOVS     R0,#+1
        B        ??rn8209c_read_5
??rn8209c_read_4:
        MOVS     R0,#+0
??rn8209c_read_5:
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0x48000400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_reset:
        PUSH     {R7,LR}
        MOVS     R1,#+0
        LDR      R0,??DataTable14_8  ;; 0x40004400
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
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     0x40014800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     rn8209c_papameter+0x32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     0x40014834

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     0x66666666,0x400A6666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_5:
        DC32     0x40014400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_6:
        DC32     0x40014434

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_7:
        DC32     0x40900000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_8:
        DC32     0x40004400

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
rn8209c_init:
        PUSH     {R7,LR}
        BL       rn8209c_reset
        BL       init_8209c_params
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
select_length:
        PUSH     {LR}
        UXTB     R0,R0
        SUBS     R0,R0,#+7
        CMP      R0,#+1
        BLS      ??select_length_0
        SUBS     R0,R0,#+27
        CMP      R0,#+2
        BLS      ??select_length_1
        SUBS     R0,R0,#+4
        CMP      R0,#+2
        BLS      ??select_length_2
        SUBS     R0,R0,#+3
        CMP      R0,#+4
        BLS      ??select_length_1
        SUBS     R0,R0,#+7
        CMP      R0,#+2
        BLS      ??select_length_1
        SUBS     R0,R0,#+5
        BEQ      ??select_length_1
        SUBS     R0,R0,#+11
        CMP      R0,#+3
        BLS      ??select_length_0
        SUBS     R0,R0,#+4
        BEQ      ??select_length_2
        SUBS     R0,R0,#+59
        BEQ      ??select_length_1
        B        ??select_length_3
??select_length_0:
        MOVS     R0,#+1
        B        ??select_length_4
??select_length_1:
        MOVS     R0,#+3
        B        ??select_length_4
??select_length_2:
        MOVS     R0,#+4
        B        ??select_length_4
??select_length_3:
        MOVS     R0,#+2
??select_length_4:
        UXTB     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
config_8209c_reg:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOV      R0,SP
        MOVS     R2,#+0
        STR      R2,[R0, #0]
        MOVS     R0,R1
        LSRS     R0,R0,#+24
        MOV      R2,SP
        STRB     R0,[R2, #+0]
        MOVS     R0,R1
        LSRS     R0,R0,#+16
        MOV      R2,SP
        STRB     R0,[R2, #+1]
        MOVS     R0,R1
        LSRS     R0,R0,#+8
        MOV      R2,SP
        STRB     R0,[R2, #+2]
        MOV      R0,SP
        STRB     R1,[R0, #+3]
        MOVS     R0,R4
        UXTB     R0,R0
        BL       select_length
        MOVS     R5,R0
        MOVS     R1,#+229
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        MOVS     R2,R5
        UXTB     R2,R2
        UXTB     R5,R5
        RSBS     R0,R5,#+0
        MOV      R1,SP
        ADDS     R1,R1,R0
        ADDS     R1,R1,#+4
        MOVS     R0,R4
        UXTB     R0,R0
        BL       rn8209c_write
        MOVS     R1,#+220
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_8209c_regs:
        PUSH     {R2-R6,LR}
        MOVS     R6,R0
        MOVS     R4,R1
        MOV      R0,SP
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
        UXTB     R6,R6
        CMP      R6,#+128
        BLT      ??read_8209c_regs_0
        MOVS     R0,#+0
        B        ??read_8209c_regs_1
??read_8209c_regs_0:
        MOVS     R0,R6
        UXTB     R0,R0
        BL       select_length
        MOVS     R5,R0
        MOVS     R2,R5
        UXTB     R2,R2
        MOV      R1,SP
        MOVS     R0,R6
        UXTB     R0,R0
        BL       rn8209c_read
        CMP      R0,#+1
        BNE      ??read_8209c_regs_2
        UXTB     R5,R5
        CMP      R5,#+1
        BNE      ??read_8209c_regs_3
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        STRB     R0,[R4, #+0]
        B        ??read_8209c_regs_4
??read_8209c_regs_3:
        UXTB     R5,R5
        CMP      R5,#+2
        BNE      ??read_8209c_regs_5
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        ADDS     R0,R0,R1
        STRH     R0,[R4, #+0]
        B        ??read_8209c_regs_4
??read_8209c_regs_5:
        UXTB     R5,R5
        CMP      R5,#+3
        BNE      ??read_8209c_regs_6
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+9        ;; #+65536
        MULS     R0,R1,R0
        MOV      R1,SP
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        MOV      R1,SP
        LDRB     R1,[R1, #+2]
        ADDS     R0,R0,R1
        STR      R0,[R4, #+0]
        B        ??read_8209c_regs_4
??read_8209c_regs_6:
        UXTB     R5,R5
        CMP      R5,#+4
        BNE      ??read_8209c_regs_4
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
        STR      R0,[R4, #+0]
??read_8209c_regs_4:
        MOVS     R0,R5
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
        B        ??rn8209c_checkSum_0
??rn8209c_checkSum_1:
        MOV      R1,SP
        MOVS     R0,R5
        UXTB     R0,R0
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        ADDS     R4,R4,R0
        ADDS     R5,R5,#+1
??rn8209c_checkSum_0:
        UXTB     R5,R5
        CMP      R5,#+24
        BLT      ??rn8209c_checkSum_1
        UXTH     R4,R4
        MVNS     R0,R4
        UXTH     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_free_addr:
        PUSH     {LR}
        MOVS     R1,R0
        MOVS     R0,#+0
        B        ??find_free_addr_0
??find_free_addr_1:
        ADDS     R0,R0,#+1
??find_free_addr_0:
        UXTH     R0,R0
        CMP      R0,#+56
        BGE      ??find_free_addr_2
        UXTH     R0,R0
        MOVS     R2,#+18
        MULS     R2,R0,R2
        LDRB     R2,[R1, R2]
        UXTB     R2,R2
        CMP      R2,#+255
        BNE      ??find_free_addr_1
??find_free_addr_2:
        MOVS     R1,#+18
        MULS     R0,R1,R0
        UXTH     R0,R0
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
save_8209c_params:
        PUSH     {R4,LR}
        SUB      SP,SP,#+64
        MOVS     R2,#+200
        MOVS     R1,#+0
        LDR      R0,??DataTable17
        BL       MemSet
        LDR      R0,??DataTable17_1
        LDR      R0,[R0, #+24]
        BL       __aeabi_f2d
        STR      R0,[SP, #+56]
        STR      R1,[SP, #+60]
        LDR      R0,??DataTable17_2
        LDR      R0,[R0, #+28]
        STR      R0,[SP, #+48]
        LDR      R0,??DataTable17_1
        LDR      R0,[R0, #+20]
        STR      R0,[SP, #+44]
        LDR      R0,??DataTable17_2
        LDR      R0,[R0, #+24]
        STR      R0,[SP, #+40]
        LDR      R0,??DataTable17_1
        LDR      R0,[R0, #+16]
        STR      R0,[SP, #+36]
        LDR      R0,??DataTable17_2
        LDR      R0,[R0, #+20]
        STR      R0,[SP, #+32]
        LDR      R0,??DataTable17_1
        LDRH     R0,[R0, #+12]
        STR      R0,[SP, #+28]
        LDR      R0,??DataTable17_2
        LDR      R0,[R0, #+16]
        STR      R0,[SP, #+24]
        LDR      R0,??DataTable17_1
        LDRB     R0,[R0, #+10]
        STR      R0,[SP, #+20]
        LDR      R0,??DataTable17_2
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+16]
        LDR      R0,??DataTable17_1
        LDRH     R0,[R0, #+8]
        STR      R0,[SP, #+12]
        LDR      R0,??DataTable17_2
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+8]
        LDR      R0,??DataTable17_1
        LDRH     R0,[R0, #+6]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable17_2
        LDR      R0,[R0, #+4]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable17_1
        LDRB     R3,[R0, #+4]
        LDR      R0,??DataTable17_2
        LDR      R2,[R0, #+0]
        LDR      R1,??DataTable18
        LDR      R0,??DataTable17
        BL       sprintf
        LDR      R0,??DataTable17
        BL       strlen
        MOVS     R4,R0
        MOVS     R1,R4
        UXTH     R1,R1
        LDR      R0,??DataTable17
        BL       GetCRC16
        MOVS     R1,R0
        UXTH     R1,R1
        LSRS     R1,R1,#+8
        UXTH     R4,R4
        LDR      R2,??DataTable17
        STRB     R1,[R2, R4]
        UXTH     R4,R4
        LDR      R1,??DataTable17
        ADDS     R1,R1,R4
        STRB     R0,[R1, #+1]
        MOVS     R0,#+0
        UXTH     R4,R4
        LDR      R1,??DataTable17
        ADDS     R1,R1,R4
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable18_1  ;; 0x800fc00
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??save_8209c_params_0
        ADDS     R4,R4,#+3
        MOVS     R2,R4
        UXTH     R2,R2
        LDR      R1,??DataTable17
        LDR      R0,??DataTable18_1  ;; 0x800fc00
        BL       FLASH_Write_chars
        CMP      R0,#+0
        BEQ      ??save_8209c_params_1
        LDR      R0,??DataTable20
        BL       printf
        B        ??save_8209c_params_1
??save_8209c_params_0:
        LDR      R0,??DataTable20
        BL       printf
??save_8209c_params_1:
        ADD      SP,SP,#+64
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_8209c_params:
        PUSH     {R7,LR}
        LDR      R0,??DataTable17_1
        LDRH     R1,[R0, #+0]
        MOVS     R0,#+2
        BL       config_8209c_reg
        LDR      R0,??DataTable17_1
        LDRH     R1,[R0, #+6]
        MOVS     R0,#+3
        BL       config_8209c_reg
        LDR      R0,??DataTable17_1
        LDRH     R1,[R0, #+8]
        MOVS     R0,#+5
        BL       config_8209c_reg
        LDR      R0,??DataTable17_1
        LDRB     R1,[R0, #+10]
        MOVS     R0,#+7
        BL       config_8209c_reg
        LDR      R0,??DataTable17_1
        LDRH     R1,[R0, #+28]
        MOVS     R0,#+32
        BL       config_8209c_reg
        MOV      R1,SP
        MOVS     R0,#+45
        BL       read_8209c_regs
        BL       rn8209c_checkSum
        LDR      R1,??DataTable17_1
        STR      R0,[R1, #+40]
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+15
        BMI      ??set_8209c_params_0
        LDR      R0,??DataTable17_1
        LDR      R0,[R0, #+40]
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
        MOVS     R6,R0
        UXTH     R6,R6
        MOVS     R4,R6
        B        ??find_old_data_0
??find_old_data_1:
        SUBS     R4,R4,#+18
??find_old_data_0:
        CMP      R4,#+0
        BMI      ??find_old_data_2
        MOVS     R2,#+18
        LDR      R1,??DataTable17
        UXTH     R6,R6
        LDR      R0,??DataTable20_1  ;; 0x800f7ee
        ADDS     R0,R6,R0
        BL       read_flash
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+15]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+16]
        ADDS     R5,R0,R1
        MOVS     R1,#+15
        LDR      R0,??DataTable17
        BL       GetCRC16
        UXTH     R5,R5
        CMP      R0,R5
        BNE      ??find_old_data_1
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+10]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable17_1
        STRH     R0,[R1, #+28]
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+5]
        MOVS     R1,#+0
        MULS     R1,R0,R1
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+6]
        MOVS     R2,#+0
        MULS     R2,R0,R2
        ADDS     R0,R1,R2
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+7]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R2,R1,R2
        ADDS     R0,R0,R2
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+8]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable17_1
        STRH     R0,[R1, #+48]
        LDR      R0,??DataTable17
        LDRB     R0,[R0, #+11]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        MULS     R0,R1,R0
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+12]
        MOVS     R2,#+128
        LSLS     R2,R2,#+9        ;; #+65536
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+13]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable17
        LDRB     R1,[R1, #+14]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable17_1
        STR      R0,[R1, #+52]
        MOVS     R0,#+1
        B        ??find_old_data_3
??find_old_data_2:
        MOVS     R0,#+0
??find_old_data_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     g_cal_Buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_1:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_2:
        DC32     paralist

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
init_8209c_params:
        PUSH     {R3-R5,LR}
        LDR      R0,??DataTable18_1  ;; 0x800fc00
        BL       read_params_area
        CMP      R0,#+1
        BEQ      .+4
        B        ??init_8209c_params_0
        LDR      R1,??DataTable21
        MOVS     R0,#+0
        BL       find_params
        CMP      R0,#+0
        BNE      .+4
        B        ??init_8209c_params_1
        LDR      R0,??DataTable22
        LDRB     R0,[R0, #+4]
        CMP      R0,#+1
        BEQ      .+4
        B        ??init_8209c_params_2
        LDR      R1,??DataTable21_1
        MOVS     R0,#+1
        BL       find_params
        LDR      R1,??DataTable21_2
        MOVS     R0,#+2
        BL       find_params
        LDR      R1,??DataTable21_3
        MOVS     R0,#+3
        BL       find_params
        LDR      R1,??DataTable22_1
        MOVS     R0,#+5
        BL       find_params
        LDR      R1,??DataTable22_2
        MOVS     R0,#+6
        BL       find_params
        LDR      R1,??DataTable22_3
        MOVS     R0,#+7
        BL       find_params
        LDR      R0,??DataTable22_4  ;; 0x800f800
        BL       find_free_addr
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,#+252
        LSLS     R0,R0,#+2        ;; #+1008
        CMP      R4,R0
        BGE      ??init_8209c_params_3
        UXTH     R4,R4
        CMP      R4,#+0
        BEQ      ??init_8209c_params_3
        MOVS     R2,#+18
        LDR      R1,??DataTable22_5
        UXTH     R4,R4
        LDR      R0,??DataTable20_1  ;; 0x800f7ee
        ADDS     R0,R4,R0
        BL       read_flash
        LDR      R0,??DataTable22_5
        LDRB     R0,[R0, #+15]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDR      R1,??DataTable22_5
        LDRB     R1,[R1, #+16]
        ADDS     R5,R0,R1
        MOVS     R1,#+15
        LDR      R0,??DataTable22_5
        BL       GetCRC16
        UXTH     R5,R5
        CMP      R0,R5
        BNE      ??init_8209c_params_4
        MOVS     R0,#+1
        LDR      R1,??DataTable23
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable22_5
        LDRB     R0,[R0, #+9]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDR      R1,??DataTable22_5
        LDRB     R1,[R1, #+10]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable22
        STRH     R0,[R1, #+28]
        LDR      R0,??DataTable22_5
        LDRB     R0,[R0, #+5]
        MOVS     R1,#+0
        MULS     R1,R0,R1
        LDR      R0,??DataTable22_5
        LDRB     R0,[R0, #+6]
        MOVS     R2,#+0
        MULS     R2,R0,R2
        ADDS     R0,R1,R2
        LDR      R1,??DataTable22_5
        LDRB     R1,[R1, #+7]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R2,R1,R2
        ADDS     R0,R0,R2
        LDR      R1,??DataTable22_5
        LDRB     R1,[R1, #+8]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable22
        STRH     R0,[R1, #+48]
        LDR      R0,??DataTable22_5
        LDRB     R0,[R0, #+11]
        MOVS     R1,#+128
        LSLS     R1,R1,#+17       ;; #+16777216
        MULS     R0,R1,R0
        LDR      R1,??DataTable22_5
        LDRB     R1,[R1, #+12]
        MOVS     R2,#+128
        LSLS     R2,R2,#+9        ;; #+65536
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable22_5
        LDRB     R1,[R1, #+13]
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MULS     R1,R2,R1
        ADDS     R0,R0,R1
        LDR      R1,??DataTable22_5
        LDRB     R1,[R1, #+14]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable22
        STR      R0,[R1, #+52]
        B        ??init_8209c_params_2
??init_8209c_params_4:
        MOVS     R0,R4
        UXTH     R0,R0
        BL       find_old_data
        CMP      R0,#+1
        BNE      ??init_8209c_params_5
        MOVS     R0,#+1
        LDR      R1,??DataTable23
        STRB     R0,[R1, #+0]
        UXTB     R0,R0
        B        ??init_8209c_params_2
??init_8209c_params_5:
        MOVS     R0,#+0
        LDR      R1,??DataTable23
        STRB     R0,[R1, #+0]
        UXTB     R0,R0
        B        ??init_8209c_params_2
??init_8209c_params_3:
        MOVS     R0,#+0
        LDR      R1,??DataTable23
        STRB     R0,[R1, #+0]
        B        ??init_8209c_params_2
??init_8209c_params_1:
        MOVS     R0,#+0
        LDR      R1,??DataTable22
        STRB     R0,[R1, #+4]
        B        ??init_8209c_params_2
??init_8209c_params_0:
        MOVS     R0,#+0
        LDR      R1,??DataTable22
        STRB     R0,[R1, #+4]
??init_8209c_params_2:
        BL       set_8209c_params
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     `?<Constant "%s%d;%s%d;%s%d;%s%d;%...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18_1:
        DC32     0x800fc00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
format_elc_data:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOV      R1,SP
        MOVS     R0,#+0
        BL       RTC_GetDate
        ADD      R1,SP,#+4
        MOVS     R0,#+0
        BL       RTC_GetTime
        MOV      R0,SP
        LDRB     R0,[R0, #+3]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+1]
        MOV      R0,SP
        LDRB     R0,[R0, #+2]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+3]
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+1]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+5]
        MOVS     R0,#+0
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable22
        LDRH     R0,[R0, #+48]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable22
        LDRH     R0,[R0, #+48]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+8]
        LDR      R0,??DataTable22
        LDRH     R0,[R0, #+28]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+9]
        LDR      R0,??DataTable22
        LDRH     R0,[R0, #+28]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+10]
        LDR      R0,??DataTable22
        LDR      R0,[R0, #+52]
        LSRS     R0,R0,#+24
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+11]
        LDR      R0,??DataTable22
        LDR      R0,[R0, #+52]
        LSRS     R0,R0,#+16
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+12]
        LDR      R0,??DataTable22
        LDR      R0,[R0, #+52]
        LSRS     R0,R0,#+8
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+13]
        LDR      R0,??DataTable22
        LDR      R0,[R0, #+52]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+14]
        MOVS     R1,#+15
        LDR      R0,??DataTable22_5
        BL       GetCRC16
        MOVS     R1,R0
        UXTH     R1,R1
        LSRS     R1,R1,#+8
        LDR      R2,??DataTable22_5
        STRB     R1,[R2, #+15]
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+16]
        MOVS     R0,#+0
        LDR      R1,??DataTable22_5
        STRB     R0,[R1, #+17]
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
save_elc_datas:
        PUSH     {R7,LR}
        BL       format_elc_data
        LDR      R0,??DataTable22_4  ;; 0x800f800
        BL       find_free_addr
        UXTH     R0,R0
        LDR      R1,??DataTable26  ;; 0x3de
        CMP      R0,R1
        BLT      ??save_elc_datas_0
        LDR      R0,??DataTable22_4  ;; 0x800f800
        BL       FLASH_ErasePage
        MOVS     R0,#+0
??save_elc_datas_0:
        MOVS     R2,#+18
        LDR      R1,??DataTable22_5
        UXTH     R0,R0
        LDR      R3,??DataTable22_4  ;; 0x800f800
        ADDS     R0,R0,R3
        BL       FLASH_Write_chars
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     `?<Constant "save calibration data...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20_1:
        DC32     0x800f7ee

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
power_down_protect:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        LDR      R0,??DataTable22_4  ;; 0x800f800
        BL       find_free_addr
        MOVS     R4,R0
        MOV      R1,SP
        MOVS     R0,#+32
        BL       read_8209c_regs
        LDR      R1,??DataTable22
        STRH     R0,[R1, #+28]
        BL       read_8209c_energyP
        BL       format_elc_data
        UXTH     R4,R4
        LDR      R0,??DataTable22_4  ;; 0x800f800
        ADDS     R0,R4,R0
        STR      R0,[SP, #+0]
        MOVS     R2,#+18
        LDR      R1,??DataTable22_5
        LDR      R0,[SP, #+0]
        BL       FLASH_Write_chars
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     rn8209c_papameter+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_1:
        DC32     rn8209c_papameter+0x6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_2:
        DC32     rn8209c_papameter+0x8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21_3:
        DC32     rn8209c_papameter+0xA

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
        LDR      R0,??DataTable26_1
        LDR      R0,[R0, #+16]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable26_2  ;; 0x40a13000
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
        LDR      R1,??DataTable26_1
        STRH     R0,[R1, #+30]
        MOV      R1,SP
        MOVS     R0,#+34
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LSLS     R0,R0,#+8
        BPL      ??read_UIP_2
        MOVS     R0,#+0
        B        ??read_UIP_3
??read_UIP_2:
        LDR      R0,??DataTable26_1
        LDR      R0,[R0, #+20]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR      R1,??DataTable26_3  ;; 0x3fe00000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable26_4  ;; 0x408f4000
        BL       __aeabi_dmul
        BL       __aeabi_d2uiz
??read_UIP_3:
        LDR      R1,??DataTable26_1
        STR      R0,[R1, #+32]
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
        LDR      R1,??DataTable26_1
        LDR      R1,[R1, #+24]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??DataTable26_5  ;; 0x412e8480
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR      R1,??DataTable26_1
        STRH     R0,[R1, #+36]
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_1:
        DC32     rn8209c_papameter+0x10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_2:
        DC32     rn8209c_papameter+0x14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_3:
        DC32     rn8209c_papameter+0x18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_4:
        DC32     0x800f800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_5:
        DC32     g_cal_Buf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_8209c_energyP:
        PUSH     {R3-R5,LR}
        MOV      R1,SP
        MOVS     R0,#+32
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable26_1
        STRH     R0,[R1, #+28]
        MOV      R1,SP
        MOVS     R0,#+42
        BL       read_8209c_regs
        LDR      R0,??DataTable26_1
        LDRH     R0,[R0, #+48]
        LDR      R1,[SP, #+0]
        ADDS     R0,R0,R1
        LDR      R1,??DataTable26_1
        STRH     R0,[R1, #+48]
        LDR      R0,??DataTable26_1
        LDRH     R0,[R0, #+48]
        BL       __aeabi_ui2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??DataTable26_4  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable26_1
        LDRH     R0,[R0, #+2]
        BL       __aeabi_ui2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2uiz
        LDR      R1,??DataTable26_1
        STR      R0,[R1, #+44]
        LDR      R0,??DataTable26_1
        LDR      R0,[R0, #+44]
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     flash_ok

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_pow_factor:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
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
        LDR      R1,??DataTable26_1
        LDR      R1,[R1, #+24]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??DataTable26_5  ;; 0x412e8480
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
        LDR      R1,??DataTable26_1
        LDR      R1,[R1, #+24]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR      R3,??DataTable26_5  ;; 0x412e8480
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
        LDR      R3,??DataTable26_6  ;; 0x40590000
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        UXTB     R0,R0
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_light_time:
        PUSH     {R4,LR}
        BL       read_light_time
        LDR      R1,??DataTable26_7  ;; 0xea60
        BL       __aeabi_uidiv
        CMP      R0,#+0
        BEQ      ??get_light_time_0
        BL       read_light_time
        LDR      R1,??DataTable26_1
        LDR      R4,[R1, #+52]
        LDR      R1,??DataTable26_7  ;; 0xea60
        BL       __aeabi_uidiv
        ADDS     R0,R4,R0
        LDR      R1,??DataTable26_1
        STR      R0,[R1, #+52]
        BL       clear_light_time
??get_light_time_0:
        LDR      R0,??DataTable26_1
        LDR      R0,[R0, #+52]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_LED_state:
        PUSH     {LR}
        LDR      R0,??DataTable26_8
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
??DataTable26:
        DC32     0x3de

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_1:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_2:
        DC32     0x40a13000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_3:
        DC32     0x3fe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_4:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_5:
        DC32     0x412e8480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_6:
        DC32     0x40590000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_7:
        DC32     0xea60

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_8:
        DC32     rn8209c_papameter+0x32

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
`?<Constant " ">`:
        DATA
        DC8 " "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "safe_start">`:
        DATA
        DC8 "safe_start"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "end">`:
        DATA
        DC8 "end"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "period save process s...">`:
        DATA
        DC8 "period save process start\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "power on pulse = %d\\r\\n">`:
        DATA
        DC8 "power on pulse = %d\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "save elc data finish\\r\\n">`:
        DATA
        DC8 "save elc data finish\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "not full the save con...">`:
        DATA
        DC8 "not full the save condition\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "protected time end\\r\\n">`:
        DATA
        DC8 "protected time end\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "flash data ok\\r\\n">`:
        DATA
        DC8 "flash data ok\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "flash  full  erase an...">`:
        DATA
        DC8 "flash  full  erase and write\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "flash  not full, write\\r\\n">`:
        DATA
        DC8 "flash  not full, write\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "flash data err, erase...">`:
        DATA
        DC8 "flash data err, erase and write new data\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "drop down, save ok\\r\\n">`:
        DATA
        DC8 "drop down, save ok\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%s%d;%s%d;%s%d;%s%d;%...">`:
        DATA
        DC8 "%s%d;%s%d;%s%d;%s%d;%s%d;%s%d;%s%d;%s%.3f;end"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "save calibration data...">`:
        DATA
        DC8 "save calibration data error\015\012"
        DC8 0, 0

        END
// 
// 1 062 bytes in section .bss
//    89 bytes in section .data
//   406 bytes in section .rodata
// 4 342 bytes in section .text
// 
// 4 334 bytes of CODE  memory (+ 8 bytes shared)
//   406 bytes of CONST memory
// 1 151 bytes of DATA  memory
//
//Errors: none
//Warnings: none
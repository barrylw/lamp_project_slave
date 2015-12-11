///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       11/Dec/2015  17:46:11
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\apl_debug.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\apl_debug.c -D USE_STDPERIPH_DRIVER
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\apl_debug.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FLASH_ErasePage
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN GetTime
        EXTERN OS_MemClr
        EXTERN ReadVersion
        EXTERN SX1276Fsk_Send_Packet
        EXTERN SX1276Fsk_recrive_Packet
        EXTERN SX1276LoRaSetRFPower
        EXTERN SX1276Read
        EXTERN SX1276Write
        EXTERN SendUart
        EXTERN SetTime
        EXTERN SoftReset
        EXTERN __aeabi_cfcmpeq
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_ui2d
        EXTERN asin
        EXTERN atof
        EXTERN atoi
        EXTERN config_8209c_reg
        EXTERN g_DebugRxBuffer
        EXTERN g_DebugRxFlag
        EXTERN g_SystickCounter
        EXTERN g_hopChannel
        EXTERN get_light_time
        EXTERN hal_InitRF
        EXTERN local_addr
        EXTERN printf
        EXTERN printf_params
        EXTERN process_start
        EXTERN read_8209c_energyP
        EXTERN read_8209c_regs
        EXTERN read_PWM_volt
        EXTERN read_UIP
        EXTERN read_pow_factor
        EXTERN rn8209c_init
        EXTERN rn8209c_papameter
        EXTERN rn8209c_reset
        EXTERN rn8209c_write
        EXTERN rn8209c_write_byte
        EXTERN save_8209c_params
        EXTERN save_elc_datas
        EXTERN set_PWM
        EXTERN start_continuous_mode
        EXTERN start_time_detect_process
        EXTERN strlen
        EXTERN strtol
        EXTERN tedtbuf
        EXTERN write_finish_debug

        PUBLIC GetStringParameter
        PUBLIC Getu16Parameter
        PUBLIC Getu8Parameter
        PUBLIC Relay_close
        PUBLIC Relay_open
        PUBLIC apl_ProcessCmdLine
        PUBLIC apl_ProcessDebugCmd
        PUBLIC cal_power_angle
        PUBLIC cal_power_gain
        PUBLIC changeHopChannel
        PUBLIC change_string_to_arry16
        PUBLIC contious_mode_rx
        PUBLIC debug_save
        PUBLIC debug_set_pwm
        PUBLIC find_string16_len
        PUBLIC get_reg
        PUBLIC radio_reset
        PUBLIC read_8209c_reg
        PUBLIC read_adc
        PUBLIC read_energy
        PUBLIC read_factor
        PUBLIC read_gdflash
        PUBLIC read_param_all
        PUBLIC read_reg_all
        PUBLIC read_u_i_p
        PUBLIC receive_packet
        PUBLIC reset_8029c
        PUBLIC reset_8209c
        PUBLIC send_packet
        PUBLIC set_8209c_Kx
        PUBLIC set_8209c_Reg
        PUBLIC set_8209c_hfconst
        PUBLIC set_local_addr
        PUBLIC set_power
        PUBLIC set_reg
        PUBLIC write_finish


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp u32 hal_GetSystickCounter(void)
hal_GetSystickCounter:
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "version">`:
        DATA
        DC8 "version"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reset">`:
        DATA
        DC8 "reset"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "settime">`:
        DATA
        DC8 "settime"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "gettime">`:
        DATA
        DC8 "gettime"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "senduart">`:
        DATA
        DC8 "senduart"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "setpow">`:
        DATA
        DC8 "setpow"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "readreg">`:
        DATA
        DC8 "readreg"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "writereg">`:
        DATA
        DC8 "writereg"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "readft">`:
        DATA
        DC8 "readft"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "tx">`:
        DATA
        DC8 "tx"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "rx">`:
        DATA
        DC8 "rx"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "contious">`:
        DATA
        DC8 "contious"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "radioreset">`:
        DATA
        DC8 "radioreset"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "hopchannel">`:
        DATA
        DC8 "hopchannel"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "read8209c">`:
        DATA
        DC8 "read8209c"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "sethfconst">`:
        DATA
        DC8 "sethfconst"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "set8209c">`:
        DATA
        DC8 "set8209c"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "setgain">`:
        DATA
        DC8 "setgain"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "setangle">`:
        DATA
        DC8 "setangle"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "setkx">`:
        DATA
        DC8 "setkx"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "readuip">`:
        DATA
        DC8 "readuip"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "readw">`:
        DATA
        DC8 "readw"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reada">`:
        DATA
        DC8 "reada"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "8209creset">`:
        DATA
        DC8 "8209creset"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "openlight">`:
        DATA
        DC8 "openlight"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "closelight">`:
        DATA
        DC8 "closelight"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "pwm">`:
        DATA
        DC8 "pwm"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "factor">`:
        DATA
        DC8 "factor"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "dbsave">`:
        DATA
        DC8 "dbsave"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "adc">`:
        DATA
        DC8 "adc"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update">`:
        DATA
        DC8 "update"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "setaddr">`:
        DATA
        DC8 "setaddr"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "flashfinish">`:
        DATA
        DC8 "flashfinish"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "C>"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\r\\ncommand length erro...">`:
        DATA
        DC8 "\015\012command length error!\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "it has taken %d ms\\r\\n">`:
        DATA
        DC8 "it has taken %d ms\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "\\r\\ncommand not recogni...">`:
        DATA
        DC8 "\015\012command not recognized\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reg %x = %x\\r\\n">`:
        DATA
        DC8 "reg %x = %x\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "%x  ">`:
        DATA
        DC8 "%x  "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "reg %x = 0x%x\\r\\n">`:
        DATA
        DC8 "reg %x = 0x%x\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "hfconst %d\\r\\n,pstart %...">`:
        DATA
        DC8 68H, 66H, 63H, 6FH, 6EH, 73H, 74H, 20H
        DC8 25H, 64H, 0DH, 0AH, 2CH, 70H, 73H, 74H
        DC8 61H, 72H, 74H, 20H, 25H, 64H, 0DH, 0AH
        DC8 2CH, 47H, 50H, 51H, 41H, 20H, 25H, 64H
        DC8 0DH, 0AH, 2CH, 70H, 68H, 73H, 41H, 73H
        DC8 20H, 25H, 64H, 0DH, 0AH, 2CH, 71H, 70H
        DC8 68H, 73H, 61H, 6CH, 20H, 25H, 64H, 0DH
        DC8 0AH, 2CH, 4BH, 75H, 20H, 25H, 64H, 0DH
        DC8 0AH, 2CH, 4BH, 69H, 20H, 25H, 64H, 0DH
        DC8 0AH, 2CH, 4BH, 70H, 20H, 25H, 66H, 0DH
        DC8 0AH, 2CH, 50H, 46H, 43H, 6FH, 6EH, 74H
        DC8 20H, 25H, 64H, 0DH, 0AH, 2CH, 65H, 6EH
        DC8 65H, 72H, 67H, 79H, 50H, 75H, 6CH, 73H
        DC8 65H, 20H, 25H, 64H, 0DH, 0AH, 2CH, 65H
        DC8 6EH, 65H, 67H, 79H, 44H, 65H, 67H, 72H
        DC8 65H, 65H, 20H, 25H, 64H, 0DH, 0AH, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "pwm =%d% \\r\\n">`:
        DATA
        DC8 "pwm =%d% \015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "light_time = %d\\r\\n,pul...">`:
        DATA
        DC8 "light_time = %d\015\012,pulse = %d\015\012,enagy = %d\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "factor = %d%">`:
        DATA
        DC8 "factor = %d%"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "ok"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "U = %d I = %d P = %d">`:
        DATA
        DC8 "U = %d I = %d P = %d"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "adc = %d">`:
        DATA
        DC8 "adc = %d"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "input  err\\r\\n">`:
        DATA
        DC8 "input  err\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "input have not start ...">`:
        DATA
        DC8 "input have not start 0x\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "OK\\r\\n">`:
        DATA
        DC8 "OK\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
CmdList:
        DATA
        DC32 `?<Constant "version">`, ReadVersion, `?<Constant "reset">`
        DC32 SoftReset, `?<Constant "settime">`, SetTime
        DC32 `?<Constant "gettime">`, GetTime, `?<Constant "senduart">`
        DC32 SendUart, `?<Constant "setpow">`, set_power
        DC32 `?<Constant "readreg">`, get_reg, `?<Constant "writereg">`
        DC32 set_reg, `?<Constant "readft">`, read_reg_all, `?<Constant "tx">`
        DC32 send_packet, `?<Constant "rx">`, receive_packet
        DC32 `?<Constant "contious">`, contious_mode_rx
        DC32 `?<Constant "radioreset">`, radio_reset
        DC32 `?<Constant "hopchannel">`, changeHopChannel
        DC32 `?<Constant "read8209c">`, read_8209c_reg
        DC32 `?<Constant "sethfconst">`, set_8209c_hfconst
        DC32 `?<Constant "set8209c">`, set_8209c_Reg, `?<Constant "setgain">`
        DC32 cal_power_gain, `?<Constant "setangle">`, cal_power_angle
        DC32 `?<Constant "setkx">`, set_8209c_Kx, `?<Constant "readuip">`
        DC32 read_u_i_p, `?<Constant "readw">`, read_energy
        DC32 `?<Constant "reada">`, read_param_all, `?<Constant "8209creset">`
        DC32 reset_8029c, `?<Constant "openlight">`, Relay_close
        DC32 `?<Constant "closelight">`, Relay_open, `?<Constant "pwm">`
        DC32 debug_set_pwm, `?<Constant "factor">`, read_factor
        DC32 `?<Constant "dbsave">`, debug_save, `?<Constant "adc">`, read_adc
        DC32 `?<Constant "update">`, read_gdflash, `?<Constant "setaddr">`
        DC32 set_local_addr, `?<Constant "flashfinish">`, write_finish

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
apl_ProcessDebugCmd:
        PUSH     {R7,LR}
        LDR      R0,??DataTable4_1
        LDRH     R0,[R0, #+2]
        CMP      R0,#+0
        BEQ      ??apl_ProcessDebugCmd_0
        BL       apl_ProcessCmdLine
        ADR      R0,??DataTable4_2  ;; 0x43, 0x3E, 0x00, 0x00
        BL       printf
        B        ??apl_ProcessDebugCmd_1
??apl_ProcessDebugCmd_0:
        LDR      R0,??DataTable4_3
        BL       printf
??apl_ProcessDebugCmd_1:
        MOVS     R1,#+30
        LDR      R0,??DataTable5
        BL       OS_MemClr
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1
        STRH     R0,[R1, #+2]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
apl_ProcessCmdLine:
        PUSH     {R3-R7,LR}
        MOVS     R5,#+0
        MOVS     R0,#+0
        MOVS     R3,#+0
        MOVS     R1,#+33
        MOVS     R4,#+1
        MOVS     R6,#+0
        B        ??apl_ProcessCmdLine_0
??apl_ProcessCmdLine_1:
        ADDS     R6,R6,#+1
??apl_ProcessCmdLine_0:
        UXTB     R6,R6
        UXTB     R1,R1
        CMP      R6,R1
        BCS      ??apl_ProcessCmdLine_2
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R0,R6,R0
        LDR      R2,??DataTable5_1
        LDR      R2,[R2, R0]
        MOVS     R0,#+0
        UXTB     R6,R6
        MOVS     R3,#+8
        MULS     R3,R6,R3
        LDR      R4,??DataTable5_1
        LDR      R3,[R4, R3]
        LDRB     R3,[R3, #+0]
        B        ??apl_ProcessCmdLine_3
??apl_ProcessCmdLine_4:
        ADDS     R0,R0,#+1
        UXTB     R0,R0
        UXTB     R6,R6
        MOVS     R3,#+8
        MULS     R3,R6,R3
        LDR      R4,??DataTable5_1
        LDR      R3,[R4, R3]
        LDRB     R3,[R3, R0]
??apl_ProcessCmdLine_3:
        UXTB     R3,R3
        CMP      R3,#+0
        BNE      ??apl_ProcessCmdLine_4
        MOVS     R4,#+1
        MOVS     R3,#+0
        B        ??apl_ProcessCmdLine_5
??apl_ProcessCmdLine_6:
        ADDS     R3,R3,#+1
??apl_ProcessCmdLine_5:
        UXTB     R3,R3
        UXTB     R0,R0
        CMP      R3,R0
        BCS      ??apl_ProcessCmdLine_7
        UXTB     R3,R3
        LDRB     R5,[R2, R3]
        UXTB     R3,R3
        LDR      R7,??DataTable5
        LDRB     R7,[R7, R3]
        CMP      R5,R7
        BEQ      ??apl_ProcessCmdLine_6
        MOVS     R4,#+0
??apl_ProcessCmdLine_7:
        UXTB     R0,R0
        CMP      R0,#+0
        BNE      ??apl_ProcessCmdLine_8
        MOVS     R4,#+0
??apl_ProcessCmdLine_8:
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??apl_ProcessCmdLine_1
        BL       hal_GetSystickCounter
        MOVS     R5,R0
        ADR      R0,??DataTable6  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R6,R0,R6
        LDR      R0,??DataTable5_1
        ADDS     R0,R0,R6
        LDR      R0,[R0, #+4]
        BLX      R0
        BL       hal_GetSystickCounter
        SUBS     R1,R0,R5
        LDR      R0,??DataTable6_1
        BL       printf
??apl_ProcessCmdLine_2:
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??apl_ProcessCmdLine_9
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+13
        BEQ      ??apl_ProcessCmdLine_10
        LDR      R0,??DataTable5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BEQ      ??apl_ProcessCmdLine_10
        LDR      R0,??DataTable7
        BL       printf
        B        ??apl_ProcessCmdLine_9
??apl_ProcessCmdLine_10:
        ADR      R0,??DataTable6  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
??apl_ProcessCmdLine_9:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Getu8Parameter:
        PUSH     {R3-R7,LR}
        MOVS     R7,R0
        MOVS     R4,#+0
        MOVS     R0,#+0
        MOVS     R2,#+0
        MOVS     R4,R2
        B        ??Getu8Parameter_0
??Getu8Parameter_1:
        ADDS     R4,R4,#+1
??Getu8Parameter_0:
        UXTH     R4,R4
        CMP      R4,#+30
        BCS      ??Getu8Parameter_2
        UXTH     R4,R4
        LDR      R2,??DataTable5
        LDRB     R2,[R2, R4]
        CMP      R2,#+32
        BNE      ??Getu8Parameter_1
        ADDS     R0,R0,#+1
        UXTB     R0,R0
        UXTB     R1,R1
        CMP      R0,R1
        BNE      ??Getu8Parameter_1
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+32
        BEQ      ??Getu8Parameter_3
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+13
        BEQ      ??Getu8Parameter_3
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+10
        BNE      ??Getu8Parameter_4
??Getu8Parameter_3:
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        STRB     R0,[R7, #+0]
        B        ??Getu8Parameter_5
??Getu8Parameter_4:
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+32
        BEQ      ??Getu8Parameter_6
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+13
        BEQ      ??Getu8Parameter_6
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+10
        BNE      ??Getu8Parameter_7
??Getu8Parameter_6:
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        MOVS     R5,R0
        MOVS     R0,#+10
        MULS     R5,R0,R5
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        BL       HexCharToInt8u
        ADDS     R0,R0,R5
        STRB     R0,[R7, #+0]
        B        ??Getu8Parameter_5
??Getu8Parameter_7:
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        MOVS     R5,R0
        MOVS     R0,#+100
        MULS     R5,R0,R5
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        BL       HexCharToInt8u
        MOVS     R6,R0
        MOVS     R0,#+10
        MULS     R6,R0,R6
        UXTH     R4,R4
        LDR      R0,??DataTable5
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        BL       HexCharToInt8u
        ADDS     R1,R5,R6
        ADDS     R0,R0,R1
        STRB     R0,[R7, #+0]
??Getu8Parameter_5:
        B        ??Getu8Parameter_8
??Getu8Parameter_2:
        MOVS     R0,#+0
        STRB     R0,[R7, #+0]
??Getu8Parameter_8:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Getu16Parameter:
        PUSH     {R0,R1,R4-R7,LR}
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R4,#+0
        MOVS     R0,#+0
        MOVS     R1,#+1
        MOVS     R7,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R5,R3
        B        ??Getu16Parameter_0
??Getu16Parameter_1:
        ADDS     R5,R5,#+1
??Getu16Parameter_0:
        UXTH     R5,R5
        CMP      R5,#+30
        BCS      ??Getu16Parameter_2
        UXTH     R5,R5
        LDR      R3,??DataTable5
        LDRB     R3,[R3, R5]
        CMP      R3,#+32
        BNE      ??Getu16Parameter_1
        ADDS     R6,R6,#+1
        MOV      R3,SP
        LDRB     R3,[R3, #+4]
        UXTB     R6,R6
        CMP      R6,R3
        BNE      ??Getu16Parameter_1
        UXTH     R5,R5
        LDR      R3,??DataTable5
        ADDS     R3,R3,R5
        ADDS     R3,R3,#+1
        UXTH     R5,R5
        LDR      R4,??DataTable5
        ADDS     R5,R4,R5
        ADDS     R5,R5,#+1
??Getu16Parameter_3:
        LDRB     R4,[R3, #+0]
        CMP      R4,#+32
        BEQ      ??Getu16Parameter_4
        ADDS     R3,R3,#+1
        LDRB     R4,[R3, #+0]
        CMP      R4,#+13
        BEQ      ??Getu16Parameter_5
        LDRB     R4,[R3, #+0]
        CMP      R4,#+10
        BNE      ??Getu16Parameter_6
??Getu16Parameter_5:
        B        ??Getu16Parameter_4
??Getu16Parameter_6:
        SUBS     R4,R3,R5
        CMP      R4,#+6
        BLT      ??Getu16Parameter_3
??Getu16Parameter_4:
        MOVS     R4,R3
        MOVS     R6,R5
        SUBS     R4,R4,R6
        LDRB     R5,[R5, #+0]
        CMP      R5,#+45
        BNE      ??Getu16Parameter_7
        MOVS     R2,#+1
??Getu16Parameter_7:
        MOVS     R6,R4
        B        ??Getu16Parameter_8
??Getu16Parameter_9:
        SUBS     R3,R3,#+1
        LDRB     R7,[R3, #+0]
        SUBS     R7,R7,#+48
        UXTH     R0,R0
        UXTH     R1,R1
        UXTB     R7,R7
        MULS     R7,R1,R7
        ADDS     R0,R0,R7
        MOVS     R4,#+10
        MULS     R1,R4,R1
        SUBS     R6,R6,#+1
??Getu16Parameter_8:
        UXTB     R2,R2
        UXTB     R6,R6
        CMP      R2,R6
        BCC      ??Getu16Parameter_9
        UXTB     R2,R2
        CMP      R2,#+1
        BNE      ??Getu16Parameter_10
        MOVS     R1,#+0
        SUBS     R0,R1,R0
??Getu16Parameter_10:
        MOVS     R4,#+0
??Getu16Parameter_2:
        LDR      R1,[SP, #+0]
        STRH     R0,[R1, #+0]
        POP      {R0,R1,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     g_SystickCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     g_DebugRxFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC8      0x43, 0x3E, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     `?<Constant "\\r\\ncommand length erro...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GetStringParameter:
        PUSH     {R4,R5,LR}
        MOVS     R2,R0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R0,#+0
        MOVS     R5,#+0
        MOVS     R3,R5
        B        ??GetStringParameter_0
??GetStringParameter_1:
        ADDS     R3,R3,#+1
??GetStringParameter_0:
        UXTH     R3,R3
        CMP      R3,#+30
        BCS      ??GetStringParameter_2
        UXTH     R3,R3
        LDR      R5,??DataTable5
        LDRB     R5,[R5, R3]
        CMP      R5,#+32
        BNE      ??GetStringParameter_1
        ADDS     R4,R4,#+1
        UXTB     R4,R4
        UXTB     R1,R1
        CMP      R4,R1
        BNE      ??GetStringParameter_1
??GetStringParameter_3:
        UXTH     R3,R3
        LDR      R1,??DataTable5
        ADDS     R1,R1,R3
        LDRB     R1,[R1, #+1]
        CMP      R1,#+32
        BEQ      ??GetStringParameter_4
        MOVS     R1,#+1
        B        ??GetStringParameter_5
??GetStringParameter_4:
        MOVS     R1,#+0
??GetStringParameter_5:
        UXTH     R3,R3
        LDR      R4,??DataTable5
        ADDS     R4,R4,R3
        LDRB     R4,[R4, #+1]
        CMP      R4,#+13
        BEQ      ??GetStringParameter_6
        MOVS     R4,#+1
        B        ??GetStringParameter_7
??GetStringParameter_6:
        MOVS     R4,#+0
??GetStringParameter_7:
        UXTH     R3,R3
        LDR      R5,??DataTable5
        ADDS     R5,R5,R3
        LDRB     R5,[R5, #+1]
        CMP      R5,#+10
        BEQ      ??GetStringParameter_8
        MOVS     R5,#+1
        B        ??GetStringParameter_9
??GetStringParameter_8:
        MOVS     R5,#+0
??GetStringParameter_9:
        UXTB     R1,R1
        UXTB     R4,R4
        ANDS     R4,R4,R1
        UXTB     R5,R5
        ANDS     R5,R5,R4
        CMP      R5,#+0
        BEQ      ??GetStringParameter_10
        UXTH     R3,R3
        LDR      R1,??DataTable5
        ADDS     R1,R1,R3
        LDRB     R1,[R1, #+1]
        STRB     R1,[R2, #+0]
        ADDS     R2,R2,#+1
        ADDS     R3,R3,#+1
        ADDS     R0,R0,#+1
        B        ??GetStringParameter_3
??GetStringParameter_10:
        UXTB     R0,R0
        B        ??GetStringParameter_11
??GetStringParameter_2:
        UXTB     R0,R0
??GetStringParameter_11:
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     g_DebugRxBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     CmdList

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HexCharToInt8u:
        PUSH     {LR}
        UXTB     R0,R0
        MOVS     R1,R0
        SUBS     R1,R1,#+48
        CMP      R1,#+10
        BCS      ??HexCharToInt8u_0
        SUBS     R0,R0,#+48
        UXTB     R0,R0
        B        ??HexCharToInt8u_1
??HexCharToInt8u_0:
        UXTB     R0,R0
        MOVS     R1,R0
        SUBS     R1,R1,#+97
        CMP      R1,#+6
        BCS      ??HexCharToInt8u_2
        SUBS     R0,R0,#+87
        UXTB     R0,R0
        B        ??HexCharToInt8u_1
??HexCharToInt8u_2:
        UXTB     R0,R0
        MOVS     R1,R0
        SUBS     R1,R1,#+65
        CMP      R1,#+6
        BCS      ??HexCharToInt8u_3
        SUBS     R0,R0,#+55
        UXTB     R0,R0
        B        ??HexCharToInt8u_1
??HexCharToInt8u_3:
        MOVS     R0,#+0
??HexCharToInt8u_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_power:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        SXTB     R0,R0
        BL       SX1276LoRaSetRFPower
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_reg:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R2,[R0, #+1]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable13
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     `?<Constant "it has taken %d ms\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_reg:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOVS     R1,#+2
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+2
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R1,[R0, #+2]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       SX1276Write
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+1
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R2,[R0, #+1]
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable13
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     `?<Constant "\\r\\ncommand not recogni...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_reg_all:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        ADD      R0,SP,#+0
        ADDS     R0,R0,#+1
        BL       Getu8Parameter
        MOVS     R1,#+2
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R4,[R0, #+1]
        B        ??read_reg_all_0
??read_reg_all_1:
        UXTB     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+10
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??read_reg_all_2
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??read_reg_all_2
        ADR      R0,??DataTable14  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
??read_reg_all_2:
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        MOVS     R0,R4
        UXTB     R0,R0
        BL       SX1276Read
        MOV      R0,SP
        LDRB     R1,[R0, #+2]
        LDR      R0,??DataTable14_1
        BL       printf
        ADDS     R4,R4,#+1
??read_reg_all_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4
        CMP      R0,R4
        BCS      ??read_reg_all_1
        ADR      R0,??DataTable14  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
send_packet:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable14_2
        BL       SX1276Fsk_Send_Packet
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
receive_packet:
        PUSH     {R7,LR}
        BL       SX1276Fsk_recrive_Packet
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
contious_mode_rx:
        PUSH     {R7,LR}
        BL       start_continuous_mode
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
radio_reset:
        PUSH     {R7,LR}
        BL       hal_InitRF
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
changeHopChannel:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        LDR      R1,??DataTable15
        STRB     R0,[R1, #+0]
        BL       hal_InitRF
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_8209c_reg:
        PUSH     {R0-R4,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        ADD      R0,SP,#+4
        MOVS     R1,#+12
        BL       __aeabi_memclr4
        MOVS     R1,#+1
        ADD      R0,SP,#+4
        BL       GetStringParameter
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        CMP      R0,#+48
        BNE      ??read_8209c_reg_0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+1]
        CMP      R0,#+120
        BNE      ??read_8209c_reg_0
        MOVS     R2,#+16
        MOVS     R1,#+0
        ADD      R0,SP,#+4
        BL       strtol
        MOVS     R4,R0
        B        ??read_8209c_reg_1
??read_8209c_reg_0:
        ADD      R0,SP,#+4
        BL       atoi
        MOVS     R4,R0
??read_8209c_reg_1:
        MOV      R1,SP
        MOVS     R0,R4
        UXTB     R0,R0
        BL       read_8209c_regs
        LDR      R2,[SP, #+0]
        UXTB     R4,R4
        MOVS     R1,R4
        LDR      R0,??DataTable16
        BL       printf
        POP      {R0-R4,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_8209c_Reg:
        PUSH     {R4,LR}
        SUB      SP,SP,#+24
        MOVS     R1,#+1
        MOV      R0,SP
        BL       GetStringParameter
        MOVS     R1,#+2
        ADD      R0,SP,#+12
        BL       GetStringParameter
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+48
        BNE      ??set_8209c_Reg_0
        MOV      R0,SP
        LDRB     R0,[R0, #+1]
        CMP      R0,#+120
        BNE      ??set_8209c_Reg_0
        MOVS     R2,#+16
        MOVS     R1,#+0
        MOV      R0,SP
        BL       strtol
        MOVS     R4,R0
        B        ??set_8209c_Reg_1
??set_8209c_Reg_0:
        MOV      R0,SP
        BL       atoi
        MOVS     R4,R0
??set_8209c_Reg_1:
        MOV      R0,SP
        LDRB     R0,[R0, #+12]
        CMP      R0,#+48
        BNE      ??set_8209c_Reg_2
        ADD      R0,SP,#+12
        LDRB     R0,[R0, #+1]
        CMP      R0,#+120
        BNE      ??set_8209c_Reg_2
        MOVS     R2,#+16
        MOVS     R1,#+0
        ADD      R0,SP,#+12
        BL       strtol
        MOVS     R1,R0
        B        ??set_8209c_Reg_3
??set_8209c_Reg_2:
        ADD      R0,SP,#+12
        BL       atoi
        MOVS     R1,R0
??set_8209c_Reg_3:
        MOVS     R0,R4
        UXTB     R0,R0
        BL       config_8209c_reg
        ADD      SP,SP,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_8209c_hfconst:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu16Parameter
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        STRB     R0,[R1, #+1]
        MOVS     R1,#+229
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        ADDS     R1,R1,#+2
        MOVS     R0,#+2
        BL       rn8209c_write
        MOVS     R1,#+220
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        MOV      R0,SP
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable20
        STRH     R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cal_power_gain:
        PUSH     {R2-R4,LR}
        MOVS     R1,#+1
        MOV      R0,SP
        BL       GetStringParameter
        MOV      R0,SP
        BL       atof
        MOVS     R2,#+0
        LDR      R3,??DataTable18  ;; 0x40590000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R4,R0
        MOVS     R1,#+254
        LSLS     R1,R1,#+22       ;; #+1065353216
        MOVS     R0,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R0,#+128
        LSLS     R0,R0,#+24       ;; #-2147483648
        EORS     R4,R4,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        MOVS     R4,R0
        MOVS     R0,R4
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BEQ      ??cal_power_gain_0
        MOVS     R1,#+142
        LSLS     R1,R1,#+23       ;; #+1191182336
        MOVS     R0,R4
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        MOVS     R4,R0
        UXTH     R4,R4
        B        ??cal_power_gain_1
??cal_power_gain_0:
        MOVS     R1,#+142
        LSLS     R1,R1,#+23       ;; #+1191182336
        MOVS     R0,R4
        BL       __aeabi_fmul
        MOVS     R1,#+143
        LSLS     R1,R1,#+23       ;; #+1199570944
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        MOVS     R4,R0
        UXTH     R4,R4
??cal_power_gain_1:
        MOVS     R0,R4
        ASRS     R0,R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,R4
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        MOVS     R1,#+229
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        MOVS     R2,#+2
        MOV      R1,SP
        MOVS     R0,#+5
        BL       rn8209c_write
        MOVS     R1,#+220
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        LDR      R0,??DataTable25_1
        STRH     R4,[R0, #+8]
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     `?<Constant "reg %x = %x\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cal_power_angle:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R1,#+1
        MOV      R0,SP
        BL       GetStringParameter
        MOV      R0,SP
        BL       atof
        MOVS     R2,#+0
        LDR      R3,??DataTable18  ;; 0x40590000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R4,R0
        MOVS     R0,R4
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        BL       __aeabi_f2d
        ADR      R2,??DataTable23
        LDM      R2,{R2,R3}
        BL       __aeabi_ddiv
        BL       asin
        BL       __aeabi_d2f
        BL       __aeabi_f2d
        ADR      R2,??DataTable23_1
        LDM      R2,{R2,R3}
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR      R3,??DataTable24  ;; 0x40668000
        BL       __aeabi_dmul
        ADR      R2,??DataTable25
        LDM      R2,{R2,R3}
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??cal_power_angle_0
        BL       __aeabi_f2iz
        MOVS     R5,R0
        B        ??cal_power_angle_1
??cal_power_angle_0:
        MOVS     R1,#+135
        LSLS     R1,R1,#+23       ;; #+1132462080
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        MOVS     R5,R0
??cal_power_angle_1:
        MOVS     R1,#+229
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        MOVS     R1,R5
        UXTB     R1,R1
        MOVS     R0,#+7
        BL       rn8209c_write_byte
        MOVS     R1,#+220
        MOVS     R0,#+234
        BL       rn8209c_write_byte
        LDR      R0,??DataTable20
        STRB     R5,[R0, #+10]
        MOVS     R0,R4
        BL       __aeabi_f2d
        ADR      R2,??DataTable25_9
        LDM      R2,{R2,R3}
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??cal_power_angle_2
        MOVS     R1,#+142
        LSLS     R1,R1,#+23       ;; #+1191182336
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        MOVS     R1,R0
        B        ??cal_power_angle_3
??cal_power_angle_2:
        MOVS     R1,#+142
        LSLS     R1,R1,#+23       ;; #+1191182336
        BL       __aeabi_fmul
        MOVS     R1,#+143
        LSLS     R1,R1,#+23       ;; #+1199570944
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        MOVS     R1,R0
??cal_power_angle_3:
        UXTH     R1,R1
        MOVS     R0,#+9
        BL       config_8209c_reg
        POP      {R0-R2,R4,R5,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     `?<Constant "%x  ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     tedtbuf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_8209c_Kx:
        PUSH     {R3-R5,LR}
        MOV      R1,SP
        MOVS     R0,#+36
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable20
        STR      R0,[R1, #+16]
        MOV      R1,SP
        MOVS     R0,#+34
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable20
        STR      R0,[R1, #+20]
        LDR      R0,??DataTable20
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable25_2  ;; 0x41f00000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,??DataTable20
        LDRH     R0,[R0, #+2]
        BL       __aeabi_ui2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        ADR      R0,??DataTable25_3
        LDM      R0,{R0,R1}
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR      R1,??DataTable20
        STR      R0,[R1, #+24]
        MOVS     R0,#+0
        LDR      R1,??DataTable20
        STRH     R0,[R1, #+48]
        MOVS     R0,#+0
        LDR      R1,??DataTable20
        STR      R0,[R1, #+44]
        MOVS     R0,#+0
        LDR      R1,??DataTable20
        STRH     R0,[R1, #+28]
        MOVS     R0,#+1
        LDR      R1,??DataTable20
        STRB     R0,[R1, #+4]
        MOV      R1,SP
        MOVS     R0,#+38
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        CMP      R0,#+0
        BPL      ??set_8209c_Kx_0
        LDR      R0,[SP, #+0]
        MVNS     R1,R0
        ADDS     R1,R1,#+1
        STR      R1,[SP, #+0]
??set_8209c_Kx_0:
        LDR      R0,[SP, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR      R3,??DataTable25_4  ;; 0x40100000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable25_5  ;; 0x408f4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        UXTH     R0,R0
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idiv
        LDR      R1,??DataTable20
        STRH     R0,[R1, #+6]
        LDR      R0,??DataTable20
        LDRH     R1,[R0, #+6]
        MOVS     R0,#+3
        BL       config_8209c_reg
        LDR      R1,??DataTable25_6
        MOVS     R0,#+5
        BL       read_8209c_regs
        LDR      R1,??DataTable25_7
        MOVS     R0,#+7
        BL       read_8209c_regs
        BL       save_8209c_params
        LDR      R0,??DataTable25_8  ;; 0x800f800
        BL       FLASH_ErasePage
        MOVS     R1,#+0
        LDR      R0,??DataTable27
        BL       process_start
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     g_hopChannel

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_param_all:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+44]
        STR      R0,[SP, #+32]
        LDR      R0,??DataTable20
        LDRH     R0,[R0, #+48]
        STR      R0,[SP, #+28]
        LDR      R0,??DataTable20
        LDRH     R0,[R0, #+28]
        STR      R0,[SP, #+24]
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+24]
        BL       __aeabi_f2d
        STR      R0,[SP, #+16]
        STR      R1,[SP, #+20]
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+20]
        STR      R0,[SP, #+12]
        LDR      R0,??DataTable20
        LDR      R0,[R0, #+16]
        STR      R0,[SP, #+8]
        LDR      R0,??DataTable20
        LDRH     R0,[R0, #+12]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable20
        LDRB     R0,[R0, #+10]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable20
        LDRH     R3,[R0, #+8]
        LDR      R0,??DataTable20
        LDRH     R2,[R0, #+6]
        LDR      R0,??DataTable20
        LDRH     R1,[R0, #+0]
        LDR      R0,??DataTable27_1
        BL       printf
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     `?<Constant "reg %x = 0x%x\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
reset_8029c:
        PUSH     {R7,LR}
        BL       rn8209c_init
        LDR      R0,??DataTable25_1
        LDRH     R1,[R0, #+0]
        MOVS     R0,#+2
        BL       config_8209c_reg
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STRH     R0,[R1, #+8]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STRB     R0,[R1, #+10]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STRH     R0,[R1, #+12]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STR      R0,[R1, #+16]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STR      R0,[R1, #+20]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STR      R0,[R1, #+24]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STRH     R0,[R1, #+28]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STRH     R0,[R1, #+48]
        MOVS     R0,#+0
        LDR      R1,??DataTable25_1
        STR      R0,[R1, #+44]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Relay_close:
        PUSH     {R7,LR}
        MOVS     R1,#+2
        LDR      R0,??DataTable27_2  ;; 0x48000400
        BL       GPIO_ResetBits
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0x40590000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Relay_open:
        PUSH     {R7,LR}
        MOVS     R1,#+2
        LDR      R0,??DataTable27_2  ;; 0x48000400
        BL       GPIO_SetBits
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
debug_set_pwm:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOV      R0,SP
        BL       Getu8Parameter
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??debug_set_pwm_0
        MOVS     R1,#+2
        LDR      R0,??DataTable27_2  ;; 0x48000400
        BL       GPIO_SetBits
        B        ??debug_set_pwm_1
??debug_set_pwm_0:
        MOVS     R1,#+2
        LDR      R0,??DataTable27_2  ;; 0x48000400
        BL       GPIO_ResetBits
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       set_PWM
??debug_set_pwm_1:
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable27_3
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_energy:
        PUSH     {R7,LR}
        BL       read_8209c_energyP
        BL       get_light_time
        LDR      R1,??DataTable25_1
        LDR      R3,[R1, #+44]
        LDR      R1,??DataTable25_1
        LDRH     R2,[R1, #+48]
        MOVS     R1,R0
        LDR      R0,??DataTable27_4
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_factor:
        PUSH     {R7,LR}
        BL       read_pow_factor
        UXTB     R0,R0
        MOVS     R1,R0
        LDR      R0,??DataTable27_5
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
debug_save:
        PUSH     {R7,LR}
        BL       save_elc_datas
        ADR      R0,??DataTable27_6  ;; 0x6F, 0x6B, 0x00, 0x00
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0xA1CAC083,0x3FFBB645

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23_1:
        DC32     0x47AE147B,0x3F947AE1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_u_i_p:
        PUSH     {R7,LR}
        BL       read_UIP
        LDR      R0,??DataTable25_1
        LDRH     R3,[R0, #+36]
        LDR      R0,??DataTable25_1
        LDR      R2,[R0, #+32]
        LDR      R0,??DataTable25_1
        LDRH     R1,[R0, #+30]
        LDR      R0,??DataTable27_7
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable24:
        DC32     0x40668000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_adc:
        PUSH     {R7,LR}
        BL       read_PWM_volt
        UXTH     R0,R0
        MOVS     R1,R0
        LDR      R0,??DataTable27_8
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0x4D12D84A,0x400921FB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_2:
        DC32     0x41f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_3:
        DC32     0x54081470,0x43C65A9F

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_4:
        DC32     0x40100000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_5:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_6:
        DC32     rn8209c_papameter+0x8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_7:
        DC32     rn8209c_papameter+0xA

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_8:
        DC32     0x800f800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_9:
        DC32     0x9096BB99,0x3FE27A0F

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
reset_8209c:
        PUSH     {R7,LR}
        BL       rn8209c_reset
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_gdflash:
        PUSH     {R7,LR}
        BL       printf_params
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
find_string16_len:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       strlen
        LDRB     R1,[R4, #+0]
        CMP      R1,#+48
        BNE      ??find_string16_len_0
        LDRB     R1,[R4, #+1]
        CMP      R1,#+120
        BNE      ??find_string16_len_0
        SUBS     R0,R0,#+2
        ADDS     R4,R4,#+2
??find_string16_len_0:
        MOVS     R1,#+0
        B        ??find_string16_len_1
??find_string16_len_2:
??find_string16_len_3:
        ADDS     R1,R1,#+1
??find_string16_len_1:
        UXTH     R1,R1
        UXTH     R0,R0
        CMP      R1,R0
        BCS      ??find_string16_len_4
        UXTH     R1,R1
        LDRB     R2,[R4, R1]
        SUBS     R2,R2,#+48
        CMP      R2,#+10
        BCC      ??find_string16_len_2
        UXTH     R1,R1
        LDRB     R2,[R4, R1]
        SUBS     R2,R2,#+97
        CMP      R2,#+6
        BCC      ??find_string16_len_3
??find_string16_len_5:
        UXTH     R1,R1
        LDRB     R2,[R4, R1]
        SUBS     R2,R2,#+65
        CMP      R2,#+6
        BCC      ??find_string16_len_3
??find_string16_len_6:
        MOVS     R0,R1
??find_string16_len_4:
        UXTH     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
change_string_to_arry16:
        PUSH     {R1,R4-R7,LR}
        SUB      SP,SP,#+8
        MOVS     R5,R0
        MOV      R0,SP
        MOVS     R1,#+0
        STR      R1,[R0, #0]
        MOVS     R0,R5
        BL       find_string16_len
        MOVS     R6,R0
        UXTH     R6,R6
        MOVS     R0,R6
        MOVS     R1,#+2
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??change_string_to_arry16_0
        UXTH     R6,R6
        MOVS     R0,R6
        MOVS     R1,#+2
        BL       __aeabi_idiv
        B        ??change_string_to_arry16_1
??change_string_to_arry16_0:
        UXTH     R6,R6
        MOVS     R0,R6
        MOVS     R1,#+2
        BL       __aeabi_idiv
        ADDS     R0,R0,#+1
??change_string_to_arry16_1:
        MOVS     R7,R0
        LDRB     R0,[R5, #+0]
        CMP      R0,#+48
        BNE      ??change_string_to_arry16_2
        LDRB     R0,[R5, #+1]
        CMP      R0,#+120
        BNE      ??change_string_to_arry16_2
        ADDS     R5,R5,#+2
??change_string_to_arry16_2:
        MOVS     R4,#+0
        B        ??change_string_to_arry16_3
??change_string_to_arry16_4:
        UXTH     R4,R4
        MOVS     R0,#+2
        MULS     R0,R4,R0
        LDRB     R0,[R5, R0]
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        UXTH     R4,R4
        MOVS     R0,#+2
        MULS     R0,R4,R0
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+1]
        MOV      R1,SP
        STRB     R0,[R1, #+1]
??change_string_to_arry16_5:
        MOVS     R2,#+16
        MOVS     R1,#+0
        MOV      R0,SP
        BL       strtol
        UXTH     R4,R4
        LDR      R1,[SP, #+8]
        STRB     R0,[R1, R4]
        ADDS     R4,R4,#+1
??change_string_to_arry16_3:
        UXTH     R4,R4
        UXTH     R7,R7
        CMP      R4,R7
        BCS      ??change_string_to_arry16_6
        UXTH     R4,R4
        CMP      R4,#+0
        BNE      ??change_string_to_arry16_4
        UXTH     R6,R6
        MOVS     R0,R6
        MOVS     R1,#+2
        BL       __aeabi_idivmod
        CMP      R1,#+1
        BNE      ??change_string_to_arry16_4
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        UXTH     R4,R4
        LDRB     R0,[R5, R4]
        MOV      R1,SP
        STRB     R0,[R1, #+1]
        B        ??change_string_to_arry16_5
??change_string_to_arry16_6:
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_local_addr:
        PUSH     {LR}
        SUB      SP,SP,#+28
        MOV      R0,SP
        MOVS     R1,#+0
        STR      R1,[R0, #0]
        MOVS     R1,#+1
        ADD      R0,SP,#+4
        BL       GetStringParameter
        MOV      R0,SP
        LDRB     R0,[R0, #+4]
        CMP      R0,#+48
        BNE      ??set_local_addr_0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+1]
        CMP      R0,#+120
        BNE      ??set_local_addr_0
        ADD      R0,SP,#+4
        LDRB     R0,[R0, #+14]
        CMP      R0,#+0
        BNE      ??set_local_addr_0
        ADD      R0,SP,#+4
        BL       find_string16_len
        CMP      R0,#+12
        BNE      ??set_local_addr_1
        LDR      R1,??DataTable27_9
        ADD      R0,SP,#+4
        BL       change_string_to_arry16
        B        ??set_local_addr_2
??set_local_addr_1:
        LDR      R0,??DataTable27_10
        BL       printf
        B        ??set_local_addr_2
??set_local_addr_0:
        LDR      R0,??DataTable27_11
        BL       printf
??set_local_addr_2:
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
write_finish:
        PUSH     {R7,LR}
        BL       write_finish_debug
        LDR      R0,??DataTable27_12
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27:
        DC32     start_time_detect_process

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_1:
        DC32     `?<Constant "hfconst %d\\r\\n,pstart %...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_2:
        DC32     0x48000400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_3:
        DC32     `?<Constant "pwm =%d% \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_4:
        DC32     `?<Constant "light_time = %d\\r\\n,pul...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_5:
        DC32     `?<Constant "factor = %d%">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_6:
        DC8      0x6F, 0x6B, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_7:
        DC32     `?<Constant "U = %d I = %d P = %d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_8:
        DC32     `?<Constant "adc = %d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_9:
        DC32     local_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_10:
        DC32     `?<Constant "input  err\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_11:
        DC32     `?<Constant "input have not start ...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable27_12:
        DC32     `?<Constant "OK\\r\\n">`

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
// 1 004 bytes in section .rodata
// 2 920 bytes in section .text
// 
// 2 920 bytes of CODE  memory
// 1 004 bytes of CONST memory
//
//Errors: none
//Warnings: 7

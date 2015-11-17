///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:17
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\apl_debug.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\apl_debug.c -D USE_STDPERIPH_DRIVER
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
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\apl_debug.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN GetTime
        EXTERN OS_MemClr
        EXTERN ReadVersion
        EXTERN SX1276LoRaSetRFPower
        EXTERN SX1276LoRa_Receive_Packet
        EXTERN SX1276LoRa_Send_Packet
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
        EXTERN g_updateBuffer
        EXTERN get_light_time
        EXTERN hal_InitRF
        EXTERN power_down_protect
        EXTERN printf
        EXTERN read_8209c_energyP
        EXTERN read_8209c_regs
        EXTERN read_PWM_volt
        EXTERN read_UIP
        EXTERN read_params_area
        EXTERN read_pow_factor
        EXTERN rn8209c_init
        EXTERN rn8209c_papameter
        EXTERN rn8209c_write
        EXTERN rn8209c_write_byte
        EXTERN save_8209c_params
        EXTERN save_elc_datas
        EXTERN set_PWM
        EXTERN strtol
        EXTERN tedtbuf

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
        PUBLIC contious_mode_rx
        PUBLIC debug_save
        PUBLIC debug_set_pwm
        PUBLIC get_reg
        PUBLIC radio_reset
        PUBLIC read_8209c_reg
        PUBLIC read_adc
        PUBLIC read_energy
        PUBLIC read_factor
        PUBLIC read_param_all
        PUBLIC read_params_flash
        PUBLIC read_reg_all
        PUBLIC read_u_i_p
        PUBLIC receive_packet
        PUBLIC reset_8029c
        PUBLIC send_packet
        PUBLIC set_8209c_Kx
        PUBLIC set_8209c_Reg
        PUBLIC set_8209c_hfconst
        PUBLIC set_power
        PUBLIC set_reg


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
`?<Constant "flashread">`:
        DATA
        DC8 "flashread"
        DC8 0, 0

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
`?<Constant "%s\\r\\n">`:
        DATA
        DC8 "%s\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "pwm =%d% \\r\\n">`:
        DATA
        DC8 "pwm =%d% \015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "light_time = %d">`:
        DATA
        DC8 "light_time = %d"

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
        DC32 reset_8029c, `?<Constant "flashread">`, read_params_flash
        DC32 `?<Constant "openlight">`, Relay_close, `?<Constant "closelight">`
        DC32 Relay_open, `?<Constant "pwm">`, debug_set_pwm
        DC32 `?<Constant "factor">`, read_factor, `?<Constant "dbsave">`
        DC32 debug_save, `?<Constant "adc">`, read_adc

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
        LDR      R0,??DataTable4_4
        BL       OS_MemClr
        MOVS     R0,#+0
        LDR      R1,??DataTable4_1
        STRH     R0,[R1, #+2]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
apl_ProcessCmdLine:
        PUSH     {R1-R7,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R0,#+31
        MOV      R1,SP
        STRB     R0,[R1, #+8]
        MOVS     R7,#+1
        MOVS     R6,#+0
??apl_ProcessCmdLine_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        UXTB     R6,R6
        CMP      R6,R0
        BCS      ??apl_ProcessCmdLine_1
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R0,R6,R0
        LDR      R1,??DataTable4_5
        LDR      R0,[R1, R0]
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        MOVS     R4,R0
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R0,R6,R0
        LDR      R1,??DataTable4_5
        LDR      R0,[R1, R0]
        LDRB     R0,[R0, #+0]
        MOVS     R5,R0
??apl_ProcessCmdLine_2:
        UXTB     R5,R5
        CMP      R5,#+0
        BEQ      ??apl_ProcessCmdLine_3
        ADDS     R4,R4,#+1
        UXTB     R4,R4
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R0,R6,R0
        LDR      R1,??DataTable4_5
        LDR      R0,[R1, R0]
        LDRB     R0,[R0, R4]
        MOVS     R5,R0
        B        ??apl_ProcessCmdLine_2
??apl_ProcessCmdLine_3:
        MOVS     R0,#+1
        MOVS     R7,R0
        MOVS     R0,#+0
??apl_ProcessCmdLine_4:
        UXTB     R0,R0
        UXTB     R4,R4
        CMP      R0,R4
        BCS      ??apl_ProcessCmdLine_5
        UXTB     R0,R0
        LDR      R1,[SP, #+4]
        LDRB     R1,[R1, R0]
        UXTB     R0,R0
        LDR      R2,??DataTable4_4
        LDRB     R2,[R2, R0]
        CMP      R1,R2
        BEQ      ??apl_ProcessCmdLine_6
        MOVS     R0,#+0
        MOVS     R7,R0
        B        ??apl_ProcessCmdLine_5
??apl_ProcessCmdLine_6:
        ADDS     R0,R0,#+1
        B        ??apl_ProcessCmdLine_4
??apl_ProcessCmdLine_5:
        UXTB     R4,R4
        CMP      R4,#+0
        BNE      ??apl_ProcessCmdLine_7
        MOVS     R0,#+0
        MOVS     R7,R0
??apl_ProcessCmdLine_7:
        UXTB     R7,R7
        CMP      R7,#+0
        BEQ      ??apl_ProcessCmdLine_8
        BL       hal_GetSystickCounter
        STR      R0,[SP, #+0]
        ADR      R0,??DataTable5  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        UXTB     R6,R6
        MOVS     R0,#+8
        MULS     R6,R0,R6
        LDR      R0,??DataTable4_5
        ADDS     R0,R0,R6
        LDR      R0,[R0, #+4]
        BLX      R0
        BL       hal_GetSystickCounter
        LDR      R1,[SP, #+0]
        SUBS     R1,R0,R1
        LDR      R0,??DataTable5_1
        BL       printf
        B        ??apl_ProcessCmdLine_1
??apl_ProcessCmdLine_8:
        ADDS     R6,R6,#+1
        B        ??apl_ProcessCmdLine_0
??apl_ProcessCmdLine_1:
        UXTB     R7,R7
        CMP      R7,#+0
        BNE      ??apl_ProcessCmdLine_9
        LDR      R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+13
        BEQ      ??apl_ProcessCmdLine_10
        LDR      R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BEQ      ??apl_ProcessCmdLine_10
        LDR      R0,??DataTable6
        BL       printf
        B        ??apl_ProcessCmdLine_9
??apl_ProcessCmdLine_10:
        ADR      R0,??DataTable5  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
??apl_ProcessCmdLine_9:
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Getu8Parameter:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+4
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R0,#+0
        MOVS     R4,R0
??Getu8Parameter_0:
        UXTH     R4,R4
        CMP      R4,#+30
        BCS      ??Getu8Parameter_1
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        LDRB     R0,[R0, R4]
        CMP      R0,#+32
        BNE      ??Getu8Parameter_2
        ADDS     R5,R5,#+1
        MOV      R0,SP
        LDRB     R0,[R0, #+8]
        UXTB     R5,R5
        CMP      R5,R0
        BNE      ??Getu8Parameter_2
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+32
        BEQ      ??Getu8Parameter_3
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+13
        BEQ      ??Getu8Parameter_3
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        CMP      R0,#+10
        BNE      ??Getu8Parameter_4
??Getu8Parameter_3:
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        LDR      R1,[SP, #+4]
        STRB     R0,[R1, #+0]
        B        ??Getu8Parameter_5
??Getu8Parameter_4:
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+32
        BEQ      ??Getu8Parameter_6
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+13
        BEQ      ??Getu8Parameter_6
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        CMP      R0,#+10
        BNE      ??Getu8Parameter_7
??Getu8Parameter_6:
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        MOVS     R7,R0
        MOVS     R0,#+10
        MULS     R7,R0,R7
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        BL       HexCharToInt8u
        MOVS     R6,R0
        ADDS     R6,R6,R7
        LDR      R0,[SP, #+4]
        STRB     R6,[R0, #+0]
        B        ??Getu8Parameter_5
??Getu8Parameter_7:
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+1]
        BL       HexCharToInt8u
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOV      R0,SP
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+100
        MULS     R1,R2,R1
        STRB     R1,[R0, #+0]
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+2]
        BL       HexCharToInt8u
        MOVS     R7,R0
        MOVS     R0,#+10
        MULS     R7,R0,R7
        UXTH     R4,R4
        LDR      R0,??DataTable4_4
        ADDS     R0,R0,R4
        LDRB     R0,[R0, #+3]
        BL       HexCharToInt8u
        MOVS     R6,R0
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,R7
        ADDS     R6,R6,R0
        LDR      R0,[SP, #+4]
        STRB     R6,[R0, #+0]
??Getu8Parameter_5:
        B        ??Getu8Parameter_8
??Getu8Parameter_2:
        ADDS     R4,R4,#+1
        B        ??Getu8Parameter_0
??Getu8Parameter_1:
        MOVS     R0,#+0
        LDR      R1,[SP, #+4]
        STRB     R0,[R1, #+0]
??Getu8Parameter_8:
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Getu16Parameter:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+8
        MOVS     R0,#+0
        MOVS     R4,#+0
        MOVS     R1,#+0
        MOV      R2,SP
        STRB     R1,[R2, #+0]
        MOVS     R1,#+0
        MOVS     R2,#+1
        MOVS     R3,#+0
        MOV      R5,SP
        STRB     R3,[R5, #+1]
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R0,R5
??Getu16Parameter_0:
        UXTH     R0,R0
        CMP      R0,#+30
        BCS      ??Getu16Parameter_1
        UXTH     R0,R0
        LDR      R5,??DataTable4_4
        LDRB     R5,[R5, R0]
        CMP      R5,#+32
        BNE      ??Getu16Parameter_2
        ADDS     R4,R4,#+1
        MOV      R5,SP
        LDRB     R5,[R5, #+12]
        UXTB     R4,R4
        CMP      R4,R5
        BNE      ??Getu16Parameter_2
        UXTH     R0,R0
        LDR      R5,??DataTable4_4
        ADDS     R5,R5,R0
        ADDS     R5,R5,#+1
        UXTH     R0,R0
        LDR      R6,??DataTable4_4
        ADDS     R6,R6,R0
        ADDS     R6,R6,#+1
        STR      R6,[SP, #+4]
??Getu16Parameter_3:
        LDRB     R6,[R5, #+0]
        CMP      R6,#+32
        BEQ      ??Getu16Parameter_4
        ADDS     R5,R5,#+1
        LDRB     R6,[R5, #+0]
        CMP      R6,#+13
        BEQ      ??Getu16Parameter_5
        LDRB     R6,[R5, #+0]
        CMP      R6,#+10
        BNE      ??Getu16Parameter_6
??Getu16Parameter_5:
        B        ??Getu16Parameter_4
??Getu16Parameter_6:
        LDR      R6,[SP, #+4]
        SUBS     R6,R5,R6
        CMP      R6,#+6
        BLT      ??Getu16Parameter_3
??Getu16Parameter_4:
        MOV      R7,SP
        MOV      R12,R7
        MOVS     R7,R5
        LDR      R6,[SP, #+4]
        SUBS     R6,R7,R6
        MOV      R7,R12
        STRB     R6,[R7, #+0]
        LDR      R6,[SP, #+4]
        LDRB     R6,[R6, #+0]
        CMP      R6,#+45
        BNE      ??Getu16Parameter_7
        MOVS     R6,#+1
        MOVS     R3,R6
??Getu16Parameter_7:
        MOV      R6,SP
        LDRB     R6,[R6, #+0]
        MOVS     R4,R6
??Getu16Parameter_8:
        UXTB     R3,R3
        UXTB     R4,R4
        CMP      R3,R4
        BCS      ??Getu16Parameter_9
        SUBS     R5,R5,#+1
        MOV      R6,SP
        LDRB     R7,[R5, #+0]
        SUBS     R7,R7,#+48
        STRB     R7,[R6, #+1]
        UXTH     R1,R1
        UXTH     R2,R2
        MOV      R6,SP
        LDRB     R6,[R6, #+1]
        MULS     R6,R2,R6
        ADDS     R1,R1,R6
        MOVS     R6,#+10
        MULS     R2,R6,R2
        SUBS     R4,R4,#+1
        B        ??Getu16Parameter_8
??Getu16Parameter_9:
        UXTB     R3,R3
        CMP      R3,#+1
        BNE      ??Getu16Parameter_10
        MOVS     R6,#+0
        SUBS     R1,R6,R1
??Getu16Parameter_10:
        MOVS     R6,#+0
        MOV      R7,SP
        STRB     R6,[R7, #+0]
        B        ??Getu16Parameter_1
??Getu16Parameter_2:
        ADDS     R0,R0,#+1
        B        ??Getu16Parameter_0
??Getu16Parameter_1:
        LDR      R5,[SP, #+8]
        STRH     R1,[R5, #+0]
        POP      {R0-R7,PC}       ;; return

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

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     g_DebugRxBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     CmdList

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GetStringParameter:
        PUSH     {R1,R4-R7,LR}
        MOVS     R1,R0
        MOVS     R2,#+0
        MOVS     R4,#+0
        MOVS     R0,#+0
        MOVS     R3,R1
        MOVS     R5,#+0
        MOVS     R2,R5
??GetStringParameter_0:
        UXTH     R2,R2
        CMP      R2,#+30
        BCS      ??GetStringParameter_1
        UXTH     R2,R2
        LDR      R5,??DataTable12
        LDRB     R5,[R5, R2]
        CMP      R5,#+32
        BNE      ??GetStringParameter_2
        ADDS     R4,R4,#+1
        MOV      R5,SP
        LDRB     R5,[R5, #+0]
        UXTB     R4,R4
        CMP      R4,R5
        BNE      ??GetStringParameter_2
??GetStringParameter_3:
        UXTH     R2,R2
        LDR      R5,??DataTable12
        ADDS     R5,R5,R2
        LDRB     R5,[R5, #+1]
        CMP      R5,#+32
        BEQ      ??GetStringParameter_4
        MOVS     R5,#+1
        B        ??GetStringParameter_5
??GetStringParameter_4:
        MOVS     R5,#+0
??GetStringParameter_5:
        UXTH     R2,R2
        LDR      R6,??DataTable12
        ADDS     R6,R6,R2
        LDRB     R6,[R6, #+1]
        CMP      R6,#+13
        BEQ      ??GetStringParameter_6
        MOVS     R6,#+1
        B        ??GetStringParameter_7
??GetStringParameter_6:
        MOVS     R6,#+0
??GetStringParameter_7:
        UXTH     R2,R2
        LDR      R7,??DataTable12
        ADDS     R7,R7,R2
        LDRB     R7,[R7, #+1]
        CMP      R7,#+10
        BEQ      ??GetStringParameter_8
        MOVS     R7,#+1
        B        ??GetStringParameter_9
??GetStringParameter_8:
        MOVS     R7,#+0
??GetStringParameter_9:
        UXTB     R5,R5
        UXTB     R6,R6
        ANDS     R6,R6,R5
        UXTB     R7,R7
        ANDS     R7,R7,R6
        CMP      R7,#+0
        BEQ      ??GetStringParameter_10
        UXTH     R2,R2
        LDR      R5,??DataTable12
        ADDS     R5,R5,R2
        LDRB     R5,[R5, #+1]
        STRB     R5,[R3, #+0]
        ADDS     R3,R3,#+1
        ADDS     R2,R2,#+1
        ADDS     R0,R0,#+1
        B        ??GetStringParameter_3
??GetStringParameter_10:
        UXTB     R0,R0
        B        ??GetStringParameter_11
??GetStringParameter_2:
        ADDS     R2,R2,#+1
        B        ??GetStringParameter_0
??GetStringParameter_1:
        UXTB     R0,R0
??GetStringParameter_11:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     `?<Constant "it has taken %d ms\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
HexCharToInt8u:
        PUSH     {LR}
        MOVS     R1,R0
        UXTB     R1,R1
        CMP      R1,#+48
        BLT      ??HexCharToInt8u_0
        UXTB     R1,R1
        CMP      R1,#+58
        BGE      ??HexCharToInt8u_0
        SUBS     R1,R1,#+48
        MOVS     R0,R1
        UXTB     R0,R0
        B        ??HexCharToInt8u_1
??HexCharToInt8u_0:
        UXTB     R1,R1
        CMP      R1,#+97
        BLT      ??HexCharToInt8u_2
        UXTB     R1,R1
        CMP      R1,#+103
        BGE      ??HexCharToInt8u_2
        SUBS     R1,R1,#+87
        MOVS     R0,R1
        UXTB     R0,R0
        B        ??HexCharToInt8u_1
??HexCharToInt8u_2:
        UXTB     R1,R1
        CMP      R1,#+65
        BLT      ??HexCharToInt8u_3
        UXTB     R1,R1
        CMP      R1,#+71
        BGE      ??HexCharToInt8u_3
        SUBS     R1,R1,#+55
        MOVS     R0,R1
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
        LDR      R0,??DataTable14
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     `?<Constant "\\r\\ncommand not recogni...">`

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
        LDR      R0,??DataTable14
        BL       printf
        POP      {R0,PC}          ;; return

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
??read_reg_all_0:
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4
        CMP      R0,R4
        BCC      ??read_reg_all_1
        UXTB     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+10
        BL       __aeabi_idivmod
        CMP      R1,#+0
        BNE      ??read_reg_all_2
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??read_reg_all_2
        ADR      R0,??DataTable15  ;; 0x0D, 0x0A, 0x00, 0x00
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
        B        ??read_reg_all_0
??read_reg_all_1:
        ADR      R0,??DataTable15  ;; 0x0D, 0x0A, 0x00, 0x00
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
        LDR      R0,??DataTable16
        BL       SX1276LoRa_Send_Packet
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
receive_packet:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        BL       SX1276LoRa_Receive_Packet
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
contious_mode_rx:
        BX       LR               ;; return

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
        LDR      R1,??DataTable16_1
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
        LDR      R0,??DataTable20
        BL       printf
        POP      {R0-R4,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_8209c_Reg:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+28
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
        MOVS     R5,R0
        B        ??set_8209c_Reg_1
??set_8209c_Reg_0:
        MOV      R0,SP
        BL       atoi
        MOVS     R5,R0
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
        MOVS     R4,R0
        B        ??set_8209c_Reg_3
??set_8209c_Reg_2:
        ADD      R0,SP,#+12
        BL       atoi
        MOVS     R4,R0
??set_8209c_Reg_3:
        MOVS     R1,R4
        MOVS     R0,R5
        UXTB     R0,R0
        BL       config_8209c_reg
        ADD      SP,SP,#+28
        POP      {R4,R5,PC}       ;; return

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
        LDR      R1,??DataTable25
        STRH     R0,[R1, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     g_DebugRxBuffer

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cal_power_gain:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R1,#+1
        MOV      R0,SP
        BL       GetStringParameter
        MOV      R0,SP
        BL       atof
        MOVS     R2,#+0
        LDR      R3,??DataTable23  ;; 0x40590000
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
        UXTH     R0,R0
        MOVS     R5,R0
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
        UXTH     R0,R0
        MOVS     R5,R0
??cal_power_gain_1:
        MOVS     R0,R5
        ASRS     R0,R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        MOVS     R0,R5
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
        MOVS     R0,R5
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+4]
        POP      {R0-R2,R4,R5,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
cal_power_angle:
        PUSH     {R2-R6,LR}
        MOVS     R1,#+1
        MOV      R0,SP
        BL       GetStringParameter
        MOV      R0,SP
        BL       atof
        MOVS     R2,#+0
        LDR      R3,??DataTable23  ;; 0x40590000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R6,R0
        MOVS     R0,R6
        MOVS     R1,#+128
        LSLS     R1,R1,#+24       ;; #-2147483648
        EORS     R0,R0,R1
        BL       __aeabi_f2d
        ADR      R2,??DataTable26
        LDM      R2,{R2,R3}
        BL       __aeabi_ddiv
        BL       asin
        BL       __aeabi_d2f
        MOVS     R4,R0
        MOVS     R0,R4
        BL       __aeabi_f2d
        ADR      R2,??DataTable26_1
        LDM      R2,{R2,R3}
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR      R3,??DataTable26_2  ;; 0x40668000
        BL       __aeabi_dmul
        ADR      R2,??DataTable26_3
        LDM      R2,{R2,R3}
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R4,R0
        MOVS     R0,R4
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS      ??cal_power_angle_0
        MOVS     R0,R4
        BL       __aeabi_f2iz
        MOVS     R5,R0
        B        ??cal_power_angle_1
??cal_power_angle_0:
        MOVS     R1,#+135
        LSLS     R1,R1,#+23       ;; #+1132462080
        MOVS     R0,R4
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
        UXTB     R5,R5
        LDR      R0,??DataTable26_7
        STRH     R5,[R0, #+6]
        POP      {R0,R1,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     `?<Constant "reg %x = %x\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     `?<Constant "%x  ">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_8209c_Kx:
        PUSH     {R7,LR}
        MOV      R1,SP
        MOVS     R0,#+36
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable26_7
        STR      R0,[R1, #+12]
        MOV      R1,SP
        MOVS     R0,#+34
        BL       read_8209c_regs
        LDR      R0,[SP, #+0]
        LDR      R1,??DataTable26_7
        STR      R0,[R1, #+16]
        LDR      R0,??DataTable26_4  ;; 0x4168e282
        LDR      R1,??DataTable26_7
        STR      R0,[R1, #+20]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+48]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STR      R0,[R1, #+44]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+24]
        MOVS     R0,#+1
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+40]
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
        LDR      R3,??DataTable26_5  ;; 0x40100000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR      R3,??DataTable26_6  ;; 0x408f4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        UXTH     R0,R0
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idiv
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+2]
        LDR      R0,??DataTable26_7
        LDRH     R1,[R0, #+2]
        MOVS     R0,#+3
        BL       config_8209c_reg
        BL       save_8209c_params
        BL       power_down_protect
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_param_all:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+44]
        STR      R0,[SP, #+32]
        LDR      R0,??DataTable25
        LDRH     R0,[R0, #+48]
        STR      R0,[SP, #+28]
        LDR      R0,??DataTable25
        LDRH     R0,[R0, #+24]
        STR      R0,[SP, #+24]
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+20]
        BL       __aeabi_f2d
        STR      R0,[SP, #+16]
        STR      R1,[SP, #+20]
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+16]
        STR      R0,[SP, #+12]
        LDR      R0,??DataTable25
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+8]
        LDR      R0,??DataTable25
        LDRH     R0,[R0, #+8]
        STR      R0,[SP, #+4]
        LDR      R0,??DataTable25
        LDRH     R0,[R0, #+6]
        STR      R0,[SP, #+0]
        LDR      R0,??DataTable25
        LDRH     R3,[R0, #+4]
        LDR      R0,??DataTable25
        LDRH     R2,[R0, #+2]
        LDR      R0,??DataTable25
        LDRH     R1,[R0, #+0]
        LDR      R0,??DataTable26_11
        BL       printf
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16:
        DC32     tedtbuf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable16_1:
        DC32     g_hopChannel

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
reset_8029c:
        PUSH     {R7,LR}
        BL       rn8209c_init
        LDR      R0,??DataTable26_7
        LDRH     R1,[R0, #+0]
        MOVS     R0,#+2
        BL       config_8209c_reg
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+2]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+4]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+8]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STR      R0,[R1, #+12]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STR      R0,[R1, #+16]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STR      R0,[R1, #+20]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+24]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STRH     R0,[R1, #+48]
        MOVS     R0,#+0
        LDR      R1,??DataTable26_7
        STR      R0,[R1, #+44]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_params_flash:
        PUSH     {R7,LR}
        LDR      R0,??DataTable26_8  ;; 0x800fc00
        BL       read_params_area
        LDR      R1,??DataTable26_9
        LDR      R0,??DataTable26_12
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Relay_close:
        PUSH     {R7,LR}
        MOVS     R1,#+2
        LDR      R0,??DataTable26_10  ;; 0x48000400
        BL       GPIO_ResetBits
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Relay_open:
        PUSH     {R7,LR}
        MOVS     R1,#+2
        LDR      R0,??DataTable26_10  ;; 0x48000400
        BL       GPIO_SetBits
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable20:
        DC32     `?<Constant "reg %x = 0x%x\\r\\n">`

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
        LDR      R0,??DataTable26_10  ;; 0x48000400
        BL       GPIO_SetBits
        B        ??debug_set_pwm_1
??debug_set_pwm_0:
        MOVS     R1,#+2
        LDR      R0,??DataTable26_10  ;; 0x48000400
        BL       GPIO_ResetBits
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        BL       set_PWM
??debug_set_pwm_1:
        MOV      R0,SP
        LDRB     R1,[R0, #+0]
        LDR      R0,??DataTable26_13
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_energy:
        PUSH     {R4,LR}
        BL       read_8209c_energyP
        BL       get_light_time
        MOVS     R4,R0
        MOVS     R1,R4
        LDR      R0,??DataTable26_14
        BL       printf
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_factor:
        PUSH     {R4,LR}
        BL       read_pow_factor
        MOVS     R4,R0
        UXTB     R4,R4
        MOVS     R1,R4
        LDR      R0,??DataTable26_15
        BL       printf
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0x40590000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
debug_save:
        PUSH     {R7,LR}
        BL       save_elc_datas
        ADR      R0,??DataTable26_16  ;; 0x6F, 0x6B, 0x00, 0x00
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_u_i_p:
        PUSH     {R7,LR}
        BL       read_UIP
        LDR      R0,??DataTable25
        LDRH     R3,[R0, #+32]
        LDR      R0,??DataTable25
        LDR      R2,[R0, #+28]
        LDR      R0,??DataTable25
        LDRH     R1,[R0, #+26]
        LDR      R0,??DataTable26_17
        BL       printf
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_adc:
        PUSH     {R4,LR}
        BL       read_PWM_volt
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R1,R4
        LDR      R0,??DataTable26_18
        BL       printf
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     0xA1CAC083,0x3FFBB645

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_1:
        DC32     0x47AE147B,0x3F947AE1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_2:
        DC32     0x40668000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_3:
        DC32     0x4D12D84A,0x400921FB

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_4:
        DC32     0x4168e282

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_5:
        DC32     0x40100000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_6:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_7:
        DC32     rn8209c_papameter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_8:
        DC32     0x800fc00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_9:
        DC32     g_updateBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_10:
        DC32     0x48000400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_11:
        DC32     `?<Constant "hfconst %d\\r\\n,pstart %...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_12:
        DC32     `?<Constant "%s\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_13:
        DC32     `?<Constant "pwm =%d% \\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_14:
        DC32     `?<Constant "light_time = %d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_15:
        DC32     `?<Constant "factor = %d%">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_16:
        DC8      0x6F, 0x6B, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_17:
        DC32     `?<Constant "U = %d I = %d P = %d">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26_18:
        DC32     `?<Constant "adc = %d">`

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
//   892 bytes in section .rodata
// 2 534 bytes in section .text
// 
// 2 534 bytes of CODE  memory
//   892 bytes of CONST memory
//
//Errors: none
//Warnings: 1

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       12/Dec/2015  17:39:24
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  G:\git_hub_lamp\lamp_slave_git\APP\APL.c
//    Command line =  
//        G:\git_hub_lamp\lamp_slave_git\APP\APL.c -D USE_STDPERIPH_DRIVER -D
//        STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -D USE_LORA_MODE -lb
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
//    List file    =  G:\git_hub_lamp\lamp_slave_git\Debug\List\APL.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN CRC16_CCITT_Table
        EXTERN Delayms
        EXTERN FLASH_Write_chars
        EXTERN GDflash_64KByte_erase
        EXTERN GDflash_init
        EXTERN GDflash_read
        EXTERN GDflash_write
        EXTERN GetCRC16
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN flash_erase_page
        EXTERN phyVersion
        EXTERN printf
        EXTERN w_memcpy
        EXTERN w_memset

        PUBLIC FLASH_Write_update_page
        PUBLIC GPQA
        PUBLIC Ki
        PUBLIC Kp
        PUBLIC Ku
        PUBLIC PFCont
        PUBLIC ReadVersion
        PUBLIC SoftReset
        PUBLIC aplVersion
        PUBLIC apl_frame
        PUBLIC apl_update_process
        PUBLIC calibration
        PUBLIC check_update_packect_state
        PUBLIC check_update_state
        PUBLIC enegyDegree
        PUBLIC energyPulse
        PUBLIC get_packet_info
        PUBLIC init_update
        PUBLIC paralist
        PUBLIC phsA
        PUBLIC printf_params
        PUBLIC proceess_packet
        PUBLIC pstart
        PUBLIC qphsal
        PUBLIC read_flash
        PUBLIC read_update_flash
        PUBLIC reset_update_params
        PUBLIC set_update_packetState
        PUBLIC st_update
        PUBLIC update_software_check
        PUBLIC write_finish_debug
        PUBLIC write_update_flash


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SystemReset(void)
NVIC_SystemReset:
        PUSH     {LR}
        DSB      
        LDR      R0,??DataTable3  ;; 0x5fa0004
        LDR      R1,??DataTable3_1  ;; 0xe000ed0c
        STR      R0,[R1, #+0]
        DSB      
??NVIC_SystemReset_0:
        B        ??NVIC_SystemReset_0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
calibration:
        DATA
        DC8 "calibration:"
        DC8 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
pstart:
        DATA
        DC8 "pstart:"

        SECTION `.data`:DATA:REORDER:NOROOT(2)
GPQA:
        DATA
        DC8 "GPQA:"
        DC8 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
phsA:
        DATA
        DC8 "phsA:"
        DC8 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
qphsal:
        DATA
        DC8 "qphsal:"

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Ku:
        DATA
        DC8 "Ku:"

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Ki:
        DATA
        DC8 "Ki:"

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Kp:
        DATA
        DC8 "Kp:"

        SECTION `.data`:DATA:REORDER:NOROOT(2)
PFCont:
        DATA
        DC8 "PFCont"
        DC8 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
energyPulse:
        DATA
        DC8 "energyPulse:"
        DC8 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
enegyDegree:
        DATA
        DC8 "enegyDegree:"
        DC8 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
paralist:
        DATA
        DC32 calibration, pstart, GPQA, phsA, qphsal, Ku, Ki, Kp, PFCont
        DC32 energyPulse, enegyDegree

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
apl_frame:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
st_update:
        DS8 140

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update_process ">`:
        DATA
        DC8 "update_process "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "packet no error\\r\\n">`:
        DATA
        DC8 "packet no error\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update start\\r\\n">`:
        DATA
        DC8 "update start\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update version = %d, ...">`:
        DATA
        DC8 75H, 70H, 64H, 61H, 74H, 65H, 20H, 76H
        DC8 65H, 72H, 73H, 69H, 6FH, 6EH, 20H, 3DH
        DC8 20H, 25H, 64H, 2CH, 20H, 75H, 70H, 64H
        DC8 61H, 74H, 65H, 5FH, 74H, 6FH, 74H, 6FH
        DC8 61H, 6CH, 42H, 79H, 74H, 65H, 73H, 20H
        DC8 3DH, 20H, 25H, 64H, 2CH, 20H, 75H, 70H
        DC8 64H, 61H, 74H, 65H, 5FH, 74H, 6FH, 74H
        DC8 61H, 6CH, 50H, 61H, 63H, 6BH, 65H, 74H
        DC8 73H, 20H, 3DH, 20H, 25H, 64H, 0DH, 0AH
        DC8 0
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "the same packet\\r\\n">`:
        DATA
        DC8 "the same packet\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "receive higher versio...">`:
        DATA
        DC8 "receive higher version,update start\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update version = %d, ...">_1`:
        DATA
        DC8 "update version = %d, update_totalPackets = %d\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "packet length err\\r\\n">`:
        DATA
        DC8 "packet length err\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "packet number err\\r\\n">`:
        DATA
        DC8 "packet number err\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "write packet %d in fl...">`:
        DATA
        DC8 "write packet %d in flash\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "all packet received\\r\\n">`:
        DATA
        DC8 "all packet received\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update data OK\\r\\n">`:
        DATA
        DC8 "update data OK\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update crc err\\r\\n">`:
        DATA
        DC8 "update crc err\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "apl_version = %d\\r\\n">`:
        DATA
        DC8 "apl_version = %d\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "total_packets = %d\\r\\n">`:
        DATA
        DC8 "total_packets = %d\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "status = %d\\r\\n">`:
        DATA
        DC8 "status = %d\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "totoalBytes = %d\\r\\n">`:
        DATA
        DC8 "totoalBytes = %d\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "apl_packetsState = ">`:
        DATA
        DC8 "apl_packetsState = "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 " %d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update failed\\r\\n">`:
        DATA
        DC8 "update failed\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update successful\\r\\n">`:
        DATA
        DC8 "update successful\015\012"

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
        DC8 66, 82, 50, 51, 18, 18, 21, 0, 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_packet_info:
        LDRB     R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+1        ;; #+256
        MULS     R2,R3,R2
        LDRB     R3,[R0, #+1]
        ADDS     R2,R2,R3
        STRH     R2,[R1, #+6]
        LDRB     R2,[R0, #+2]
        MOVS     R3,#+128
        LSLS     R3,R3,#+1        ;; #+256
        MULS     R2,R3,R2
        LDRB     R3,[R0, #+3]
        ADDS     R2,R2,R3
        STRH     R2,[R1, #+2]
        LDRB     R2,[R0, #+4]
        MOVS     R3,#+128
        LSLS     R3,R3,#+1        ;; #+256
        MULS     R2,R3,R2
        LDRB     R3,[R0, #+5]
        ADDS     R2,R2,R3
        STRH     R2,[R1, #+0]
        LDRB     R2,[R0, #+6]
        MOVS     R3,#+128
        LSLS     R3,R3,#+1        ;; #+256
        MULS     R2,R3,R2
        LDRB     R3,[R0, #+7]
        ADDS     R2,R2,R3
        STRH     R2,[R1, #+4]
        LDRB     R2,[R0, #+8]
        STRB     R2,[R1, #+12]
        MOVS     R2,R0
        ADDS     R2,R2,#+9
        STR      R2,[R1, #+8]
        BX       LR               ;; return

        SECTION `.data`:DATA:REORDER:NOROOT(2)
apl_update_process:
        DATA
        DC32 0H, `?<Constant "update_process ">`
        DC32 process_thread_apl_update_process
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
process_thread_apl_update_process:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R1,#+1
        LDRH     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ      ??process_thread_apl_update_process_0
        CMP      R0,#+124
        BEQ      ??process_thread_apl_update_process_1
        B        ??process_thread_apl_update_process_2
??process_thread_apl_update_process_0:
        MOVS     R1,#+0
        MOVS     R0,#+124
        STRH     R0,[R4, #+0]
??process_thread_apl_update_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??process_thread_apl_update_process_3
        MOVS     R0,#+1
        B        ??process_thread_apl_update_process_4
??process_thread_apl_update_process_3:
        UXTB     R6,R6
        CMP      R6,#+134
        BNE      ??process_thread_apl_update_process_0
        LDR      R0,??DataTable4
        STR      R5,[R0, #+0]
        LDR      R1,??DataTable5
        LDR      R0,??DataTable4
        LDR      R0,[R0, #+0]
        BL       get_packet_info
        LDR      R0,??DataTable5
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable5
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BCC      ??process_thread_apl_update_process_5
        LDR      R0,??DataTable5_1
        BL       printf
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_5:
        LDR      R0,??DataTable5_2
        LDRB     R0,[R0, #+10]
        CMP      R0,#+0
        BNE      ??process_thread_apl_update_process_6
        LDR      R0,??DataTable5_3
        BL       printf
        LDR      R0,??DataTable5
        LDRB     R2,[R0, #+12]
        ADDS     R2,R2,#+9
        LDR      R0,??DataTable4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_4
        BL       w_memcpy
        BL       GDflash_64KByte_erase
        MOVS     R2,#+140
        MOVS     R1,#+0
        LDR      R0,??DataTable5_2
        BL       w_memset
        MOVS     R0,#+1
        LDR      R1,??DataTable5_2
        STRB     R0,[R1, #+10]
        LDR      R0,??DataTable5
        LDRH     R0,[R0, #+6]
        LDR      R1,??DataTable5_2
        STRH     R0,[R1, #+8]
        LDR      R0,??DataTable5
        LDRH     R0,[R0, #+2]
        LDR      R1,??DataTable5_2
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable5
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable5_2
        STRH     R0,[R1, #+2]
        MOVS     R0,#+1
        LDR      R1,??DataTable5_5
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable5_2
        LDRH     R3,[R0, #+2]
        LDR      R0,??DataTable5_2
        LDRH     R2,[R0, #+0]
        LDR      R0,??DataTable5_2
        LDRH     R1,[R0, #+8]
        LDR      R0,??DataTable5_6
        BL       printf
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_6:
        LDR      R0,??DataTable5_2
        LDRB     R0,[R0, #+10]
        CMP      R0,#+1
        BNE      ??process_thread_apl_update_process_7
??process_thread_apl_update_process_8:
        LDR      R0,??DataTable5_2
        LDRH     R0,[R0, #+8]
        LDR      R1,??DataTable5
        LDRH     R1,[R1, #+6]
        CMP      R0,R1
        BNE      ??process_thread_apl_update_process_9
        LDR      R0,??DataTable5
        LDRH     R0,[R0, #+4]
        BL       check_update_packect_state
        CMP      R0,#+1
        BNE      ??process_thread_apl_update_process_10
        LDR      R0,??DataTable6
        BL       printf
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_10:
        LDR      R1,??DataTable5_2
        LDR      R0,??DataTable5
        BL       proceess_packet
        LDR      R0,??DataTable5_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??process_thread_apl_update_process_11
        MOVS     R0,#+0
        LDR      R1,??DataTable5_5
        STRB     R0,[R1, #+0]
        LDR      R1,??DataTable5
        LDR      R0,??DataTable5_4
        BL       get_packet_info
        B        ??process_thread_apl_update_process_8
??process_thread_apl_update_process_11:
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_9:
        LDR      R0,??DataTable7
        BL       printf
        LDR      R0,??DataTable5
        LDRB     R2,[R0, #+12]
        ADDS     R2,R2,#+9
        LDR      R0,??DataTable4
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable5_4
        BL       w_memcpy
        BL       reset_update_params
        BL       GDflash_64KByte_erase
        MOVS     R0,#+1
        LDR      R1,??DataTable5_2
        STRB     R0,[R1, #+10]
        LDR      R0,??DataTable5
        LDRH     R0,[R0, #+6]
        LDR      R1,??DataTable5_2
        STRH     R0,[R1, #+8]
        LDR      R0,??DataTable5
        LDRH     R0,[R0, #+2]
        LDR      R1,??DataTable5_2
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable5
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable5_2
        STRH     R0,[R1, #+2]
        MOVS     R0,#+1
        LDR      R1,??DataTable5_5
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable5_2
        LDRH     R2,[R0, #+2]
        LDR      R0,??DataTable5_2
        LDRH     R1,[R0, #+8]
        LDR      R0,??DataTable8
        BL       printf
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_7:
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_2:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_apl_update_process_4:
        POP      {R4-R6,PC}       ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??buf:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??st_update_packet:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??g_updateBuffer:
        DS8 144

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??update_buf_full:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
proceess_packet:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDRH     R0,[R4, #+4]
        LDRH     R1,[R5, #+2]
        CMP      R0,R1
        BCS      ??proceess_packet_0
        LDRB     R0,[R4, #+12]
        CMP      R0,#+65
        BLT      ??proceess_packet_1
        LDR      R0,??DataTable8_1
        BL       printf
        B        ??proceess_packet_2
??proceess_packet_1:
        LDRH     R1,[R4, #+4]
        LDR      R0,??DataTable8_2
        BL       printf
        LDRB     R2,[R4, #+12]
        LDR      R1,[R4, #+8]
        LDRH     R0,[R4, #+4]
        BL       FLASH_Write_update_page
        LDRH     R0,[R4, #+4]
        BL       set_update_packetState
        LDRH     R0,[R5, #+2]
        BL       check_update_state
        CMP      R0,#+1
        BNE      ??proceess_packet_3
        B        ??proceess_packet_4
??proceess_packet_0:
        LDR      R0,??DataTable8_3
        BL       printf
        B        ??proceess_packet_2
??proceess_packet_4:
        LDR      R0,??DataTable8_4
        BL       printf
        LDRH     R0,[R4, #+2]
        BL       update_software_check
        CMP      R0,#+0
        BNE      ??proceess_packet_5
        MOVS     R0,#+2
        STRB     R0,[R5, #+10]
        MOVS     R0,R5
        BL       write_update_flash
        LDR      R0,??DataTable9
        BL       printf
        MOVS     R0,#+250
        LSLS     R0,R0,#+1        ;; #+500
        BL       Delayms
        BL       SoftReset
        B        ??proceess_packet_6
??proceess_packet_5:
        BL       reset_update_params
        LDR      R0,??DataTable10
        BL       printf
        B        ??proceess_packet_6
??proceess_packet_3:
        MOVS     R0,R5
        BL       write_update_flash
??proceess_packet_6:
??proceess_packet_2:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_flash:
        PUSH     {R4,LR}
        MOVS     R3,#+0
??read_flash_0:
        UXTH     R3,R3
        UXTH     R2,R2
        CMP      R3,R2
        BCS      ??read_flash_1
        UXTH     R3,R3
        LDRB     R4,[R0, R3]
        UXTH     R3,R3
        STRB     R4,[R1, R3]
        ADDS     R3,R3,#+1
        B        ??read_flash_0
??read_flash_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_update_flash:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        LDR      R4,??DataTable11  ;; 0x800f400
        LDRB     R0,[R4, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDRB     R1,[R4, #+1]
        ADDS     R0,R0,R1
        STRH     R0,[R5, #+8]
        LDRB     R0,[R4, #+2]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDRB     R1,[R4, #+3]
        ADDS     R0,R0,R1
        STRH     R0,[R5, #+0]
        LDRB     R0,[R4, #+4]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        LDRB     R1,[R4, #+5]
        ADDS     R0,R0,R1
        STRH     R0,[R5, #+2]
        LDRB     R0,[R4, #+6]
        STRB     R0,[R5, #+10]
        MOVS     R0,#+135
        LDRB     R0,[R4, R0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R0,R1,R0
        MOVS     R1,#+136
        LDRB     R1,[R4, R1]
        ADDS     R0,R0,R1
        STRH     R0,[R5, #+6]
        MOVS     R2,#+128
        MOVS     R1,R4
        ADDS     R1,R1,#+7
        MOVS     R0,R5
        ADDS     R0,R0,#+11
        BL       w_memcpy
        MOVS     R1,#+135
        MOVS     R0,R5
        BL       GetCRC16
        LDRH     R1,[R5, #+6]
        CMP      R0,R1
        BNE      ??read_update_flash_0
        MOVS     R6,#+1
        B        ??read_update_flash_1
??read_update_flash_0:
        MOVS     R6,#+0
??read_update_flash_1:
        MOVS     R0,R6
        UXTB     R0,R0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x5fa0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0xe000ed0c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
write_update_flash:
        PUSH     {R4,LR}
        SUB      SP,SP,#+144
        MOVS     R4,R0
        LDRH     R0,[R4, #+8]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idiv
        MOV      R1,SP
        STRB     R0,[R1, #+0]
        LDRH     R0,[R4, #+8]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_idivmod
        MOV      R0,SP
        STRB     R1,[R0, #+1]
        LDRH     R0,[R4, #+0]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+2]
        LDRH     R0,[R4, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+3]
        LDRH     R0,[R4, #+2]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        LDRH     R0,[R4, #+2]
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        LDRB     R0,[R4, #+10]
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOVS     R2,#+128
        MOVS     R1,R4
        ADDS     R1,R1,#+11
        MOV      R0,SP
        ADDS     R0,R0,#+7
        BL       w_memcpy
        MOVS     R1,#+135
        MOV      R0,SP
        BL       GetCRC16
        STRH     R0,[R4, #+6]
        LDRH     R0,[R4, #+6]
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        MOV      R1,SP
        ADDS     R1,R1,#+135
        STRB     R0,[R1, #+0]
        LDRH     R0,[R4, #+6]
        MOV      R1,SP
        ADDS     R1,R1,#+136
        STRB     R0,[R1, #+0]
        LDR      R0,??DataTable11  ;; 0x800f400
        BL       flash_erase_page
        CMP      R0,#+4
        BNE      ??write_update_flash_0
        MOVS     R2,#+137
        MOV      R1,SP
        LDR      R0,??DataTable11  ;; 0x800f400
        BL       FLASH_Write_chars
??write_update_flash_0:
        ADD      SP,SP,#+144
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     ??buf

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
write_finish_debug:
        PUSH     {LR}
        SUB      SP,SP,#+140
        MOVS     R0,#+5
        MOV      R1,SP
        STRH     R0,[R1, #+8]
        LDR      R0,??DataTable11_1  ;; 0x2cf
        MOV      R1,SP
        STRH     R0,[R1, #+4]
        LDR      R0,??DataTable11_2  ;; 0xb3d6
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOVS     R0,#+180
        LSLS     R0,R0,#+2        ;; #+720
        MOV      R1,SP
        STRH     R0,[R1, #+2]
        MOVS     R0,#+2
        MOV      R1,SP
        STRB     R0,[R1, #+10]
        MOV      R0,SP
        BL       write_update_flash
        ADD      SP,SP,#+140
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     ??st_update_packet

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     `?<Constant "packet no error\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     st_update

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     `?<Constant "update start\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     ??g_updateBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     ??update_buf_full

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     `?<Constant "update version = %d, ...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
printf_params:
        PUSH     {R4,LR}
        LDR      R0,??DataTable12
        LDRH     R1,[R0, #+8]
        LDR      R0,??DataTable11_3
        BL       printf
        LDR      R0,??DataTable12
        LDRH     R1,[R0, #+2]
        LDR      R0,??DataTable11_4
        BL       printf
        LDR      R0,??DataTable12
        LDRB     R1,[R0, #+10]
        LDR      R0,??DataTable12_1
        BL       printf
        LDR      R0,??DataTable12
        LDRH     R1,[R0, #+0]
        LDR      R0,??DataTable12_2
        BL       printf
        LDR      R0,??DataTable12_3
        BL       printf
        MOVS     R4,#+0
??printf_params_0:
        UXTH     R4,R4
        CMP      R4,#+128
        BGE      ??printf_params_1
        UXTH     R4,R4
        LDR      R0,??DataTable12
        ADDS     R0,R0,R4
        LDRB     R1,[R0, #+11]
        ADR      R0,??DataTable12_4  ;; " %d"
        BL       printf
        ADDS     R4,R4,#+1
        B        ??printf_params_0
??printf_params_1:
        ADR      R0,??DataTable12_5  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     `?<Constant "the same packet\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
reset_update_params:
        PUSH     {R7,LR}
        MOVS     R2,#+140
        MOVS     R1,#+0
        LDR      R0,??DataTable12
        BL       w_memset
        LDR      R0,??DataTable12
        BL       write_update_flash
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     `?<Constant "receive higher versio...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
update_software_check:
        PUSH     {R0,R4-R7,LR}
        SUB      SP,SP,#+8
        LDR      R5,??DataTable12_6  ;; 0xffff
        MOV      R0,SP
        LDRH     R0,[R0, #+8]
        SUBS     R6,R0,#+2
        MOVS     R4,#+0
??update_software_check_0:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTH     R0,R0
        CMP      R0,#+0
        BEQ      ??update_software_check_1
        MOVS     R2,#+1
        MOV      R1,SP
        MOVS     R0,R4
        BL       GDflash_read
        ADDS     R4,R4,#+1
        MOVS     R0,R5
        UXTH     R0,R0
        LSRS     R0,R0,#+8
        UXTH     R5,R5
        MOV      R1,SP
        LDRB     R1,[R1, #+0]
        EORS     R1,R1,R5
        UXTB     R1,R1
        MOVS     R2,#+2
        MULS     R1,R2,R1
        LDR      R2,??DataTable12_7
        LDRH     R5,[R2, R1]
        EORS     R5,R5,R0
        B        ??update_software_check_0
??update_software_check_1:
        MOVS     R0,R5
        LDR      R5,??DataTable12_6  ;; 0xffff
        EORS     R5,R5,R0
        MOVS     R2,#+1
        MOV      R1,SP
        MOVS     R0,R4
        BL       GDflash_read
        ADDS     R4,R4,#+1
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        MULS     R1,R0,R1
        MOVS     R7,R1
        MOVS     R2,#+1
        MOV      R1,SP
        MOVS     R0,R4
        BL       GDflash_read
        ADDS     R4,R4,#+1
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        ADDS     R7,R7,R0
        UXTH     R5,R5
        UXTH     R7,R7
        CMP      R5,R7
        BNE      ??update_software_check_2
        MOVS     R0,#+0
        B        ??update_software_check_3
??update_software_check_2:
        MOVS     R0,#+1
??update_software_check_3:
        POP      {R1-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     `?<Constant "update version = %d, ...">_1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     `?<Constant "packet length err\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     `?<Constant "write packet %d in fl...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     `?<Constant "packet number err\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     `?<Constant "all packet received\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
init_update:
        PUSH     {R7,LR}
        BL       GDflash_init
        LDR      R0,??DataTable12
        BL       read_update_flash
        LDR      R0,??DataTable12
        LDRB     R0,[R0, #+10]
        CMP      R0,#+0
        BEQ      ??init_update_0
        CMP      R0,#+2
        BEQ      ??init_update_1
        BCC      ??init_update_2
        CMP      R0,#+4
        BEQ      ??init_update_3
        BCC      ??init_update_4
        B        ??init_update_5
??init_update_2:
        LDR      R0,??DataTable12
        LDRH     R0,[R0, #+0]
        CMP      R0,#+0
        BNE      ??init_update_6
        BL       reset_update_params
??init_update_6:
        B        ??init_update_7
??init_update_1:
        B        ??init_update_7
??init_update_0:
        MOVS     R2,#+140
        MOVS     R1,#+0
        LDR      R0,??DataTable12
        BL       w_memset
        B        ??init_update_7
??init_update_3:
        LDR      R0,??DataTable12_8
        BL       printf
        BL       reset_update_params
        B        ??init_update_7
??init_update_4:
        LDR      R0,??DataTable12_9
        BL       printf
        BL       reset_update_params
        B        ??init_update_7
??init_update_5:
        BL       reset_update_params
??init_update_7:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     `?<Constant "update data OK\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_update_packetState:
        PUSH     {R4-R7,LR}
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable12
        ADDS     R5,R1,R0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable12
        ADDS     R0,R1,R0
        LDRB     R6,[R0, #+11]
        MOVS     R7,#+1
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+8
        BL       __aeabi_idivmod
        LSLS     R7,R7,R1
        ORRS     R7,R7,R6
        STRB     R7,[R5, #+11]
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     `?<Constant "update crc err\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
check_update_packect_state:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable12
        ADDS     R0,R1,R0
        LDRB     R5,[R0, #+11]
        MOVS     R6,#+1
        UXTH     R4,R4
        MOVS     R0,R4
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
??DataTable11:
        DC32     0x800f400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x2cf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0xb3d6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     `?<Constant "apl_version = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     `?<Constant "total_packets = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
check_update_state:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
??check_update_state_0:
        UXTH     R5,R5
        UXTH     R4,R4
        CMP      R5,R4
        BCS      ??check_update_state_1
        MOVS     R0,R5
        UXTH     R0,R0
        BL       check_update_packect_state
        CMP      R0,#+0
        BNE      ??check_update_state_2
        MOVS     R0,#+0
        B        ??check_update_state_3
??check_update_state_2:
        ADDS     R5,R5,#+1
        B        ??check_update_state_0
??check_update_state_1:
        MOVS     R0,#+1
??check_update_state_3:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Write_update_page:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        UXTH     R4,R4
        MOVS     R7,#+64
        MULS     R7,R4,R7
        CPSID    I
        UXTB     R5,R5
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R7
        BL       GDflash_write
        CPSIE    I
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
ReadVersion:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR      R0,??DataTable12_10
        LDRB     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable12_10
        LDRB     R0,[R0, #+1]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable12_10
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable12_10
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable12_10
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable12_10
        LDRB     R0,[R0, #+5]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable12_10
        LDRB     R0,[R0, #+6]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable12_10
        LDRB     R0,[R0, #+7]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable12_10
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
        LDR      R0,??DataTable12_11
        BL       printf
        LDR      R0,??DataTable12_12
        LDRB     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable12_12
        LDRB     R0,[R0, #+1]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable12_12
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable12_12
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable12_12
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable12_12
        LDRB     R0,[R0, #+5]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable12_12
        LDRB     R0,[R0, #+6]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable12_12
        LDRB     R0,[R0, #+7]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable12_12
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
        LDR      R0,??DataTable12_13
        BL       printf
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     st_update

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     `?<Constant "status = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     `?<Constant "totoalBytes = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     `?<Constant "apl_packetsState = ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC8      " %d"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     CRC16_CCITT_Table

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     `?<Constant "update failed\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_9:
        DC32     `?<Constant "update successful\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_10:
        DC32     aplVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_11:
        DC32     `?<Constant "APL Version=%c%c%c%c-...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_12:
        DC32     phyVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_13:
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
//   317 bytes in section .bss
//   160 bytes in section .data
//   620 bytes in section .rodata
// 1 808 bytes in section .text
// 
// 1 808 bytes of CODE  memory
//   620 bytes of CONST memory
//   477 bytes of DATA  memory
//
//Errors: none
//Warnings: 1

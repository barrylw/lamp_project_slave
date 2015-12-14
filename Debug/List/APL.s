///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:15:32
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\APP\APL.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\APP\APL.c -D USE_STDPERIPH_DRIVER -D
//        STM32F030X8 -D AUTOSTART_ENABLE -D USE_LORA_MODE -D PRINTF_DEBUG -lb
//        F:\cloneSlave\lamp_project_slave\Debug\List\ --diag_suppress Pa050 -o
//        F:\cloneSlave\lamp_project_slave\Debug\Obj\ --no_cse --no_unroll
//        --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M0 -e --fpu=None
//        --dlib_config "F:\Program Files (x86)\IAR Systems\Embedded Workbench
//        7.0\arm\INC\c\DLib_Config_Normal.h" -I
//        F:\cloneSlave\lamp_project_slave\APP\ -I
//        F:\cloneSlave\lamp_project_slave\LIB\STM32F0xx_StdPeriph_Driver\inc\
//        -I
//        F:\cloneSlave\lamp_project_slave\LIB\CMSIS\CM0\DeviceSupport\ST\STM32F0xx\
//        -I F:\cloneSlave\lamp_project_slave\LIB\CMSIS\CM0\CoreSupport\ -I
//        F:\cloneSlave\lamp_project_slave\core\ -I
//        F:\cloneSlave\lamp_project_slave\core\sys\ -I
//        F:\cloneSlave\lamp_project_slave\platform\ -I
//        F:\cloneSlave\lamp_project_slave\core\lib\ -I
//        F:\cloneSlave\lamp_project_slave\tools\wpcapslip\ -I
//        F:\cloneSlave\lamp_project_slave\core\cfs\ -I
//        F:\cloneSlave\lamp_project_slave\OLED\ -I
//        F:\cloneSlave\lamp_project_slave\coffee_arch\ -On -I "F:\Program
//        Files (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\APL.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN CRC16_CCITT_Table
        EXTERN FLASH_ErasePage
        EXTERN FLASH_Write_chars
        EXTERN GDflash_64KByte_erase
        EXTERN GDflash_init
        EXTERN GDflash_read
        EXTERN GDflash_write
        EXTERN GetCRC16
        EXTERN __aeabi_idiv
        EXTERN __aeabi_idivmod
        EXTERN etimer_set
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
        LDR      R1,??DataTable4  ;; 0xe000ed0c
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
`?<Constant "the same packet\\r\\n">`:
        DATA
        DC8 "the same packet\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update data OK, start...">`:
        DATA
        DC8 "update data OK, start update\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "receive higher versio...">`:
        DATA
        DC8 "receive higher version,update start\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "packet length err\\r\\n">`:
        DATA
        DC8 "packet length err\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "packet number err\\r\\n">`:
        DATA
        DC8 "packet number err\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "write in flash packet...">`:
        DATA
        DC8 "write in flash packet number = %d \015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "update crc err\\r\\n">`:
        DATA
        DC8 "update crc err\015\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "wait update packets\\r\\n">`:
        DATA
        DC8 "wait update packets\015\012"
        DC8 0, 0

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
`?<Constant "packet %d not have\\r\\n">`:
        DATA
        DC8 "packet %d not have\015\012"
        DC8 0, 0, 0

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
        DC8 66, 82, 50, 51, 18, 18, 21, 17, 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
get_packet_info:
        LDRB     R2,[R0, #+0]
        MOVS     R3,#+128
        LSLS     R3,R3,#+1        ;; #+256
        MULS     R2,R3,R2
        LDRB     R3,[R0, #+1]
        ADDS     R2,R2,R3
        STRH     R2,[R1, #+0]
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
        STRH     R2,[R1, #+4]
        LDRB     R2,[R0, #+6]
        MOVS     R3,#+128
        LSLS     R3,R3,#+1        ;; #+256
        MULS     R2,R3,R2
        LDRB     R3,[R0, #+7]
        ADDS     R2,R2,R3
        STRH     R2,[R1, #+6]
        LDRB     R2,[R0, #+8]
        STRB     R2,[R1, #+8]
        MOVS     R2,R0
        ADDS     R2,R2,#+9
        STR      R2,[R1, #+12]
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
        CMP      R0,#+125
        BEQ      ??process_thread_apl_update_process_1
        CMP      R0,#+176
        BEQ      ??process_thread_apl_update_process_2
        CMP      R0,#+193
        BNE      .+4
        B        ??process_thread_apl_update_process_3
        B        ??process_thread_apl_update_process_4
??process_thread_apl_update_process_0:
        MOVS     R1,#+0
        MOVS     R0,#+125
        STRH     R0,[R4, #+0]
??process_thread_apl_update_process_1:
        UXTB     R1,R1
        CMP      R1,#+0
        BNE      ??process_thread_apl_update_process_5
        MOVS     R0,#+1
        B        ??process_thread_apl_update_process_6
??process_thread_apl_update_process_5:
        UXTB     R6,R6
        CMP      R6,#+134
        BNE      ??process_thread_apl_update_process_0
        LDR      R0,??DataTable5
        STR      R5,[R0, #+0]
        LDR      R1,??DataTable5_1
        LDR      R0,??DataTable5
        LDR      R0,[R0, #+0]
        BL       get_packet_info
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+6]
        LDR      R1,??DataTable5_1
        LDRH     R1,[R1, #+4]
        CMP      R0,R1
        BCC      ??process_thread_apl_update_process_7
        LDR      R0,??DataTable5_2
        BL       printf
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_7:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+8]
        CMP      R0,#+0
        BNE      ??process_thread_apl_update_process_8
        LDR      R0,??DataTable5_3
        BL       printf
        LDR      R0,??DataTable5_1
        LDRB     R2,[R0, #+8]
        ADDS     R2,R2,#+9
        LDR      R0,??DataTable5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable6_1
        BL       w_memcpy
        BL       GDflash_64KByte_erase
        MOVS     R2,#+140
        MOVS     R1,#+0
        LDR      R0,??DataTable6
        BL       w_memset
        MOVS     R0,#+1
        LDR      R1,??DataTable6
        STRB     R0,[R1, #+8]
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+2]
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+2]
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+4]
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+0]
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_8:
        LDR      R0,??DataTable6
        LDRB     R0,[R0, #+8]
        CMP      R0,#+1
        BNE      ??process_thread_apl_update_process_9
??process_thread_apl_update_process_10:
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable5_1
        LDRH     R1,[R1, #+0]
        CMP      R0,R1
        BNE      ??process_thread_apl_update_process_11
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+6]
        BL       check_update_packect_state
        CMP      R0,#+1
        BNE      ??process_thread_apl_update_process_12
        LDR      R0,??DataTable7_1
        BL       printf
        LDR      R0,??DataTable6
        LDRH     R0,[R0, #+4]
        BL       check_update_state
        CMP      R0,#+1
        BNE      ??process_thread_apl_update_process_13
        LDR      R0,??DataTable7_2
        BL       printf
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        LDR      R0,??DataTable7_3
        BL       etimer_set
        MOVS     R1,#+0
        MOVS     R0,#+176
        STRH     R0,[R4, #+0]
??process_thread_apl_update_process_2:
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??process_thread_apl_update_process_14
        UXTB     R6,R6
        CMP      R6,#+136
        BNE      ??process_thread_apl_update_process_14
        LDR      R0,??DataTable7_3
        CMP      R5,R0
        BEQ      ??process_thread_apl_update_process_15
??process_thread_apl_update_process_14:
        MOVS     R0,#+1
        B        ??process_thread_apl_update_process_6
??process_thread_apl_update_process_15:
        BL       SoftReset
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_13:
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_12:
        LDR      R1,??DataTable6
        LDR      R0,??DataTable5_1
        BL       proceess_packet
        CMP      R0,#+1
        BNE      ??process_thread_apl_update_process_16
        LDR      R0,??DataTable7_2
        BL       printf
        MOVS     R1,#+250
        LSLS     R1,R1,#+1        ;; #+500
        LDR      R0,??DataTable7_3
        BL       etimer_set
        MOVS     R1,#+0
        MOVS     R0,#+193
        STRH     R0,[R4, #+0]
??process_thread_apl_update_process_3:
        UXTB     R1,R1
        CMP      R1,#+0
        BEQ      ??process_thread_apl_update_process_17
        UXTB     R6,R6
        CMP      R6,#+136
        BNE      ??process_thread_apl_update_process_17
        LDR      R0,??DataTable7_3
        CMP      R5,R0
        BEQ      ??process_thread_apl_update_process_18
??process_thread_apl_update_process_17:
        MOVS     R0,#+1
        B        ??process_thread_apl_update_process_6
??process_thread_apl_update_process_18:
        BL       SoftReset
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_16:
        LDR      R0,??DataTable7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE      ??process_thread_apl_update_process_19
        MOVS     R0,#+0
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+0]
        LDR      R1,??DataTable5_1
        LDR      R0,??DataTable6_1
        BL       get_packet_info
        B        ??process_thread_apl_update_process_10
??process_thread_apl_update_process_19:
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_11:
        LDR      R0,??DataTable8
        BL       printf
        LDR      R0,??DataTable5_1
        LDRB     R2,[R0, #+8]
        ADDS     R2,R2,#+9
        LDR      R0,??DataTable5
        LDR      R1,[R0, #+0]
        LDR      R0,??DataTable6_1
        BL       w_memcpy
        BL       reset_update_params
        BL       GDflash_64KByte_erase
        MOVS     R0,#+1
        LDR      R1,??DataTable6
        STRB     R0,[R1, #+8]
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+0]
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+2]
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+2]
        LDR      R0,??DataTable5_1
        LDRH     R0,[R0, #+4]
        LDR      R1,??DataTable6
        STRH     R0,[R1, #+4]
        MOVS     R0,#+1
        LDR      R1,??DataTable7
        STRB     R0,[R1, #+0]
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_9:
        B        ??process_thread_apl_update_process_0
??process_thread_apl_update_process_4:
        MOVS     R0,#+0
        MOVS     R1,R0
        MOVS     R0,#+0
        STRH     R0,[R4, #+0]
        MOVS     R0,#+3
??process_thread_apl_update_process_6:
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

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??update_timer:
        DS8 16

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
proceess_packet:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDRH     R0,[R4, #+6]
        LDRH     R1,[R5, #+4]
        CMP      R0,R1
        BCS      ??proceess_packet_0
        LDRB     R0,[R4, #+8]
        CMP      R0,#+65
        BLT      ??proceess_packet_1
        LDR      R0,??DataTable11
        BL       printf
        MOVS     R0,#+0
        B        ??proceess_packet_2
??proceess_packet_1:
        LDRH     R1,[R4, #+6]
        LDR      R0,??DataTable11_1
        BL       printf
        LDRB     R2,[R4, #+8]
        LDR      R1,[R4, #+12]
        LDRH     R0,[R4, #+6]
        BL       FLASH_Write_update_page
        LDRH     R0,[R4, #+6]
        BL       set_update_packetState
        LDRH     R0,[R5, #+4]
        BL       check_update_state
        CMP      R0,#+1
        BNE      ??proceess_packet_3
        B        ??proceess_packet_4
??proceess_packet_0:
        LDR      R0,??DataTable12
        BL       printf
        MOVS     R0,#+0
        B        ??proceess_packet_2
??proceess_packet_4:
        LDRH     R0,[R4, #+2]
        BL       update_software_check
        CMP      R0,#+0
        BNE      ??proceess_packet_5
        MOVS     R0,#+2
        STRB     R0,[R5, #+8]
        MOVS     R0,R5
        BL       write_update_flash
        MOVS     R0,#+1
        B        ??proceess_packet_2
??proceess_packet_5:
        LDR      R0,??DataTable12_1
        BL       printf
        BL       reset_update_params
        MOVS     R0,#+0
        B        ??proceess_packet_2
??proceess_packet_3:
        LDR      R0,??DataTable12_2
        BL       printf
        MOVS     R0,R5
        BL       write_update_flash
        MOVS     R0,#+0
??proceess_packet_2:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
read_update_flash:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R2,#+140
        LDR      R1,??DataTable12_3  ;; 0x800f400
        MOVS     R0,R4
        BL       w_memcpy
        MOVS     R1,#+138
        MOVS     R0,R4
        BL       GetCRC16
        MOVS     R1,#+138
        LDRH     R1,[R4, R1]
        CMP      R0,R1
        BNE      ??read_update_flash_0
        MOVS     R5,#+1
        B        ??read_update_flash_1
??read_update_flash_0:
        MOVS     R5,#+0
??read_update_flash_1:
        MOVS     R0,R5
        UXTB     R0,R0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x5fa0004

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
write_update_flash:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R1,#+138
        MOVS     R0,R4
        BL       GetCRC16
        MOVS     R1,#+138
        STRH     R0,[R4, R1]
        LDR      R0,??DataTable12_3  ;; 0x800f400
        BL       FLASH_ErasePage
        CMP      R0,#+4
        BNE      ??write_update_flash_0
        MOVS     R2,#+140
        MOVS     R1,R4
        LDR      R0,??DataTable12_3  ;; 0x800f400
        BL       FLASH_Write_chars
??write_update_flash_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0xe000ed0c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
write_finish_debug:
        PUSH     {LR}
        SUB      SP,SP,#+140
        MOVS     R0,#+5
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        LDR      R0,??DataTable12_4  ;; 0x2cf
        MOV      R1,SP
        STRH     R0,[R1, #+6]
        LDR      R0,??DataTable12_5  ;; 0xb3d6
        MOV      R1,SP
        STRH     R0,[R1, #+2]
        MOVS     R0,#+180
        LSLS     R0,R0,#+2        ;; #+720
        MOV      R1,SP
        STRH     R0,[R1, #+4]
        MOVS     R0,#+2
        MOV      R1,SP
        STRB     R0,[R1, #+8]
        MOV      R0,SP
        BL       write_update_flash
        ADD      SP,SP,#+140
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     ??buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     ??st_update_packet

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     `?<Constant "packet no error\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     `?<Constant "update start\\r\\n">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
printf_params:
        PUSH     {R4,LR}
        LDR      R0,??DataTable6
        LDRH     R1,[R0, #+0]
        LDR      R0,??DataTable12_6
        BL       printf
        LDR      R0,??DataTable6
        LDRH     R1,[R0, #+4]
        LDR      R0,??DataTable12_7
        BL       printf
        LDR      R0,??DataTable6
        LDRB     R1,[R0, #+8]
        LDR      R0,??DataTable12_8
        BL       printf
        LDR      R0,??DataTable6
        LDRH     R1,[R0, #+2]
        LDR      R0,??DataTable13
        BL       printf
        LDR      R0,??DataTable13_1
        BL       printf
        MOVS     R4,#+0
??printf_params_0:
        UXTH     R4,R4
        CMP      R4,#+128
        BGE      ??printf_params_1
        UXTH     R4,R4
        LDR      R0,??DataTable6
        ADDS     R0,R0,R4
        LDRB     R1,[R0, #+9]
        ADR      R0,??DataTable13_2  ;; " %d"
        BL       printf
        ADDS     R4,R4,#+1
        B        ??printf_params_0
??printf_params_1:
        ADR      R0,??DataTable13_3  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     st_update

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     ??g_updateBuffer

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
reset_update_params:
        PUSH     {R7,LR}
        MOVS     R2,#+140
        MOVS     R1,#+0
        LDR      R0,??DataTable13_4
        BL       w_memset
        LDR      R0,??DataTable13_4
        BL       write_update_flash
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     ??update_buf_full

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     `?<Constant "the same packet\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     `?<Constant "update data OK, start...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     ??update_timer

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
update_software_check:
        PUSH     {R0,R4-R7,LR}
        SUB      SP,SP,#+8
        LDR      R5,??DataTable13_5  ;; 0xffff
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
        LDR      R2,??DataTable13_6
        LDRH     R5,[R2, R1]
        EORS     R5,R5,R0
        B        ??update_software_check_0
??update_software_check_1:
        MOVS     R0,R5
        LDR      R5,??DataTable13_5  ;; 0xffff
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
        DC32     `?<Constant "receive higher versio...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
init_update:
        PUSH     {R7,LR}
        BL       GDflash_init
        LDR      R0,??DataTable13_4
        BL       read_update_flash
        LDR      R0,??DataTable13_4
        LDRB     R0,[R0, #+8]
        CMP      R0,#+0
        BEQ      ??init_update_0
        CMP      R0,#+1
        BEQ      ??init_update_1
        CMP      R0,#+3
        BEQ      ??init_update_2
        CMP      R0,#+4
        BEQ      ??init_update_3
        B        ??init_update_4
??init_update_1:
        LDR      R0,??DataTable13_4
        LDRH     R0,[R0, #+2]
        CMP      R0,#+0
        BNE      ??init_update_5
        BL       reset_update_params
??init_update_5:
        B        ??init_update_6
??init_update_0:
        MOVS     R2,#+140
        MOVS     R1,#+0
        LDR      R0,??DataTable13_4
        BL       w_memset
        B        ??init_update_6
??init_update_3:
        LDR      R0,??DataTable13_7
        BL       printf
        BL       reset_update_params
        B        ??init_update_6
??init_update_2:
        LDR      R0,??DataTable13_8
        BL       printf
        BL       reset_update_params
        B        ??init_update_6
??init_update_4:
        BL       reset_update_params
??init_update_6:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
set_update_packetState:
        PUSH     {R4-R7,LR}
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable13_4
        ADDS     R5,R1,R0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable13_4
        ADDS     R0,R1,R0
        LDRB     R6,[R0, #+9]
        MOVS     R7,#+1
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+8
        BL       __aeabi_idivmod
        LSLS     R7,R7,R1
        ORRS     R7,R7,R6
        STRB     R7,[R5, #+9]
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
check_update_packect_state:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        UXTH     R4,R4
        MOVS     R0,R4
        MOVS     R1,#+8
        BL       __aeabi_idiv
        LDR      R1,??DataTable13_4
        ADDS     R0,R1,R0
        LDRB     R5,[R0, #+9]
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
        DC32     `?<Constant "packet length err\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     `?<Constant "write in flash packet...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
check_update_state:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,#+0
??check_update_state_0:
        UXTH     R4,R4
        UXTH     R5,R5
        CMP      R4,R5
        BCS      ??check_update_state_1
        MOVS     R0,R4
        UXTH     R0,R0
        BL       check_update_packect_state
        CMP      R0,#+0
        BNE      ??check_update_state_2
        UXTH     R4,R4
        MOVS     R1,R4
        LDR      R0,??DataTable13_9
        BL       printf
        MOVS     R0,#+0
        B        ??check_update_state_3
??check_update_state_2:
        ADDS     R4,R4,#+1
        B        ??check_update_state_0
??check_update_state_1:
        MOVS     R0,#+1
??check_update_state_3:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     `?<Constant "packet number err\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     `?<Constant "update crc err\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     `?<Constant "wait update packets\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0x800f400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0x2cf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0xb3d6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     `?<Constant "apl_version = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_7:
        DC32     `?<Constant "total_packets = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_8:
        DC32     `?<Constant "status = %d\\r\\n">`

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
        LDR      R0,??DataTable13_10
        LDRB     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable13_10
        LDRB     R0,[R0, #+1]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable13_10
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable13_10
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable13_10
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable13_10
        LDRB     R0,[R0, #+5]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable13_10
        LDRB     R0,[R0, #+6]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable13_10
        LDRB     R0,[R0, #+7]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable13_10
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
        LDR      R0,??DataTable13_11
        BL       printf
        LDR      R0,??DataTable13_12
        LDRB     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable13_12
        LDRB     R0,[R0, #+1]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable13_12
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable13_12
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable13_12
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable13_12
        LDRB     R0,[R0, #+5]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable13_12
        LDRB     R0,[R0, #+6]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable13_12
        LDRB     R0,[R0, #+7]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable13_12
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
        LDR      R0,??DataTable13_13
        BL       printf
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     `?<Constant "totoalBytes = %d\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     `?<Constant "apl_packetsState = ">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC8      " %d"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC8      0x0D, 0x0A, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     st_update

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     CRC16_CCITT_Table

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     `?<Constant "update failed\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     `?<Constant "update successful\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     `?<Constant "packet %d not have\\r\\n">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     aplVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_11:
        DC32     `?<Constant "APL Version=%c%c%c%c-...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_12:
        DC32     phyVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_13:
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
//   333 bytes in section .bss
//   160 bytes in section .data
//   544 bytes in section .rodata
// 1 706 bytes in section .text
// 
// 1 706 bytes of CODE  memory
//   544 bytes of CONST memory
//   493 bytes of DATA  memory
//
//Errors: none
//Warnings: none

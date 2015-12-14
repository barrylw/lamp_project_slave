///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:07
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\APP\common.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\APP\common.c -D USE_STDPERIPH_DRIVER
//        -D STM32F030X8 -D AUTOSTART_ENABLE -D USE_LORA_MODE -D PRINTF_DEBUG
//        -lb F:\cloneSlave\lamp_project_slave\Debug\List\ --diag_suppress
//        Pa050 -o F:\cloneSlave\lamp_project_slave\Debug\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
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
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\common.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN IWDG_ReloadCounter
        EXTERN WWDG_SetCounter
        EXTERN g_SystickCounter

        PUBLIC CRC16_CCITT_Table
        PUBLIC Delayms
        PUBLIC Delayus
        PUBLIC GetCRC16
        PUBLIC MemCpy
        PUBLIC MemSet
        PUBLIC `cmp`
        PUBLIC getSum
        PUBLIC w_memcpy
        PUBLIC w_memset


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp u32 hal_GetSystickCounter(void)
hal_GetSystickCounter:
        LDR      R0,??DataTable1
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
CRC16_CCITT_Table:
        DATA
        DC16 0, 4489, 8978, 12955, 17956, 22445, 25910, 29887, 35912, 40385
        DC16 44890, 48851, 51820, 56293, 59774, 63735, 4225, 264, 13203, 8730
        DC16 22181, 18220, 30135, 25662, 40137, 36160, 49115, 44626, 56045
        DC16 52068, 63999, 59510, 8450, 12427, 528, 5017, 26406, 30383, 17460
        DC16 21949, 44362, 48323, 36440, 40913, 60270, 64231, 51324, 55797
        DC16 12675, 8202, 4753, 792, 30631, 26158, 21685, 17724, 48587, 44098
        DC16 40665, 36688, 64495, 60006, 55549, 51572, 16900, 21389, 24854
        DC16 28831, 1056, 5545, 10034, 14011, 52812, 57285, 60766, 64727, 34920
        DC16 39393, 43898, 47859, 21125, 17164, 29079, 24606, 5281, 1320, 14259
        DC16 9786, 57037, 53060, 64991, 60502, 39145, 35168, 48123, 43634
        DC16 25350, 29327, 16404, 20893, 9506, 13483, 1584, 6073, 61262, 65223
        DC16 52316, 56789, 43370, 47331, 35448, 39921, 29575, 25102, 20629
        DC16 16668, 13731, 9258, 5809, 1848, 65487, 60998, 56541, 52564, 47595
        DC16 43106, 39673, 35696, 33800, 38273, 42778, 46739, 49708, 54181
        DC16 57662, 61623, 2112, 6601, 11090, 15067, 20068, 24557, 28022, 31999
        DC16 38025, 34048, 47003, 42514, 53933, 49956, 61887, 57398, 6337, 2376
        DC16 15315, 10842, 24293, 20332, 32247, 27774, 42250, 46211, 34328
        DC16 38801, 58158, 62119, 49212, 53685, 10562, 14539, 2640, 7129, 28518
        DC16 32495, 19572, 24061, 46475, 41986, 38553, 34576, 62383, 57894
        DC16 53437, 49460, 14787, 10314, 6865, 2904, 32743, 28270, 23797, 19836
        DC16 50700, 55173, 58654, 62615, 32808, 37281, 41786, 45747, 19012
        DC16 23501, 26966, 30943, 3168, 7657, 12146, 16123, 54925, 50948, 62879
        DC16 58390, 37033, 33056, 46011, 41522, 23237, 19276, 31191, 26718
        DC16 7393, 3432, 16371, 11898, 59150, 63111, 50204, 54677, 41258, 45219
        DC16 33336, 37809, 27462, 31439, 18516, 23005, 11618, 15595, 3696, 8185
        DC16 63375, 58886, 54429, 50452, 45483, 40994, 37561, 33584, 31687
        DC16 27214, 22741, 18780, 15843, 11370, 7921, 3960

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GetCRC16:
        PUSH     {R4,LR}
        MOVS     R2,R0
        LDR      R0,??DataTable1_1  ;; 0xffff
??GetCRC16_0:
        MOVS     R3,R1
        SUBS     R1,R3,#+1
        UXTH     R3,R3
        CMP      R3,#+0
        BEQ      ??GetCRC16_1
        MOVS     R3,R0
        UXTH     R3,R3
        LSRS     R3,R3,#+8
        UXTH     R0,R0
        LDRB     R4,[R2, #+0]
        EORS     R4,R4,R0
        UXTB     R0,R4
        MOVS     R4,#+2
        MULS     R0,R4,R0
        LDR      R4,??DataTable1_2
        LDRH     R0,[R4, R0]
        EORS     R0,R0,R3
        ADDS     R2,R2,#+1
        B        ??GetCRC16_0
??GetCRC16_1:
        MOVS     R3,R0
        LDR      R0,??DataTable1_1  ;; 0xffff
        EORS     R0,R0,R3
        UXTH     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     g_SystickCounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0xffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     CRC16_CCITT_Table

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Delayms:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        BL       hal_GetSystickCounter
        MOVS     R5,R0
??Delayms_0:
        BL       hal_GetSystickCounter
        SUBS     R0,R0,R5
        UXTH     R4,R4
        CMP      R0,R4
        BCS      ??Delayms_1
        BL       IWDG_ReloadCounter
        MOVS     R0,#+127
        BL       WWDG_SetCounter
        B        ??Delayms_0
??Delayms_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
Delayus:
        PUSH     {LR}
        MOVS     R1,#+0
??Delayus_0:
        MOVS     R2,R0
        SUBS     R0,R2,#+1
        UXTB     R2,R2
        CMP      R2,#+0
        BEQ      ??Delayus_1
        MOVS     R2,#+0
        MOVS     R1,R2
??Delayus_2:
        UXTB     R1,R1
        CMP      R1,#+8
        BGE      ??Delayus_0
        ADDS     R1,R1,#+1
        B        ??Delayus_2
??Delayus_1:
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
MemCpy:
        PUSH     {R4,R5,LR}
        MOVS     R3,R0
        MOVS     R0,R3
        MOVS     R4,R1
??MemCpy_0:
        MOVS     R5,R2
        SUBS     R2,R5,#+1
        UXTH     R5,R5
        CMP      R5,#+0
        BEQ      ??MemCpy_1
        LDRB     R5,[R4, #+0]
        STRB     R5,[R0, #+0]
        ADDS     R4,R4,#+1
        ADDS     R0,R0,#+1
        B        ??MemCpy_0
??MemCpy_1:
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
MemSet:
        PUSH     {R4,LR}
        MOVS     R3,R0
??MemSet_0:
        MOVS     R4,R2
        SUBS     R2,R4,#+1
        UXTH     R4,R4
        CMP      R4,#+0
        BEQ      ??MemSet_1
        STRB     R1,[R3, #+0]
        ADDS     R3,R3,#+1
        B        ??MemSet_0
??MemSet_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
w_memcpy:
        PUSH     {R4,R5,LR}
        MOVS     R3,R1
        MOVS     R4,R0
??w_memcpy_0:
        MOVS     R5,R2
        SUBS     R2,R5,#+1
        CMP      R5,#+0
        BEQ      ??w_memcpy_1
        LDRB     R5,[R3, #+0]
        STRB     R5,[R4, #+0]
        ADDS     R3,R3,#+1
        ADDS     R4,R4,#+1
        B        ??w_memcpy_0
??w_memcpy_1:
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
w_memset:
        PUSH     {R4,LR}
        MOVS     R3,R0
??w_memset_0:
        MOVS     R4,R2
        SUBS     R2,R4,#+1
        CMP      R4,#+0
        BEQ      ??w_memset_1
        MOVS     R4,R1
        STRB     R4,[R3, #+0]
        ADDS     R3,R3,#+1
        B        ??w_memset_0
??w_memset_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
getSum:
        PUSH     {R4,LR}
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R3,#+0
??getSum_0:
        UXTB     R3,R3
        UXTB     R1,R1
        CMP      R3,R1
        BCS      ??getSum_1
        UXTB     R3,R3
        LDRB     R4,[R2, R3]
        ADDS     R0,R0,R4
        ADDS     R3,R3,#+1
        B        ??getSum_0
??getSum_1:
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
`cmp`:
        PUSH     {R4,R5,LR}
        MOVS     R3,R0
        MOVS     R0,#+0
??cmp_0:
        UXTB     R0,R0
        UXTB     R2,R2
        CMP      R0,R2
        BCS      ??cmp_1
        UXTB     R0,R0
        LDRB     R4,[R3, R0]
        UXTB     R0,R0
        LDRB     R5,[R1, R0]
        CMP      R4,R5
        BEQ      ??cmp_2
        MOVS     R0,#+0
        B        ??cmp_3
??cmp_2:
        ADDS     R0,R0,#+1
        B        ??cmp_0
??cmp_1:
        MOVS     R0,#+1
??cmp_3:
        POP      {R4,R5,PC}       ;; return

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
// 512 bytes in section .rodata
// 308 bytes in section .text
// 
// 308 bytes of CODE  memory
// 512 bytes of CONST memory
//
//Errors: none
//Warnings: none

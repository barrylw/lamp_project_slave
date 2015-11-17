///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       17/Nov/2015  16:19:17
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\svnProject\street_lamp_new\APP\APL.c
//    Command line =  
//        E:\svnProject\street_lamp_new\APP\APL.c -D USE_STDPERIPH_DRIVER -D
//        STM32F030X8 -D AUTOSTART_ENABLE -D PRINTF_DEBUG -D USE_LORA_MODE -lb
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
//        E:\svnProject\street_lamp_new\coffee_arch\ -On -I "F:\Program Files
//        (x86)\IAR Systems\Embedded Workbench 7.0\arm\CMSIS\Include\"
//    List file    =  E:\svnProject\street_lamp_new\Debug\List\APL.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_d2f
        EXTERN __aeabi_memclr4
        EXTERN __iar_Strstr
        EXTERN atof
        EXTERN atoi
        EXTERN phyVersion
        EXTERN printf
        EXTERN strlen

        PUBLIC GPQA
        PUBLIC Ki
        PUBLIC Kp
        PUBLIC Ku
        PUBLIC PFCont
        PUBLIC ReadVersion
        PUBLIC SoftReset
        PUBLIC aplVersion
        PUBLIC calibration
        PUBLIC enegyDegree
        PUBLIC energyPulse
        PUBLIC find_params
        PUBLIC g_updateBuffer
        PUBLIC nwk_frame_ptr
        PUBLIC paralist
        PUBLIC phsA
        PUBLIC pstart
        PUBLIC qphsal
        PUBLIC read_flash
        PUBLIC read_params_area
        PUBLIC strstr


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

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_updateBuffer:
        DS8 1024

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
nwk_frame_buf:
        DS8 260

        SECTION `.data`:DATA:REORDER:NOROOT(2)
nwk_frame_ptr:
        DATA
        DC32 nwk_frame_buf

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

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
        DC8 66, 82, 50, 51, 48, 1, 20, 0, 1, 0, 0, 0

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
read_params_area:
        PUSH     {LR}
        MOVS     R1,#+0
??read_params_area_0:
        UXTH     R1,R1
        MOVS     R2,#+128
        LSLS     R2,R2,#+3        ;; #+1024
        CMP      R1,R2
        BGE      ??read_params_area_1
        UXTH     R1,R1
        LDRB     R2,[R0, R1]
        UXTH     R1,R1
        LDR      R3,??DataTable3_2
        STRB     R2,[R3, R1]
        UXTH     R1,R1
        LDR      R2,??DataTable3_2
        LDRB     R2,[R2, R1]
        CMP      R2,#+255
        BNE      ??read_params_area_2
        MOVS     R2,#+0
        UXTH     R1,R1
        LDR      R3,??DataTable3_2
        STRB     R2,[R3, R1]
        B        ??read_params_area_1
??read_params_area_2:
        ADDS     R1,R1,#+1
        B        ??read_params_area_0
??read_params_area_1:
        POP      {PC}             ;; return

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
        LDR      R1,??DataTable3_3
        LDR      R1,[R1, R0]
        LDR      R0,??DataTable3_2
        BL       strstr
        MOVS     R5,R0
        CMP      R5,#+0
        BNE      ??find_params_0
        MOVS     R0,#+0
        B        ??find_params_1
??find_params_0:
        MOVS     R6,#+0
??find_params_2:
        UXTB     R6,R6
        CMP      R6,#+15
        BGE      ??find_params_3
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R1,??DataTable3_3
        LDR      R0,[R1, R0]
        BL       strlen
        UXTB     R6,R6
        ADDS     R0,R5,R0
        LDRB     R0,[R0, R6]
        CMP      R0,#+59
        BEQ      ??find_params_4
        UXTB     R4,R4
        MOVS     R0,#+4
        MULS     R0,R4,R0
        LDR      R1,??DataTable3_3
        LDR      R0,[R1, R0]
        BL       strlen
        UXTB     R6,R6
        ADDS     R0,R5,R0
        LDRB     R0,[R0, R6]
        UXTB     R6,R6
        MOV      R1,SP
        STRB     R0,[R1, R6]
        ADDS     R6,R6,#+1
        B        ??find_params_2
??find_params_4:
??find_params_3:
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
ReadVersion:
        PUSH     {LR}
        SUB      SP,SP,#+36
        LDR      R0,??DataTable3_4
        LDRB     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable3_4
        LDRB     R0,[R0, #+1]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable3_4
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable3_4
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable3_4
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable3_4
        LDRB     R0,[R0, #+5]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable3_4
        LDRB     R0,[R0, #+6]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable3_4
        LDRB     R0,[R0, #+7]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable3_4
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
        LDR      R0,??DataTable3_5
        BL       printf
        LDR      R0,??DataTable3_6
        LDRB     R0,[R0, #+0]
        MOV      R1,SP
        STRB     R0,[R1, #+24]
        LDR      R0,??DataTable3_6
        LDRB     R0,[R0, #+1]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+1]
        LDR      R0,??DataTable3_6
        LDRB     R0,[R0, #+2]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+2]
        LDR      R0,??DataTable3_6
        LDRB     R0,[R0, #+3]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+3]
        LDR      R0,??DataTable3_6
        LDRB     R0,[R0, #+4]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+4]
        LDR      R0,??DataTable3_6
        LDRB     R0,[R0, #+5]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+5]
        LDR      R0,??DataTable3_6
        LDRB     R0,[R0, #+6]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+6]
        LDR      R0,??DataTable3_6
        LDRB     R0,[R0, #+7]
        ADD      R1,SP,#+24
        STRB     R0,[R1, #+7]
        LDR      R0,??DataTable3_6
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
        LDR      R0,??DataTable3_7
        BL       printf
        ADD      SP,SP,#+36
        POP      {PC}             ;; return

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

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     g_updateBuffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     paralist

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     aplVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     `?<Constant "APL Version=%c%c%c%c-...">`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     phyVersion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     `?<Constant "PHY Version=%c%c%c%c-...">`

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SoftReset:
        PUSH     {R7,LR}
        CPSID    I
        BL       NVIC_SystemReset
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP strstr
        THUMB
// __intrinsic __nounwind __interwork __softfp char *strstr(char const *, char const *)
strstr:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R1,R4
        MOVS     R0,R5
        BL       __iar_Strstr
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
// 1 284 bytes in section .bss
//   148 bytes in section .data
//   124 bytes in section .rodata
//   580 bytes in section .text
// 
//   564 bytes of CODE  memory (+ 16 bytes shared)
//   124 bytes of CONST memory
// 1 432 bytes of DATA  memory
//
//Errors: none
//Warnings: none

///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.10.3.6832/W32 for ARM       14/Dec/2015  19:06:09
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  F:\cloneSlave\lamp_project_slave\APP\hal_GDflash.c
//    Command line =  
//        F:\cloneSlave\lamp_project_slave\APP\hal_GDflash.c -D
//        USE_STDPERIPH_DRIVER -D STM32F030X8 -D AUTOSTART_ENABLE -D
//        USE_LORA_MODE -D PRINTF_DEBUG -lb
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
//    List file    =  F:\cloneSlave\lamp_project_slave\Debug\List\hal_GDflash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init
        EXTERN GPIO_ReadInputDataBit
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN RCC_AHBPeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN SPI_Cmd
        EXTERN SPI_I2S_DeInit
        EXTERN SPI_I2S_GetFlagStatus
        EXTERN SPI_Init
        EXTERN SPI_ReceiveData8
        EXTERN SPI_RxFIFOThresholdConfig
        EXTERN SPI_SendData8
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_uidivmod

        PUBLIC GDfalsh_read_identification
        PUBLIC GDflash_64KByte_erase
        PUBLIC GDflash_ReadByte
        PUBLIC GDflash_ReadWriteByte
        PUBLIC GDflash_WriteByte
        PUBLIC GDflash_erase
        PUBLIC GDflash_init
        PUBLIC GDflash_page_program
        PUBLIC GDflash_read
        PUBLIC GDflash_read_datas
        PUBLIC GDflash_read_status_reg
        PUBLIC GDflash_test
        PUBLIC GDflash_write
        PUBLIC GDflash_write_enable
        PUBLIC GDflash_write_status_reg
        PUBLIC hal_Init_gdflash_pins
        PUBLIC hal_gdflash_SPI_Config
        PUBLIC wait_flash_free


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_Init_gdflash_pins:
        PUSH     {LR}
        SUB      SP,SP,#+12
        MOVS     R1,#+1
        MOVS     R0,#+192
        LSLS     R0,R0,#+11       ;; #+393216
        BL       RCC_AHBPeriphClockCmd
        MOVS     R0,#+128
        LSLS     R0,R0,#+8        ;; #+32768
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOV      R1,SP
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_Init
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+4]
        MOVS     R0,#+1
        MOV      R1,SP
        STRB     R0,[R1, #+7]
        MOVS     R0,#+0
        MOV      R1,SP
        STRB     R0,[R1, #+6]
        MOVS     R0,#+3
        MOV      R1,SP
        STRB     R0,[R1, #+5]
        MOV      R1,SP
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_Init
        MOVS     R0,#+16
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
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_Init
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
hal_gdflash_SPI_Config:
        PUSH     {LR}
        SUB      SP,SP,#+20
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        MOVS     R1,#+0
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_Cmd
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_I2S_DeInit
        MOVS     R1,#+1
        MOVS     R0,#+128
        LSLS     R0,R0,#+5        ;; #+4096
        BL       RCC_APB2PeriphClockCmd
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+0]
        MOVS     R0,#+130
        LSLS     R0,R0,#+1        ;; #+260
        MOV      R1,SP
        STRH     R0,[R1, #+2]
        MOVS     R0,#+224
        LSLS     R0,R0,#+3        ;; #+1792
        MOV      R1,SP
        STRH     R0,[R1, #+4]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+6]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+8]
        MOVS     R0,#+128
        LSLS     R0,R0,#+2        ;; #+512
        MOV      R1,SP
        STRH     R0,[R1, #+10]
        MOVS     R0,#+16
        MOV      R1,SP
        STRH     R0,[R1, #+12]
        MOVS     R0,#+0
        MOV      R1,SP
        STRH     R0,[R1, #+14]
        MOVS     R0,#+7
        MOV      R1,SP
        STRH     R0,[R1, #+16]
        MOV      R1,SP
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_Init
        MOVS     R1,#+128
        LSLS     R1,R1,#+5        ;; #+4096
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_RxFIFOThresholdConfig
        MOVS     R1,#+1
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_Cmd
        ADD      SP,SP,#+20
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_ReadWriteByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
??GDflash_ReadWriteByte_0:
        MOVS     R1,#+2
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??GDflash_ReadWriteByte_0
        MOVS     R1,R4
        UXTB     R1,R1
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_SendData8
??GDflash_ReadWriteByte_1:
        MOVS     R1,#+1
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ      ??GDflash_ReadWriteByte_1
        LDR      R0,??DataTable4_1  ;; 0x40013000
        BL       SPI_ReceiveData8
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_WriteByte:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
??GDflash_WriteByte_0:
        UXTB     R5,R5
        CMP      R5,#+8
        BGE      ??GDflash_WriteByte_1
        UXTB     R4,R4
        LSLS     R0,R4,#+24
        BPL      ??GDflash_WriteByte_2
        MOVS     R1,#+32
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_SetBits
        B        ??GDflash_WriteByte_3
??GDflash_WriteByte_2:
        MOVS     R1,#+32
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_ResetBits
??GDflash_WriteByte_3:
        MOVS     R1,#+8
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_SetBits
        LSLS     R4,R4,#+1
        MOVS     R1,#+8
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_ResetBits
        ADDS     R5,R5,#+1
        B        ??GDflash_WriteByte_0
??GDflash_WriteByte_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_ReadByte:
        PUSH     {R3-R7,LR}
        MOVS     R7,R0
        MOVS     R4,#+0
        MOVS     R6,#+0
        MOVS     R5,#+0
??GDflash_ReadByte_0:
        UXTB     R5,R5
        CMP      R5,#+8
        BGE      ??GDflash_ReadByte_1
        LSLS     R4,R4,#+1
        MOVS     R1,#+16
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_ReadInputDataBit
        MOVS     R6,R0
        MOVS     R1,#+8
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_SetBits
        UXTB     R6,R6
        CMP      R6,#+0
        BEQ      ??GDflash_ReadByte_2
        MOVS     R0,R4
        MOVS     R4,#+1
        ORRS     R4,R4,R0
??GDflash_ReadByte_2:
        MOVS     R1,#+8
        LDR      R0,??DataTable4  ;; 0x48000400
        BL       GPIO_ResetBits
        ADDS     R5,R5,#+1
        B        ??GDflash_ReadByte_0
??GDflash_ReadByte_1:
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x48000400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40013000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
wait_flash_free:
        PUSH     {R7,LR}
??wait_flash_free_0:
        BL       GDflash_read_status_reg
        LSLS     R0,R0,#+31
        BMI      ??wait_flash_free_0
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_init:
        PUSH     {R7,LR}
        BL       hal_Init_gdflash_pins
        MOVS     R0,#+1
        BL       GDflash_write_enable
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_write_enable:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ResetBits
        UXTB     R4,R4
        CMP      R4,#+0
        BEQ      ??GDflash_write_enable_0
        MOVS     R0,#+6
        BL       GDflash_WriteByte
        B        ??GDflash_write_enable_1
??GDflash_write_enable_0:
        MOVS     R0,#+4
        BL       GDflash_WriteByte
??GDflash_write_enable_1:
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_read_status_reg:
        PUSH     {R4,LR}
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ResetBits
        MOVS     R0,#+5
        BL       GDflash_WriteByte
        MOVS     R0,#+170
        BL       GDflash_ReadByte
        MOVS     R4,R0
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        MOVS     R0,R4
        UXTB     R0,R0
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_write_status_reg:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ResetBits
        MOVS     R0,#+1
        BL       GDflash_WriteByte
        MOVS     R0,R4
        UXTB     R0,R0
        BL       GDflash_WriteByte
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDfalsh_read_identification:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ResetBits
        MOVS     R0,#+159
        BL       GDflash_WriteByte
        MOVS     R0,#+170
        BL       GDflash_ReadByte
        STRB     R0,[R4, #+0]
        MOVS     R0,#+170
        BL       GDflash_ReadByte
        STRB     R0,[R4, #+1]
        MOVS     R0,#+170
        BL       GDflash_ReadByte
        STRB     R0,[R4, #+2]
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_read_datas:
        PUSH     {R2,R4-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R3
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ResetBits
        UXTB     R7,R7
        CMP      R7,#+0
        BEQ      ??GDflash_read_datas_0
        MOVS     R0,#+11
        BL       GDflash_WriteByte
        B        ??GDflash_read_datas_1
??GDflash_read_datas_0:
        MOVS     R0,#+3
        BL       GDflash_WriteByte
??GDflash_read_datas_1:
        MOVS     R0,R4
        LSRS     R0,R0,#+16
        UXTB     R0,R0
        BL       GDflash_WriteByte
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        UXTB     R0,R0
        BL       GDflash_WriteByte
        MOVS     R0,R4
        UXTB     R0,R0
        BL       GDflash_WriteByte
        UXTB     R7,R7
        CMP      R7,#+0
        BEQ      ??GDflash_read_datas_2
        MOVS     R0,#+170
        BL       GDflash_WriteByte
??GDflash_read_datas_2:
        MOVS     R6,#+0
??GDflash_read_datas_3:
        LDR      R0,[SP, #+0]
        CMP      R6,R0
        BCS      ??GDflash_read_datas_4
        MOVS     R0,#+170
        BL       GDflash_ReadByte
        STRB     R0,[R5, R6]
        ADDS     R6,R6,#+1
        B        ??GDflash_read_datas_3
??GDflash_read_datas_4:
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_page_program:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R2
??GDflash_page_program_0:
        BL       GDflash_read_status_reg
        LSLS     R0,R0,#+31
        BMI      ??GDflash_page_program_0
        MOVS     R0,#+1
        BL       GDflash_write_enable
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ResetBits
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ      ??GDflash_page_program_1
        MOVS     R0,#+242
        BL       GDflash_WriteByte
        B        ??GDflash_page_program_2
??GDflash_page_program_1:
        MOVS     R0,#+2
        BL       GDflash_WriteByte
??GDflash_page_program_2:
        MOVS     R0,R4
        LSRS     R0,R0,#+16
        UXTB     R0,R0
        BL       GDflash_WriteByte
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        UXTB     R0,R0
        BL       GDflash_WriteByte
        MOVS     R0,R4
        UXTB     R0,R0
        BL       GDflash_WriteByte
        MOVS     R6,#+0
??GDflash_page_program_3:
        UXTH     R6,R6
        UXTH     R7,R7
        CMP      R6,R7
        BCS      ??GDflash_page_program_4
        UXTH     R6,R6
        LDRB     R0,[R5, R6]
        BL       GDflash_WriteByte
        ADDS     R6,R6,#+1
        B        ??GDflash_page_program_3
??GDflash_page_program_4:
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
??GDflash_page_program_5:
        BL       GDflash_read_status_reg
        LSLS     R0,R0,#+31
        BMI      ??GDflash_page_program_5
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_erase:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
??GDflash_erase_0:
        BL       GDflash_read_status_reg
        LSLS     R0,R0,#+31
        BMI      ??GDflash_erase_0
        MOVS     R0,#+1
        BL       GDflash_write_enable
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_ResetBits
        UXTB     R5,R5
        CMP      R5,#+0
        BEQ      ??GDflash_erase_1
        CMP      R5,#+2
        BEQ      ??GDflash_erase_2
        BCC      ??GDflash_erase_3
        CMP      R5,#+3
        BEQ      ??GDflash_erase_4
        B        ??GDflash_erase_5
??GDflash_erase_1:
        MOVS     R0,#+32
        BL       GDflash_WriteByte
        B        ??GDflash_erase_6
??GDflash_erase_3:
        MOVS     R0,#+82
        BL       GDflash_WriteByte
        B        ??GDflash_erase_6
??GDflash_erase_2:
        MOVS     R0,#+216
        BL       GDflash_WriteByte
        B        ??GDflash_erase_6
??GDflash_erase_4:
        MOVS     R0,#+96
        BL       GDflash_WriteByte
        B        ??GDflash_erase_6
??GDflash_erase_5:
??GDflash_erase_6:
        UXTB     R5,R5
        CMP      R5,#+3
        BEQ      ??GDflash_erase_7
        MOVS     R0,R4
        LSRS     R0,R0,#+16
        UXTB     R0,R0
        BL       GDflash_WriteByte
        MOVS     R0,R4
        LSRS     R0,R0,#+8
        UXTB     R0,R0
        BL       GDflash_WriteByte
        MOVS     R0,R4
        UXTB     R0,R0
        BL       GDflash_WriteByte
??GDflash_erase_7:
        MOVS     R1,#+128
        LSLS     R1,R1,#+8        ;; #+32768
        MOVS     R0,#+144
        LSLS     R0,R0,#+23       ;; #+1207959552
        BL       GPIO_SetBits
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_read:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R3,#+0
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R4
        BL       GDflash_read_datas
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_write:
        PUSH     {R0,R1,R4-R7,LR}
        SUB      SP,SP,#+12
        MOVS     R7,R2
        LDR      R4,[SP, #+12]
        MOV      R5,SP
        MOVS     R6,#+0
        LDR      R0,[SP, #+12]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_uidivmod
        SUBS     R0,R6,R1
        STRB     R0,[R5, #+0]
        LDR      R6,[SP, #+16]
        STR      R7,[SP, #+4]
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        CMP      R0,R7
        BCS      ??GDflash_write_0
        MOVS     R3,#+0
        MOV      R0,SP
        LDRB     R2,[R0, #+0]
        UXTH     R2,R2
        MOVS     R1,R6
        MOVS     R0,R4
        BL       GDflash_page_program
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        ADDS     R4,R4,R0
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        ADDS     R6,R6,R0
        MOV      R0,SP
        LDRB     R0,[R0, #+0]
        SUBS     R0,R7,R0
        STR      R0,[SP, #+4]
        MOV      R0,SP
        LDR      R1,[SP, #+4]
        LSRS     R1,R1,#+8
        STRH     R1,[R0, #+8]
        MOV      R5,SP
        LDR      R0,[SP, #+4]
        MOVS     R1,#+128
        LSLS     R1,R1,#+1        ;; #+256
        BL       __aeabi_uidivmod
        STRH     R1,[R5, #+2]
        MOVS     R5,#+0
??GDflash_write_1:
        MOV      R0,SP
        LDRH     R0,[R0, #+8]
        UXTH     R5,R5
        CMP      R5,R0
        BCS      ??GDflash_write_2
        MOVS     R3,#+0
        MOVS     R2,#+128
        LSLS     R2,R2,#+1        ;; #+256
        MOVS     R1,R6
        MOVS     R0,R4
        BL       GDflash_page_program
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        ADDS     R4,R4,R0
        MOVS     R0,#+128
        LSLS     R0,R0,#+1        ;; #+256
        ADDS     R6,R6,R0
        ADDS     R5,R5,#+1
        B        ??GDflash_write_1
??GDflash_write_2:
        MOV      R0,SP
        LDRH     R0,[R0, #+2]
        CMP      R0,#+0
        BEQ      ??GDflash_write_3
        MOVS     R3,#+0
        MOV      R0,SP
        LDRH     R2,[R0, #+2]
        MOVS     R1,R6
        MOVS     R0,R4
        BL       GDflash_page_program
        B        ??GDflash_write_3
??GDflash_write_0:
        MOVS     R3,#+0
        MOVS     R2,R7
        UXTH     R2,R2
        MOVS     R1,R6
        MOVS     R0,R4
        BL       GDflash_page_program
??GDflash_write_3:
        ADD      SP,SP,#+20
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_64KByte_erase:
        PUSH     {R7,LR}
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       GDflash_erase
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GDflash_test:
        PUSH     {LR}
        SUB      SP,SP,#+60
        ADD      R0,SP,#+20
        LDR      R1,??DataTable5
        MOVS     R2,#+13
        BL       __aeabi_memcpy
        BL       GDflash_init
        MOV      R0,SP
        BL       GDfalsh_read_identification
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       GDflash_erase
        MOVS     R3,#+0
        MOVS     R2,#+13
        MOV      R1,SP
        MOVS     R0,#+0
        BL       GDflash_read_datas
        MOVS     R3,#+0
        MOVS     R2,#+13
        ADD      R1,SP,#+20
        MOVS     R0,#+0
        BL       GDflash_page_program
        MOVS     R3,#+0
        MOVS     R2,#+13
        ADD      R1,SP,#+36
        MOVS     R0,#+0
        BL       GDflash_read_datas
        MOV      R0,SP
        BL       GDfalsh_read_identification
        ADD      SP,SP,#+60
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     `?<Constant "hello,world!">`

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "hello,world!">`:
        DATA
        DC8 "hello,world!"
        DC8 0, 0, 0

        END
// 
//    16 bytes in section .rodata
// 1 326 bytes in section .text
// 
// 1 326 bytes of CODE  memory
//    16 bytes of CONST memory
//
//Errors: none
//Warnings: none

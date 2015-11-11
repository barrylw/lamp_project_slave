;********************************************************************************************************
;                                               uC/OS-II
;                                         The Real-Time Kernel
;
;
;                               (c) Copyright 1992-2012, Micrium, Weston, FL
;                                          All Rights Reserved
;
;                                           ARM Cortex-M0 Port
;
; File      : os_cpu_a.asm
; Version   : V2.92.07.00
; By        : JJL
;             BN
;             MD
;
; For       : ARMv6M Cortex-M0
; Mode      : Thumb2
; Toolchain : IAR EWARM
;********************************************************************************************************

;********************************************************************************************************
;                                           PUBLIC FUNCTIONS
;********************************************************************************************************

    PUBLIC  OS_CPU_SR_Save                                      ; Functions declared in this file (internal)
    PUBLIC  OS_CPU_SR_Restore

;********************************************************************************************************
;                                                EQUATES
;********************************************************************************************************

;********************************************************************************************************
;                                      CODE GENERATION DIRECTIVES
;********************************************************************************************************

    RSEG CODE:CODE:NOROOT(2)
    THUMB

;********************************************************************************************************
;                                   CRITICAL SECTION METHOD 3 FUNCTIONS
;
; Description: Disable/Enable interrupts by preserving the state of interrupts.  Generally speaking you
;              would store the state of the interrupt disable flag in the local variable 'cpu_sr' and then
;              disable interrupts.  'cpu_sr' is allocated in all of uC/OS-II's functions that need to
;              disable interrupts.  You would restore the interrupt disable state by copying back 'cpu_sr'
;              into the CPU's status register.
;
; Prototypes :     OS_CPU_SR  OS_CPU_SR_Save(void);
;                  void       OS_CPU_SR_Restore(OS_CPU_SR cpu_sr);
;
;
; Note(s)    : 1) These functions are used in general like this:
;
;                 void Task (void *p_arg)
;                 {
;                 #if OS_CRITICAL_METHOD == 3                   /* Allocate storage for CPU status register             */
;                     OS_CPU_SR  cpu_sr;
;                 #endif
;
;                          :
;                          :
;                     OS_ENTER_CRITICAL();                      /* cpu_sr = OS_CPU_SaveSR();                            */
;                          :
;                          :
;                     OS_EXIT_CRITICAL();                       /* OS_CPU_RestoreSR(cpu_sr);                            */
;                          :
;                          :
;                 }
;********************************************************************************************************

OS_CPU_SR_Save
    MRS     R0, PRIMASK                                         ; Set prio int mask to mask all (except faults)
    CPSID   I
    BX      LR

OS_CPU_SR_Restore
    MSR     PRIMASK, R0
    BX      LR

    END

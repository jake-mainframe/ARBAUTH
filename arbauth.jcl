//ARBAUTH   JOB (TSO),
//             'RUN ARBAUTH',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(2,1),
//             REGION=0K,
//             USER=IBMUSER,
//             PASSWORD=SYS1
//ASMLKD1 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
OPENTST  CSECT
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R12,0
         USING *,R12
         STM   R14,R12,SAVE
         OPEN (INDCB,(INPUT))
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         GET INDCB,INAREA
SAYHI    LA  R1,MSGHI
         SVC 35
***********************************************************************
*    END OF PROGRAM
***********************************************************************
ENDPROG  LM    R14,R12,SAVE
         XR    R15,R15
         BR    R14
***********************************************************************
*    DATA
***********************************************************************
MSGHI    DC    XL4'00570000'
         DC    CL3'HI '
INAREA   DS    CL80
SAVE     DS    18F
***********************************************************************
*    DATASETS
***********************************************************************
INDCB   DCB DSORG=PS,MACRF=(GM),DDNAME=INPUTDD,                        X
               RECFM=FB,EODAD=SAYHI
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   OPENTST CSECT
@@
//LKED.SYSLMOD  DD DSN=SYSC.LINKLIB(OPENTST),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//ASMLKD2 EXEC ASMFCL,
//             PARM.ASM='OBJECT,NODECK,TERM,XREF(SHORT)',
//             PARM.LKED='LET,MAP,XREF,LIST,TEST,AC=1'
//ASM.SYSLIB  DD   DSN=SYS1.MACLIB,DISP=SHR
//            DD   DSN=SYS2.MACLIB,DISP=SHR
//            DD   DSN=SYS1.AMODGEN,DISP=SHR
//            DD   DSN=SYS1.AMACLIB,DISP=SHR
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSTERM DD SYSOUT=*
//ASM.SYSIN   DD *,DLM=@@
ARBAUTH  CSECT
***********************************************************************
*    INITIALIZATION
***********************************************************************
         BALR  R11,0
         USING *,R11
         STM   R14,R12,SAVE
***********************************************************************
*    MAINSTREAM OF PROGRAM
***********************************************************************
         L      R2,0(R1)
         MVC    LOADPROG,2(R2)    
         LA     R2,LOADPROG
         ATTACH EPLOC=(R2),ECB=AMYECB
         ST     R1,TCBADDR
         WAIT   R1,ECB=AMYECB
         DETACH TCBADDR
***********************************************************************
*    END OF PROGRAM
***********************************************************************
ENDPROG  LM    R14,R12,SAVE
         XR    R15,R15
         BR    R14
***********************************************************************
*    DATA
***********************************************************************
LOADPROG DS    CL8
TCBADDR  DC    F'0'        ADDRESS OF SUBTASK TCB
AMYECB   DC    F'0'        END-OF-SUBTASK ECB
SAVE     DS    18F
***********************************************************************
*    MACROS
***********************************************************************
         YREGS
         END   ARBAUTH
@@
//LKED.SYSLMOD  DD DSN=SYS2.LINKLIB(ARBAUTH),DISP=SHR
//LKED.SYSPRINT DD   SYSOUT=A
//OPENTST   EXEC PGM=OPENTST
//SYSPRINT DD   SYSOUT=A
//STEPLIB  DD   DISP=SHR,DSN=SYSC.LINKLIB
//SYSUDUMP DD   SYSOUT=A
//INPUTDD  DD   *
JAKE
//*
//ARBAUTH   EXEC PGM=ARBAUTH,
// PARM='IEFBR14 '
//SYSPRINT DD   SYSOUT=A
//STEPLIB  DD   DISP=SHR,DSN=SYS2.LINKLIB
//SYSUDUMP DD   SYSOUT=A


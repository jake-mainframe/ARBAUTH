//ALLOCSTD   JOB (TSO),
//             'ALLOC DATASETS',
//             CLASS=A,
//             MSGCLASS=A,
//             MSGLEVEL=(1,1),
//             USER=IBMUSER,PASSWORD=SYS1
//STEP01   EXEC PGM=IEFBR14    
//PATTERN  DD  DSN=IBMUSER.PATTERN,DISP=(NEW,CATLG),    
//             UNIT=SYSDA,VOL=SER=PUB000,                          
//             SPACE=(TRK,(1,1),RLSE),                              
//             DCB=(DSORG=PS,RECFM=FB,LRECL=30000,BLKSIZE=30000)                     
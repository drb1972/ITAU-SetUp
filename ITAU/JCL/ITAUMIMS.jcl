//ITAUMIMS JOB ACC-ITAUM,NAME,MSGLEVEL=(1,1),MSGCLASS=3   
//*
//STEP1   EXEC PGM=DFSRRC00,PARM='ULU,DFSUDMP0'
//*
//STEPLIB   DD DSNAME=ITAUM.SDFSRESL,DISP=SHR
//DFSRESLB  DD DSNAME=ITAUM.SDFSRESL,DISP=SHR
//IMS       DD DSNAME=ITAUM.DBDLIB,DISP=SHR
//*
//SYSPRINT  DD SYSOUT=A
//*
//DBHI3A    DD DSNAME=ITAUM.DBHI3A,DISP=SHR
//DBHI3B    DD DSNAME=ITAUM.DBHI3B,DISP=SHR
//*
//DBAOUT1   DD DSNAME=ITAUM.DBAOUT1,DISP=(NEW,KEEP),
//             UNIT=TAPE,VOL=SER=DBDMP1,LABEL=(,SL)
//*
//DBAOUT2   DD DSNAME=ITAUM.DBAOUT2,DISP=(NEW,KEEP),
//             UNIT=TAPE,VOL=SER=DBDMP2,LABEL=(,SL)
//*
//DBBOUT1   DD DSNAME=ITAUM.DBBOUT1,DISP=(NEW,KEEP),
//             UNIT=TAPE,VOL=SER=DBDMP3,LABEL=(,SL)
//* 
//SYSIN     DD *
D2 DI32DB01 DBHI3A   DBAOUT1  DBAOUT2  DATA SET 1-DUMP 1+2
D1 DI32DB01 DBHI3B   DBBOUT1           DATA SET 2-DUMP 1

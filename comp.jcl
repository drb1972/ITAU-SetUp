//ITAMCMP  JOB (40600000),CLASS=A,MSGCLASS=X          
//*                  
//* ITAUM001
//*
//COMPILE  EXEC  PGM=IGYCRCTL
//STEPLIB  DD  DSN=IGY.SIGYCOMP,DISP=SHR                               
//*                                                                    
//SYSPRINT DD  SYSOUT=(*)                                               
//SYSIN    DD  DSN=ITAUM.COBOL(ITAUM001),                                 
//   DISP=SHR                                                           
//SYSPUNCH DD  DUMMY                                                    
//SYSUT1   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT2   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT3   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT4   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT5   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT6   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT7   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT8   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT9   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT10  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT11  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT12  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT13  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT14  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT15  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSMDECK DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSLIB   DD  DSN=SYS1.MACLIB,DISP=SHR                                 
//         DD  DSN=ITAUM.COBOL(ITAUM001),                                 
//   DISP=SHR                                                           
//SYSLIN   DD  DSN=ITAUM.OBJECT(ITAUM001),                              
//   DISP=SHR                                                           
//*                                                                     
//LKED   EXEC PGM=HEWL,COND=(8,LT,COMPILE),REGION=1024K                 
//SYSLIB   DD DSNAME=CEE.SCEELKED,                                      
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//SYSLIN   DD DSNAME=ITAUM.OBJECT(ITAUM001),DISP=SHR                    
//         DD DDNAME=SYSIN                                              
//SYSLMOD  DD DSNAME=ITAUM.LOAD(ITAUM001),DISP=SHR                      
//SYSUT1   DD UNIT=VIO,SPACE=(TRK,(10,10))                              
//GO     EXEC PGM=*.LKED.SYSLMOD,COND=((8,LT,COMPILE),(4,LT,LKED)),     
//            REGION=2048K                                              
//STEPLIB  DD DSNAME=CEE.SCEERUN,                                       
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//CEEDUMP  DD SYSOUT=*                                                  
//SYSUDUMP DD SYSOUT=*  
//*                                                                     
//LKED   EXEC PGM=HEWL,COND=(8,LT,COMPILE),REGION=1024K                 
//SYSLIB   DD DSNAME=CEE.SCEELKED,                                      
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//SYSLIN   DD DSNAME=ITAUM.OBJECT(ITAUM001),DISP=SHR                    
//         DD DDNAME=SYSIN                                              
//SYSLMOD  DD DSNAME=ITAUM.IMS.LOAD(ITAUM001),DISP=SHR                      
//SYSUT1   DD UNIT=VIO,SPACE=(TRK,(10,10))                              
//GO     EXEC PGM=*.LKED.SYSLMOD,COND=((8,LT,COMPILE),(4,LT,LKED)),     
//            REGION=2048K                                              
//STEPLIB  DD DSNAME=CEE.SCEERUN,                                       
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//CEEDUMP  DD SYSOUT=*                                                  
//SYSUDUMP DD SYSOUT=*  
//*
//* ITAUM002
//*                                                 
//COMPILE  EXEC  PGM=IGYCRCTL
//STEPLIB  DD  DSN=IGY.SIGYCOMP,DISP=SHR                               
//*                                                                    
//SYSPRINT DD  SYSOUT=(*)                                               
//SYSIN    DD  DSN=ITAUM.COBOL(ITAUM002),                                 
//   DISP=SHR                                                           
//SYSPUNCH DD  DUMMY                                                    
//SYSUT1   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT2   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT3   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT4   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT5   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT6   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT7   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT8   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT9   DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT10  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT11  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT12  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT13  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT14  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSUT15  DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSMDECK DD  UNIT=SYSDA,SPACE=(CYL,(2,2))                             
//SYSLIB   DD  DSN=SYS1.MACLIB,DISP=SHR                                 
//         DD  DSN=ITAUM.COBOL(ITAUM002),                                 
//   DISP=SHR                                                           
//SYSLIN   DD  DSN=ITAUM.OBJECT(ITAUM002),                              
//   DISP=SHR                                                           
//*                                                                     
//LKED   EXEC PGM=HEWL,COND=(8,LT,COMPILE),REGION=1024K                 
//SYSLIB   DD DSNAME=CEE.SCEELKED,                                      
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//SYSLIN   DD DSNAME=ITAUM.OBJECT(ITAUM002),DISP=SHR                    
//         DD DDNAME=SYSIN                                              
//SYSLMOD  DD DSNAME=ITAUM.LOAD(ITAUM002),DISP=SHR                      
//SYSUT1   DD UNIT=VIO,SPACE=(TRK,(10,10))                              
//GO     EXEC PGM=*.LKED.SYSLMOD,COND=((8,LT,COMPILE),(4,LT,LKED)),     
//            REGION=2048K                                              
//STEPLIB  DD DSNAME=CEE.SCEERUN,                                       
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//CEEDUMP  DD SYSOUT=*                                                  
//SYSUDUMP DD SYSOUT=*     
//*                                                                     
//LKED   EXEC PGM=HEWL,COND=(8,LT,COMPILE),REGION=1024K                 
//SYSLIB   DD DSNAME=CEE.SCEELKED,                                      
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//SYSLIN   DD DSNAME=ITAUM.OBJECT(ITAUM002),DISP=SHR                    
//         DD DDNAME=SYSIN                                              
//SYSLMOD  DD DSNAME=ITAUM.CICS.LOAD(ITAUM002),DISP=SHR                      
//SYSUT1   DD UNIT=VIO,SPACE=(TRK,(10,10))                              
//GO     EXEC PGM=*.LKED.SYSLMOD,COND=((8,LT,COMPILE),(4,LT,LKED)),     
//            REGION=2048K                                              
//STEPLIB  DD DSNAME=CEE.SCEERUN,                                       
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//CEEDUMP  DD SYSOUT=*                                                  
//SYSUDUMP DD SYSOUT=*                                               
//*                                                                     
//LKED   EXEC PGM=HEWL,COND=(8,LT,COMPILE),REGION=1024K                 
//SYSLIB   DD DSNAME=CEE.SCEELKED,                                      
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//SYSLIN   DD DSNAME=ITAUM.OBJECT(ITAUM002),DISP=SHR                    
//         DD DDNAME=SYSIN                                              
//SYSLMOD  DD DSNAME=ITAUM.DBRM(ITAUM001),DISP=SHR                      
//SYSUT1   DD UNIT=VIO,SPACE=(TRK,(10,10))                              
//GO     EXEC PGM=*.LKED.SYSLMOD,COND=((8,LT,COMPILE),(4,LT,LKED)),     
//            REGION=2048K                                              
//STEPLIB  DD DSNAME=CEE.SCEERUN,                                       
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//CEEDUMP  DD SYSOUT=*                                                  
//SYSUDUMP DD SYSOUT=*   
//*                                                                     
//LKED   EXEC PGM=HEWL,COND=(8,LT,COMPILE),REGION=1024K                 
//SYSLIB   DD DSNAME=CEE.SCEELKED,                                      
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//SYSLIN   DD DSNAME=ITAUM.OBJECT(ITAUM002),DISP=SHR                    
//         DD DDNAME=SYSIN                                              
//SYSLMOD  DD DSNAME=ITAUM.CICS.LOAD(ITAUM002),DISP=SHR                      
//SYSUT1   DD UNIT=VIO,SPACE=(TRK,(10,10))                              
//GO     EXEC PGM=*.LKED.SYSLMOD,COND=((8,LT,COMPILE),(4,LT,LKED)),     
//            REGION=2048K                                              
//STEPLIB  DD DSNAME=CEE.SCEERUN,                                       
//            DISP=SHR                                                  
//SYSPRINT DD SYSOUT=*                                                  
//CEEDUMP  DD SYSOUT=*                                                  
//SYSUDUMP DD SYSOUT=*   
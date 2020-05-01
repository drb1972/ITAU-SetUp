//ITAUM001 JOB (40600000),CLASS=A,MSGCLASS=X  
//*
//JOBLIB   DD DSN=ITAUM.LOAD,DISP=SHR
//*
//STEP0001 EXEC PGM=ITAUM001
//SYSIN    DD DUMMY
//SYSPRINT DD SYSOUT=*
//*---------------------------------------------------
//* SORT 
//*---------------------------------------------------
//ORDENA   EXEC PGM=SORT                              
//SYSOUT   DD SYSOUT=*                                
//SORTIN   DD DSN=ITAUM.PS1,DISP=SHR        
//SORTOUT  DD DSN=ITAUM.PS2,DISP=SHR            
//SYSOUT   DD SYSOUT=*                                
//SYSPRINT DD SYSOUT=*                                
//SYSIN    DD *                                       
 SORT FIELDS=(1,31,CH,A)                              
 SUM FIELDS=NONE    
/*                   
//REPRO   JOB (40600000),CLASS=A,MSGCLASS=X          
//*------------------------------------------------------ 
//* REPRO                 
//*------------------------------------------------------  
//STEP1  EXEC PGM=IDCAMS                                   
//IN  DD DSN=ITAUM.PS1,DISP=SHR                          
//OUT DD DSN=ITAUM.VSAM1,DISP=SHR                         
//SYSPRINT DD  SYSOUT=*                                    
//SYSIN DD  *                                              
 REPRO INFILE(IN) -                                        
 OUTFILE(OUT)                                              
/*                                                         
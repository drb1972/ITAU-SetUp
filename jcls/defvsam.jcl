//DEFVSAM   JOB (40600000),CLASS=A,MSGCLASS=X
//*------------------------------------------------------ 
//STEP1  EXEC PGM=IDCAMS                                  
//SYSPRINT DD  SYSOUT=*                                   
//SYSIN    DD  *                                          
DEFINE CLUSTER (NAME(ITAUM .VSAM1)      -                 
INDEXED                                 -                 
KEYS(6 1)                               -                 
RECSZ(80 80)                            -                 
TRACKS(1,1)                             -                 
CISZ(4096)                              -                 
FREESPACE(3 3) )                        -                 
DATA (NAME(ITAUM.VSAM1.DATA))          -                 
INDEX (NAME(UTAUM.VSAM1.INDEX))                          
/*                                                        
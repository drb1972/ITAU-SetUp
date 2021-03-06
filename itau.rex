/* rexx                                    */
/* crea las librerias Master para ITAU Demo*/

ENV   = 'ITAUM'
call crea_alias
call alloc
call load
exit

crea_alias:

masterc = ICF.MASTER.VCATLOG
userc   = ICF.MINI.USERCAT
alias   = "'"ENV"'"

'zowe tso issue command --ssm "LISTC ENT('alias') ALIAS" | RxQueue'
jcl = 0
drop jcl.
do queued()
   pull var; say '> 'var
   select 
      when pos("ALIAS",var) > 0 then do
         say 'ALIAS 'env ' exists'
      end
      when pos("NOT FOUND",var) > 0 then do 
         jcl=jcl+1 ; jcl.jcl = '//CREALIAS JOB (40600000),CLASS=A,MSGCLASS=X'
         jcl=jcl+ 1; jcl.jcl = '//STEP1     EXEC  PGM=IDCAMS'
         jcl=jcl+ 1; jcl.jcl = '//SYSPRINT  DD    SYSOUT=A'
         jcl=jcl+ 1; jcl.jcl = '//SYSIN     DD    *'
         jcl=jcl+ 1; jcl.jcl = '     DEFINE ALIAS -'
         jcl=jcl+ 1; jcl.jcl = '           (NAME('ENV') -'
         jcl=jcl+ 1; jcl.jcl = '            RELATE('userc')) -'
         jcl=jcl+ 1; jcl.jcl = '            CATALOG('masterc')'

         jcl.0 = jcl
         "rm temp.jcl"
         output_file = 'temp.jcl' 
         call lineout output_file, , 1
         do j = 1 to jcl.0
            call lineout output_file, jcl.j
         end
         call lineout output_file
         com ="zowe zos-jobs submit local-file temp.jcl --vasc"; interpret '"'com'"'
      end
      otherwise nop
   end
end

return

alloc:
/* Librerías de ejecutables */
com ="zowe zos-files create data-set-binary ITAUM.LOAD --bs 27998 --rf U --rl 27998 --sz 1 --ss 1"; interpret '"'com'"'
com ="zowe zos-files create data-set-binary ITAUM.OBJECT --bs 27998 --rf U --rl 27998 --sz 1 --ss 1"; interpret '"'com'"'
com ="zowe zos-files create data-set-binary ITAUM.CICS.LOAD --bs 27998 --rf U --rl 27998 --sz 1 --ss 1"; interpret '"'com'"'
com ="zowe zos-files create data-set-binary ITAUM.IMS.LOAD --bs 27998 --rf U --rl 27998 --sz 1 --ss 1"; interpret '"'com'"'
com ="zowe zos-files create data-set-binary ITAUM.DBRM --bs 27998 --rf U --rl 27998 --sz 1 --ss 1"; interpret '"'com'"'

/* PDS */
com ="zowe zos-files create classic ITAUM.COBOL  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1 --ss 1"; interpret '"'com'"'
com ="zowe zos-files create classic ITAUM.JCL  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1 --ss 1"; interpret '"'com'"'
com ="zowe zos-files create classic ITAUM.COPY  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1 --ss 1"; interpret '"'com'"'

/* PS File */
com ="zowe zos-files create ps ITAUM.PS1 --bs 6160 --rf FB --rl 80 --sz 1 --ss 1"; interpret '"'com'"'
com ="zowe zos-files create ps ITAUM.PS2 --bs 7315 --rf FB --rl 95 --sz 1 --ss 1"; interpret '"'com'"'

/* PDS */
com ="zowe zos-files create classic ITAUM.PDS1  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1 --ss 1"; interpret '"'com'"'
com ="zowe zos-files create classic ITAUM.PDS2  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1 --ss 1"; interpret '"'com'"'

/* VSAM */
com ="zowe zos-jobs submit local-file creavsam.jcl --vasc"; interpret '"'com'"'

/* Populate libraries */

com ="zowe zos-files upload dir-to-pds ITAU/COBOL ITAUM.COBOL"; interpret '"'com'"'
com ="zowe zos-files upload dir-to-pds ITAU/COPY ITAUM.COPY"; interpret '"'com'"'
com ="zowe zos-files upload dir-to-pds ITAU/JCL ITAUM.JCL"; interpret '"'com'"'
com ="zowe zos-files upload file-to-data-set ITAU/PS1 ITAUM.PS1"; interpret '"'com'"'
com ="zowe zos-files upload file-to-data-set ITAU/PS2 ITAUM.PS2"; interpret '"'com'"'
com ="zowe zos-files upload file-to-data-set ITAU/PDS1 ITAUM.PDS1(MEM1)"; interpret '"'com'"'
com ="zowe zos-files upload file-to-data-set ITAU/PDS2 ITAUM.PDS2(MEM2)"; interpret '"'com'"'
com ="zowe zos-jobs submit local-file repro.jcl --vasc"; interpret '"'com'"'
return

load:
com ='zowe zos-files list all-members "itaum.cobol"'
interpret "'"com"  | RxQueue'"

member.0 = queued()
input_file  = 'ITAUMCMP.jcl'
output_file = 'temp.jcl' 
do i=1 to member.0
   member.i = linein("QUEUE:")
   /* Open output for writing */
   call lineout output_file, , 1
   /* Read lines in loop and process them */
   do while lines(input_file) \= 0
      line = linein(input_file)
      if pos("&env",line) > 0 then do
         parse var line head '&env' tail
         line = head || ENV || tail
      end 
      if pos("&member",line) > 0 then do
         parse var line head '&member' tail
         line = head || member.i || tail
      end 
      /* write line to the output file */
      call lineout output_file, line
      say line
   end
   /* close all files */
   call lineout output_file
   call lineout input_file
   com ="zowe zos-jobs submit local-file temp.jcl --vasc"; interpret '"'com'"'
end
return





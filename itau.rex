/* rexx                                    */
/* crea las librerias Master para ITAU Demo*/

/* Librerías de ejecutables */
interpret "zowe zos-files create ITAUM.LOAD bin ITAUM.LOAD  --bs 27998 --rf U --rl 27998 --sz 1CYL --ss 1CYL"
interpret "zowe zos-files create ITAUM.OBJECT bin ITAUM.LOAD  --bs 27998 --rf U --rl 27998 --sz 1CYL --ss 1CYL"
interpret "zowe zos-files create ITAUM.CICS.LOAD bin ITAUM.LOAD  --bs 27998 --rf U --rl 27998 --sz 1CYL --ss 1CYL"
interpret "zowe zos-files create ITAUM.IMS.LOAD bin ITAUM.LOAD  --bs 27998 --rf U --rl 27998 --sz 1CYL --ss 1CYL"
interpret "zowe zos-files create ITAUM.DBRM bin ITAUM.LOAD  --bs 27998 --rf U --rl 27998 --sz 1CYL --ss 1CYL"

/* PDS */
interpret "zowe zos-files create classic ITAUM.COBOL  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1CYL --ss 1"
interpret "zowe zos-files create classic ITAUM.JCL  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1CYL --ss 1"
interpret "zowe zos-files create classic ITAUM.COPY  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1CYL --ss 1"

/* PS File */
interpret "zowe zos-files create ps ITAU.PS1 --bs 6160 --rf FB --rl 80 --sz 1CYL --ss 1"
interpret "zowe zos-files create ps ITAU.PS2 --bs 6160 --rf FB --rl 80 --sz 1CYL --ss 1"

/* PDS */
interpret "zowe zos-files create classic ITAUM.PDS1  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1CYL --ss 1"
interpret "zowe zos-files create classic ITAUM.PDS2  --bs 6160 --dst LIBRARY --rf FB --rl 80 --sz 1CYL --ss 1"

/* VSAM */
interpret "zowe zos-files create vsam ITAUM.VSAM1  --dso INDEXED --sz 1CYL --ss 1CYL"

/* Populate libraries */

interpret "zowe zos-jobs submit local-file comp.jcl  --vasc"
interpret "zowe zos-files create vsam ITAUM.VSAM1 --dso INDEXED --sz 1CYL --ss 1CYL"
interpret "zowe zos-files upload dir-to-pds 'ITAU/COBOL' 'ITAUM.COBOL'"
interpret "zowe zos-files upload dir-to-pds 'ITAU/COPY' 'ITAUM.COPY'"
interpret "zowe zos-files upload dir-to-pds 'ITAU/JCL' 'ITAUM.JCL'"
interpret 'zowe zos-files upload file-to-data-set "ITAU/PS1" "ITAUM.PS1"'
interpret 'zowe zos-files upload file-to-data-set "ITAU/PDS1" "ITAUM.PDS1(MEM1)"'
interpret 'zowe zos-files upload file-to-data-set "ITAU/PDS2" "ITAUM.PDS1(MEM2)"'
interpret "zowe zos-jobs submit local-file repro.jcl  --vasc"
exit




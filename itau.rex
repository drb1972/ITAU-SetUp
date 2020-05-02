/* rexx                                    */
/* crea las librerias Master para ITAU Demo*/

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
com ="zowe zos-files create vsam ITAUM.VSAM1  --dso INDEXED --sz 1 --ss 1"; interpret '"'com'"'

/* Populate libraries */

com ="zowe zos-files upload dir-to-pds 'ITAU/COBOL' 'ITAUM.COBOL'"; interpret '"'com'"'
com ="zowe zos-files upload dir-to-pds 'ITAU/COPY' 'ITAUM.COPY'"; interpret '"'com'"'
com ="zowe zos-files upload dir-to-pds 'ITAU/JCL' 'ITAUM.JCL'"; interpret '"'com'"'
com ="zowe zos-files upload file-to-data-set ITAU/PS1 'ITAUM.PS1'"; interpret '"'com'"'
com ="zowe zos-files upload file-to-data-set ITAU/PS2 'ITAUM.PS2'"; interpret '"'com'"'
com ="zowe zos-files upload file-to-data-set ITAU/PDS1 ITAUM.PDS1(MEM1)"; interpret '"'com'"'
com ="zowe zos-files upload file-to-data-set ITAU/PDS2 ITAUM.PDS2(MEM2)"; interpret '"'com'"'
com ="zowe zos-jobs submit local-file repro.jcl --vasc"; interpret '"'com'"'

com ='zowe zos-jobs submit data-set "ITAUM.JCL(ITAUMCMP)"'; interpret "'"com"'"

exit





PROC IMPORT
DATAFILE ="C:\Users\EmilyHong\Google ���ݵw��\graduate\106A course\�h�ܶq���R\Homework 3\test.xlsx"
OUT= WORK
DBMS=EXCEL REPLACE;

RUN;

/*���V�m�M����*/
DATA TRAIN TEST;
  SET WORK;
  IF id <=523 THEN OUTPUT TRAIN;
  IF id >523 THEN OUTPUT TEST;
RUN;

PROC PRINT DATA=TRAIN; 
PROC PRINT DATA=TEST;

/* Discrimination Analysis */
/* class :y�ܼ� */
/*PRIORS������v  */
PROC DISCRIM DATA=train TESTDATA=test LIST LISTERR TESTLIST TESTLISTERR;
CLASS CNTTDHH;
VAR DRVRCNT HHFAMINC HHSIZE HHVEHCNT WRKCOUNT wchild retired;
 PRIORS '0'=.64 '1'=.36 ;
RUN;
/* Stepwise Discrimination Analysis */
PROC STEPDISC DATA=train FORWARD;
CLASS CNTTDHH;
VAR DRVRCNT HHFAMINC HHSIZE HHVEHCNT WRKCOUNT wchild retired;
RUN;
/* �ھڳv�B�P�O���R�����G�A�R��DRVRCNT�� HHVEHCNT ���ܼơA�d�U��L�ܼơA�A���@���P�O���R */
PROC DISCRIM DATA=train TESTDATA=test LIST LISTERR TESTLIST TESTLISTERR;
CLASS CNTTDHH;
VAR HHFAMINC HHSIZE WRKCOUNT wchild retired;
 PRIORS '0'=.64 '1'=.36 ;
RUN;


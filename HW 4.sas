DATA WORK;
  Infile "C:\Users\EmilyHong\Google ���ݵw��\graduate\106A course\�h�ܶq���R\Homework 4\HW4_final.prn";
  Input  x1-x16;
  Cards;
Run;
PROC PRINT;

/* Principal Componest */
/*out�ⰵ���D���������out��princon���*/
PROC PRINCOMP DATA=WORK OUT=princom; 
  VAR x1-x16;
RUN; 
/* ��X�D�������O�_���� */
/*var ���D�|�ӥD�����˵��O�_����*/
PROC CORR DATA=princom;
 VAR PRIN1 PRIN2 PRIN3 PRIN4;
RUN;

/* Factor Analysis with orthogonal rotation method*/
PROC FACTOR DATA=WORK METHOD=PRINCIPAL MSA SCREE ROTATE=VARIMAX OUTSTAT=output SCORE FUZZ=0.4; 
  VAR x1-x16;
RUN; 



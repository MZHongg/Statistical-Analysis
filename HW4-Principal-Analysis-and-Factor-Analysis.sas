DATA WORK;
  Infile "C:\Users\EmilyHong\Google 雲端硬碟\graduate\106A course\多變量分析\Homework 4\HW4_final.prn";
  Input  x1-x16;
  Cards;
Run;
PROC PRINT;

/* Principal Componest */
/*out把做完主成分的資料out到princon資料*/
PROC PRINCOMP DATA=WORK OUT=princom; 
  VAR x1-x16;
RUN; 
/* 算出主成份間是否相關 */
/*var 先挑四個主成份檢視是否相關*/
PROC CORR DATA=princom;
 VAR PRIN1 PRIN2 PRIN3 PRIN4;
RUN;

/* Factor Analysis with orthogonal rotation method*/
PROC FACTOR DATA=WORK METHOD=PRINCIPAL MSA SCREE ROTATE=VARIMAX OUTSTAT=output SCORE FUZZ=0.4; 
  VAR x1-x16;
RUN; 



DATA h2;
  Infile "C:\Users\EmilyHong\Google ���ݵw��\graduate\106A course\�h�ܶq���R\Homework 2\accident_all_selected data_cut2.prn";
  Input speedlimit drink die injury;
  Cards;
Run;
PROC PRINT;


/* Multivariate Regression Analysis */
/*MTEST ��EQUATION�@�˩w*/
PROC REG data=h2;
 MODEL die injury=speedlimit drink/ VIF TOL DW SPEC;
 Mtest1:MTEST speedlimit, drink;
 Mtest2:MTEST speedlimit;

RUN;


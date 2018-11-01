DATA h2;
  Infile "C:\Users\EmilyHong\Google 雲端硬碟\graduate\106A course\多變量分析\Homework 2\accident_all_selected data_cut2.prn";
  Input speedlimit drink die injury;
  Cards;
Run;
PROC PRINT;


/* Multivariate Regression Analysis */
/*MTEST 跨EQUATION作檢定*/
PROC REG data=h2;
 MODEL die injury=speedlimit drink/ VIF TOL DW SPEC;
 Mtest1:MTEST speedlimit, drink;
 Mtest2:MTEST speedlimit;

RUN;


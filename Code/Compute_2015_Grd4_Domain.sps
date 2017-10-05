* Encoding: UTF-8.
/*Topic N1*/
GET
  FILE='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'.
  DATASET NAME DataSet1 WINDOW=FRONT.
  include file = 'C:\MySoftware\IEA\IDBAnalyzerV4\bin\Data\Templates\SPSS_Macros\JB_PV.ieasps'.

JB_PV 	 infile='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'/
   cvar=IDCNTRY /
   rootpv=ExpectedPercent_N1/
   tailpv=/
   npv=5/
   wgt=TOTWGT/
   nrwgt=150 /
   rwgt=/
   jkz=JKZONE/
   jkr=JKREP/
   jk2type=FULL/
   nomiss=Y/
   method=JRR/
   kfac=0/
   shrtcut=N/
   viewcod=N/
   ndec=4/
   clean = Y/
   strctry = N/
   graphs=N/
   intavg=Y/
   selcrit = /
   selvar = /
   outdir='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\TempOutput'/
   outfile='G4_Domain_2015_ExpectedPercent_N1'.

/*Topic N2*/
GET
  FILE='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'.
  DATASET NAME DataSet1 WINDOW=FRONT.
  include file = 'C:\MySoftware\IEA\IDBAnalyzerV4\bin\Data\Templates\SPSS_Macros\JB_PV.ieasps'.

JB_PV 	 infile='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'/
   cvar=IDCNTRY /
   rootpv=ExpectedPercent_N2/
   tailpv=/
   npv=5/
   wgt=TOTWGT/
   nrwgt=150 /
   rwgt=/
   jkz=JKZONE/
   jkr=JKREP/
   jk2type=FULL/
   nomiss=Y/
   method=JRR/
   kfac=0/
   shrtcut=N/
   viewcod=N/
   ndec=4/
   clean = Y/
   strctry = N/
   graphs=N/
   intavg=Y/
   selcrit = /
   selvar = /
   outdir='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\TempOutput'/
   outfile='G4_Domain_2015_ExpectedPercent_N2'.

/*Topic N3*/
GET
  FILE='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'.
  DATASET NAME DataSet1 WINDOW=FRONT.
  include file = 'C:\MySoftware\IEA\IDBAnalyzerV4\bin\Data\Templates\SPSS_Macros\JB_PV.ieasps'.

JB_PV 	 infile='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'/
   cvar=IDCNTRY /
   rootpv=ExpectedPercent_N3/
   tailpv=/
   npv=5/
   wgt=TOTWGT/
   nrwgt=150 /
   rwgt=/
   jkz=JKZONE/
   jkr=JKREP/
   jk2type=FULL/
   nomiss=Y/
   method=JRR/
   kfac=0/
   shrtcut=N/
   viewcod=N/
   ndec=4/
   clean = Y/
   strctry = N/
   graphs=N/
   intavg=Y/
   selcrit = /
   selvar = /
   outdir='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\TempOutput'/
   outfile='G4_Domain_2015_ExpectedPercent_N3'.

/*Topic G1*/
GET
  FILE='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'.
  DATASET NAME DataSet1 WINDOW=FRONT.
  include file = 'C:\MySoftware\IEA\IDBAnalyzerV4\bin\Data\Templates\SPSS_Macros\JB_PV.ieasps'.

JB_PV 	 infile='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'/
   cvar=IDCNTRY /
   rootpv=ExpectedPercent_G1/
   tailpv=/
   npv=5/
   wgt=TOTWGT/
   nrwgt=150 /
   rwgt=/
   jkz=JKZONE/
   jkr=JKREP/
   jk2type=FULL/
   nomiss=Y/
   method=JRR/
   kfac=0/
   shrtcut=N/
   viewcod=N/
   ndec=4/
   clean = Y/
   strctry = N/
   graphs=N/
   intavg=Y/
   selcrit = /
   selvar = /
   outdir='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\TempOutput'/
   outfile='G4_Domain_2015_ExpectedPercent_G1'.

/*Topic G2*/
GET
  FILE='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'.
  DATASET NAME DataSet1 WINDOW=FRONT.
  include file = 'C:\MySoftware\IEA\IDBAnalyzerV4\bin\Data\Templates\SPSS_Macros\JB_PV.ieasps'.

JB_PV 	 infile='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'/
   cvar=IDCNTRY /
   rootpv=ExpectedPercent_G2/
   tailpv=/
   npv=5/
   wgt=TOTWGT/
   nrwgt=150 /
   rwgt=/
   jkz=JKZONE/
   jkr=JKREP/
   jk2type=FULL/
   nomiss=Y/
   method=JRR/
   kfac=0/
   shrtcut=N/
   viewcod=N/
   ndec=4/
   clean = Y/
   strctry = N/
   graphs=N/
   intavg=Y/
   selcrit = /
   selvar = /
   outdir='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\TempOutput'/
   outfile='G4_Domain_2015_ExpectedPercent_G2'.

/*Topic D1*/
GET
  FILE='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'.
  DATASET NAME DataSet1 WINDOW=FRONT.
  include file = 'C:\MySoftware\IEA\IDBAnalyzerV4\bin\Data\Templates\SPSS_Macros\JB_PV.ieasps'.

JB_PV 	 infile='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd4_Domain.sav'/
   cvar=IDCNTRY /
   rootpv=ExpectedPercent_D1/
   tailpv=/
   npv=5/
   wgt=TOTWGT/
   nrwgt=150 /
   rwgt=/
   jkz=JKZONE/
   jkr=JKREP/
   jk2type=FULL/
   nomiss=Y/
   method=JRR/
   kfac=0/
   shrtcut=N/
   viewcod=N/
   ndec=4/
   clean = Y/
   strctry = N/
   graphs=N/
   intavg=Y/
   selcrit = /
   selvar = /
   outdir='C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\TempOutput'/
   outfile='G4_Domain_2015_ExpectedPercent_D1'.

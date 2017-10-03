* Encoding: UTF-8.
* Grade 4, 2015, domain


* Encoding: UTF-8.
/* Import the data from the input SPSS file with student info */
GET FILE "H:\5.2_main\TIMSS\TIMSS topic study\Input\ASAUSAM6.sav".
DATASET NAME StudentData WINDOW=Front.

/* Import the data from the output .csv file with the estimated percent scores for each Topic */
GET DATA
  /TYPE=TXT
  /FILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\ExpectedPercentScoresGrd4Domain2015.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  ExpectedPercent_D11 F16.13
  ExpectedPercent_D12 F16.13
  ExpectedPercent_D13 F16.13
  ExpectedPercent_D14 F16.13
  ExpectedPercent_D15 F16.13
  ExpectedPercent_G11 F16.13
  ExpectedPercent_G12 F16.13
  ExpectedPercent_G13 F16.13
  ExpectedPercent_G14 F16.13
  ExpectedPercent_G15 F16.13
  ExpectedPercent_G21 F16.13
  ExpectedPercent_G22 F16.13
  ExpectedPercent_G23 F16.13
  ExpectedPercent_G24 F16.13
  ExpectedPercent_G25 F16.13
  ExpectedPercent_N11 F16.13
  ExpectedPercent_N12 F16.13
  ExpectedPercent_N13 F16.13
  ExpectedPercent_N14 F16.13
  ExpectedPercent_N15 F16.13
  ExpectedPercent_N21 F16.13
  ExpectedPercent_N22 F16.13
  ExpectedPercent_N23 F16.13
  ExpectedPercent_N24 F16.13
  ExpectedPercent_N25 F16.13
  ExpectedPercent_N31 F16.13
  ExpectedPercent_N32 F16.13
  ExpectedPercent_N33 F16.13
  ExpectedPercent_N34 F16.13
  ExpectedPercent_N35 F16.13
  ExpectedPercent_Total1 F16.13
  ExpectedPercent_Total2 F16.13
  ExpectedPercent_Total3 F16.13
  ExpectedPercent_Total4 F16.13
  ExpectedPercent_Total5 F16.13
  ExpectedPercent_ASMDAT1 F16.13
  ExpectedPercent_ASMDAT2 F16.13
  ExpectedPercent_ASMDAT3 F16.13
  ExpectedPercent_ASMDAT4 F16.13
  ExpectedPercent_ASMDAT5 F16.13
  ExpectedPercent_ASMGEO1 F16.13
  ExpectedPercent_ASMGEO2 F16.13
  ExpectedPercent_ASMGEO3 F16.13
  ExpectedPercent_ASMGEO4 F16.13
  ExpectedPercent_ASMGEO5 F16.13
  ExpectedPercent_ASMNUM1 F16.13
  ExpectedPercent_ASMNUM2 F16.13
  ExpectedPercent_ASMNUM3 F16.13
  ExpectedPercent_ASMNUM4 F16.13
  ExpectedPercent_ASMNUM5 F16.13.
CACHE.
EXECUTE.
DATASET NAME ExpectedPercentScores WINDOW=ASIS.

/* Merge datasets*/
DATASET ACTIVATE StudentData.
MATCH FILES /FILE=*
  /FILE='ExpectedPercentScores'.
EXECUTE.

/* Save the merged file */
SAVE OUTFILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\asausam6_merged_domain.sav".

* Grade 4, 2015, general

* Encoding: UTF-8.
/* Import the data from the input SPSS file with student info */
GET FILE "H:\5.2_main\TIMSS\TIMSS topic study\Input\ASAUSAM6.sav".
DATASET NAME StudentData WINDOW=Front.

/* Import the data from the output .csv file with the estimated percent scores for each Topic */
GET DATA
  /TYPE=TXT
  /FILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\ExpectedPercentScoresGrd4General2015.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  ExpectedPercent_D11 F16.13
  ExpectedPercent_D12 F16.13
  ExpectedPercent_D13 F16.13
  ExpectedPercent_D14 F16.13
  ExpectedPercent_D15 F16.13
  ExpectedPercent_G11 F16.13
  ExpectedPercent_G12 F16.13
  ExpectedPercent_G13 F16.13
  ExpectedPercent_G14 F16.13
  ExpectedPercent_G15 F16.13
  ExpectedPercent_G21 F16.13
  ExpectedPercent_G22 F16.13
  ExpectedPercent_G23 F16.13
  ExpectedPercent_G24 F16.13
  ExpectedPercent_G25 F16.13
  ExpectedPercent_N11 F16.13
  ExpectedPercent_N12 F16.13
  ExpectedPercent_N13 F16.13
  ExpectedPercent_N14 F16.13
  ExpectedPercent_N15 F16.13
  ExpectedPercent_N21 F16.13
  ExpectedPercent_N22 F16.13
  ExpectedPercent_N23 F16.13
  ExpectedPercent_N24 F16.13
  ExpectedPercent_N25 F16.13
  ExpectedPercent_N31 F16.13
  ExpectedPercent_N32 F16.13
  ExpectedPercent_N33 F16.13
  ExpectedPercent_N34 F16.13
  ExpectedPercent_N35 F16.13
  ExpectedPercent_Total1 F16.13
  ExpectedPercent_Total2 F16.13
  ExpectedPercent_Total3 F16.13
  ExpectedPercent_Total4 F16.13
  ExpectedPercent_Total5 F16.13
  ExpectedPercent_ASMDAT1 F16.13
  ExpectedPercent_ASMDAT2 F16.13
  ExpectedPercent_ASMDAT3 F16.13
  ExpectedPercent_ASMDAT4 F16.13
  ExpectedPercent_ASMDAT5 F16.13
  ExpectedPercent_ASMGEO1 F16.13
  ExpectedPercent_ASMGEO2 F16.13
  ExpectedPercent_ASMGEO3 F16.13
  ExpectedPercent_ASMGEO4 F16.13
  ExpectedPercent_ASMGEO5 F16.13
  ExpectedPercent_ASMNUM1 F16.13
  ExpectedPercent_ASMNUM2 F16.13
  ExpectedPercent_ASMNUM3 F16.13
  ExpectedPercent_ASMNUM4 F16.13
  ExpectedPercent_ASMNUM5 F16.13.
CACHE.
EXECUTE.
DATASET NAME ExpectedPercentScores WINDOW=ASIS.

/* Merge datasets*/
DATASET ACTIVATE StudentData.
MATCH FILES /FILE=*
  /FILE='ExpectedPercentScores'.
EXECUTE.

/* Save the merged file */
SAVE OUTFILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\asausam6_merged_general.sav".

* Grade 4, 2011, domain

* Encoding: UTF-8.
/* Import the data from the input SPSS file with student info */
GET FILE "H:\5.2_main\TIMSS\TIMSS topic study\Input\ASAUSAM5.sav".
DATASET NAME StudentData WINDOW=Front.

/* Import the data from the output .csv file with the estimated percent scores for each Topic */
GET DATA
  /TYPE=TXT
  /FILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\ExpectedPercentScoresGrd4Domain2011.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  ExpectedPercent_D11 F16.13
  ExpectedPercent_D12 F16.13
  ExpectedPercent_D13 F16.13
  ExpectedPercent_D14 F16.13
  ExpectedPercent_D15 F16.13
  ExpectedPercent_G11 F16.13
  ExpectedPercent_G12 F16.13
  ExpectedPercent_G13 F16.13
  ExpectedPercent_G14 F16.13
  ExpectedPercent_G15 F16.13
  ExpectedPercent_G21 F16.13
  ExpectedPercent_G22 F16.13
  ExpectedPercent_G23 F16.13
  ExpectedPercent_G24 F16.13
  ExpectedPercent_G25 F16.13
  ExpectedPercent_N11 F16.13
  ExpectedPercent_N12 F16.13
  ExpectedPercent_N13 F16.13
  ExpectedPercent_N14 F16.13
  ExpectedPercent_N15 F16.13
  ExpectedPercent_N21 F16.13
  ExpectedPercent_N22 F16.13
  ExpectedPercent_N23 F16.13
  ExpectedPercent_N24 F16.13
  ExpectedPercent_N25 F16.13
  ExpectedPercent_N31 F16.13
  ExpectedPercent_N32 F16.13
  ExpectedPercent_N33 F16.13
  ExpectedPercent_N34 F16.13
  ExpectedPercent_N35 F16.13
  ExpectedPercent_Total1 F16.13
  ExpectedPercent_Total2 F16.13
  ExpectedPercent_Total3 F16.13
  ExpectedPercent_Total4 F16.13
  ExpectedPercent_Total5 F16.13
  ExpectedPercent_ASMDAT1 F16.13
  ExpectedPercent_ASMDAT2 F16.13
  ExpectedPercent_ASMDAT3 F16.13
  ExpectedPercent_ASMDAT4 F16.13
  ExpectedPercent_ASMDAT5 F16.13
  ExpectedPercent_ASMGEO1 F16.13
  ExpectedPercent_ASMGEO2 F16.13
  ExpectedPercent_ASMGEO3 F16.13
  ExpectedPercent_ASMGEO4 F16.13
  ExpectedPercent_ASMGEO5 F16.13
  ExpectedPercent_ASMNUM1 F16.13
  ExpectedPercent_ASMNUM2 F16.13
  ExpectedPercent_ASMNUM3 F16.13
  ExpectedPercent_ASMNUM4 F16.13
  ExpectedPercent_ASMNUM5 F16.13.
CACHE.
EXECUTE.
DATASET NAME ExpectedPercentScores WINDOW=ASIS.

/* Merge datasets*/
DATASET ACTIVATE StudentData.
MATCH FILES /FILE=*
  /FILE='ExpectedPercentScores'.
EXECUTE.

/* Save the merged file */
SAVE OUTFILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\asausam5_merged_domain.sav".

* Grade 4, 2011, general

* Encoding: UTF-8.
/* Import the data from the input SPSS file with student info */
GET FILE "H:\5.2_main\TIMSS\TIMSS topic study\Input\ASAUSAM5.sav".
DATASET NAME StudentData WINDOW=Front.

/* Import the data from the output .csv file with the estimated percent scores for each Topic */
GET DATA
  /TYPE=TXT
  /FILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\ExpectedPercentScoresGrd4General2011.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  ExpectedPercent_D11 F16.13
  ExpectedPercent_D12 F16.13
  ExpectedPercent_D13 F16.13
  ExpectedPercent_D14 F16.13
  ExpectedPercent_D15 F16.13
  ExpectedPercent_G11 F16.13
  ExpectedPercent_G12 F16.13
  ExpectedPercent_G13 F16.13
  ExpectedPercent_G14 F16.13
  ExpectedPercent_G15 F16.13
  ExpectedPercent_G21 F16.13
  ExpectedPercent_G22 F16.13
  ExpectedPercent_G23 F16.13
  ExpectedPercent_G24 F16.13
  ExpectedPercent_G25 F16.13
  ExpectedPercent_N11 F16.13
  ExpectedPercent_N12 F16.13
  ExpectedPercent_N13 F16.13
  ExpectedPercent_N14 F16.13
  ExpectedPercent_N15 F16.13
  ExpectedPercent_N21 F16.13
  ExpectedPercent_N22 F16.13
  ExpectedPercent_N23 F16.13
  ExpectedPercent_N24 F16.13
  ExpectedPercent_N25 F16.13
  ExpectedPercent_N31 F16.13
  ExpectedPercent_N32 F16.13
  ExpectedPercent_N33 F16.13
  ExpectedPercent_N34 F16.13
  ExpectedPercent_N35 F16.13
  ExpectedPercent_Total1 F16.13
  ExpectedPercent_Total2 F16.13
  ExpectedPercent_Total3 F16.13
  ExpectedPercent_Total4 F16.13
  ExpectedPercent_Total5 F16.13
  ExpectedPercent_ASMDAT1 F16.13
  ExpectedPercent_ASMDAT2 F16.13
  ExpectedPercent_ASMDAT3 F16.13
  ExpectedPercent_ASMDAT4 F16.13
  ExpectedPercent_ASMDAT5 F16.13
  ExpectedPercent_ASMGEO1 F16.13
  ExpectedPercent_ASMGEO2 F16.13
  ExpectedPercent_ASMGEO3 F16.13
  ExpectedPercent_ASMGEO4 F16.13
  ExpectedPercent_ASMGEO5 F16.13
  ExpectedPercent_ASMNUM1 F16.13
  ExpectedPercent_ASMNUM2 F16.13
  ExpectedPercent_ASMNUM3 F16.13
  ExpectedPercent_ASMNUM4 F16.13
  ExpectedPercent_ASMNUM5 F16.13.
CACHE.
EXECUTE.
DATASET NAME ExpectedPercentScores WINDOW=ASIS.

/* Merge datasets*/
DATASET ACTIVATE StudentData.
MATCH FILES /FILE=*
  /FILE='ExpectedPercentScores'.
EXECUTE.

/* Save the merged file */
SAVE OUTFILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\asausam5_merged_general.sav".

* Grade 8, 2015, domain

* Encoding: UTF-8.
/* Import the data from the input SPSS file with student info */
GET FILE "H:\5.2_main\TIMSS\TIMSS topic study\Input\BSAUSAM6.sav".
DATASET NAME StudentData WINDOW=Front.

/* Import the data from the output .csv file with the estimated percent scores for each Topic */
GET DATA
  /TYPE=TXT
  /FILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\ExpectedPercentScoresGrd8Domain.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  ExpectedPercent_A11 F16.13
ExpectedPercent_A12 F16.13
ExpectedPercent_A13 F16.13
ExpectedPercent_A14 F16.13
ExpectedPercent_A15 F16.13
ExpectedPercent_A21 F16.13
ExpectedPercent_A22 F16.13
ExpectedPercent_A23 F16.13
ExpectedPercent_A24 F16.13
ExpectedPercent_A25 F16.13
ExpectedPercent_A31 F16.13
ExpectedPercent_A32 F16.13
ExpectedPercent_A33 F16.13
ExpectedPercent_A34 F16.13
ExpectedPercent_A35 F16.13
ExpectedPercent_D11 F16.13
ExpectedPercent_D12 F16.13
ExpectedPercent_D13 F16.13
ExpectedPercent_D14 F16.13
ExpectedPercent_D15 F16.13
ExpectedPercent_D21 F16.13
ExpectedPercent_D22 F16.13
ExpectedPercent_D23 F16.13
ExpectedPercent_D24 F16.13
ExpectedPercent_D25 F16.13
ExpectedPercent_D31 F16.13
ExpectedPercent_D32 F16.13
ExpectedPercent_D33 F16.13
ExpectedPercent_D34 F16.13
ExpectedPercent_D35 F16.13
ExpectedPercent_G11 F16.13
ExpectedPercent_G12 F16.13
ExpectedPercent_G13 F16.13
ExpectedPercent_G14 F16.13
ExpectedPercent_G15 F16.13
ExpectedPercent_G21 F16.13
ExpectedPercent_G22 F16.13
ExpectedPercent_G23 F16.13
ExpectedPercent_G24 F16.13
ExpectedPercent_G25 F16.13
ExpectedPercent_G31 F16.13
ExpectedPercent_G32 F16.13
ExpectedPercent_G33 F16.13
ExpectedPercent_G34 F16.13
ExpectedPercent_G35 F16.13
ExpectedPercent_N11 F16.13
ExpectedPercent_N12 F16.13
ExpectedPercent_N13 F16.13
ExpectedPercent_N14 F16.13
ExpectedPercent_N15 F16.13
ExpectedPercent_N21 F16.13
ExpectedPercent_N22 F16.13
ExpectedPercent_N23 F16.13
ExpectedPercent_N24 F16.13
ExpectedPercent_N25 F16.13
ExpectedPercent_N31 F16.13
ExpectedPercent_N32 F16.13
ExpectedPercent_N33 F16.13
ExpectedPercent_N34 F16.13
ExpectedPercent_N35 F16.13
ExpectedPercent_Total1 F16.13
ExpectedPercent_Total2 F16.13
ExpectedPercent_Total3 F16.13
ExpectedPercent_Total4 F16.13
ExpectedPercent_Total5 F16.13
ExpectedPercent_BSMALG1 F16.13
ExpectedPercent_BSMALG2 F16.13
ExpectedPercent_BSMALG3 F16.13
ExpectedPercent_BSMALG4 F16.13
ExpectedPercent_BSMALG5 F16.13
ExpectedPercent_BSMDAT1 F16.13
ExpectedPercent_BSMDAT2 F16.13
ExpectedPercent_BSMDAT3 F16.13
ExpectedPercent_BSMDAT4 F16.13
ExpectedPercent_BSMDAT5 F16.13
ExpectedPercent_BSMGEO1 F16.13
ExpectedPercent_BSMGEO2 F16.13
ExpectedPercent_BSMGEO3 F16.13
ExpectedPercent_BSMGEO4 F16.13
ExpectedPercent_BSMGEO5 F16.13
ExpectedPercent_BSMNUM1 F16.13
ExpectedPercent_BSMNUM2 F16.13
ExpectedPercent_BSMNUM3 F16.13
ExpectedPercent_BSMNUM4 F16.13
ExpectedPercent_BSMNUM5 F16.13.
CACHE.
EXECUTE.
DATASET NAME ExpectedPercentScores WINDOW=ASIS.

/* Merge datasets*/
DATASET ACTIVATE StudentData.
MATCH FILES /FILE=*
  /FILE='ExpectedPercentScores'.
EXECUTE.

/* Save the merged file */
SAVE OUTFILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\BSAUSAM6_merged_domain.sav".

* Grade 8, 2015, general

* Encoding: UTF-8.
/* Import the data from the input SPSS file with student info */
GET FILE "H:\5.2_main\TIMSS\TIMSS topic study\Input\BSAUSAM6.sav".
DATASET NAME StudentData WINDOW=Front.

/* Import the data from the output .csv file with the estimated percent scores for each Topic */
GET DATA
  /TYPE=TXT
  /FILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\ExpectedPercentScoresGrd8General.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  ExpectedPercent_A11 F16.13
ExpectedPercent_A12 F16.13
ExpectedPercent_A13 F16.13
ExpectedPercent_A14 F16.13
ExpectedPercent_A15 F16.13
ExpectedPercent_A21 F16.13
ExpectedPercent_A22 F16.13
ExpectedPercent_A23 F16.13
ExpectedPercent_A24 F16.13
ExpectedPercent_A25 F16.13
ExpectedPercent_A31 F16.13
ExpectedPercent_A32 F16.13
ExpectedPercent_A33 F16.13
ExpectedPercent_A34 F16.13
ExpectedPercent_A35 F16.13
ExpectedPercent_D11 F16.13
ExpectedPercent_D12 F16.13
ExpectedPercent_D13 F16.13
ExpectedPercent_D14 F16.13
ExpectedPercent_D15 F16.13
ExpectedPercent_D21 F16.13
ExpectedPercent_D22 F16.13
ExpectedPercent_D23 F16.13
ExpectedPercent_D24 F16.13
ExpectedPercent_D25 F16.13
ExpectedPercent_D31 F16.13
ExpectedPercent_D32 F16.13
ExpectedPercent_D33 F16.13
ExpectedPercent_D34 F16.13
ExpectedPercent_D35 F16.13
ExpectedPercent_G11 F16.13
ExpectedPercent_G12 F16.13
ExpectedPercent_G13 F16.13
ExpectedPercent_G14 F16.13
ExpectedPercent_G15 F16.13
ExpectedPercent_G21 F16.13
ExpectedPercent_G22 F16.13
ExpectedPercent_G23 F16.13
ExpectedPercent_G24 F16.13
ExpectedPercent_G25 F16.13
ExpectedPercent_G31 F16.13
ExpectedPercent_G32 F16.13
ExpectedPercent_G33 F16.13
ExpectedPercent_G34 F16.13
ExpectedPercent_G35 F16.13
ExpectedPercent_N11 F16.13
ExpectedPercent_N12 F16.13
ExpectedPercent_N13 F16.13
ExpectedPercent_N14 F16.13
ExpectedPercent_N15 F16.13
ExpectedPercent_N21 F16.13
ExpectedPercent_N22 F16.13
ExpectedPercent_N23 F16.13
ExpectedPercent_N24 F16.13
ExpectedPercent_N25 F16.13
ExpectedPercent_N31 F16.13
ExpectedPercent_N32 F16.13
ExpectedPercent_N33 F16.13
ExpectedPercent_N34 F16.13
ExpectedPercent_N35 F16.13
ExpectedPercent_Total1 F16.13
ExpectedPercent_Total2 F16.13
ExpectedPercent_Total3 F16.13
ExpectedPercent_Total4 F16.13
ExpectedPercent_Total5 F16.13
ExpectedPercent_BSMALG1 F16.13
ExpectedPercent_BSMALG2 F16.13
ExpectedPercent_BSMALG3 F16.13
ExpectedPercent_BSMALG4 F16.13
ExpectedPercent_BSMALG5 F16.13
ExpectedPercent_BSMDAT1 F16.13
ExpectedPercent_BSMDAT2 F16.13
ExpectedPercent_BSMDAT3 F16.13
ExpectedPercent_BSMDAT4 F16.13
ExpectedPercent_BSMDAT5 F16.13
ExpectedPercent_BSMGEO1 F16.13
ExpectedPercent_BSMGEO2 F16.13
ExpectedPercent_BSMGEO3 F16.13
ExpectedPercent_BSMGEO4 F16.13
ExpectedPercent_BSMGEO5 F16.13
ExpectedPercent_BSMNUM1 F16.13
ExpectedPercent_BSMNUM2 F16.13
ExpectedPercent_BSMNUM3 F16.13
ExpectedPercent_BSMNUM4 F16.13
ExpectedPercent_BSMNUM5 F16.13.
CACHE.
EXECUTE.
DATASET NAME ExpectedPercentScores WINDOW=ASIS.

/* Merge datasets*/
DATASET ACTIVATE StudentData.
MATCH FILES /FILE=*
  /FILE='ExpectedPercentScores'.
EXECUTE.

/* Save the merged file */
SAVE OUTFILE="H:\5.2_main\TIMSS\TIMSS topic study\Output\BSAUSAM6_merged_general.sav".





















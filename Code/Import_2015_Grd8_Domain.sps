* Encoding: UTF-8.

PRESERVE.
SET DECIMAL DOT.

GET DATA  /TYPE=TXT
  /FILE=
    "C:\Users\tcalico\Desktop\TIMSS_topic_october\Output\ExpectedPercentScores_2015_Grd8_Domain.csv"
  /ENCODING='UTF8'
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  IDCNTRY AUTO
  TOTWGT AUTO
  JKZONE AUTO
  JKREP AUTO
  ExpectedPercent_A11 AUTO
  ExpectedPercent_A12 AUTO
  ExpectedPercent_A13 AUTO
  ExpectedPercent_A14 AUTO
  ExpectedPercent_A15 AUTO
  ExpectedPercent_A21 AUTO
  ExpectedPercent_A22 AUTO
  ExpectedPercent_A23 AUTO
  ExpectedPercent_A24 AUTO
  ExpectedPercent_A25 AUTO
  ExpectedPercent_A31 AUTO
  ExpectedPercent_A32 AUTO
  ExpectedPercent_A33 AUTO
  ExpectedPercent_A34 AUTO
  ExpectedPercent_A35 AUTO
  ExpectedPercent_D11 AUTO
  ExpectedPercent_D12 AUTO
  ExpectedPercent_D13 AUTO
  ExpectedPercent_D14 AUTO
  ExpectedPercent_D15 AUTO
  ExpectedPercent_D21 AUTO
  ExpectedPercent_D22 AUTO
  ExpectedPercent_D23 AUTO
  ExpectedPercent_D24 AUTO
  ExpectedPercent_D25 AUTO
  ExpectedPercent_D31 AUTO
  ExpectedPercent_D32 AUTO
  ExpectedPercent_D33 AUTO
  ExpectedPercent_D34 AUTO
  ExpectedPercent_D35 AUTO
  ExpectedPercent_G11 AUTO
  ExpectedPercent_G12 AUTO
  ExpectedPercent_G13 AUTO
  ExpectedPercent_G14 AUTO
  ExpectedPercent_G15 AUTO
  ExpectedPercent_G21 AUTO
  ExpectedPercent_G22 AUTO
  ExpectedPercent_G23 AUTO
  ExpectedPercent_G24 AUTO
  ExpectedPercent_G25 AUTO
  ExpectedPercent_G31 AUTO
  ExpectedPercent_G32 AUTO
  ExpectedPercent_G33 AUTO
  ExpectedPercent_G34 AUTO
  ExpectedPercent_G35 AUTO
  ExpectedPercent_N11 AUTO
  ExpectedPercent_N12 AUTO
  ExpectedPercent_N13 AUTO
  ExpectedPercent_N14 AUTO
  ExpectedPercent_N15 AUTO
  ExpectedPercent_N21 AUTO
  ExpectedPercent_N22 AUTO
  ExpectedPercent_N23 AUTO
  ExpectedPercent_N24 AUTO
  ExpectedPercent_N25 AUTO
  ExpectedPercent_N31 AUTO
  ExpectedPercent_N32 AUTO
  ExpectedPercent_N33 AUTO
  ExpectedPercent_N34 AUTO
  ExpectedPercent_N35 AUTO
  ExpectedPercent_Total1 AUTO
  ExpectedPercent_Total2 AUTO
  ExpectedPercent_Total3 AUTO
  ExpectedPercent_Total4 AUTO
  ExpectedPercent_Total5 AUTO
  ExpectedPercent_ASMDAT1 AUTO
  ExpectedPercent_ASMDAT2 AUTO
  ExpectedPercent_ASMDAT3 AUTO
  ExpectedPercent_ASMDAT4 AUTO
  ExpectedPercent_ASMDAT5 AUTO
  ExpectedPercent_ASMGEO1 AUTO
  ExpectedPercent_ASMGEO2 AUTO
  ExpectedPercent_ASMGEO3 AUTO
  ExpectedPercent_ASMGEO4 AUTO
  ExpectedPercent_ASMGEO5 AUTO
  ExpectedPercent_ASMNUM1 AUTO
  ExpectedPercent_ASMNUM2 AUTO
  ExpectedPercent_ASMNUM3 AUTO
  ExpectedPercent_ASMNUM4 AUTO
  ExpectedPercent_ASMNUM5 AUTO
  /MAP.
RESTORE.

CACHE.
EXECUTE.
DATASET NAME DataSet1 WINDOW=FRONT.

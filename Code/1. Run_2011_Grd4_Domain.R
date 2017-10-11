# This file sets the important directories and global variables. It then calls, 
# one by one, all script files that calculate the topic scores. 
# Each script file roughly corresponds to a slide on the PowerPoint 
# presentation prepared by Enis Dogan.


############
# Preamble #
############

# Make sure there are no objects in memory.
rm(list = ls())

# Set the directory structure. codeDir, inputDir and outpurDir MUST be
# sub directories of baseDir.
baseDir   <- "H:/5.2_secondary/TIMSS/TIMSS topic study/TIMSS_topic_october/"
codeDir   <- paste0(baseDir, "Code/")
inputDir  <- paste0(baseDir, "Input/")
outputDir <- paste0(baseDir, "Output/")


# Load required libraries.
library(data.table)
library(stringr)

# For this code to work you need three files: studentdatafile, scalingconstantsfile, and itemdatafile

# 1. studentDataFileName must be named "ASAUSAM6.csv" or "BSAUSAM6" depending on grade

# 2. scalingConstantsFile must be named "ScalingConstants2015TIMSSG8" or "ScalingConstants2011TIMMSG4" 
# depending on cycle/grade

# 3. itemDataFileName must be named ""T07T11combinedTIMSSG4.csv" or T011T15combinedTIMSSG8" etc. 
# depending on cycle/grade


###############################################################################
# Set global variables
###############################################################################

grade        <- '4'          # 4 or 8
analysisMode <- 'Domain'     # Domain or General
oldYear      <- '2007'       # 2007 or 2011                                              
newYear      <- '2011'       # 2011 or 2015

objectivesVarName <- "Objective"
topicsVarName     <- "Topic"

# Names studentdatafile, itemdatafile, and scaling constants object based on grade and newYear

studentDataFileName  <- "ASAUSAM5.csv"                    # .csv file with student data
itemDataFileName     <- "T07T11combinedTIMSSG4.csv"       # .csv file with item information data.
scalingConstantsFile <- "ScalingConstants2011TIMSSG4.csv" # .csv file with scaling data

# Create a list with the names of the latent traits and the corresponding
# Topic codes. Necessary to map latent trait estimates to items, and then
# compute response probabilities.

if (grade == '4') {
      traitsByTopics <- list(ASMDAT = c("D1"),                                  
                             ASMGEO = c("G1", "G2"),                        
                             ASMNUM = c("N1", "N2", "N3"))     
  
} else if (grade == '8') {
             traitsByTopics <- list(BSMALG = c("A1", "A2", "A3"),
                                    BSMDAT = c("D1", "D2", "D3"),                                
                                    BSMGEO = c("G1", "G2", "G3"),                        
                                    BSMNUM = c("N1", "N2", "N3"))     
}


# State how many plausible values exist, in order to automate computation
# of each response probability matrix.
numberOfPVs <- 5                                                       

# Decide wether to create files with intermediate computation results.
saveIntermediate <- TRUE #TRUE or FALSE

###############################################################################
###############################################################################

###############
# Computation #
###############

# Now call the files and compute
source(paste0(codeDir, "/2. ComputeItemWeights.R"))
source(paste0(codeDir, "/3. ComputeThetas.R"))
source(paste0(codeDir, "/4. ComputeAnswerProbabilities.R"))
source(paste0(codeDir, "/5. ComputeExpectedScores.R"))

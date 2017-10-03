# In this file we calculate the thetas for all students' plausible thetas.
# 1. We take a .csv file with the student data (translated from SPSS .sav file)
# 2. Import a .csv with the scaling constant.
# 3. Convert the 5 scale scores to theta, for all students.

############
# Preamble #
############

# Source required code
source(paste0(codeDir, "fRecastThetas.R"))


###############
# Computation #
###############

# Step 1: Get student usage information.
studentData <- fread(paste0(inputDir, studentDataFileName))

# Keep only relevant variables
if (grade == 4) {
	varsToKeep <-		c("IDCNTRY", "TOTWGT", "JKZONE", "JKREP",
									 paste0("ASMMAT", str_pad(1:numberOfPVs, 2, pad = "0")),
									 paste0("ASMDAT", str_pad(1:numberOfPVs, 2, pad = "0")),
									 paste0("ASMGEO", str_pad(1:numberOfPVs, 2, pad = "0")),
									 paste0("ASMNUM", str_pad(1:numberOfPVs, 2, pad = "0")))
} else if (grade == 8) {
	varsToKeep <-		c("IDCNTRY", "TOTWGT", "JKZONE", "JKREP",
										paste0("BSMMAT", str_pad(1:numberOfPVs, 2, pad = "0")),
									 	paste0("BSMALG", str_pad(1:numberOfPVs, 2, pad = "0")),
									 	paste0("BSMDAT", str_pad(1:numberOfPVs, 2, pad = "0")),
										paste0("BSMGEO", str_pad(1:numberOfPVs, 2, pad = "0")),
									 	paste0("BSMNUM", str_pad(1:numberOfPVs, 2, pad = "0")))
}

studentData <- studentData[, ..varsToKeep]


# Step 2: Get scaling constants.
scalingConstants <- fread(paste0(inputDir,scalingConstantsFile))

# Step 3: Compute thetas.

if (analysisMode == 'Domain') {
	lapply(names(traitsByTopics), computeThetas)
} else if (analysisMode == 'General' & grade == '4') {
	computeThetas('ASMMAT')
} else if (analysisMode == 'General' & grade == '8') {
	computeThetas('BSMMAT')
}

# Save it as .csv for sharing and as .Rdata to facilitate use in R.
if (saveIntermediate == TRUE) {
	write.csv(studentData,
						paste0(outputDir, "studentData_", newYear, "_Grd", grade, "_", analysisMode, ".csv"),
						row.names = FALSE)
}
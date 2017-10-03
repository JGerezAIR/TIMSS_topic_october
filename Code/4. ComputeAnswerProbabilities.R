# In this file we calculate the response probabilities for all student x items.
# We do it over the 5 PVs, which means that for student i we need to compute
# the probability 5 times
#
# To facilitate mapping, we will create 5 matrices, one for each PV.
# Each column will correspond to an item, and each row to a student. So each
# response probability matrix will be i students BY j items (12569 X 249).

############
# Preamble #
############

# Source required code
source(paste0(codeDir, "fIRTfunctions.R"))

###############
# Computation #
###############

# We compute the five matrices.
# We run the computeRP() function five times PER TOPIC. For each plausible value
# we select the appropriate mix of thetas and items, compute the probabilities,
# and bind it into a single matrix. We should end up with 1 matrix per PV, all
# of which have the same number of rows (students = 12569) and columns
# (items = 249).

# We get the names of items that belong to each Topic.
itemGroups <- list()

for (i in 1:length(traitsByTopics)) {
  temp <- character()
  name <- names(traitsByTopics[i])
  for (j in 1:length(traitsByTopics[[i]])) {
    temp <- c(temp,
              itemData[get(topicsVarName) == traitsByTopics[[i]][j], itemID])
  }
  itemGroups[[name]] <- temp
}

# And we compute the five matrices with response probabilities, by looping
# over the number of plausible values.


for (i in 1:numberOfPVs) {
  temp <<-
    aggregateRP(names(traitsByTopics), i, analysisMode, itemGroups, nrow(studentData))
  assign(paste0("responseProbsPV", i), temp)
} 


# Let us save this, once again, as .csv for sharing, and as .Rdata for
# further computation.

if (saveIntermediate == TRUE) {
  for (i in 1:numberOfPVs) {
    write.csv(get(paste0("responseProbsPV", i)),
              paste0(outputDir, "responseProbs_PV", i, "_", newYear, "_Grd", grade, "_", analysisMode, ".csv"),
              row.names = FALSE)
  }
}
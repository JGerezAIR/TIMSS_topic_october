# In this file we calculate the indiviual item weights.
# 1. We take the .csv file with the item usage in 2007 and 2011.
# 2. Compute the weights as per slide 2.
# 3. Save the data table with the item weights as .Rdata and .csv files

# Step 1: Get item usage information.
itemData <- fread(paste0(inputDir, itemDataFileName))

# Set important keys, so we can condition
setkeyv(itemData,
        cols = c('itemID', 'adminYear', topicsVarName,
                 objectivesVarName))

# Also, order items in the following order: T15Objectives, itemID
itemData <- itemData[order(get(objectivesVarName), itemID)]

# Set a table that will have the marginals and the marginalWeights
# Select the unique Topics
marginalWeights <-
  as.data.table(itemData[, unique(get(topicsVarName))])
setnames(marginalWeights, 'V1', topicsVarName)

# Select the unique Objectives
marginalWeights <-
  merge(marginalWeights, itemData[, unique(get(objectivesVarName)), by = topicsVarName],  by = topicsVarName)
setnames(marginalWeights, 'V1', objectivesVarName)

# Set important keys, so we can condition and order
setkeyv(marginalWeights, cols = c(topicsVarName, objectivesVarName))

# Order by Topic and Objectives
marginalWeights <-
  marginalWeights[order(get(topicsVarName), get(objectivesVarName))]

###############################################
# Compute and merge the marginals, one by one #
###############################################

# Compute points in old year BY Objectives
marginalWeights <-
  merge(marginalWeights, itemData[adminYear == oldYear, sum(maxPoints),
                                  by = objectivesVarName],
        by = objectivesVarName, all.x = TRUE)
# Set the name of the newly created column
setnames(marginalWeights, 'V1', paste0('pointsObjectives', oldYear))

# Compute points in new year BY Objectives
marginalWeights <-
  merge(marginalWeights, itemData[adminYear == newYear, sum(maxPoints),
                                  by = objectivesVarName],
        by = objectivesVarName, all.y = TRUE)
# Set the name of the newly created column
setnames(marginalWeights, 'V1', paste0('pointsObjectives', newYear))


# Compute points in old year  BY TOPICS
marginalWeights <-
  merge(marginalWeights, itemData[adminYear == oldYear, sum(maxPoints),
                                  by = topicsVarName],
        by = topicsVarName, all.x = TRUE)

# Set the name of the newly created column
setnames(marginalWeights, 'V1', paste0('pointsTopic', oldYear))

# Compute points in new year  BY TOPICS
marginalWeights <-
  merge(marginalWeights, itemData[adminYear == newYear, sum(maxPoints),
                                  by = topicsVarName],
        by = topicsVarName, all.x = TRUE)
# Set the name of the newly created column
setnames(marginalWeights, 'V1', paste0('pointsTopic', newYear))

# Set NA to 0, so we can do divison
marginalWeights[is.na(marginalWeights)] <- 0

# Compute Total Points per OBJECTIVE over years
marginalWeights[, totalObjectiveYears := get(paste0('pointsObjectives', oldYear))
                + get(paste0('pointsObjectives', newYear))]

# Compute Total points per TOPIC over years
marginalWeights[, totalTopicYears := sum(totalObjectiveYears), by = topicsVarName]


###############################
# Time to compute the ratios. #
###############################
# Ratio of Objective on Topic in 2011
marginalWeights[, paste0('ratio', newYear) :=
                  get(paste0('pointsObjectives', newYear)) /
                  get(paste0('pointsTopic', newYear))]

# Ratio of Objective on Topic over both years
marginalWeights[, ratioObjectiveBoth := totalObjectiveYears / totalTopicYears]


# Item weight.
marginalWeights[, itemWeight := get(paste0('ratio', newYear)) /
                  ratioObjectiveBoth]


####################################
# Merge item Weights to each item. #
####################################
itemData <-
  merge(itemData, marginalWeights[, list(itemWeight, get(objectivesVarName))],
        by.x = objectivesVarName, by.y = 'V2') # here we merge the marginalWeights with itemData (because they are item data)

# Reorder columns so it will be easier to look things up.
setcolorder(itemData, c(2:16, 1, 17:28))

# Also reorder rows by itemID
itemData <- itemData[order(itemID), ]

# Remove Marginal Weights temporary object.
rm(marginalWeights) # and here we get rid of marginalWeights, because it was a temp object.

# Compute reweighted max points
itemData[, reweightedMaxPoints := maxPoints * itemWeight]

# Save it as .csv for if required on first script.
if (saveIntermediate == TRUE) {
  write.csv(itemData, paste0(outputDir, "reweightedItemData_", newYear, "_", "Grd", grade, ".csv"), row.names = FALSE)
}
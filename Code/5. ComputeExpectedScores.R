# In this file we calculate the expected total scores per topic.
# We do it over the 5 respProbs, which means for student i we will have 5 PV X 
# 6 Topics = 30 Expected Total Scores
# 
# We will need the response probabilities and item data.


# So, let us do some matrix multiplication. We multiply each row
# in the respProbs matrices (all probs per student) by the weights for each
# item. We then transpose the weighted matrix, so we have students in rows
# and items on columns.
# We do this for all i PVs (in this case 5)

for (i in 1:numberOfPVs) {
  name <- paste0("responseProbsPV", i)
  # Now, create a temp matrix which will have the response probabilities
  # ordered by item name.
  temp <<- get(name)[, order(colnames(get(name)))]
  
  # Check that the colnames for the response proability matrix are in the same
  # order as the items in the itemData data.table. If not, stop.
  if (all.equal(colnames(temp), itemData[order(itemID), itemID]) == TRUE) {
    temp <<- apply(temp, 1, FUN = function(x) itemData$itemWeight * x)
    temp <<- t(temp)
    assign(paste0("weightedRespProb", i), temp)
    rm(temp)
  } else {
    cat("Columns do not match. Quitting.\n")
    break()
  }
}

# Let's free some space by getting rid of the unweighted probability matrices
rm(list = apropos("^responseProb"))

# Let us select the item names, their weights and reweighted max points.
# We also create a list with the denominators
itemsByTopic <- list()
denominators <- list()
uniqueTopics <- unique(unlist(traitsByTopics, use.names = FALSE))

# We simply loop over the unique Topic Names.
# Create a small data frame with weights to add to itemsByTopic list
for (i in 1:length(uniqueTopics)) {
  temp <<- itemData[get(topicsVarName) == uniqueTopics[i], 
                    .(itemID, itemWeight, reweightedPoints = maxPoints * itemWeight)]
  itemsByTopic[[uniqueTopics[i]]] <- temp
  denominators[[uniqueTopics[i]]] <- as.numeric(sum(temp$reweightedPoints) * .01)
}
rm(temp)


# Now... we want to compute the NUMBER CORRECT expected score and the 
# PERCENT expected score. We want to do this for the 1) Total Score,
# 2) three domains, and 3) 6 topics. That means that we need a dataframe with 
# 10 columns, times 5 PV = 50 columns.

uniqueTopics <- unique(unlist(traitsByTopics, use.names = FALSE))

colNames <- sapply(uniqueTopics, FUN = function(x) paste(paste0('ExpectedNmbCorr_',
                                                                x,1:numberOfPVs), sep = ','),
                   simplify = TRUE)

colNames <- as.list(colNames)
colNames <- c(colNames, sapply('Total', FUN = function(x) paste(paste0('ExpectedNmbCorr_',
                                                                       x,1:numberOfPVs), sep = ','),
                               simplify = TRUE))
colNames <- c(colNames, sapply(names(traitsByTopics), FUN = function(x) paste(paste0('ExpectedNmbCorr_',
                                                                                     x,1:numberOfPVs), sep = ','),
                               simplify = TRUE))


# Create data frame for number correct scores.
expectedNmbCorr <- as.data.frame(matrix(NA, nrow = nrow(studentData), 
                                        ncol = length(colNames)))
colnames(expectedNmbCorr) <- colNames


# Create data frame for percent scores.
expectedPercent <- as.data.frame(matrix(NA, nrow = nrow(studentData), 
                                        ncol = length(colNames)))
colNames <- sub("NmbCorr", "Percent", colnames(expectedNmbCorr))
colnames(expectedPercent) <- colNames
rm(colNames)



# Now we loop over the i TOPICS and j PVs in order to compute all
# i * j topic scores.
for (i in seq_along(uniqueTopics)) {
  for (j in 1:numberOfPVs) {
    colNameNmbCorr <- paste(paste0('ExpectedNmbCorr_',uniqueTopics[i],j), sep = ',')
    colNamepercent <- paste(paste0('ExpectedPercent_',uniqueTopics[i],j), sep = ',')
    
    matrixName     <- paste0("weightedRespProb", j)
    items          <- itemData[get(topicsVarName) == uniqueTopics[i], itemID]
    
    expectedNmbCorr[, colNameNmbCorr] <- rowSums(get(matrixName)[,items]) 
    expectedPercent[, colNamepercent] <- expectedNmbCorr[, colNameNmbCorr] /
      itemData[itemID %in% items, sum(reweightedMaxPoints) * .01]
    
  }
}

# Now we do the total score, over j PVs.
for (j in 1:numberOfPVs) {
  colNameNmbCorr <- paste(paste0('ExpectedNmbCorr_Total',j), sep = ',')
  colNamepercent <- paste(paste0('ExpectedPercent_Total',j), sep = ',')
  
  matrixName     <- paste0("weightedRespProb", j)
  items <- itemData[, itemID]
  
  expectedNmbCorr[, colNameNmbCorr] <- rowSums(get(matrixName)[,items]) 
  expectedPercent[, colNamepercent] <- expectedNmbCorr[, colNameNmbCorr] /
    itemData[itemID %in% items, sum(reweightedMaxPoints) * .01]
  
}

# Now we loop over the i DOMAINS and j PVs in order to compute all
# i * j domain scores.



for (i in seq_along(names(traitsByTopics))) {
  for (j in 1:numberOfPVs){
    
    
    colNameNmbCorr <- paste(paste0('ExpectedNmbCorr_',names(traitsByTopics)[i],j), sep = ',')
    colNamepercent <- paste(paste0('ExpectedPercent_',names(traitsByTopics)[i],j), sep = ',')
    
    topics         <- traitsByTopics[[i]]
    matrixName     <- paste0("weightedRespProb", j)
    items          <- itemData[topicsVarName %in% topics, itemID]
    
    expectedNmbCorr[, colNameNmbCorr] <- rowSums(get(matrixName)[,items]) 
    expectedPercent[, colNamepercent] <- expectedNmbCorr[, colNameNmbCorr] /
      itemData[itemID %in% items, sum(reweightedMaxPoints) * .01]
    
  }
}



# And we save the expected scpres to a .csv, in order to merge it in SPSS
# with the rest of the student data.
write.csv(expectedNmbCorr, paste0(outputDir, "/ExpectedNmbCorrGrd", grade, analysisMode, ".csv"),
          row.names = FALSE)

write.csv(expectedPercent, paste0(outputDir, "/ExpectedPercentScoresGrd", grade, analysisMode, ".csv"),
          row.names = FALSE)
# save(expectedScores, file = paste0(outputDir, "/expectedScores.Rdata"))

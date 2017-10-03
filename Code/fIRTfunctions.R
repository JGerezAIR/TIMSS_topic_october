# This file defines several functions for computing 2PL/3PL response
# probabilities, PCM expected score, as well as recovering the appropriate 
# item parameters, theta parameters, and selecting the scoring function conditi-
# onal on the type of item being used.

# Grab the item parameters.
# This function gets the item parameters for each item from the 'itemData' table
# Input: the item name (character)
# Output: a vector with 'itemTopic', 'maxPoints', and item parameters 'alpha',
# 'beta', 'gamma', 'd1', 'd2.' (character and real).

getParams <- function(itemName) {

  itemName <- as.character(itemName)
  params <- itemData[itemID == itemName,
                     c(a_est, b_est, c_est, d1_est, d2_est, maxPoints)]
  params <- as.data.frame(t(params))
  colnames(params) <-
    c('alpha', 'beta', 'gamma', 'd1', 'd2', 'maxPoints')
  return(params)
}

# Compute the response probabilities for 2PL and 3PL items, for a vector of 
# thetas. When item has no gamma parameter, we set it to 0.
# Input: a theta value; a vector with alpha, beta, gamma, d1, d2
# Output: a vector with the probability of a correct answer in a 2/3PL item.

prob3PL <- function(theta, params) {
  # Check for gamma parameter. If empty, set it to 0.
  if (is.na(params$gamma)) params$gamma <- 0
  
  # Numerator of 3 PL response probability function
  numerator   <- 1 - params$gamma
  
  # Denominator
  denominator <-
    1 + exp(-1.7 * params$alpha * (theta - params$beta))
  
  # Compute the probability, return it.
  prob <- params$gamma + (numerator / denominator)
  return(prob)
}


# Compute the expected score for Partial Credit items.
# Input:  a vector of thetas; a vector with alpha, beta, gamma, d1, d2.
# Output: a vector with the expect scores for the PCM item

probPartialCredit <- function(theta, params) {

  # Let us set those thresholds.
  Z0 <- 1.7 * params$alpha * (theta - params$beta)
  Z1 <- 1.7 * params$alpha * (theta - (params$beta - params$d1))
  Z2 <- 1.7 * params$alpha * (theta - (params$beta - params$d2))
  
  expZ0       <- exp(Z0)
  expZ0Z1     <- exp(Z0 + Z1)
  expZ0Z1Z2   <- exp(Z0 + Z1 + Z2)
  denominator <- expZ0 + expZ0Z1 + expZ0Z1Z2
  probD1      <- expZ0Z1 / denominator
  probD2      <- expZ0Z1Z2 / denominator
  expScore    <- probD1 + 2 * probD2
  return(expScore)
}

# Choose which response probability function to use, conditional on the item
# type. The function uses the 'maxPoint's variable to decide which function to
# use. If maxPoints == 1, use 2/3PL function. All else, use PCM function.
# Input: a vector of thetas, a vector with alpha, beta, gamma, d1, d2, maxPoints.
# Output: A vector of response probabilities. 

computeProbs <- function(theta, item) {
  tempParams <- getParams(item)
  if (tempParams$maxPoints == 1) {
    probs <- prob3PL(theta, tempParams)
  } else {
    probs <- probPartialCredit(theta, tempParams)
  }
  return(probs)
}


# Compute a filled response probability matrix
# Input: a vector with theta values, a vector with item names
# Output: a matrix with response probabilities. Each row is a student, each
# column an item.

computeRP <- function(thetas, items) {

  # Create a temp matrix that will hold response probabilities
  tempMatrix <- matrix(NA, nrow = length(thetas), ncol = length(items))
  colnames(tempMatrix) <- c(items)
  
  # Using all thetas, go over all items, one item at the time, and compute all
  # response probabilities for that item.
  for (j in seq_along(items)) {
    item <- items[j]
    tempMatrix[, j] <- computeProbs(thetas, item)
  }
  # Return the temporary matrix
  return(tempMatrix)
}


# Compute and aggregate the response proability matrices for ALL topics, within
# a given plausible value.
# 
# Input:  A character vector with the root name of the topic variables.
#         An integer with the number of the target PV.
#         A character variable with analysis mode.
#         A data frame with the name of the items per Topic
#         Number of rows for the output matrix (N students)
# Output: A single matrix with nrows= N students and ncols = J items.      
        
aggregateRP <- function(topics, PV, analysisMode, itemGroups, nStudents){
  topics        <- as.character(topics)
  PV            <- as.numeric(PV)
  collatedProbs <- matrix(NA, nrow = nStudents, ncol = 0)
  
  if (analysisMode == 'Domain') {
  theta         <- as.character(paste0('theta_', topics, "_pv_0", PV))
  
  for (i in seq_along(topics)) {
      
      tempThetas <- studentData[, get(theta[i])]
      items <- itemGroups[[i]]
      tempProbs <- computeRP(tempThetas, items)
      collatedProbs <- cbind(collatedProbs, tempProbs) 
  }
  return(collatedProbs)
  
  } else if (analysisMode == 'General' & grade == '4') {
    theta <- as.character(paste0('theta_ASMMAT_pv_0', PV))
      tempThetas <- studentData[, get(theta)]
      items <- unlist(itemGroups)
      tempProbs <- computeRP(tempThetas, items)
      collatedProbs <- cbind(collatedProbs, tempProbs) 
    return(collatedProbs)
      
  } else if (analysisMode == 'General' & grade == '8') {
    theta <- as.character(paste0('theta_BSMMAT_pv_0', PV))
    tempThetas <- studentData[, get(theta)]
    items <- unlist(itemGroups)
    tempProbs <- computeRP(tempThetas, items)
    collatedProbs <- cbind(collatedProbs, tempProbs) 
  }
  return(collatedProbs)
}

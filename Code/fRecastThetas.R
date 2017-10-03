# Compute theta score using as input the report scores and the scaling constants
# This function assumes the following:
# a) Student information in a data.table object named 'studentData'
# b) Scaling information is a data.table object named 'scalingConstants'
# c) The scalingConstants table has three columns named 1) PV, 2) Origin, and 
#    3) SD. 
# d) There are FEWER than 10 plausible values, as the PV names are padded    
#    with a leading '0'.
#    
# The only required input is the root name of the score to be converted. For
# example for all mathematics number variables, 'ASMNUM01' - 'ASMNUM05', only
# provide 'ASMNUM'. The function will iterate across the appropriate number of
# PVs, as defined by the row length of the 'scalingConstants' table.
# 
# The computed scale scores are output to new columns in the 'studentData' table
# following the convention 'theta_ASMNUM_pv_01".
# 
# THIS FUNCTION ASSUMES THAT THE STUDENT DATA ARE IN DATA TABLE NAMED
# 'studentData'.

computeThetas <- function(scoreNameRoot) {
  scoreNameRoot <- as.character(scoreNameRoot)
  
  for (i in seq_along(scalingConstants$PV)) {
    targetTheta <- paste0('theta_', scoreNameRoot, "_pv_0", i)
    origScore   <- paste0(scoreNameRoot, 0, i)
    
    studentData[, eval(targetTheta) := (get(origScore)
                  - scalingConstants[i, Origin]) / scalingConstants[i, SD]]
    
  }
}

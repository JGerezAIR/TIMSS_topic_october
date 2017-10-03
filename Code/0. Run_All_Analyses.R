# Run all analyses.
# This script looks for files starting with "1." and runs them, one by one.

runDir 		 <- "C:/Users/tcalico/Desktop/TIMSS_topic_october/Code/"
filesToRun <- list.files(path = runDir, pattern = "(^1.+)")

for (i in seq_along(filesToRun)) {
	cat(paste0("Running ", filesToRun[i], ".\n"))
	source(paste0(runDir, filesToRun[i]))
}

## Programming Assigment 1, Part II: Air Pollution

# A function to collect the number of observations in each file within a
# specified directory, and compile a .csv with the columns: name of file and 
# number of observations.

setwd("/Users/Shelter/datasciencecoursera/specdata")
source("complete.R")

complete <- function(directory, id = 1:332) {
        
        # Collect list of specified files
        files <- list.files(paste("~/datasciencecoursera/", 
                                  directory, 
                                  "/", 
                                  sep = ""))[id]
        #print(files)
        
        # Determine number of complete observations per file
        obs <- lapply(files, function(x) read.csv(x))
        nobs <- lapply(obs, function(y) sum(complete.cases(y)))
        
        #print(obsum)
        
        # Combine id and nobs into a data.frame
        tab <- cbind(id, nobs)
        dat <- as.data.frame(tab)
        print(dat)
        
}

## Test
#complete("specdata", c(2, 4, 8, 10, 12))

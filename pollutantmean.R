## Programming Assignment 1, Part I: Air Pollution

# A function to extract the mean of a column of data from a handful of files 
# inside a directory. File names range from "001.csv" to "332.csv".

pollutantmean <- function(directory, pollutant, id) {
        
        # Draw out only the requested files (id) in the "directory" and print.
        monitors <- list.files(paste("~/datasciencecoursera/", 
                                     directory, 
                                     "/", 
                                     sep = ""))[id]
        #print(monitors)       
        
        
        # Loop through each file and extract all "pollutant" specified columns,
        # then compile each vector into a list.
        pols <- lapply(monitors, function(x) read.csv(x)[[pollutant]])
        #summary(pols) ## Did I catch each unique one?
        
        # Take the vectors out of their giant list and smash them together
        dat <- unlist(pols)
        #print(dat) ## Test
       
        # Calculate the mean.
        mean(dat, na.rm = T)
}

# Test - should be 4.064128
#pollutantmean("specdata", "sulfate", 1:10)

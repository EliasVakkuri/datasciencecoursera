complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  source('~/GitHub/datasciencecoursera/RProg1/readFiles.R')
  data <- readFiles (directory, id)
  
  counter <- 0
  
  idVector <- c()
  nobs <- c()
  
  for (i in id) {
    
    counter <- counter + 1
    
    idVector[counter] <- i
    
    dsub <- data[data$ID == i,]
    complete <- complete.cases(dsub)
    dcomp <- dsub[complete == TRUE,]
    
    nobs[counter] <- nrow(dcomp)
    
  }
  
  completes <- data.frame(idVector, nobs, row.names = NULL)
  colnames(completes) <- c("id","nobs")
  
  completes
}
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  source('~/GitHub/datasciencecoursera/RProg1/readFiles.R')
  
  data <- readFiles (directory)
  
  counter <- 0
  
  idVector <- c()
  nobs <- c()
  
  compData <- c()
  
  for (i in 1:332) {
    
    counter <- counter + 1
    
    idVector[counter] <- i
    
    dsub <- data[data$ID == i,]
    complete <- complete.cases(dsub)
    dcomp <- dsub[complete == TRUE,]
    
    compData <- rbind(compData, dcomp)
    
    nobs[counter] <- nrow(dcomp)
    
  }
  
  completes <- data.frame(idVector, nobs, row.names = NULL)
  colnames(completes) <- c("id","nobs")
  
  corrs <- c()
  counter <- 0
  
  for (i in 1:332) {
    
    counter <- counter + 1
    
    if (completes[completes$id == i,]$nobs > threshold) {
    
      corrs[counter] <- cor(compData[compData$ID == i,]$sulfate, 
                            compData[compData$ID == i,]$nitrate)
      
    }
    
  }
  
  if (!is.null(corrs)) {
    corrs[!is.na(corrs)]
  }
  else {
    corrs
  }
}
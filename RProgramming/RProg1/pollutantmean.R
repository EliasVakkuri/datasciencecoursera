pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  data <- readFiles (directory, id)
  
  if (pollutant == "sulfate") {
    mean(data$sulfate, na.rm = TRUE)
  }
  else if (pollutant == "nitrate") {
    mean(data$nitrate, na.rm = TRUE)
  }
  
}

readFiles <- function(directory, id) {
  
  #Read full filenames. MUST BE SORTED ASCENDING.
  filenames <- dir(directory, full.names = TRUE) 
  
  data <- data.frame()
  
  for (i in id) {
    
    data <- rbind(data, read.csv(filenames[i]))
    
  }
  
  data
  
}

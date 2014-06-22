readFiles <- function(directory, id = 1:332) {
  
  #Read full filenames. MUST BE SORTED ASCENDING.
  filenames <- dir(directory, full.names = TRUE) 
  
  data <- data.frame()
  
  for (i in id) {
    
    data <- rbind(data, read.csv(file = filenames[i], 
                                 comment.char = "", 
                                 colClasses = c("character", 
                                                "numeric", 
                                                "numeric", 
                                                "integer"),
                                 nrows = 10000))
    
  }
  
  data
  
}
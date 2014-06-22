rankHospNoRead <- function(state, outcome, num = "best", data ) {
        
        ## Set column numbers corresponding to outcomes
        ocCols <- data.frame(oc = c("heart attack", 
                                    "heart failure", 
                                    "pneumonia"),
                             col = c(11,
                                     17,
                                     23))
        
        ## Check that state and outcome are valid
        outc <- as.character(outcome)
        
        column <- ocCols[ocCols$oc == outc, 2]
        if (length(column) == 0)
                stop("invalid outcome")
        
        applicable <- data[data$State == state, c(2, column)]
        if (nrow(applicable) == 0)
                stop("invalid state")
        
        ## Exclude "Not Available"
        rates <- applicable[applicable[,2] != "Not Available",]
        
        ## Switch data to numeric
        rates[,2] <- as.numeric(rates[,2])
        
        ## Order first by outcome, then by name
        hospRank <- order(rates[,2], rates[,1])
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        if (is.numeric(num)) {
                hospName <- rates[hospRank[num], 1]        
        }
        else if (num == "best") {
                hospName <- rates[head(hospRank, 1), 1]
        }
        else {
                hospName <- rates[tail(hospRank, 1), 1]
        }
        
        hospName
}
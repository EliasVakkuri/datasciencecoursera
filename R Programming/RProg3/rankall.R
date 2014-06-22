rankall <- function(outcome, num = "best") {
        
        source("rankHospNoRead.R")
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", 
                         colClasses ="character")
        
        ## Create list of state abbreviations, and sort alphabetically
        states <- unique ( data[,7] )
        states <- states[order(states)]
        
        ## For each state, find the hospital of the given rank
        bestPerState <- character( length(states) )
        
        for ( i in 1:length(states) ) {
                
                bestPerState[i] <- rankHospNoRead ( states[i],
                                                    outcome,
                                                    num,
                                                    data )                
        }
        
        bestHosps <- data.frame(hospital = bestPerState, state = states)
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        bestHosps
        
}
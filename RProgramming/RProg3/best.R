best <- function(state, outcome) {
        source("rankhospital.R")
        
        bestHosp <- rankhospital(state, outcome, num = "best")
        
        bestHosp
}
source("i0score_with_diamonds_effect.R")

plays_till_broke <- function(start_with) {
    cash <- start_with
    n <- 0
    repeat {
        cash <- cash - 1 + play()
        n <- n + 1
        if (cash <= 0) {
            break
        }
    }
    n
}

plays_till_broke(100)
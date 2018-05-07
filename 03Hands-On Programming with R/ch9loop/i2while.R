source("i0score_with_diamonds_effect.R")

plays_till_broke <- function(start_with) {
    cash <- start_with
    n <- 0
    while (cash > 0) {
        cash <- cash - 1 + play()
        n <- n + 1
    }
    n
}

plays_till_broke(100)
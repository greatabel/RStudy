source("../ch9loop/i0score_with_diamonds_effect.R")

winnings <- vector(length = 100000)
for( i in 1:100000){
    winnings[i] <- play()
}

mean(winnings)
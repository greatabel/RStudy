system.time({
    output <- rep(NA, 1000000)
    for(i in 1:1000000){
        output[i] <- i + 1
    }
})

system.time({
    output <- NA
    for(i in 1:1000000){
        output[i] <- i + 1
    }
})
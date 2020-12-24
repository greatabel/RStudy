now <- Sys.time()
now

typeof(now)
class(now)
unclass(now)

mil <- 1000000
mil

class(mil) <- c("POSIXct", "POSIXt")
mil
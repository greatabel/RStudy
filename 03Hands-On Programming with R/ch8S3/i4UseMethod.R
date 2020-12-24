source("i1change_play_func.R")
source("i2invoke_i1play.R")

one_play = play()

class(one_play) <- 'slots'

args(print)

print.slots <- function(x, ...) {
    cat('I am print.slots method\n')
}

print(one_play)

rm(print.slots)

print.slots <- function(x, ...) {
    slot_display(x)
}
print(one_play)
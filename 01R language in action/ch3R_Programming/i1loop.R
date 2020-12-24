library(crayon)

i <- 10

while( i <= 15) {
    cat(green(i, ' '))
    i = i + 1
}

'i = '; i

repeat {
    cat(i, " ")
    i <- i + 1
    if( i > 20) {
        cat("\n")
        break
    }
}

for(i in 1: 10){
    cat(i , " ")
    if (i >= 5) {
        cat("\n")
        break
    }
}

cat(blue$bold('求水仙花数\n'))

for(i in 100:999){

    a = floor(i / 100)
    b = floor((i - a*100)/10)
    c = i - a*100 - b* 10

    if(a^3 + b^3 + c^3 == i){
        cat(red(i, "\n"))
    }
    
}
a <- 3.14

dec <- a - trunc(a)
dec

if(dec >= 0.5){
    a <- trunc(a) + 1
} else {
    a <- trunc(a)
}

a
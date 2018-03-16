library(plotrix)

countries <- c("Brazil", "Russia", "India", "China", "Souch Africa")
GDP <- c(23920, 20790, 18618, 94906, 3660)

pie3D(GDP, labels = countries, explode=0.1,
    main = '3D Pie Chart')
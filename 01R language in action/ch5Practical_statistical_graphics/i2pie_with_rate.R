countries <- c("Brazil", "Russia", "India", "China", "Souch Africa")
GDP <- c(23920, 20790, 18618, 94906, 3660)

percentage = round(GDP / sum(GDP) * 100, 2)
index <- paste(countries, " ", percentage, "%", sep="")
pie(GDP, labels = index, col = rainbow(length(index)),
    main = "pie chart with percentage")
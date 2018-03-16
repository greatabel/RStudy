countries <- c("Brazil", "Russia", "India", "China", "Souch Africa")
GDP <- c(23920, 20790, 18618, 94906, 3660)
pie(GDP, labels = countries, col = c('purple', 'violetred1','green3', 'cornsilk', 'cyan'),
         main = "2013 年金砖国家 GDP ")
pie(GDP, labels = countries,  clockwise = TRUE, 
    col = gray(seq(0.4, 1.0, length=5)),
    main = "basic")
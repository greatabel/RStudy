library(dplyr)
library(lubridate)
library(data.table)
library(geosphere)
library(ggplot2)
library(gridExtra)

train <-tibble::as_tibble(fread("csv_data/distance_average_summary.csv"))

class(train)
glimpse(train)
summary(train)

sum(is.na(train))
train <- train %>%
mutate(pickup_datetime = ymd_hms(pickup_datetime),
        dropoff_datetime = ymd_hms(dropoff_datetime),
        vendor_id = factor(vendor_id),
        distance = factor(distance))


# table‘s sumamary data is coming from rhdfs's result
# I just copy and past into the read.table()
# it's temp solution
data <- read.table(text = "Month             Averge_Pick_in_24            Fiscal.Year
                           2013-01-01        15              2013
                           2009-02-01        23              2013
                           2009-03-01        21              2013
                           2009-04-01        14              2013
                           2009-05-01        20              2013
                           2009-06-01        18              2013
                           2020-01-01        12              2020
                           2020-02-01        13              2020
                           2012-03-01        12              2020
                           2012-04-01        21              2020
                           2012-05-01        9               2020
                           2012-06-01        10              2020",
                   header=TRUE, sep="", nrows=18)

data$MonthN <- as.numeric(format(as.Date(data$Month),"%m")) # Month's number
data$Month  <- months(as.Date(data$Month), abbreviate=TRUE) # Month's abbr.


g <- ggplot(data = data, aes(x = MonthN, y = Averge_Pick_in_24, 
  group = Fiscal.Year, 
  colour=as.factor(Fiscal.Year))) +
  xlab("1M             2M            3M             4M            5M            6M") +
  ylab("Averge_Pick_in_24") +
     geom_line() +
     geom_point() +
     scale_x_discrete(breaks = data$MonthN, labels = data$Month) 
     # + scale_fill_manual(values=c("blue", "red", "orange"))


print(g)
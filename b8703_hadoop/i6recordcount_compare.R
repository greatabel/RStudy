library(dplyr)
library(lubridate)
library(data.table)
library(geosphere)
library(ggplot2)
library(gridExtra)

train <-tibble::as_tibble(fread("csv_data/monthly_summary.csv"))

class(train)
glimpse(train)
summary(train)

sum(is.na(train))
train <- train %>%
mutate(pickup_datetime = ymd_hms(pickup_datetime),
        dropoff_datetime = ymd_hms(dropoff_datetime),
        vendor_id = factor(vendor_id),
        passenger_count = factor(passenger_count))

train <- train %>%
 mutate(weekday = wday(pickup_datetime),
        month = month(pickup_datetime),
       year = year(pickup_datetime))

# train <- train %>%
#  mutate(distance = distHaversine(pickuplocation,dropofflocation)/1000) 
# train <- train %>%
#  mutate(speed = distance/trip_duration*3600)

p1 <- train %>%
 ggplot(aes(year,fill = weekday)) +
 geom_bar(fill = 3) +
 theme(legend.position = "null")

print(p1)
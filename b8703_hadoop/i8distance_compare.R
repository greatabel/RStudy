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

train <- train %>%
 mutate(weekday = wday(pickup_datetime),
        month = month(pickup_datetime),
       year = year(pickup_datetime))

# p1 <- train %>%
#  ggplot(aes(year,fill = weekday)) +
#  geom_bar(fill = 3) +
#  theme(legend.position = "null")


# p4 <- train%>%
#  ggplot(aes(year,fill = passenger_count)) +
#  geom_bar() +theme(legend.position = "null") +
#  scale_y_sqrt()

# ggplot(small,aes(price,fill=cut,alpha = 1/10))+
# geom_histogram(position="dodge")  
#position=dodge,将各系列位置错开成簇状直方图。

# p4 <- train%>%
#  ggplot(aes(year,fill=passenger_count,alpha = 1/10))+
# geom_histogram(position="dodge")  
p4 <- train%>%
 ggplot(aes(year,fill=distance,alpha = 1/10))+
geom_histogram(position="dodge",bins=5) 

print(p4)
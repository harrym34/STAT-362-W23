# More on dplyr: a package for data management 
library(tidyverse)
install.packages("nycflights13")
library(nycflights13)

# Functions we will use

# arrange(): to reorder rows
# filter(): select some rows according to some specified conditions
# select(): select some specific columns
# mutate(): add some columns
# summarize(): create a new column based on other columns

#
# arrange()
#

# tibble is like data.frame
data <- tibble(x = c(2, 2, 1, 4, 5),
               y = c(2, 3, 10, 10, 10))

# result is also a tibble
arrange(data, x)
arrange(data, x, desc(y))

# main dataset in nycflights is flights
arrange(flights, desc(arr_delay))

df <- tibble(x = c(5, NA, 2))
arrange(df, x)
arrange(df, desc(x))

# Find the flights that left earliest, the -43 means the flight left 43
# mins early
arrange(flights, dep_delay)

#
# filter()
#

# Find the flights on January 1st, and view the data set (as a table)
View(filter(flights, month == 1, day == 1))

data <- tibble(x = c(1, 3, 5, 5, 3, 4, 5), 
               y = 1:7)

# Select the data where x == 5.
data[data$x == 5,]

# with the filter function (easier, more intuitive)
filter(data, x == 5, y == 7)


# select flights that departed in November or December
filter(flights, month == 11 | month == 12)
# could also do in base R
flights[flights$month == 11 | flights$month == 12]


# the %in% operator
a <- c(1, 3, 5)
b <- 1
a %in% b
d <- c(1, 2)
d %in% b

nov_dec2 <- filter(flights, month %in% c(11, 12))
nov_dec1 <- filter(flights, month == 11 | month == 12)
# to compare: they the exact same
identical(nov_dec1, nov_dec2)

# select flights that were not delayed on arrival or departure
# by more than two hours

# minutes not hours
delay1 <- filter(flights, dep_delay <= 120, arr_delay <= 120)

delay2 <- flights[flights$dep_delay <= 120 & flights$arr_delay <= 120]

# They are not the same
identical(delay1, delay2)


data3 <- tibble(x = 1:4, y = c(1, 2, NA, 4))
filter(data, x <= 4)
filter(data, y <= 4)

# Row with missing value
data3[data3$y <= 4,]


# find all flights that flew to Houston
# (IAH or HOU)

View(filter(flights, dest %in% c("IAH", "HOU")))

#
# select()
#

select(flights, month, day, dep_time)

# in base R
flights[, c("month", "day", "dep_time")]

# remove some columns - year is pretty useless as all the 
# flights are from 2013
select(flights, -year)




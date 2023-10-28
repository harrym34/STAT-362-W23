library(tidyverse)
library(nycflights13)
# Also install Rtools (for assignment)

# Recall: arrange(), filter(), select(), mutate(), transmute()
# Today:

#
# summarize()
#

# for example (with all missing values removed)
summarize(flights, mean_delay = mean(dep_delay, na.rm = TRUE))

# This is the same as
mean(flights$dep_delay, na.rm = TRUE)

# Suppose you want to compute the mean of the dep_delay for each day


# In base R, you could use a for loop

# iterate through months
mean_delay <- rep(0, 12)
for (i in 1:12) {
  # Assign the mean delay of each month to each element in mean_delay
  mean_delay[i] <- mean(flights[flights$month == i,]$dep_delay, 
                        na.rm = TRUE)
}
print(mean_delay)

# Summarize is usually used together with another function group_by()
by_month <- group_by(flights, month) 
summarize(by_month, mean_delay = mean(dep_delay, na.rm = TRUE))
                     
by_day <- group_by(flights, month, day)
summarize(by_day, means_delay = mean(dep_delay, na.rm = TRUE))

# Doing it with a for loop (or multiple).
no_day <- rep(0, 12)
for (i in 1:12) {
  no_day[i] <- unique(flights[flights$month == i,]$day)
}

no_day
x <- c(1, 2, 3)
unique(x)

mean_by_day <- rep(0, 365)
index <- 0
# For the month
for (i in 1:12) {
  # for the day
  for (j in 1:no_day[i]) {
    index <- index + 1
    mean_by_day[index] <- mean(flights[flights$month == i &
                 flights$day == j, ]$dep_delay,
         na.rm = TRUE)
  }
}

#
# the pipe operator ( %>%), ctrl + shift + m
#

filter(flights, month == 1)

flights %>% 
  filter(month == 1)

# this code performs the same task


flights %>% 
  group_by(month) %>% 
  summarize(mean_dep_delay = mean(dep_delay, na,rm = TRUE)) %>% 
  ungroup()

# first two lines
group_by(flights, month)
summarize(mean_dep_delay = mean(dep_delay, na,rm = TRUE))
# all three lines
summarize(group_by(flights, month), mean_dep_delay)

# usually you should use ungroup after using group_by
# and performing your task

#############################################
# CHAPTER V: Creating Basic Plots in base R #
#############################################


head(mtcars)

# scatterplot

# compare weight and mpg
plot(x = mtcars$wt, y = mtcars$mpg)

# Another example
set.seed(1)
x <- rnorm(20)
y <- 2 * x + 1 + rnorm(20, 0, 0.1)
plot(x, y)

# Line graphs
plot(pressure$temperature, pressure$pressure, type = "l")

# if you want to add points on an existing plot:
points(pressure$temperature, pressure$pressure, col = "purple")

# Add an additional line
lines(pressure$temperature, pressure$pressure * 2, col = "orange")


# Bar charts (NOT A HISTOGRAM)
  # histrograms estimate the density function of a continuous
  # variable, only one variable

  # bar char is for discrete data, and has two variables
  # x axis is discrete, y axis is discrete/continuous

# another dataset
BOD
barplot(BOD$demand, names.arg = BOD$Time)



###########################################
# CHAPTER VI: Creating Plots with ggplot2 #
###########################################

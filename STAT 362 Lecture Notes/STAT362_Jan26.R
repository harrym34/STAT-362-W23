# Loop functions
# apply, lapply

A <- matrix(1:20, nrow = 4, ncol = 5)
B <- matrix(1:20, nrow = 4, ncol = 5, byrow = TRUE)

C <- matrix(1:5, nrow = 4, ncol = 5, byrow = TRUE)

# Sum of each row in A
apply(A, 1, sum)

# Sum of each column in A
apply(A, 2, sum)


# column mean, column sum
colMeans(B)
colSums(B)


# row mean, row sum
rowMeans(A)
rowSums(A)

# lapply, l = list
set.seed(1)
n <- 1:5
lapply(n, rnorm)


set.seed(1)
output <- list()
for (i in 1:5) {
  output[[i]] <- rnorm(i)
}

# the same as lapply()
print(output)


# speed considerations: vectorized operations

x <- 1:10
y <- 2:11

# if you want to add them element wise, can do
x + y

# can also do
x / y
x * y

output <- 0
# with a loop (SLOW), not vectorized (think NumPy in Python)
for (i in 1:length(x)) {
  output <- x[i] + y[i]
}


# want to simulate 1,000,000 random variables





# generally, if you can do it with vectorized operations, you should.
# But if you aren't dealing with much data and the operation is relatively
# simple, then using loops is probably fine.


####################################
# Chapter IV: Managing Data, dplyr #
####################################


#
# 4.1 - Missing Values
#


m <- c(1, 5, NA, 4) # NA = missing value

mean(m)

# simplest solution is to just remove the NA
mean(m, na.rm = TRUE)

sum(m, na.rm = TRUE)
sd(m, na.rm = TRUE)

is.na(m) # check whether element is == NA
!is.na(m)
m[!is.na(m)] # one way to find all the non-missing values

# another way
na.omit(m)

#
# 4.2 Saving, loading, and removing data structures
#


# include at beginning of each assignment question, removes all
# objects in the environment
rm(list = ls())

x <- 1:5
y <- 3:10
ls()

# saving objects, useful for large datasets
Q <- matrix(1:10, 2, 5)
save(Q, file = "my_data_Q_matrix.RData")
load("my_data_Q_matrix.Rdata")

# importing and saving data from csv files
setwd("C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362") # set working directory
getwd() # get working directory

J <- matrix(1:10, 2, 5)
save(J, file = "C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/my_data_F_matrix.RData")


my_data <- data.frame(x = c(1, 5, 10),
                      y = c(1, 2, 3))

# Will be a file in excel
write.csv(my_data, "my_data.csv", row.names = FALSE)
# Read file in console
result_from_reading <- read.csv("my_data.csv")


#
# tidyverse
#

install.packages("tidyverse")
library(tidyverse)
library(nycflights13)





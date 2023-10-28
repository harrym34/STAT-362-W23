library(tidyverse)
library(nycflights13)
library(dplyr)


# Q1
A2_Q1 <- function(A) {
  
  # Select all elements that are less than 0, and 
  # replace them with 0
  A[A < 0] <- 0
  return(A)
}

# For testing
R <- matrix(c(-2, 1, 1, 3), 2, 2)
A2_Q1(R)


# Q2
A2_Q2 <- function(A) {
  
  # Return the sum of the diagonal entries of A
  return(sum(diag(A)))
}

# For testing
W <- matrix(c(-2, 1, 1, 10), 2, 2)
A2_Q2(W)

# Q3
A2_Q3 <- function(data, col) {
  
}

# For testing
d <- data.frame(x = 1:5, y = c(1, NA, NA, 4, 4))
A2_Q3(d, "y")

# Q4a
set.seed(1)

# number of simulations
n_sims <- 10000    

X <- rnorm(n_sims, mean = 0, sd = 2)
Y <- rexp(n_sims, rate = 3)

# estimate of P(X > Y)
mean(X > Y)     


# Q4b
set.seed(2)
# number of simulations
n_sims2 <- 10000        

X2 <- rnorm(n_sims2, mean = 2, sd = 1)
Y2 <- rexp(n_sims2, rate = 2)

# estimate of E(min(X, Y))
mean(pmin(X2, Y2))     


# Q5
out <- 0
for (i in 1:100) {
  if (i %/% 2 != 0) {
    out <- out + i
  }
  else if (i %/% 2 == 0) {
    out <- out + (-1 * i)
  }
}



# Q6

# Use the pipe operator
mtcars %>% 
  filter(gear == 4)



# Q7a
# Use the pipe operator
mtcars %>% 
  filter(gear == 4 | cyl == 6)

# Q7b

# assign a variable to the number of cars with the appropriate
# conditions
cars <- mtcars %>% 
  filter(gear == 4 | cyl == 6)

# Get the number of rows
nrow(cars)

# Q8
cars_by_weight <- mtcars %>% 
  arrange(desc(wt))

# Get the first and last elements of the tibble
heaviest_car <- cars_by_weight %>% head(1)
lightest_car <- cars_by_weight %>% tail(1)


# Q9
flights %>% 
  filter((month == 1 | month == 11) & arr_delay < 10)


# Q10
flights_in_may <- flights %>% 
  filter(month == 5)
nrow(flights_in_may)




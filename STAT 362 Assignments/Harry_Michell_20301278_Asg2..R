library(tidyverse)
library(nycflights13)
library(mtcars)


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

# Q4




# Q5





# Q6





# Q7




# Q8





# Q9





# Q10
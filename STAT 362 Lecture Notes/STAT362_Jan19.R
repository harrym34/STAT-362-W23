# More on writing functions

# Write a function to give a summary of observations

summary <- function(X) {
  output <- list()
  output[[1]] <- mean(X)
  output[[2]] <- var(X)
  output[[3]] <- min(X)
  output[[4]] <- max(X)
  
  
  # Return output as a list
  return(output)
  
}

a <- rnorm(100)

summary(a)

# Argument matching: ordering of arguments matters
# can do
rnorm(100, 1, 3)

# instead of:
rnorm(n = 11, mean = 1, sd = 3)



#
# 3.2 Control Flow
#

for (var in sequence) {
  # do stuff
}

for (i in 1:5) {
  print(i)
}


for (i in c(1, 4, 9)) {
  print(i)
}

# Ex. for loop to create a temperature conversion table

low <- 0
up <- 0
step <- 20


f_temp <- seq(low, up, step)
n <- length(f_temp)

c_temp <- rep(0, n)

for (i in 1:n) {
  # Convert from f to C
  c_temp[i] < (5 / 9) * f_temp[i] - 32
}

# More stuff I just didn't copy





# while loop in R
  # for example, numerical optimization in a function (e.g. grad desc)

while (condition) {
  # do stuff
}

h <- 1
while (h < 5) {
  print(h)
  h <- h + 1
}

# find the smallest n s.t. 1^2 + 2^2 + ... + n^2 > 65
total <- 0
i <- 1
while (total <= 65) {
  total <- total + i^2
  i <- i + 1
  print(total)
}

check_pos <- function(x) {
  if (x > 0) {
    print("Positive")
  }
  
  if (x < 0) {
    print("Negative")
  }
  
  if (x == 0) {
    print("x is 0")
  }
}

check_pos(0)
check_pos(-0.1)






# Harry Michell 203012728


# Q1a
my_LS <- function(X, Y) {
  
  # solve() calculates the inverse of a matrix
  return(solve(t(X) %*% X) %*% t(X) %*% Y)
  
}

# for testing
X <- cbind(rep(1, 10), 1:10)
Y <- seq(1, 30, length = 10)
my_LS(X, Y)

# Q1b
my_ridge <- function(X, Y, lambda) {
  id <- diag(t(X)%*%X)
  return(solve(t(X) %*% X + (lambda * id)) %*% t(X) %*% Y)
}

X <- cbind(rep(1, 10), 1:10)
Y <- seq(1, 30, length = 10)
lambda <- 1
my_ridge(X, Y, lambda)


# Q2a
my_sum <- function(n, m) {
  
  # Initialize output
  output <- 0
  
  # Calculate the sum with two for loops
  for (i in 1:n) {
    for (j in 1:m) {
      output <- output + (i ^ 2) * j / (i + j)
    }
  }
}

# Q2b
my_sum2 <- function(n, m) {
  x <- 1:n
  y <- 1:m
  return(sum((x ^ 2) * y / (x + y)))
}

my_sum(4, 5)
my_sum2(4, 5)

# Q3

# Generate a pseudo-random number with runif() and round()
round(runif(1, min = 1, max = 5))

# Q4
sample(c("Heads", "Tails"), 10, replace = TRUE, prob = c(0.6, 0.4))

# Q5
l_p <- function(x, p) {
  
  temp <- 0
  
  # Calculate the summation
  for (n in 1:length(x)) {
    temp <- temp + abs(n) ^ p
  }
  
  # Apply the 1/p to the summation
  return(temp ^ (1 / p))
}

  # For testing
  l_p(c(1, 2, 3, 4, 5), 2)


# Q6

# Sum the entries of v where the remainder is not 0 when dividing by 2
sum(v[v %% 2 != 0])
  


# Q7
plot(dgeom(1:10, 0.3, log = TRUE))



# Q8
p0 <- 100
mu <- 0.0002
sigma <- 0.015

p_t <- exp(cumsum(rnorm(n, mu, sigma)))


num_sim <- 20
event <- rep(0, num_sim)
# to estimate
for (i in 1:num_sim) {
  p_t <- p0 * exp(cumsum(rnorm(n, mu, sigma)))
  event[i] <- min(p_t) < 95
}

mean(event)


# A to be the event that the price is below $95 at the close 
# of at least one of the next 20 trading days

# Rearraging:
# p_t * e^{r+1} = p_{t+1}
# p_1 = p0 * e^{r_1}
# p_2 = p1 * e*{r_2}
# etc.


# Q9


# Q10

  # On Windows:
  
  # Clear console: ctrl + L
  # Move cursor to console: ctrl + 2
  # Interrupt currently executing command: Esc
  # Move cursor to Source Editor: ctrl + 1
  # Save active document: ctrl + S
  # Run current line/selection: ctrl + Enter
  # Undo: ctrl + Z
  # Cut: ctrl + x
  # Copy: ctrl + c
  # Paste: ctrl + v
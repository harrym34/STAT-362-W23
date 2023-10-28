#######################################
# Intro to Statistical Inference in R #
#######################################

# 1. Simulate some X
# 2. Set the values of beta
# 3. Simulate Y according to the model

# Sample size
n <- 1000
X <- matrix(0, nrow = n, ncol = 3)

# Want the first col to be 1
X[, 1] <- 1

# Want the second col to be cov
X[, 2] <- runif(n)
X[, 3] <- runif(n)


beta <- c(0.5, -0.5, 1)

prob <- rep(0, n)

# Might be easier with a for loop
for (i in 1:n) {
  prob[i] <- exp(sum(X[i, ] * beta)) / 
    (1 + exp(sum(X[i, ] * beta)))
}


rbinom(n, size = 1, prob = prob)

# A function to find the likelihood
log_like <- function(beta, X, y) {
  
  n <- length(y)
  output <- 0
  
  for (i in 1:n) {
    output <- output + sum(X[i, ] * beta * y[i]) -
      
    # log is natural log (ln)
    log(1 + exp(sum(X[i, ] * beta * y[i])))
  }
  
  return(output)
}

neg_log_like <- function(beta, X, y) {
  n <- length(y)
  output <- 0
  
  for (i in 1:n) {
    output <- output + sum(X[i, ] * beta * y[i]) -
      
      # log is natural log (ln)
      log(1 + exp(sum(X[i, ] * beta * y[i])))
  }
  
  return(-output)
  
}

log_like(beta, X, y)

# optim() is for minimization 
optim(runif(3), fn = neg_log_like, X = X, y = y)








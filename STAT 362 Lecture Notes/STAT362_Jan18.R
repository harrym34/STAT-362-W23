# Last time we talked about simulation:
  # +$1 if you get a head
  # -$1 if you get a tail
  # Play 100 times

profit <- sample(c(-1, 1), 100, replace = TRUE)
plot(1:100, cumsum(profit))
     
# Could also do it like this for unfair coins
profit <- sample(c(-1, 1), 100, replace = TRUE, prob = c(0.2, 0.8))
plot(1:100, cumsum(profit), "l")



# Suppose we have two dice, A and B
  # A has 6 sides with 1, 2, ... , 6
  # B has 4 sides with 1, 2, 3, and 7

  # Each side in A has prob 0.1, 0.1, 0.1, 0.1, 0.1, 0.5
  # For B: 0.3, 0.2, 0.3, 0.2

  # Want to find P(A > B)
  # Could calculate by hand (but we have R)


A <- sample(c(1:6), size = 1, prob = c(rep(0.1, 5), 0.5)

B <- sample(c(1, 2, 3, 7), size = 1, prob = c(0.3, 0.2, 0.3, 0.2))

# This will give you a logical vector, TRUE becomes 1, FALSE becomes 0
mean(A > B) # An estimator of P(A > B)



#################################
# CHAPTER III: Programming in R #
#################################

#
# 3.1: Writing Functions
#

# General format
function_name <- function(arg1, arg2) {
  statements
}

# Writing a function that computes variance

# \frac{1}{n} \sum_{i=1}^{n} (x_i - \bar{x_n})^{2}
# x_n = \frac{1}{n} \sum_{i=1}^{n} x_i

my_var <- function(x) {
  n <- length(x)
  mean_x = mean(x)
  return(sum((x - mean_x) ^ 2) / (n - 1))
}

b <- runif(10)

# Should be the same (they are)
my_var(b)
var(b)

# Scope of variables in R

y <- 2

# y is only defined in the function, not any global variables
f <- function(x){
  y <- x
  return(y)
}

f(x = 5)

# Function for pooled variance (two vectors)
  # Inputs:
  # X = (x1, ..., xn)
  # Y = (y1, ..., yn)

  # Outputs sample pooled variance

pooled_var <- function(X, Y) {
  n <- length(X)
  m <- length(Y)
  S_X_2 <- var(X)
  S_Y_2 <- var(Y)
  return((n-1 * S_X_2 + (m-1) * S_Y_2) / (n + m - 2))
}

a <- runif(10)
b <- runif(15)

pooled_var(a, b)




              
              

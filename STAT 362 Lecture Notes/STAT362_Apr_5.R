#
# Root Finding and Optimization
#

# Bisection method
# Finds the root(s) of a single variable function)
bisection <- function(f, a, b, tol, maxit = 100) {
  while (abs(b - a) > tol) {
    # Assign c
    c <- (a + b) / 2
    
    if (f(c) == 0) {
      return(c)
    }
    
    # Checking if the signs are equal
    if (f(a) * f(c) < 0) {
      b <- c
    }
    
    else {
      a <- c
    }
  }
}


g <- function(x) {
  (x - 2) ^ 2 - 3
}

x_star <- bisection(g, 2, 10, tol = 1e-6)
g(x_star)

# Newton-Raphson Method
# Stop when the change is small

# For symbolic differentiation
library(Deriv)

gp <- Deriv(g)

x0 <- 5
values <- rep(0, 10)
for (i in 1:10) {
  x <- x0 - (g(x0) / gp(x0))
  values[i] <- x
  x0 <- x
}
# After 4 iterations, there are no changes.
# After 10 iterations, g(x0) is very close to 0 (decimal with
# 16 zeros after the decimal point).
g(x0)


# Gradient Descent

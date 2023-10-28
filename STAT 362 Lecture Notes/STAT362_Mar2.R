# More on optim()

# we did it with one input (i.e. f(x)), how can we do something like 
# f(x, y, z)?

# generally, optim(par, fn)
# will give par: the minimizer, value: the min value of the fn, and
# convergance: 0 indicates succesful optimization.

# Univariate
f <- function(x) {
  x ^ 2 + 2 * x + 1
}
fit <- optim(par = runif(1), fn = f)

# Multivariate
g <- function(x) {
  (x[1] - 2)^2 + (x[2] - 1)^2 + (x[3] + 3)^2
}

# Fixed initial value, compared to random
gfit <- optim(par = c(0, 0, 0), fn = g)

# Will have 3 minimizers
gfit


# Multivariate with a fixed argument
h <- function(x, y) {
  (x[1] - y)^2 + (x[2] - 1)^2 + (x[3] + 3)^2
}
# provide the additional value of a
hfit <- optim(par = c(0, 0, 0), fn = h, y = 5)
hfit


# Multivariate, optimizing over a region
j <- function(x) {
  (x[1] - 2)^2 + (x[2] - 1)^2 + (x[3] + 3)^2
}

# Optimize over a region
jfit <- optim(par = c(0, 0, 0), fn = j, method = "L-BFGS-B",
              # Upper and lower bounds
              lower = c(-5, 0, 0), upper = c(1.5, 4, 5))

# How to control the number of iterations
# maxit = max. amount of iterations, set it to whatevery you want
optim(par = c(0, 0, 0), fn = j, control = list(maxit = 10))


#
# BRAND NEW SHIT: K-NEAREST NEIGHBORS
#





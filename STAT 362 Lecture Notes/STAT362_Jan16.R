# Last lecture we talked about built-in functions
# sqrt, abs, sin, cos, log, exp
# More today!

# 
# Functions for Rounding
#

# Ceiling: smallest integer greater than the param
ceiling(4.1)

# Floor: the greatest integer smaller than the param
floor(3.3)

# Truncate: get the integer part of the number
trunc(4.6)

# Round: follows standard rounding rules (I think)
round(9.49)
round(9.50)

# Sorting from smallest to largest
x <- c(1, 3, 10, 5)
sort(x)
# Sorting from largest to smallest
sort(x, decreasing = TRUE)

# Getting the sum of all the elements in x
sum(x)

# Getting the mean
mean(x)

# Multiplies all elements in a vector
prod(x)

# Cumulative things
cumsum(x)
cumprod(x)

# Min and Max
min(x)
max(x)

# Comparing vectors element-wise
x <- c(1, 3, 10, 5)
y <- c(10, 2, 3, 5)
pmin(x, y)
pmax(x, y)

# Statistical jargon
var(x)
sd(x)

#  
# Structured vectors
#

# seq(start, end, by), end is inclusive.
seq(1, 100, by = 2)

# length specifies ???
seq (0, 10, length = 21)
seq(0, 10, by = 0.1)

# rep(thing to repeat, number of times to repeat it)
rep(0, 10)
rep(c(1, 2, 3), 2)

############################
# CHAPTER TWO: Probability #
############################

#
# 2.1: Probability Distributions
#


# pnorm gives CDF
# dnorm gives density (or probability mass function for a discrete var)
# qnorm gives the normal quantile function
# rnorm gives normal random variables

# Density of N(2, 3^2) at x = 5
dnorm(5, mean = 2, sd = 3)

# Find P(X <= 3)
pnorm(3, mean = 2, sd = 3)

# 95th percentile of N(0, 1)
qnorm(0.95)

# Generate random variables
rnorm(10, mean = 2, sd = 2)

# Other distributions include beta, cauchy, gamma, t, F, etc.
rbeta(10, 2, 3)
x <- seq(-4, 4, length = 100)
y <- dnorm(x)
plot(x, y, type = "l")

# Discrete distributions

# Binomial
dbinom(2, size = 10, prob = 0.4)
# Also have geom, nbinom, pois


# More on plotting
x <- 0:10
y <- dbinom(x, 10, prob = 0.4)
plot(x, y, type = "h")


#
# 2.2: Simulation - how to reproduce results
#

# Pseudo-random numbers, but good enough
set.seed(1)
runif(10, 0, 1)


# Generating discrete random variables with sample()
sample(10) # is a permutation of 1 to 10 (symmetric group??)

sample(10, replace = TRUE)

x <- sample(c(1, 4, 10),
       size = 1000,
       replace = TRUE,
       prob = c(0.7, 0.1, 0.2))
# The second vector has corresponding probabilities with the first
table(x)


# Example: coins

# Fair coin, head = win $1, tails = lose $1
# play 100 games, simulate game for cum. profit

x <- sample(c(-1, 1), size = 100, replace = TRUE, prob = c(0.5, 0.5))

pts <- 1:100
plot(pts, cumsum(x), type = "l")








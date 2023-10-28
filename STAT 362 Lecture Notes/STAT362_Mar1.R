#
# 7.2 Hypothesis Testing
#

# 7.2.4 Inference for Mean of One Sample

# Solution to iid X1, X2, ..., Xn sample to estimate mu
  # Use t test, appropriate when nata is normally distributed
  # and have a large sample size (n > 30)

set.seed(362)
x <- rnorm(75, mean = 100, sd = 15)
x
t.test(x, mu = 95)


# 7.2.5 t test for inference on two means
sleep
t.test(sleep[1:10, 1], sleep[11:20, 1], paired = TRUE)


# Comparing two means
library(MASS)
birthwt
t.test(birthwt$bwt[birthwt$smoke ==1],
       birthwt$bwt[birthwt$smoke == 0])


set.seed(1)
heads <- rbinom(1, size = 100, prob = 0.4)
heads
prop.test(heads, 100)

fair <- rbinom(1000, size = 100, prob = 0.5)
hist(fair, breaks = 100)

# 7.2.7 Testing groups for equal proportions


# Chapter 8: Optimization (maximization/minimizing a function)

# min(f) = max(-f)

# There will be a minimum of this function
f <- function(x) {
  x ^ 2 + 2*x + 1
}

# Want to find minimum of f, numerically can use optim()
  # par is an initial guess of min
  # fn is a function to minimize/maximize
  

# If have more variables wanting to optimize, i.e. f(x, y, z), then
# use three values for par to begin the optimization
fit <- optim(par = runif(1), fn = f)
fit





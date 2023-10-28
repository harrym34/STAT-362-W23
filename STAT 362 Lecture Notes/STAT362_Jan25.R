# Example in section 3.5/3.6

# Using simulation to estimate the price is below $95 t the close
# of at least one of the next 30 trading days.
  # Estimate the probability of an event happening by the empirical
  # proportion of the corresponding event

#p0 = 100, mu = 0.0002, sigma = 0.015

p0 <- 100
mu <- 0.0002
sigma <- 0.015
n <- 30
p_t <- exp(cumsum(rnorm(n, mu, sigma)))

plot(1:30, p_t, type = "l", ylim = c(70, 120), abline(h = 95))



num_sim <- 100000
event <- rep(0, num_sim)
# to estimate
for (i in 1:num_sim) {
  p_t <- p0 * exp(cumsum(rnorm(n, mu, sigma)))
  event[i] <- min(p_t) < 95
}

mean(event)


# Simulate one path from 1:40, and then consider the first 20 days where
# it has been < 95

# check < 95 for first 20, < 101 for the whole 40 days


#
# Back to control flow
#


sim_norm_unif2 <- function(n, dist) {
  switch(dist, norm = rnorm(n), unif = runin(n))
}


# next and break

# break is like break in Python with loops, a condition can be satisfied
# (or not), and then "breaks" out of the current loop and then goes to the
# next most inner loop

# next skips the 


for (j in 1:3) {
  for (i in 1:5) {
    if (i <= 3) {
      next
    }
    print(c(i, j))
  }
}

for (j in 1:3) {
  for (i in 1:5) {
    if (i >= 3) {
      break
    }
    print(c(i, j))
  }
}

# apply
# apply(X, MARGIN, FUN)
# margin is 1 or 2, FUN is a function
X <- matrix(1:20, nrow = 4, ncol = 5)
apply(X, 2, sum) # 2 is column, so column sum
apply(X, 1, sum) # 1 is row, so row sum

apply(X, 1, max)









library(tidyverse)
library(nycflights13)

# 10.6 Comparing models with ANOVA (quick)

# Suppose you have some models:
set.seed(100)
n <- 100
x1 <- rnorm(n, 0, 1)
x2 <- rnorm(n, 0, 1)
x3 <- rnorm(n, 0, 1)
x4 <- rnorm(n, 0, 1)
y <- 1 + 2 * x1 + 3 * x2 + rnorm(n, 0, 1)

m1 <- lm(y ~ x1)
m2 <- lm(y ~ x1 + x2)
m3 <- lm(y ~ x1 + x2 + x3)
m4 <- lm(y ~ x1 + x2 + x3 + x4)

# m1 is contained within m2, 
# m2 is contained within m3, and m3 is contained within m4.

# What if we want to compare a few different models?
anova(m1, m2)

# 10.7 Prediction
set.seed(1)

# Get training and testing sets
random_index <- sample(nrow(flights), size = nrow(flights) * 0.7)
flights_train <- flights[random_index, ]
flights_test <- flights[-random_index, ]

# Perform regression
fit <- lm(arr_delay ~ dep_delay, data = flights_train)

head(predict(fit, flights_test))
head(flights_test$arr_delay)

# Predicted vs. actual, regression seems pretty good
y_hat <- predict(fit, flights_test)
y_star <- flights_test$arr_delay

# Predicted 0, got like 200 at some points,
# model needs work
plot(y_hat, y_star)

# Perform prediction
View(predict(fit, flights_test))

# Because our response is continuous, we cannot use 
# "accuracy" to measure the performance of our prediction

# One possible solution is to use correlation (91%)
cor(predict(fit, flights_test), flights_test$arr_delay, use = "complete.obs")

data <- cbind(y_hat, y_star)
data <- na.omit(data)
mean(data[, 1] - data[, 2]^2)


#
# 10.8 Interaction Terms
#

# simulation
set.seed(1)
x1 <- rnorm(100, 0, 1)
x2 <- rnorm(100, 0, 1)
y <- 1 + 2 * x1 + 3 * x2 + 4 * x1 * x2 + rnorm(100, 0, 1)

# estimation
lm(y ~ x1 * x2)

#
# 10.9 Polynomial Regression
#

set.seed(1)
x1 <- rnorm(100, 0, 1)
x2 <- rnorm(100, 0, 1)
y <- 1 + 2 * x1 + 3 * x1 ^ 2 - 2 * x2 + rnorm(100, 0, 1)

lm(y ~ poly(x1, 2, raw = TRUE) + x2)

# Alternatively, include I(x1^2) not x1^2:
set.seed(1)
x1 <- rnorm(100, 0, 1)
x2 <- rnorm(100, 0, 1)
y <- 1 + 2 * x1 + 3 * x1 ^ 2 - 2 * x2 + rnorm(100, 0, 1)

lm(y ~ x1 + I(x1 ^ 2) + x2)
  
  

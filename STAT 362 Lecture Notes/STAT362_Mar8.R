########################################
# Chapter 10: Linear Regression Models #
########################################

library(nycflights13)
library(ggplot2)
library(tidyverse)

# y = arr_delay, x = dep_delay (y goes on the left,
# it is y regressed on x). "lm" is "linear model"
lm(arr_delay ~ dep_delay, data = flights)

# Simple linear regresion
# summary()
# multiple linear regression
# categorical variables, interaction, variable selection

# Finding a line that best fits out data
set.seed(1)
x <- rnorm(100, 0, 1)
y <- 1 + x + rnorm(100, 0, 1)
lm(y ~ x)

# The shaded area is the confidence interval
# The greater the area, the less confidence there is
ggplot(mapping = aes(x = x, y= y)) +
  geom_point() +
  geom_smooth(method = lm)


# To remove the CI
ggplot(mapping = aes(x = x, y= y)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)


# Mapping smoothed conditional means
cars %>% 
  ggplot(mapping = aes(x = speed, y = dist)) +
  geom_point() + 
  geom_smooth(color = "red")


# Simple regression: have one x \in R
# Multiple regression: have one \vec{x} \in R^n


# To illustrate (without a dataframe)
set.seed(1)
n <- 100

# x1, x2 are vectors of features
x1 <- rnorm(n, 0, 1)
x2 <- rnorm(n, 0, 1)

# Performing the regression, rnorm(n, 0, 1) is epsilon (error)
y <- 1 + 2 * x1 + 3 * x2 + rnorm(n, 0, 1)
fit <- lm(y ~ x1 + x2)
summary(fit)

# Doing it with a data frame
new_data <- tibble(response = y, cov1 = x1, cov2 = x2)

fit2 <- lm(response ~ cov1 + cov2, data = new_data)
summary(fit2)

fit2$coefficients
# These are the confidence intervals
confint(fit2)

#
# Exampe with diamonds
#

# When the variable is an ordered factor, the names in 
# the output of lm() are weird. So turn them into an 
# unordered factor first.
diamonds2 <- diamonds
diamonds2$cut <- factor(diamonds2$cut, order = FALSE)
diamonds2$clarity <- factor(diamonds2$clarity, order = FALSE)
diamonds2$color <- factor(diamonds2$color, order = FALSE)

fit <- lm(price ~ cut, data = diamonds2)
summary(fit)

# Try factoring in carat:
fit <- lm(price ~ cut + carat, data = diamonds2)
summary(fit)








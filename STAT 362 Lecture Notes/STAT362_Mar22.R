##########################
# 14: Re-sampling Methods #
##########################

set.seed(1)
x <- runif(100, 0, 1)
y <- 1 + x + rnorm(100, 0, 1)

# Split 1: first half (not a good split for validation)
fit <- lm(y[1:50] ~ x[1:50])
# test error:
mean((y[51:100] - predict(fit, data.frame(x[51:100])))^2)



# Split 2: second half (also, not a good split for validation)
fit <- lm(y[51:100] ~ x[51:100])
# test error:
mean((y[1:50] - predict(fit, data.frame(x[1:50])))^2)

# this is called "repeated holdout"

############
# A standard practice is k-fold cross validation, which
# is a much more systematic way.

# partition data into k non-overlapping partitions. Common
# choices for k are 3, 5, and 10 (not clear as to why).

# We can perform CV for linear regression using cv.glm()
# from the boot package

library(boot)
library(tree)
library(ISLR2)
# remove rows with missing values
Hitters <- na.omit(Hitters)

# create an additional variable
Hitters$High <- factor(ifelse(Hitters$Salary >= 
                                quantile(Hitters$Salary, 0.75), "High", "Low"))

# split the dataset
set.seed(1)
index <- sample(nrow(Hitters), nrow(Hitters) * 0.5)
Hitters_train <- Hitters[index, ]
Hitters_test <- Hitters[-index, ]
fit <- tree(High ~. - Salary, data = Hitters_train)

cv_fit <- cv.tree(fit, FUN = prune.misclass)
cv_fit

# Plot it
plot(cv_fit$size, cv_fit$dev, type = "b") 

# size: number of terminal nodes of the tree
# dev: cross-validation errors

# Choose the size with the minimum dev:

# Generate confusion matrix
prune_fit <- prune.misclass(fit, best = 3)
(result <- table(Hitters_test$High, predict(prune_fit, Hitters_test, type = "class")))
sum(diag(result)) / sum(result)

plot(prune_fit)
text(prune_fit)

# This can also be applied to a regression tree.

set.seed(1)
x <- runif(100, 0, 1)
y <- 1 + x + rnorm(100, 0, 1)
toy_data <- data.frame(x = x, y = y)

error <- rep(0, 10)
for (i in 1:100) {
  fit_no_i <- lm(y ~ x, data = toy_data[-i, ])
  error[i] <- predict(fit_no_i, toy_data[i, ]) -
    toy_data[i, ]$y^2
}

mean(error)


# General k-fold cross validation
library(caret)

set.seed(1)
x <- runif(100, 0, 1)
y <- 1 + x + rnorm(100, 0, 1)
CV_example <- data.frame(x = x, y = y)

folds <- createFolds(y, k = 10) # the result is a list
test_error <- rep(0, 10)

for (k in 1:10) {
  # fit the model without one partition
  fit <- lm(y ~ x, data = CV_example[-folds[[k]], ])
  # MSE as the test error
  test_error[k] <- sum((CV_example$y[folds[[k]]] -
                          predict(fit, CV_example[folds[[k]], ]))^2) / length(folds[[k]])
}

# average
mean(test_error)


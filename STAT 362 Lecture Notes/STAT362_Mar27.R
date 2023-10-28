#
# Bootstrap and Re-sampling Methods
#

# For bootstrap!
library(boot)

# Get variables
set.seed(1)
rA <- rnorm(100, 0.01, 0.05)
rB <- 0.5 * rA + rnorm(100, 0, 0.05) 
return_data <- cbind(rA, rB)


# Point estimator for alpha
est_alpha <- function(data, index) {
  rA <- data[index, 1]
  rB <- data[index, 2]
  
  # This formula is the \hat{alpha} formula
  (var(rB) - cov(rA, rB)) / (var(rA) + var(rB) - 2 * cov(rA, rB))
}


# \hat{theta} +- 1.96 * \hat{sigma}
est_alpha(return_data, 1:100)

# Want more an an estimate, want a confidence interval, this is 
# what bootstrap is for.

# boot(data, what you want to compute, number of times algo performed)
boot(return_data, est_alpha, R = 1000)



#
# Ensemble Methods
#

library(ISLR2)
library(randomForest)
library(tidyverse)
library(tree)

Hitters <- na.omit(Hitters)

# Split the dataset
set.seed(1)
index <- sample(nrow(Hitters), nrow(Hitters) * 0.5)
Hitters_train <- Hitters[index, ]
Hitters_test <- Hitters[-index, ]

# Fitting a random forest
rf_fit <- randomForest(Salary ~., data = Hitters_train, 
                       mtry = (ncol(Hitters_train) - 1) / 3, 
                       ntree = 1000, importance = TRUE)

# Model Prediction
rf_pred <- predict(rf_fit, Hitters_test)
mean((Hitters_test$Salary - rf_pred)^2)

# Compared with least squares
ls_fit <- lm(Salary ~., data = Hitters_train)
ls_pred <- predict(ls_fit, Hitters_test)
mean((Hitters_test$Salary - ls_pred)^2)


# Compared with one tree
# Fit regression tree
tree_fit <- tree(Salary ~., Hitters_train)

# MSE in test data
tree_pred <- predict(tree_fit, Hitters_test)
mean((Hitters_test$Salary - tree_pred)^2)

# Weakness of RF: need to interpret many models, 
# first consider the first node, then 
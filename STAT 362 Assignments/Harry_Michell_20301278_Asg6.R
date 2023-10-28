# Harry Michell, 20301278

library(FNN)
library(tree)
library(randomForest)
library(tidyverse)

# Q1
set.seed(1)
n <- 1000
X <- rnorm(n, 0.01, 0.05)
Y <- 0.5 * X + rnorm(n, 0, 0.05)
data <- cbind(X, Y)


# Q2
concrete <- read.csv(
  "C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Random/concrete.csv"
)

names(concrete)[1] <- "cement"
set.seed(2)
index <- sample(nrow(concrete), 700) # indices corresponding to the training data
concrete_train <- concrete[index, ]
concrete_test <- concrete[-index, ]

# Regression tree
reg_tree <- tree(
  # Use all other variables for tree
  strength ~.,
  data = concrete
  )

# Q3
plot(reg_tree)
text(reg_tree)

# Q4

# Linear regression model
strength_lm <- lm(strength ~., data = concrete)

# Mean squared error
mean(strength_lm$residuals ^ 2)

# Q5

# Random forest
rf_fit <- randomForest(
  strength ~.,
  data = concrete,
  mtry = (ncol(concrete) - 1)/ 3,
  ntree = 1000, 
  importance = TRUE
  )

# Prediction and MSE
rf_pred <- predict(rf_fit, concrete)
mean((concrete$strength - rf_pred) ^ 2)

# Q6
varImpPlot(rf_fit)
# age is the most important variable

# Q7

# Scale the data (as done in A4)
normalize <- function(train, test) {
  
  train_n <- train
  test_n <- test
  train_min <- apply(train, 2, min)
  train_max <- apply(train, 2, max)
  
  for (i in 1:ncol(train)) {
    train_n[, i] <- (train_n[, i] - train_min[i]) / (train_max[i] - train_min[i])
    
    # Use the min and max from training data to normalize the testing data
    test_n[, i] <- (test_n[, i] - train_min[i]) / (train_max[i] - train_min[i])
  }
  
  return(list(train = train_n, test = test_n))
}

concrete_n <- normalize(dplyr::select(concrete_train, -strength),
                   dplyr::select(concrete_test, -strength))
concrete_train_n <- concrete_n$train
concrete_test_n <- concrete_n$test


knn_concrete <- knn.reg(concrete_train, concrete_test, concrete$strength, k = 3)
knn_concrete$pred


# Q8
# In this data set, the methods that give the smallest test error are...

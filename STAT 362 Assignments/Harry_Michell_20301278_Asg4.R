# Harry Michell 20301278

library(ggplot2)
library(ggpubr)
library(MASS)
library(tidyverse)


# Q1)

# For graphing
x <- seq(-4, 4, by = 0.1)
df <- data.frame(x)

bx <- ggplot(df, aes(x = x)) + geom_density(kernel = "rectangular")
gauss <- ggplot(df, aes(x = x)) + geom_density(kernel = "gaussian")
ep <- ggplot(df, aes(x = x)) + geom_density(kernel = "epanechnikov")
tri <- ggplot(df, aes(x = x)) + geom_density(kernel = "triangular")

plots <- ggarrange(bx, gauss, ep, tri, nrow = 2, ncol = 2)
plots

# Q2)
ribbons <- c(171.6, 191.8, 178.3, 184.9, 189.1)
t.test(ribbons, mu = 185, alternative = "less", conf.level = 0.95)

# Q3)
crossings <- c(142600, 167800, 136500, 108300, 126400, 133700, 162000, 149400)
mu <- mean(crossings)
sigma <- sd(crossings)

t.test(crossings, mu = mu, conf.level = 0.95)

# Q4)

# 35 people with discomfort, 400 total people
prop.test(x = 35, n = 400, conf.level = 0.95)

# Q5)
data <- c(232, 168, 260, 240, 197, 203)


detergent <- matrix(data, nrow = 3, ncol = 2)

prop.test(detergent, n = length(data))

# Data for questions 6-8
iris_train <- read.csv(
  "C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Assignments/STAT 362 Datasets/iris_train.csv"
  )

iris_test <-read.csv(
  "C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Assignments/STAT 362 Datasets/iris_test.csv"
)

# Q6)

# our "y"
iris_train_labels <- iris_train$Species
iris_test_labels <- iris_test$Species

iris_train_n <- iris_train[, 1:4]
iris_test_n <- iris_test[, 1:4]

train_min <- apply(iris_train, MARGIN = 2, min)
train_max <- apply(iris_train, MARGIN = 2, max)


for (i in 1:ncol(iris_train)) {
  iris_train_n[, i] <- (iris_train[, i] - train_min[i]) / (train_max[i] - train_min[i]) 
  # use the min and max from training data to normalize the testing data
  iris_test_n[, i] <- (iris_test[, i] - train_min[i]) / (train_max[i] - train_min[i]) 
}


# Q7a)
library(class)
a <- knn(train = iris_train_n, test = iris_test_n, 
    cl = iris_train_labels, k = 3)

# Q7b)

result <- table(iris_test_labels, knn_predicted)
accuracy <- sum(diag((result)) / sum(result))

# Q8)
# When prob is set to TRUE, knn returns the probabilities
# of each data point being assigned to each label
b <- knn(train = iris_train_n, test = iris_test_n, 
    cl = iris_train_labels, k = 3, prob = TRUE)

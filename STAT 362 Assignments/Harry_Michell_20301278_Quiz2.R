##########################
# Harry Michell 20301278 #
##########################

# Setting
set.seed(362)
n <- 1000
beta_0 <- c(0.5, 1, -1) # true beta

# Simulation
x1 <- runif(n, 0, 1)
x2 <- runif(n, 0, 1)
prob_num <- exp(beta_0[1] + beta_0[2] * x1 + beta_0[3] * x2)
prob <- prob_num / (1 + prob_num)
y1 <- rbinom(n, size = 1, prob = prob)
y2 <- 2 * x2 + x2 * x2 * x2 + x1 * x2 + rnorm(n)
data <- data.frame(x1, x2, y1, y2)

# Q1
# 

# Q2
# They are equal to one

# Q3
set.seed(362)
index <- sample(nrow(data), nrow(data) * 0.6)
train <- data[index, ]
test <- data[-index, ]
# This code creates training and testing sets for data,
# where 60% of of the data is used for training, and 40%
# of the data is used for testing.

# Q4
q4 <- glm(y1 ~ x1 + x2 , data = train, family = "binomial")

# Q5
prob <- predict(q4, test, type = "response")
predicted_class <- ifelse(prob > 0.5, 1, 0)
mean(test$y1 == predicted_class)


# Q6
library(class)
knn_predicted <- knn(train = train[, c("x1", "x2")], test = test[, c("x1", "x2")], 
                     cl = train[, "y1"], k = 3)
# Really not sure why this is not working, it says that 
# the "dims of 'test' and 'train' differ", which is confusing me
# because this is straight from the practice test.

# Q7
mean(test$y1 == knn_predicted)

# Q8

# Compute for k = 3, ..., 10
accuracies = rep(0, 8)

accuracies = rep(0, 8)
for (i in 3:10) {
  curr_knn <- knn(train = train[, c("x1", "x2")], test = test[, c("x1", "x2")], 
                  cl = train[, "y1"], k = i)
  accuracies[i-2] <- mean(test$y1 == curr_knn)
}
# Display to console
accuracies
# Similar problem here as in Q6

# Q9

# Estimate model and display results
q9 <- lm(y2 ~ x2 + I(x2 ^ 3) + x1:x2, data = data)
summary(q9)

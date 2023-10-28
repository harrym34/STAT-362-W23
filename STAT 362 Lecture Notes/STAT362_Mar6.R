#
# Implementing k-NN nearest neighbors in R
#

# k represents the number of closest neighbors

# Useful for classification and regression:
  # when y_i is cont, used for regression
  # when y_i is categorical, used for classification
wbcd <- read.csv("C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Random/wisc_bc_data.csv")

# Choosing training and test data (as subsets)

set.seed(6)
random_index <- sample(nrow(wbcd), 469)

# our "x", -(1:2) means we don't want the ID in the first two
# columns
wbcd_train <- wbcd[random_index, -(1:2)]
wbcd_test <- wbcd[-random_index, -(1:2)]


# our "y", it is categorical
wbcd_train_labels <- wbcd[random_index, ]$diagnosis
wbcd_test_labels <- wbcd[-random_index, ]$diagnosis

# Temporary objects, n stands for "normalize"
wbcd_train_n <- wbcd_train
wbcd_test_n <- wbcd_test

# Find the min and max of each column in training data
# For the testing, we should not use the whole dataset
train_min <- apply(wbcd_train, 2, min)
train_max <- apply(wbcd_train, 2, max)


# Apply normalization (see notes)
for (i in 1:ncol(wbcd_train)) {
  wbcd_train_n[, i] <- (wbcd_train[, i] - train_min[i]) / (train_max[i] - train_min[i]) 
  
  # use the min and max from training data to normalize the testing data
  wbcd_test_n[, i] <- (wbcd_test[, i] - train_min[i]) / (train_max[i] - train_min[i]) 
}

library(class)

# Perform the classification, play around with different
# values of k (may get different results)
knn_predicted <- knn(train = wbcd_train_n, test = wbcd_test_n, 
                     cl = wbcd_train_labels, k = 21)


# Look at results
result <- table(wbcd_test_labels, knn_predicted)

# Accuracy is 94%
accuracy <- sum(diag((result)) / sum(result))

# Error rate is 1 - accuracy (here it's 6%)
error <- 1 - accuracy

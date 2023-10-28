#####################
# 20: Deep Learning #
#####################

# Load the data (hand drawn digits).
library(keras)
library(tensorflow)

mnist <- dataset_mnist()
train_images <- mnist$train$x
train_labels <- mnist$train$y
test_images <- mnist$test$x
test_labels <- mnist$test$y


# For each image, we first turn the matrix of values into a 
# vector of values. We also re-scale the data to have values in 
# [0, 1]. The data originally take integer values in [0, 255].

# Encode the data
train_images <- array_reshape(train_images, c(60000, 28 * 28))
train_images <- train_images / 255
test_images <- array_reshape(test_images, c(10000, 28 * 28))
test_images <- test_images / 255

# The original labels take integer values from 0 to 9. We will 
# apply "one-hot" encoding to the labels:
train_labels <- to_categorical(train_labels)
test_labels <- to_categorical(test_labels)

# Specifying the model
model <- keras_model_sequential() %>%
  layer_dense(units = 512, activation = "relu", input_shape = c(28 * 28)) %>%
  layer_dense(units = 10, activation = "softmax")

model

# More on decision trees
# Can be used for classification or regression

install.packages("GGally")
library(tidyverse) 
library(GGally) # to use ggpairs
library(ISLR2)

str(iris)

set.seed(6)

# select 100 examples for our training dataset
random_index <- sample(nrow(iris), 100) 
iris_train <- iris[random_index, ]
iris_test <- iris[-random_index, ]


# we only want to plot the numeric features
# the 5th column is the species of the flowers
pairs(iris_train[, -5])

# GGally to use ggpairs
ggpairs(data = iris_train, aes(color = Species, alpha = 0.8), columns = 1:4)

# It seems that Petal.length and Petal.width may be
# useful in classifying the flowers.
ggplot(iris_train, aes(x = Petal.Width, y = Petal.Length, color = Species)) +
  geom_point()

# By looking at the plot, we could draw some separating
# hyperplanes to linearly separate the data. We can draw lines
# and see where the data falls compared to these lines,
# then we can classify the data.

install.packages("tree")
library(tree)
# split the data into training data and testing data
set.seed(10)
index <- sample(nrow(iris), 100)
tree_iris <- tree(Species ~. , data = iris[index, ])

# display the result (a tree)
tree_iris

# Plot the tree
plot(tree_iris)
text(tree_iris, pretty = 0)

# prediction
predict_iris <- predict(tree_iris, iris[-index, ], type = "class")

(result <- table(iris[-index, 5], predict_iris))


# accuracy
print("Accuracy is") 
sum(diag(result)) / sum(result)





# Regression Trees
# The only difference is that the response variable is
# continuous. 

df <- na.omit(Hitters)
plot(df$Hits, df$Years)


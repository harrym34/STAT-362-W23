library(tidyverse)
library(class)
library(ggplot2)
library(tree)

# Load data
league <- read.csv("C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Project/high_diamond_ranked_10min.csv")
df <- select(league, blueWins, blueTotalGold, redTotalGold,
             blueGoldDiff, redGoldDiff)

###################
# Regression Tree # 
###################

# Create training data sets
set.seed(1)

# For selecting 
p <- 0.70
random_index <- sample(nrow(df), nrow(df) * p) 

# Training/testing
df_train_tree <- df[random_index, 1:3]
df_test_tree <- df[-random_index, 1:3]

# Training min/max
train_min_tree <- apply(df_train_tree, 2, min)
train_max_tree <- apply(df_test_tree, 2, max)

df_train_labels_tree <- df[random_index, ]$blueWins
df_test_labels_tree <- df[-random_index, ]$blueWins

# Fit tree, display tree
fitc <- tree(as.factor(df_test_labels_tree) ~ redTotalGold + blueTotalGold, data = df_test_tree)
summary(fitc)
plot(fitc)
text(fitc)

# Compute accuracy
pred <- predict(fitc, newdata = df_test, type = "class")
mean(pred == df_test_labels_tree)

# Visualze results
ggplot(df_test, aes(x = redTotalGold, y = blueTotalGold, color = factor(df_test_labels_tree))) +
  geom_point() +
  scale_color_manual(values = c("red", "blue")) +
  labs(title = "Classification Tree: Red and Blue Total Gold",
       x = "Red Total Gold", y = "Blue Total Gold",
       color = "Blue Wins") +
  theme(legend.position = "bottom")
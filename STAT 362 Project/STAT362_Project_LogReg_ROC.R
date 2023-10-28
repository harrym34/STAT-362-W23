# For random analysis
library(tidyverse)
library(ggplot2)
library(pROC)
library(caret)

league <- read.csv("C:/Users/harry/OneDrive/Desktop/Classes/2nd Year/STAT 362/STAT 362 Project/high_diamond_ranked_10min.csv")
df <- select(league, blueWins, blueTotalGold, redTotalGold,
             blueGoldDiff, redGoldDiff)

redGoldAvg <- filter(df, blueWins == 0)
blueGoldAvg <- filter(df, blueWins == 1)

# Winning gold differential
m_red_gold_diff_w <- mean(redGoldAvg$redGoldDiff)
m_blue_gold_diff_w <- mean(blueGoldAvg$blueGoldDiff)

# Losing gold differential
m_blue_gold_diff_l <- mean(redGoldAvg$blueGoldDiff)
m_blue_gold_diff_l <- mean(blueGoldAvg$redGoldDiff)

# Logistic Regression
set.seed(1)
random_index <- sample(nrow(df), size = nrow(df) * 0.7)
train_data  <- df[random_index, ]
test_data <- df[-random_index, ]

# Blue wins compared against red gold differential
log_reg <- glm(blueWins ~ redGoldDiff, data = df, family = binomial)
summary(log_reg)

# Prediction
prob <- predict(log_reg, df, type = "response")
predicted_class <- ifelse(prob > 0.5, "pos", "neg")

# Confusion matrix
confmat <- table(predicted_class, df$blueWins)
confmat

# Accuracy
acc <- ((confmat[1, 1] + confmat[2, 2]) / sum(confmat))
acc


#
# For ROC Curve
#

# ROC curve
roc_curve <- roc(df$blueWins, prob)

# Plot ROC curve (ver 1)
plot(
  roc_curve, 
  ain = "ROC Curve", col = "blue",
  print.auc = TRUE,
)

threshold <- seq(0, 1, by = 0.001)
roc_sensitivity <- rep(0, length(threshold))
roc_specificity <- rep(0, length(threshold))

for (i in 1:length(threshold)) {
  # for each value of threshold, find our predictions
  predicted_class <- factor(ifelse(prob > threshold[i], "pos", "neg"))
  # compute the corresponding sensitivity and specificity
  roc_sensitivity[i] <- sensitivity(predicted_class, as.factor(df$blueWins), positive = "pos")
  roc_specificity[i]  <- specificity(predicted_class, as.factor(df$blueWins), negative = "neg")
}


# Create data frame for plotting
plotdata <- data.frame(redGoldDiff = seq(min(df$redGoldDiff), max(df$redGoldDiff), length.out = 100))

# Add predicted probabilities to data frame
plotdata$prob <- predict(log_reg, newdata = plotdata, type = "response")

# Create plot
ggplot(plotdata, aes(x = redGoldDiff, y = prob)) +
  geom_line() +
  geom_point(data = df, aes(x = redGoldDiff, y = blueWins, color = factor(blueWins)), alpha = 0.5) +
  labs(title = "Logistic Regression Results", x = "Red Team Gold Differential", y = "Probability of Blue Team Win", color = "Blue Wins") +
  scale_color_manual(values = c("red", "blue")) +
  theme_bw()

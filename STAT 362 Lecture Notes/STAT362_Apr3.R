####################################
# 19: Evaluating Model Performance #
####################################

library(caret)
install.packages("gmodels")
library(gmodels)
library(pROC)
library(mlbench)
install.packages("ROCR")
library(ROCR)
library(DMwR)

# Assessment using confusion matricies
data(PimaIndiansDiabetes2)
PimaIndiansDiabetes2 <- na.omit(PimaIndiansDiabetes2)

# Split the data into training and test set
set.seed(1)
random_index <- sample(nrow(PimaIndiansDiabetes2), 
                       size = nrow(PimaIndiansDiabetes2) * 0.7)
train_data  <- PimaIndiansDiabetes2[random_index, ]
test_data <- PimaIndiansDiabetes2[-random_index, ]
fit_simple <- glm(diabetes ~ glucose, data = train_data, family = binomial)

# Prediction
prob <- predict(fit_simple, test_data, type = "response")
predicted_class <- ifelse(prob > 0.5, "pos", "neg")

# Confusion matrix with additional information
CrossTable(predicted_class, test_data$diabetes, prop.chisq = FALSE) 

#
# Confusion Matricies; ROC
#

# The package caret has a function called confusionMatrix(),
confusionMatrix(data = factor(predicted_class), 
                reference =  factor(test_data$diabetes),
                positive = "pos")

# Threshold values, FPR, TPR for ROC
threshold <- seq(0, 1, by = 0.001)
roc_sensitivity <- rep(0, length(threshold))
roc_specificity <- rep(0, length(threshold))

for (i in 1:length(threshold)) {
  # for each value of threshold, find our predictions
  predicted_class <- factor(ifelse(prob > threshold[i], "pos", "neg"))
  # compute the corresponding sensitivity and specificity
  roc_sensitivity[i] <- sensitivity(predicted_class, test_data$diabetes, positive = "pos")
  roc_specificity[i]  <- specificity(predicted_class, test_data$diabetes, negative = "neg")
}

# ROC, use geom_path instead of geom_line to retain the order when joining the points
ggplot(mapping = aes(x = 1 - roc_specificity, y = roc_sensitivity)) +
  geom_path() +
  labs(x = "1 - Specificity", y = "Sensitivity") + 
  geom_segment(aes(x = 0, xend = 1, y = 0, yend = 1), linetype = 2)

# Can also do this using the pROC package:
roc_logistic <- roc(predictor = as.numeric(prob), response = test_data$diabetes)

plot(roc_logistic)


# 19.2.1: The Kappa Statistic
  # A way of adjusting accuracy by accounting for the possibility 
  # of a correct prediction by chance alone.

# \kappa = \frac{p_a - p_e}{1 - p_e}
# p_a is the actual accuracy
# p_e is the expected agreement between the classifier and the 
# true values, under the assumption that they were chosen at
# random, see the notes for a derivation/full explanation.



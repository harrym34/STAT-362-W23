library(mlbench)

data(PimaIndiansDiabetes2)

# Remove NA
PimaIndiansDiabetes2 <- na.omit(PimaIndiansDiabetes2)


# Split the data into training and test set
set.seed(1)
random_index <- sample(nrow(PimaIndiansDiabetes2), 
                       size = nrow(PimaIndiansDiabetes2) * 0.7)
train_data  <- PimaIndiansDiabetes2[random_index, ]
test_data <- PimaIndiansDiabetes2[-random_index, ]

# glm = generalized linear model
fit_simple <- glm(diabetes ~ glucose,
                  data = train_data, family = binomial)
summary(fit_simple)


# Prediction
prob <- predict(fit_simple, test_data, type = "response")
predicted_class <- ifelse(prob > 0.5, "pos", "neg")

# Confusion Matrix (s/o 271)
table(predicted_class, test_data$diabetes) 

# Accuracy (73%)
mean(predicted_class == test_data$diabetes)


#
# Using covariates
#

# Estimation
fit <- glm(diabetes ~ ., data = train_data, family = binomial)

# Summary
summary(fit)

# Prediction
prob <- predict(fit, test_data, type = "response")
predicted_class <- ifelse(prob > 0.5, "pos", "neg")

# Confusion Matrix
table(predicted_class, test_data$diabetes)


# Accuracy
mean(predicted_class == test_data$diabetes)





#
# 12: k-means clustering
#


# (x, y)
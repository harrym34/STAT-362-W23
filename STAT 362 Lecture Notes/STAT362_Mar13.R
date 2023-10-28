#
# 10.11 Stepwise Regression
#

install.packages("bestglm")
library(bestglm)


# Backward stepwise regression: 
# starts with the full model (or a model with 
# many variables) and removes the variable that results
# in the largest AIC until no variables can be removed.

full_model <- lm(lpsa ~ . , data = zprostate[, -10])

# Stepwise:
# variable selection = select a subset fo your model
# stepwise regression is one of the approaches.
step(full_model, direction = "backward")

# Add more here; check posted code
step_model <- lm(lpsa ~ lcavol + lweight + age + lcp,
                 data = zprostate)


# Forward direction:
# Start with the intercept

# the model with intercept only
null_model <- lm(lpsa ~ 1, data = zprostate[, -10]) 
step(null_model, direction = "forward", scope = formula(full_model))


#
# 10.12 Best Subset
#

# The "punishment" term changes from 2k to k * log(n), where
# n is ???

# k * log(n) is designed to prevent us from overfitting.

# the last column index
bestglm(zprostate[, -10], IC = "BIC")


#
# 12: lOGISITC REGRESSION
#

install.packages("mlbench")
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

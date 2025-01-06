# Data Preprocessing

# Importing the dataset
dataset = read.csv("Data.csv")

# Taking care of missing data
# is.na(dataset$Age) returns True if value in column is missing
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

# Basically replace missing values by mean, but the syntax is confusing as fuck
dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

# Encoding categorical data
# We don't need the three columns stuff bc R does it as categorical
dataset$Country = factor(dataset$Country, 
                         levels = c("France", "Spain", "Germany"),
                         labels = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchased, 
                         levels = c("No", "Yes"),
                         labels = c(0, 1))


# Splitting the dataset into the training set and test set
# install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# Basically logical array, True means observation goes to training set
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Most ML works on euclidean distance, so larger values will dominate so 
# we need to do feature scaling to counteract this
# standardisation basically centres data on zero and gives it unit standard deviation

# Feature Scaling, remeber we only need to do this on numeric obvs
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])

# Most libaries apply feature scaling by default but not all``
# Data Preprocessing

# Importing the dataset
dataset = read.csv("Data.csv")
# dataset = dataset[, 2:3]


# Splitting the dataset into the training set and test set
# install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# Basically logical array, True means observation goes to training set
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling, remeber we only need to do this on numeric obvs
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])
# to comment multiple lines ctr + shift + c


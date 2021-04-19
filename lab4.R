# Title     : TODO
# Objective : TODO
# Created by: Rodrigo Garoz
# Created on: 16/04/2021
require(ggplot2)
require(reshape2)

raw_data <- read.csv('insurance.csv')
head(raw_data)
pairs(raw_data[,c(1,3,7)], pch = 19)
nrow(raw_data)
sum(is.na(raw_data[,1:7]))
training_size <- floor(0.7*nrow(raw_data))
test_size <- floor(0.3*nrow(raw_data))
set.seed(4)
train_ind <- sample(seq_len(nrow(raw_data)), size = training_size)
train <- raw_data[train_ind,]
test <- raw_data[-train_ind,]
train[,1:6] <- scale(train[,1:6])
head(train)
fit <- lsfit(train[,1:6], train[7], yname = 'charges')
ls.print(fit)
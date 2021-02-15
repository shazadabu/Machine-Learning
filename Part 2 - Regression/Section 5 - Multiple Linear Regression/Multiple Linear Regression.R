#setting working directory
setwd('L:/Courses/Machine leaning A-Z/Machine Learning A-Z Template Folder/Section 5 - Multiple Linear Regression')
getwd()


#read dataset
dataset=read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

#splitting
library(caTools)
split =sample.split(dataset$Profit,SplitRatio = 0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)


#multi variable regression
regressor=lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
             data = training_set)

Y_pred=predict(regressor,newdata= test_set)

#checking p valuue
summary(regressor)



backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
dataset = dataset[, c(1,2,3,4,5)]
backwardElimination(training_set, SL)




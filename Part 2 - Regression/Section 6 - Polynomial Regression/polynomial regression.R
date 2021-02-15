setwd("L:/Courses/Machine leaning A-Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 7 - Support Vector Regression (SVR)")
# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset=dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
#install.packages("ggplot2")
library(ggplot2)

#split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
#training_set = subset(dataset, split == TRUE)
#test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

dataset$Level2=dataset$Level^2
dataset$Level3=dataset$Level^3
poly_reg=lm(formula = Salary ~ .,
            data=dataset)

ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),color='blue')+
  geom_line(aes(x=dataset$Level,y=predict(poly_reg,newdata = dataset)),color='red')

y_pred= predict(poly_reg,data.frame(Level=6.5,
                                    Level2=6.5^2,
                                    Level3=6.5^3))
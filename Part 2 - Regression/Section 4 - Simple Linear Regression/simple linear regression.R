#setting working directory
setwd('L:/Courses/Machine leaning A-Z/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 4 - Simple Linear Regression')
getwd()


#read dataset
dataset=read.csv('Salary_Data.csv')

# #averaging missing data
# dataset$YearsExperience=ifelse(is.na(dataset$YearsExperience),
#                    ave(dataset$YearsExperience,FUN=function(x) mean(x,na.rm=TRUE)),
#                    dataset$YearsExperience)
# dataset$Salary=ifelse(is.na(dataset$Salary),
#                       ave(dataset$Salary,FUN=function(x) mean(x,na.rm=TRUE)),
#                       dataset$Salary)
# 
# #categorising data
# dataset$Country=factor(dataset$Country,
#                        levels = c('France','Spain', 'Germany'),
#                        labels = c(1,2,3))
# dataset$Purchased=factor(dataset$Purchased,
#                          levels = c('Yes','No'),
#                          labels = c(1,2))

#splitting into training and test set
library(caTools)
split =sample.split(dataset$Salary,SplitRatio = 2/3)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

# 
# #Feature scaling
# training_set[,1]=scale(training_set[,2:3])
# test_set[,2]=scale(test_set[,2:3])

regressor=lm(formula = Salary ~ YearsExperience,
             data = training_set)

Y_pred=predict(regressor,newdata= test_set)




#install.packages('ggplot2')

library(ggplot2)
ggplot()+
  geom_point(aes(x=training_set$YearsExperience,y=training_set$Salary),color='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata= training_set)),color = 'blue')+
  ggtitle("Salary vs Experience (training)")+
  xlab('Years of experience')+
  ylab('Salary')

ggplot()+
  geom_point(aes(x=test_set$YearsExperience,y=test_set$Salary),color='red')+
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata= training_set)),color = 'blue')+
  ggtitle("Salary vs Experience (test)")+
  xlab('Years of experience')+
  ylab('Salary')




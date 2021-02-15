setwd("L:/Courses/Machine leaning A-Z/Machine Learning A-Z Template Folder/Part 5 - Association Rule Learning/Section 28 - Apriori/Apriori_R")
install.packages('arules')
library(arules)
dataset=read.transactions('Market_Basket_Optimisation.csv', sep= ',', rm.duplicates = TRUE)
itemFrequencyPlot(dataset, topN=10)

rules=apriori(data=dataset, parameter = list(support=0.002, confidence=0.4) )


inspect(sort(rules, by='lift')[1:10])

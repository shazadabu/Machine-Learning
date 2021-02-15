setwd("L:/Courses/Machine leaning A-Z/Machine Learning A-Z Template Folder/Part 5 - Association Rule Learning/Section 29 - Eclat")


# Apriori

# Data Preprocessing
# install.packages('arules')
library(arules)
dataset = read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)

# Training Apriori on the dataset
rules = eclat(data = dataset, parameter = list(support = 0.004,minlen=2 ))

# Visualising the results
inspect(sort(rules, by = 'support')[1:10])
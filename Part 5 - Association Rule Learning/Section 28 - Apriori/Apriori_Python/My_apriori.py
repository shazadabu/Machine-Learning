# -*- coding: utf-8 -*-
"""
Created on Sat May  2 05:44:16 2020

@author: Shazad
"""
# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Market_Basket_Optimisation.csv', header=None)

#creating proper structured list
transactions=[]
for i in range (0,7501):
    transactions.append([str(dataset.values[i,j]) for j in range(0,19)])


#Training the dataset
    
from apyori import apriori
rules=apriori(transactions,min_support=0.003,min_confidence=0.2,min_lift=3,min_length=2)

#visulaisation
MB= list(rules)
listRules = [list(MB[i][0]) for i in range(0,len(MB))]
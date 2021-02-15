import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


dataset = pd.read_csv('Data.csv')

X= dataset.iloc[:,:-1].values
Y= dataset.iloc[:,-1].values

from sklearn.preprocessing import Imputer, OneHotEncoder, LabelEncoder


# missing values pe mean laga denge
imputer= Imputer(missing_values='NaN',strategy='mean',axis=0)
imputer=imputer.fit(X[:,1:3])
X[:,1:3]=imputer.transform(X[:,1:3])


#categorical data me convert karne k liye
labelencoder_x=LabelEncoder()
X[:,0]=labelencoder_x.fit_transform(X[:,0])

labelencoder_y=LabelEncoder()
Y[:]=labelencoder_y.fit_transform(Y[:])

#single 1 & rest 0 for all One Hot Encoder
onehotencoder=OneHotEncoder()
onehotencoder=OneHotEncoder(categorical_features=[0])
X=onehotencoder.fit_transform(X).toarray()


#splitting training and testing dataset
from sklearn.model_selection import train_test_split
X_train,X_test,Y_train,Y_test=train_test_split(X,Y,test_size=0.2)


#Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X=StandardScaler()
X_train=sc_X.fit_transform(X_train)
X_test=sc_X.transform(X_test)


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import mean_squared_error, mean_absolute_error,accuracy_score, r2_score
from sklearn.preprocessing import StandardScaler


HouseDF = pd.read_csv("C:\\Users\\pltra\\OneDrive\\Masaüstü\\Houses1.2.2.csv",sep=',')
#print(HouseDF)
#HouseDF.info()
#HouseDF.describe()
X = HouseDF[['area', 'bedrooms', 'bathrooms','stories', 'mainroad','guestroom',
             'basement','hotwaterheating','airconditioning','parking','prefarea','furnishingstatus']]

y = HouseDF['price']

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42) 

scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)
from sklearn.linear_model import LinearRegression 

lm = LinearRegression() 

lm.fit(X_train,y_train) 
print(lm.intercept_)

coeff_df = pd.DataFrame(lm.coef_,X.columns,columns=['Coefficient']) 

predictions = lm.predict(X_test)  
print (predictions)

#print(accuracy_score(y_test, predictions))


from sklearn import metrics

print('MAE:', metrics.mean_absolute_error(y_test, predictions))
print('MSE:', metrics.mean_squared_error(y_test, predictions)) 
print('RMSE:', metrics.mean_squared_error(y_test, predictions)) 
#print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, predictions))) 

print('r2: ',r2_score(y_test, predictions))
'''
lm.fit(X_train, y_train)
y_pred = lm.predict(X_test)
print(accuracy_score(y_test, y_pred))



predict_train = lm.predict(X_train)
predict_test = lm.predict(X_test)


print(confusion_matrix(y_train,predict_train))
print(classification_report(y_train,predict_train))

print(confusion_matrix(y_test,predict_test))
print(classification_report(y_test,predict_test))
'''

'''

import sklearn
import pandas as pd
from sklearn.model_selection import train_test_split 
from sklearn.metrics import mean_squared_error, mean_absolute_error,accuracy_score
import numpy as np
from math import sqrt
from sklearn.metrics import classification_report,confusion_matrix,r2_score
from sklearn.preprocessing import StandardScaler

df = pd.read_csv("C:\\Users\\pltra\\OneDrive\\Masaüstü\\Houses1.2.csv",sep=',')

target_column = ['price']
predictors = list(set(list(df.columns))-set(target_column))

X = df[predictors].values
y = df[target_column].values


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)

scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)

from sklearn.linear_model import LinearRegression

model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)

print(accuracy_score(y_test, y_pred))


predict_train = model.predict(X_train)
predict_test = model.predict(X_test)


print(confusion_matrix(y_train,predict_train))
print(classification_report(y_train,predict_train))

print(confusion_matrix(y_test,predict_test))
print(classification_report(y_test,predict_test))
'''
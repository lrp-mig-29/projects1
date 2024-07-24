import pandas as pd
from sklearn.neural_network import MLPClassifier
from sklearn.model_selection import train_test_split 
from sklearn.metrics import mean_squared_error, mean_absolute_error,accuracy_score
import numpy as np
from math import sqrt
from sklearn.metrics import classification_report,confusion_matrix,r2_score
from sklearn.preprocessing import StandardScaler

houses1 = pd.read_csv("C:\\Users\\pltra\\OneDrive\\Masaüstü\\Houses1.2.2.csv",sep=',')

houses1.loc[houses1.price.between(1750000, 2905000) , 'price'] = 0
houses1.loc[houses1.price.between(2905000, 4060000) , 'price'] = 1
houses1.loc[houses1.price.between(4060000, 5215000) , 'price'] = 2
houses1.loc[houses1.price.between(5215000, 6370000) , 'price'] = 3
houses1.loc[houses1.price.between(6370000, 7525000) , 'price'] = 4
houses1.loc[houses1.price.between(7525000, 8680000) , 'price'] = 5

houses1 = houses1[houses1['price']<=8680000] 

target_column = ['price']

predictors = list(set(list(houses1.columns))-set(target_column))

X = houses1[predictors].values
y = houses1[target_column].values


X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=42) 
sc_X = StandardScaler()
sc_X.fit(X_train)
X_trainscaled = sc_X.transform(X_train)
X_testscaled = sc_X.transform(X_test)


mlp = MLPClassifier(activation='relu', alpha=0.0001, batch_size='auto', beta_1=0.9,
       beta_2=0.999, early_stopping=False, epsilon=1e-08,
       hidden_layer_sizes=(13, 13, 13), learning_rate='constant',
       learning_rate_init=0.001, max_iter=500, momentum=0.9,
       nesterovs_momentum=True, power_t=0.5, random_state=None,
       shuffle=True, solver='adam', tol=0.0001, validation_fraction=0.1,
       verbose=False, warm_start=False)

mlp.fit(X_trainscaled,y_train)


predict_train = mlp.predict(X_trainscaled)
predict_test = mlp.predict(X_testscaled)


print(confusion_matrix(y_train,predict_train))
print(classification_report(y_train,predict_train))

print(confusion_matrix(y_test,predict_test))
print(classification_report(y_test,predict_test))


#print('r2: ',r2_score(y_test, predict_train))



'''
houses1.drop(new_price < 8680000)
print(new_price)

#print(new_price)

if new_price > 1750000 && new_price <=2905000
 new_price.replace(new_price,0)
 elif
 '''
import os
import numpy as np
from sklearn import preprocessing
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.metrics import classification_report
from sklearn import metrics
from sklearn import tree
df = pd.read_csv('crop_production.csv',nrows=130000)
df.head()
df.tail()
df.count()
print(df.size)
print(df.shape)
print(df.columns)
df['Production'].unique()
# label_encoder object knows
# how to understand word labels.
label_encoder = preprocessing.LabelEncoder()

# Encode labels in column 'species'.
df['State_Name'] = label_encoder.fit_transform(df['State_Name'])
df['District_Name'] = label_encoder.fit_transform(df['District_Name'])
df['Season'] = label_encoder.fit_transform(df['Season'])
df['Crop'] = label_encoder.fit_transform(df['Crop'])
df['Production'] = label_encoder.fit_transform(df['Production'])

print(df.dtypes)
df['Production'].value_counts()
sns.heatmap(df.corr(),annot=True)
features = df[['State_Name','District_Name','Crop_Year','Season','Crop','Area']]
target = df['Crop']
labels = df['Crop']
acc = []
model = []
from sklearn.model_selection import train_test_split
Xtrain, Xtest, Ytrain, Ytest = train_test_split(features,target,test_size=0.2,random_state=2)

from sklearn.tree import DecisionTreeClassifier
DecisionTree = DecisionTreeClassifier(criterion='entropy',random_state=2,max_depth=5)
DecisionTree.fit(Xtrain,Ytrain)
predicted_values = DecisionTree.predict(Xtest)
x = metrics.accuracy_score(Ytest, predicted_values)
acc.append(x)
model.append('Decision Tree')
print("DecisionTrees's Accuracy is: ", x*100)
print(classification_report(Ytest,predicted_values))
from sklearn.model_selection import cross_val_score
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score
# Cross validation score (Decision Tree)
score = cross_val_score(DecisionTree, features, target,cv=5)
print(score)
from sklearn.neural_network  import MLPClassifier
mlp = MLPClassifier(max_iter=100)
mlp.fit(Xtrain,Ytrain)
y_pred = mlp.predict(Xtest)
print(classification_report(Ytest, y_pred))
s=accuracy_score(Ytest, y_pred)
print('MLP Accuracy: {:.2f}'.format(accuracy_score(Ytest, y_pred)))
import pickle
DT_pkl_filename = 'DecisionTree.pkl'
DT_Model_pkl = open(DT_pkl_filename, 'wb')
pickle.dump(DecisionTree, DT_Model_pkl)
# Close the pickle instances
DT_Model_pkl.close()
names = ['Decision Tree','MLP']
acc = [score.mean(),s.mean()]
plt.figure(figsize=(10,8))
graph = plt.barh(names,acc)
plt.xlabel('Accuracy')
plt.ylabel('Models')
graph[0].set_color('red')
plt.show()

import pandas as pd
import seaborn as sns
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC
from sklearn.metrics import classification_report, confusion_matrix

data = pd.read_csv('hand_data.csv', delimiter=',')
# print(data.head())
x = data.drop("label", axis=1)
y=np.ravel(data['label'])

x_train, x_test, y_train, y_test = train_test_split(x,y, test_size = 0.5, random_state=42)

scaler = StandardScaler().fit(x_train)
x_train = scaler.transform(x_train)
x_test = scaler.transform(x_test)

svc_model = SVC()

svc_model.fit(x_train, y_train)

y_predict = svc_model.predict(x_test)

# print(y_predict)

cm = np.array(confusion_matrix(y_test, y_predict, labels=[1,0]))
confusion = pd.DataFrame(cm, index=['Open', 'Close'], columns=['Predicted Open', 'Predicted Close'])

print(confusion)
print("------------------------------------------------------------------------------------------------")
print(classification_report(y_test, y_predict))

# classify with new data

# # 1 expected (open)
# arr = np.array([
#     [261,327,206,302,164,263,130,240,100,230,224,185,217,139,217,112,218,91,259,184,263,133,265,105,268,85,293,194,305,150,309,127,312,110,323,215,344,187,356,172,365,161]
# ])
# print(svc_model.predict(scaler.transform(arr)))
#
# # 0 expected (closed)
# arr2 = np.array([
#     [289,302,240,289,197,258,184,215,211,189,231,210,222,184,223,213,228,229,259,202,248,172,249,210,258,225,290,200,281,173,278,209,282,224,324,207,312,180,306,207,307,221]
# ])
# print(svc_model.predict(scaler.transform(arr2)))

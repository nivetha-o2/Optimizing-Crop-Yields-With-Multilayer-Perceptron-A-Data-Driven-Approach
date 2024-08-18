from flask import Flask, request, render_template,session,send_file
import sklearn
import pickle
import pandas as pd
import os
import mysql.connector
app = Flask(__name__)   # Initializing flask
app.config['DEBUG']
app.config['SECRET_KEY'] = '7d441f27d441f27567d441f2b6176a'
# Loading our model:
model = pickle.load(open("RFmodel.pkl", "rb"))
from sklearn.neural_network import MLPClassifier
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
X, y = make_classification(n_samples=100, random_state=1)
X_train, X_test, y_train, y_test = train_test_split(X, y, stratify=y,
                                                     random_state=1)
clf = MLPClassifier(random_state=1, max_iter=100).fit(X_train, y_train)
@app.route("/")
def home():
    return render_template("index.html")
@app.route("/crop")
def crop():
    pred=''
    return render_template("crop.html",prediction_text=pred)
@app.route("/recom")
def recom():
    return render_template("recom.html")
@app.route("/cropspric", methods = ["GET", "POST"])
def cropspric():
    if request.method == "POST":
        
        # Nitrogen
        c=''
        s1=''
        state = request.form["state1"]
        ds = request.form["ds"]
        year = request.form["year"]
        area = request.form["area1"]
                # Phosphorus
        sess = float(request.form["sess"])
        
        # Potassium
        crop = float(request.form["crop"])
        import numpy as np
        model = pickle.load(open('model.pkl', 'rb'))
        arr = np.array([year, sess, crop])
        arr = arr.astype(np.float64)
        pred = model.predict([arr])
        print(clf.score(X_test, y_test))
        s=clf.score(X_test, y_test)
        print(pred)
        a=pred[0]
        print(a)
        print(crop)
        if str(crop)=='76.0':
            c='rice'
        elif str(crop)=='47.0':
            c = 'Maize'
        elif str(crop)=='51.0':
            c = 'Moong(Green Gram)'
        elif str(crop)=='82.0':
            c = 'Sesamum'
        elif str(crop)=='24.0':
            c = 'Coffee'
        elif str(crop)=='65.0':
            c = 'Peas  (vegetable)'
        elif str(crop)=='75.0':
            c = 'Redish'
        elif str(crop)=='16.0':
            c = 'Carrot'
        elif str(crop)=='100.0':
            c = 'other fibres'

        if str(sess)=='1.0':
            s1='Kharif'
        elif str(sess)=='2.0':
            s1 = 'Rabi'
        elif str(sess)=='4.0':
            s1 = 'Whole Year'
        elif str(sess)=='3.0':
            s1 = 'Summer'
        elif str(sess)=='5.0':
            s1 = 'Winter'
        elif str(sess)=='0.0':
            s1 = 'Autumn'







        conn = mysql.connector.connect(user='root', password='', host='localhost', database='test_db')
        # cursor = conn.cursor()
        cur = conn.cursor()
        cur.execute(
            "insert into userinput values('','" + str(state) + "','" + ds + "','" + year + "','" + str(s1) + "','" + str(c) + "','" + str(area) + "','" + str(a) + "','" + str(s) + "','','','','','','','','','','')")
        conn.commit()
        conn.close()
        conn1 = mysql.connector.connect(user='root', password='', host='localhost', database='test_db')
        cursor1 = conn1.cursor()
        cursor1.execute("select max(id) from userinput")
        da = cursor1.fetchone()
        print(da)
        for i in da:
            d = i
        print(d)
        session['uid']=d


                
    return render_template('crop.html', prediction_text=pred,acc=s)


@app.route("/predict", methods=["GET", "POST"])
def predict():
    if request.method == "POST":
        uid=session['uid']

        # Nitrogen
        nitrogen = float(request.form["nitrogen"])

        # Phosphorus
        phosphorus = float(request.form["phosphorus"])

        # Potassium
        potassium = float(request.form["potassium"])

        # Temperature
        temperature = float(request.form["temperature"])

        # Humidity Level
        humidity = float(request.form["humidity"])

        # PH level
        phLevel = float(request.form["ph-level"])

        # Rainfall
        rainfall = float(request.form["rainfall"])

        # Making predictions from the values:
        predictions = model.predict([[nitrogen, phosphorus, potassium, temperature, humidity, phLevel, rainfall]])

        output = predictions[0]
        finalOutput = output.capitalize()

        if (output == "rice" or output == "blackgram" or output == "pomegranate" or output == "papaya"
                or output == "cotton" or output == "orange" or output == "coffee" or output == "chickpea"
                or output == "mothbeans" or output == "pigeonpeas" or output == "jute" or output == "mungbeans"
                or output == "lentil" or output == "maize" or output == "apple"):

            cropStatement = finalOutput + " should be harvested. " \
                                          "Its a Kharif crop, so it must" \
                                          " be sown at the beginning of the rainy season " \
                                          "e.g between April and May."
            cropStatement1 = finalOutput + " should be harvested.\n " \
                                          "Its a Kharif crop, so it must\n" \
                                          " be sown at the beginning of the rainy season \n" \
                                          "e.g between April and May."


        elif (
                output == "muskmelon" or output == "kidneybeans" or output == "coconut" or output == "grapes" or output == "banana"):
            cropStatement = finalOutput + " should be harvested. " \
                                          "Its a Rabi crop, so it must " \
                                          "be sown at the end of monsoon and beginning of" \
                                          " winter season e.g between September and October."
            cropStatement1 = finalOutput + " should be harvested.\n " \
                                          "Its a Rabi crop, so it must\n " \
                                          "be sown at the end of monsoon and beginning of\n" \
                                          " winter season e.g between September and October."

        elif (output == "watermelon"):
            cropStatement = finalOutput + " should be harvested." \
                                          " It is a Zaid Crop, so it must " \
                                          "be sown between the Kharif and rabi" \
                                          " season i.e between March and June."
            cropStatement1 = finalOutput + " should be harvested.\n" \
                                          " It is a Zaid Crop, so it must \n" \
                                          "be sown between the Kharif and rabi\n" \
                                          " season i.e between March and June."

        elif (output == "mango"):
            cropStatement = finalOutput + " should be harvested. Its a cash crop and also perennial. So you can grow it anytime."
            cropStatement1 = finalOutput + " should be harvested.\n Its a cash crop and also perennial.\n So you can grow it anytime."

        conn111 = mysql.connector.connect(user='root', password='', host='localhost', database='test_db')
        cursor111 = conn111.cursor()
        cursor111.execute("select * from fertilizer where Crop='" + str(output) + "'")
        da11 = cursor111.fetchall()
        for data in da11:
            fzr='N:'+data[2]+',P:'+data[3]+',K:'+data[4]+',PH LEVEL:'+data[5]+',soil_moisture:'+data[6]
        conn = mysql.connector.connect(user='root', password='', host='localhost', database='test_db')
        # cursor = conn.cursor()
        cur = conn.cursor()
        cur.execute("update userinput set Nitrogen='"+str(nitrogen)+"',Phosphorus='"+str(phosphorus)+"',Potassium='"+str(potassium)+"',Temperature='"+str(temperature)+"',hm='"+str(humidity)+"',PH='"+str(phLevel)+"',Rainfall='"+str(rainfall)+"',crop1='"+str(output)+"',details1='"+cropStatement+"',fertilizer='"+str(fzr)+"' where id='"+str(uid)+"'")
        conn.commit()
        conn.close()
        file1 = open("myfile.txt", "w")
        file1.write(cropStatement1)
        file1.close()
        conn2 = mysql.connector.connect(user='root', password='', host='localhost', database='test_db')
        cursor2 = conn2.cursor()
        cursor2.execute("select * from userinput where id='" + str(uid) + "'")
        da1 = cursor2.fetchone()
        print(da1)

        from fpdf import FPDF

        # save FPDF() class into a
        # variable pdf
        pdf = FPDF()

        # Add a page
        pdf.add_page()

        # set style and size of font
        # that you want in the pdf
        pdf.set_font("Arial", size=12)

        # create a cell
        pdf.cell(200, 10, txt="Crop Yield Prediction",
                 ln=1, align='C')

        # add another cell
        pdf.cell(200, 10, txt="User ID:"+str(da1[0]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="State_ID:" + str(da1[1]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="District_Name:" + str(da1[2]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Crop_Year:" + str(da1[3]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Season:" + str(da1[4]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Crop:" + str(da1[5]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Area:" + str(da1[6]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Yield Would Be:" + str(da1[7])+"kgs/acre ",
                 ln=2, align='L')
        pdf.cell(200, 10, txt="MLP Accuracy:" + str(da1[8]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="",
                 ln=2, align='C')
        pdf.cell(200, 10, txt="Crop Recommendation",
                 ln=2, align='C')
        pdf.cell(200, 10, txt="Nitrogen Level:" + str(da1[9]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Phosphorus Level:" + str(da1[10]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Potassium Level:" + str(da1[11]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Temperature:" + str(da1[12]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Humidity Level:" + str(da1[13]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="PH Level:" + str(da1[14]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Rainfall Level:" + str(da1[15]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Recommented Crop:" + str(da1[16]),
                 ln=2, align='L')
        pdf.cell(200, 10, txt="Details:",
                 ln=2, align='L')

        f = open("myfile.txt", "r")
        for x in f:
            pdf.cell(200, 10, txt=x, ln=1, align='L')
        pdf.cell(200, 10, txt="Fertilizer Details:" + str(da1[18]),
                 ln=2, align='L')


        # save the pdf with name .pdf
        pdf.output("GFG.pdf")



    return render_template('CropResult.html', prediction_text=cropStatement)
@app.route("/download")
def download():

    path="GFG.pdf"
    return send_file(path, as_attachment=True)
if __name__ == '__main__':
    app.run(debug=True)
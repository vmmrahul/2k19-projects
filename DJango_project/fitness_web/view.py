from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import FileSystemStorage
from database import *
import datetime
from database.PDF_QR import *
from database.mail import *
# import datetime
import time


@csrf_exempt
def adminlogin(request):
    if 'admin' not in request.session:
        if request.method == 'POST':
            Email = request.POST['email']
            password = request.POST['pass']
            query = "SELECT * FROM `Admins` WHERE `email`='{}' and `password`='{}'".format(Email, password)
            result = Fetchall(query)
            print(result)
            if result and result != 'INVALID QUERY':
                request.session['admin'] = result[0]
                print(request.session['admin'])
                return redirect(dashBoard)
            else:
                return render(request, 'adminlogin.html', {'result': 'not'})
        return render(request, 'adminlogin.html')
    else:
        return redirect(dashBoard)


def dashBoard(request):
    return render(request, 'dashboard.html')


def logoutamin(request):
    try:
        del request.session['admin']
    except:
        pass
    return redirect(adminlogin)


@csrf_exempt
def addfood(request):
    if request.method == 'POST':
        name = request.POST['name']
        Calories = request.POST['Calories']
        Description = request.POST['Description']
        Carbs = request.POST['Carbs']
        Protein = request.POST['Protein']
        Fats = request.POST['Fats']
        query = "INSERT INTO `Food`(`Foodname`, `Calorie`, `description`, `Carbs`, `Protein`, `fats`) VALUES ('{}','{}','{}','{}','{}','{}')".format(
            name, Calories, Description, Carbs, Protein, Fats)
        result = Insert(query)
        return render(request, 'addfoods.html', {'result': result})
    return render(request, 'addfoods.html')


def viewFoods(request):
    query = "SELECT * FROM `Food`"
    result = Fetchall(query)
    data = []
    for row in result:
        dist = {
            'id': row[0],
            'name': row[1],
            'calories': row[2],
            'description': row[3],
            'carbs': row[4],
            'protein': row[5],
            'fats': row[6],
        }
        data.append(dist)
    return render(request, 'Viewfood.html', {'data': data})


def deletefood(request):
    id = request.GET['id']
    query = "DELETE FROM `Food` WHERE `Foodid`='{}'".format(id)
    result = Delete(query)
    return redirect(viewFoods)


@csrf_exempt
def editfood(request):
    id = request.POST['id']
    name = request.POST['name']
    Calories = request.POST['Calories']
    Description = request.POST['Description']
    Carbs = request.POST['Carbs']
    Protein = request.POST['Protein']
    Fats = request.POST['Fats']
    query = f"UPDATE `Food` SET `Foodname`='{name}',`Calorie`='{Calories}',`description`='{Description}',`Carbs`='{Carbs}',`Protein`='{Protein}',`fats`='{Fats}' WHERE `Foodid`='{id}'"
    result = Update(query)
    print(result)
    return redirect(viewFoods)


@csrf_exempt
def addExercise(request):
    if request.method == 'POST':
        title = request.POST['title']
        caloriesburnt = request.POST['caloriesburnt']
        Description = request.POST['Description']
        query = f"INSERT INTO `Exercise`( `Title`, `Description`, `caloriesburnt`) VALUES ('{title}','{Description}','{caloriesburnt}')"
        result = Insert(query)
        print(query)
        print(result)
        return render(request, 'addExercise.html', {'result': result})
    return render(request, 'addExercise.html')


def viewExercise(request):
    query = "SELECT * FROM `Exercise` ORDER by `EID` DESC"
    result = Fetchall(query)
    data = []
    for row in result:
        dist = {
            'id': row[0],
            'title': row[1],
            'description': row[2],
            'caloriesburnt': row[3],
        }
        data.append(dist)
    return render(request, 'viewExercise.html', {'data': data})


def deleteExercise(request):
    id = request.GET['id']
    query = f"DELETE FROM `Exercise` WHERE `EID`='{id}'"
    result = Delete(query)
    print(result)
    return redirect(viewExercise)


def index(request):
    return render(request, 'index.html')


def contact(request):
    return render(request, 'contact.html')


def gallery(request):
    return HttpResponseRedirect('/#gallery')


def signup(request):
    if not 'user' in request.session:
        return render(request, 'userSinup.html')
    else:
        return redirect(index)


@csrf_exempt
def signupAction(request):
    email = request.POST['email']
    password = request.POST['password']
    age = request.POST['age']
    height = request.POST['height']
    weight = request.POST['weight']
    name = request.POST['name']
    mobile = request.POST['mobile']
    waiste = request.POST['waiste']
    biceps = request.POST['Biceps']
    query = f"INSERT INTO `User`(`email`, `name`, `mobile`, `password`, `age`, `height`, `weight`, `waiste`, `biceps`) VALUES ('{email}','{name}','{mobile}','{password}','{age}','{height}','{weight}','{waiste}','{biceps}')"
    result = Insert(query)
    print(query)
    print(result)
    return HttpResponse(result)


@csrf_exempt
def userlogin(request):
    if not 'user' in request.session:
        if request.method == 'POST':
            Email = request.POST['email']
            password = request.POST['password']
            query = "SELECT * FROM `User` WHERE `email`='{}' and `password`='{}'".format(Email, password)
            result = Fetchall(query)
            print(result)
            if result and result != 'INVALID QUERY':
                request.session['user'] = result[0]
                print(request.session['user'])
                return redirect(index)
            else:
                return render(request, 'userLogin.html', {'result': 'not'})
        return render(request, 'userLogin.html')
    else:
        return redirect(index)


def userLogout(request):
    try:
        del request.session['user']
        del request.session['F']
        del request.session['E']
    except:
        pass
    return redirect(index)


def userfood(request):
    query = "SELECT * FROM `Food`"
    result = Fetchall(query)
    data = []
    for row in result:
        dist = {
            'id': row[0],
            'name': row[1],
            'calories': row[2],
            'description': row[3],
            'carbs': row[4],
            'protein': row[5],
            'fats': row[6],
        }
        data.append(dist)
    if 'F' not in request.session:
        request.session['F'] = []
    return render(request, 'userFoods.html', {'data': data})


def userfoodAction(request):
    id = request.GET['id']
    qty = request.GET['qty']
    date = datetime.date.today()
    qu = time.asctime(time.localtime())
    qrtime = qu.split()[3]
    email= request.session['user'][0]
    query = f"INSERT INTO `Food_consumed`(`Foodid`, `Qty`, `Dateofconsumption`, `timeofconsumption`, `Email`) VALUES ('{id}','{qty}','{date}','{qrtime}','{email}')"
    result=Insert(query)
    return redirect(userfood)


def userExercise(request):
    query = "SELECT * FROM `Exercise` ORDER by `EID` DESC"
    result = Fetchall(query)
    data = []
    for row in result:
        dist = {
            'id': row[0],
            'title': row[1],
            'description': row[2],
            'caloriesburnt': row[3],
        }
        data.append(dist)
    # del request.session['E']
    if 'E' not in request.session:
        request.session['E'] = []
    return render(request, 'userExercise.html', {'data': data})


def userExerciseAction(request):
    p = request.session['E']
    id = int(request.GET['id'])
    p.append(id)
    request.session['E'] = p
    print(request.session['E'])
    date = datetime.date.today()
    email = request.session['user'][0]
    query = f"INSERT INTO `Exercise_done`(`Excerciseid`, `Dateofexcercise`, `Email`) VALUES ('{id}','{date}','{email}')"
    result = Insert(query)
    return redirect(userExercise)

def ActivityLog(request):
    email=request.session['user'][0]
    print(email)
    try:
        date=request.GET['datepicker']
    except:
        date = datetime.date.today()
    Fquery="SELECT * FROM `Food_consumed` INNER JOIN `Food` on `Food_consumed`.`Foodid`=`Food`.`Foodid` where `Dateofconsumption`='{}' and `Email`='{}'".format(date,email)
    Fresult=Fetchall(Fquery)
    print(Fquery)
    Fdata=[]
    Ftotal=0
    for row in Fresult:
        dist1={
            'fcid':row[0],
            'foodid':row[1],
            'qty':row[2],
            'dateofConsumption':row[3],
            'timeofConsumption':row[4],
            'email':row[5],
            'foodname':row[7],
            'calorie':round(float(row[8])*float(row[2]),2),
            'descripition':row[9],
            'carbs':round(float(row[10])*float(row[2]),2),
            'protein':round(float(row[11])*float(row[2]),2),
            'fats':round(float(row[12])*float(row[2]),2),
        }
        Ftotal+=float(row[8])*float(row[2])
        Fdata.append(dist1)
    Equery="SELECT * FROM `Exercise_done` INNER JOIN `Exercise` on `Exercise_done`.`Excerciseid`=`Exercise`.`EID` where `Dateofexcercise`='{}' and `Email`='{}'".format(date,email)
    Eresult=Fetchall(Equery)
    print(Equery)
    Edata = []
    Etotal=0
    for row in Eresult:
        dist2 = {
            'id':row[0],
            'Dateofexcercise':row[2],
            'email':row[3],
            'Eid': row[4],
            'title': row[5],
            'description': row[6],
            'caloriesburnt': row[7],
        }
        Etotal+=float(row[7])
        Edata.append(dist2)
    return render(request,'ActivityLog.html',{'Fdata':Fdata,'Edata':Edata,'Etotal':Etotal,'Ftotal':Ftotal})

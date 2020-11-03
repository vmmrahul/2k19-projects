import math
import random
import smtplib

from django.shortcuts import *
from django.http import *
import http.client
from pymysql import *
from django.views.decorators.csrf import *
from django.core.files.storage import *


@csrf_exempt
def addadmin(request):
    if 'adminemail' in request.session:
        return render(request, "addadmin.html")
    else:
        return HttpResponseRedirect('adminlogin')


@csrf_exempt
def insertadmin(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "insert into admin values('" + request.POST["email"] + "','" + request.POST["password"] + "'," + request.POST[
        "mobile"] + ",'" + request.POST["type"] + "')"
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    # d = {"message": "Admin Added Successfully"}
    return HttpResponse("Admin Added successfully")


def viewadmin(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "select email,mobile,type from admin"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        d = {"email": row[0], "mobile": row[1], "type": row[2]}
        x.append(d)
    return JsonResponse(x, safe=False)


@csrf_exempt
def removeadmin(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "delete from admin where email='" + request.POST["email"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("admin Deleted Successfully")


# @csrf_exempt
def editadmin(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "select * from admin where email='" + request.GET["email"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    d = {"email": str(result[0]), "password": str(result[1]), "mobile": str(result[2]), "type": str(result[3])}
    return render(request, "editadmin.html", {"ar": d})


@csrf_exempt
def saveadmin(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "update admin set password ='" + request.POST["password"] + "', mobile='" + request.POST[
        "mobile"] + "', type='" + request.POST["type"] + "' where email='" + request.POST["email"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("Edit Successfully")


def adminlogin(request):
    return render(request, "adminlogin.html")


def adminlogout(request):
    try:
        del request.session['adminemail']
    except:
        pass
    return render(request, "adminlogin.html")


@csrf_exempt
def checkadminlogin(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    e = request.POST["email"]
    p = request.POST["password"]
    s = "select * from admin where email='" + e + "' and password='" + p + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()

    # if result:
    #     request.session['adminemail'] = e
    #     return render(request, "admindashboard.html")
    # else:
    #     d = {"message": "Invalid Credentials"}
    #
    #     return render(request, "adminlogin.html", {"ar": d})
    if result:
        request.session['adminemail'] = e
        result = "success"
    else:
        result = "fail"
    return HttpResponse(result)


def changeadminpassword(request):
    if 'adminemail' in request.session:
        return render(request, "adminchangepassword.html")
    else:
        return HttpResponseRedirect('adminlogin')


def admindashboard(request):
    if 'adminemail' in request.session:
        return render(request, "admindashboard.html")
    else:
        return HttpResponseRedirect('adminlogin')


@csrf_exempt
def adminchangepassword(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    oldpassword = request.POST["oldpassword"]
    newpassword = request.POST["newpassword"]
    em = request.session['adminemail']
    # s = "select * from admin where email='" + em + "' and password='" + oldpassword + "'"
    query = f"select * from admin where email='{em}' and password='{oldpassword}'"
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()
    print(result)
    if result:
        s = "update admin set password='" + newpassword + "' where email='" + em + "' and password='" + oldpassword + "'"
        cr = conn.cursor()
        cr.execute(s)
        conn.commit()
        d = {"message": "Password Updated Successfully"}
        return render(request, "admindashboard.html", {"ar": d})
    else:
        d = {"message": "Incorrect Old Password"}
        return render(request, "adminchangepassword.html", {"ar": d})


def sendadminforgotsms(request):
    smsmobile = request.GET["smsmobile"]
    print(smsmobile)
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    query = f"select password from admin where mobile='{smsmobile}' "
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()

    if result:
        password = result[0]
        print(password)
        try:
            msg = "Your Password is:" + str(password)
            msg = msg.replace(" ", "%20")
            conn = http.client.HTTPConnection("server1.vmm.education")
            conn.request('GET',
                         "/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=" + msg + "&phone_numbers=" + smsmobile)
            response = conn.getresponse()
            res = "SMS Sent Successfuly"
        except:
            res = "Failed due to network or server problem"
    else:
        res = "Invalid Mobile Number !"
    return HttpResponse(res)


def addcategory(request):
    if 'adminemail' in request.session:
        return render(request, "addcategorymodal.html")
    else:
        return HttpResponseRedirect('adminlogin')


@csrf_exempt
def insertcategory(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    catname = request.POST["catname"]
    description = request.POST["description"]
    file = request.FILES["photo"]
    photo = "categoryphotos/" + str(random.randint(1, 10000)) + file.name
    print(photo)
    # s="insert into category values('"+catname+"' , '"+description+"' ,'"+photo+"')"
    query = f"insert into category values ('{catname}','{description}','{photo}')"
    fs = FileSystemStorage()
    fs.save(photo, file)
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    return HttpResponse('Category Added Successfully')


# def addcategory(request):
#     return render(request, "addcategory.html")


def editcategory(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "select * from category where catname='" + request.GET["q"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    d = {"catname": str(result[0]), "description": str(result[1]), "photo": result[2]}
    return render(request, "editcategory.html", {"ar": d})


@csrf_exempt
def removecategory(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "delete from category where catname='" + request.POST["catname"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("Category Deleted Successfully")


@csrf_exempt
def savecat(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    description = request.POST["description"]
    catname = request.POST["catname"]
    try:
        file = request.FILES['photo']
    except:
        file = ""

    if file != "":
        print(f"if condition {file}")
        file = request.FILES["photo"]
        uploadname = ("categoryphotos/" + str(random.randint(1, 10000)) + file.name)
        s = "update category set description='" + description + "',photo='" + uploadname + "' where catname='" + catname + "'"
        fs = FileSystemStorage()
        fs.save(uploadname, file)
        cr = conn.cursor()
        cr.execute(s)
        conn.commit()

    else:
        print(f"else condition:-{file}")
        s1 = "update category set description ='" + description + "' where catname='" + catname + "'"
        cr = conn.cursor()
        cr.execute(s1)
        conn.commit()
    return HttpResponseRedirect("showcategory")


@csrf_exempt
def updatecategory(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    catname = request.POST["catname"]
    print(catname)
    description = request.POST["description"]
    print(description)
    try:
        file = request.FILES['photo']
    except:
        file = ""
    print(file)
    if file != "":
        print(f"if condition {file}")
        file = request.FILES["photo"]
        uploadname = ("categoryphotos/" + str(random.randint(1, 10000)) + file.name)
        s = "update category set description='" + description + "',photo='" + uploadname + "' where catname='" + catname + "'"
        print(s)
        fs = FileSystemStorage()
        fs.save(uploadname, file)
        cr = conn.cursor()
        cr.execute(s)
        conn.commit()

    else:
        print(f"else condition:-{file}")
        s1 = "update category set description ='" + description + "' where catname='" + catname + "'"
        print(s1)
        cr = conn.cursor()
        cr.execute(s1)
        conn.commit()
    return HttpResponse(" Category Successfully Updated")


def showcategory(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "select * from category"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        d = {}
        d["catname"] = row[0]
        d["description"] = row[1]
        d["photo"] = row[2]
        x.append(d)
    return JsonResponse(x, safe=False)


def usersignup1(request):
    return render(request, "usersignup1.html")


def usersignupotpveryfy(request):
    if 'userotp' in request.session:
        return render(request, "usersignup2.html")
    else:
        return HttpResponseRedirect('usersignup1')


def sendotpmobile(request):
    mobile = request.GET['mobile']
    print(mobile)
    digits = "0123456789"
    OTP = ""
    for i in range(6):
        OTP = OTP + digits[math.floor(random.random() * 10)]
    print(OTP)
    try:
        msg = "Your OTP is:" + str(OTP)
        msg = msg.replace(" ", "%20")
        conn = http.client.HTTPConnection("server1.vmm.education")
        conn.request('GET',
                     "/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=" + msg + "&phone_numbers=" + mobile)
        response = conn.getresponse()
        request.session['userotp'] = OTP
        request.session['mobile'] = mobile
        returnvalue = 'OTP Sent Successfuly'
    except:
        returnvalue = "Failed To Sent OTP"
    return HttpResponse(returnvalue)


@csrf_exempt
def verifyotp(request):
    print(request.session['userotp'])
    sendedotp = request.POST['sendotp']
    if str(sendedotp == request.session['userotp']):
        return HttpResponse('OTP Success')
    else:
        return HttpResponse('OTP Not Matched')


def usersignup2(request):
    if 'userotp' in request.session:
        return render(request, "usersignup2.html")
    else:
        return HttpResponseRedirect('usersignup1')


@csrf_exempt
def insertuser(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    mobile = request.POST["mobile"]
    email = request.POST["email"]
    digits = "abcdefghijklmnopqrstuvwxyz0123456789"
    password = ""
    for i in range(6):
        password += digits[math.floor(random.random() * 10)]
    address = request.POST["address"]
    city = request.POST["city"]
    file = request.FILES["photo"]
    print(file.name)
    photo = "userphotos/" + str(random.randint(1, 10000)) + file.name
    # print(photo)
    query = f"insert into user values ('{mobile}','{email}','{address}','{city}','{photo}','{password}')"

    fs = FileSystemStorage()
    fs.save(photo, file)
    try:
        cr = conn.cursor()
        cr.execute(query)
        conn.commit()
        result = "success"
        msg = "Your Password is:" + str(password)
        msg = msg.replace(" ", "%20")
        conn = http.client.HTTPConnection("server1.vmm.education")
        conn.request('GET',
                     "/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=" + msg + "&phone_numbers=" + mobile)
        response = conn.getresponse()
        res = "SMS Sent Successfuly"

    except:
        result = "fail"
    return HttpResponse(result)


def userloginpage(request):
    return render(request, 'userlogin.html')


def userDashboard(request):
    return render(request, "userDashboard.html")


@csrf_exempt
def userlogin(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    e = request.POST["email"]
    p = request.POST["password"]
    s = "select * from user where email='" + e + "' and password='" + p + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    if result:
        request.session['useremail'] = e
        result = "success"
    else:
        result = "fail"
    return HttpResponse(result)


def userlogout(request):
    try:
        del request.session['useremail']
    except:
        pass
    return render(request, "userlogin.html")


def senduserforgotsms(request):
    smsmobile = request.GET["smsmobile"]
    print(smsmobile)
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    query = f"select password from user where mobile='{smsmobile}' "
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()

    if result:
        password = result[0]
        print(password)
        try:
            msg = "Your Password is:" + str(password)
            msg = msg.replace(" ", "%20")
            conn = http.client.HTTPConnection("server1.vmm.education")
            conn.request('GET',
                         "/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=" + msg + "&phone_numbers=" + smsmobile)
            response = conn.getresponse()
            res = "SMS Sent Successfuly"
        except:
            res = "Failed due to network or server problem"
    else:
        res = "Invalid Mobile Number !"
    return HttpResponse(res)


# -------------------------------SERVICE PROVIDER--------------------------------------------------------------------------------
def serviceprovidersignup(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    query = "select catname from category"
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchall()
    x = []
    for row in result:
        d = {"catname": row[0]}
        x.append(d)
    # print(x)
    return render(request, "serviceprovidersignup.html", {"ar": x})


@csrf_exempt
def insertserviceprovider(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    email = request.POST["email"]
    print(email)
    name = request.POST["name"]
    print(name)
    mobile = request.POST["mobile"]
    print(mobile)
    digits = "0123456789"
    print(digits)
    password = ""
    for i in range(6):
        password += digits[math.floor(random.random() * 10)]
    business = request.POST["business"]
    print(business)
    catname = request.POST["catname"]
    print(catname)
    city = request.POST["city"]
    print(city)
    address = request.POST["address"]
    print(address)
    timings = request.POST["timings"]
    print(timings)
    fees = request.POST["fees"]
    print(fees)
    area = request.POST["area"]
    print(area)
    file = request.FILES["photo"]
    print(file)
    status = "pending"
    photo = "serviceproviderphotos/" + str(random.randint(1, 10000)) + file.name
    print(photo)
    fs = FileSystemStorage()
    fs.save(photo, file)
    q = "select * from serviceprovider"
    cr = conn.cursor()
    cr.execute(q)
    result = cr.fetchall()
    flag = True
    for row in result:
        if row[0] == email:
            flag = False
            break
    if flag == False:
        returnvalue = "duplicate"
    else:
        query = f"insert into serviceprovider values ('{email}','{name}','{mobile}','{password}','{business}','{catname}','{city}','{address}','{timings}','{fees}','{area}','{status}','{photo}')"
        print(query)
        cr = conn.cursor()
        cr.execute(query)
        conn.commit()
        try:
            msg = "Your Password is:" + str(password)
            msg = msg.replace(" ", "%20")
            conn = http.client.HTTPConnection("server1.vmm.education")
            conn.request('GET',
                         "/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=" + msg + "&phone_numbers=" + mobile)
            response = conn.getresponse()
            res = "SMS Sent Successfuly"
        except:
            res = "Failed due to network or server problem"
        returnvalue = "success"
    return HttpResponse(returnvalue)


def serviceproviderlogin(request):
    return render(request, 'serviceproviderlogin.html')


@csrf_exempt
def checkserviceproviderlogin(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    e = request.POST["email"]
    p = request.POST["password"]
    s = "select * from serviceprovider where email='" + e + "' and password='" + p + "'"
    cr = conn.cursor()
    cr.execute(s)
    result1 = cr.fetchone()
    if result1:
        request.session['serviceprovideremail'] = e
        result = "sucess"
        print(result)
    else:
        result = "fail"
    return HttpResponse(result)


def splogout(request):
    try:
        del request.session['serviceprovideremail']
    except:
        pass
    return render(request, "serviceproviderlogin.html")


def spDashboard(request):
    return render(request, "spDashboard.html")


def spchangepassword(request):
    return render(request, "spChangePassword.html")


@csrf_exempt
def spChangePassword(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    oldpassword = request.POST["oldpassword"]
    newpassword = request.POST["newpassword"]
    em = request.session['serviceprovideremail']
    query = f"select * from serviceprovider where email='{em}' and password='{oldpassword}'"
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()
    print(result)
    if result:
        s = "update serviceprovider set password='" + newpassword + "' where email='" + em + "' and password='" + oldpassword + "'"
        cr = conn.cursor()
        cr.execute(s)
        conn.commit()
        d = {"message": "Password Updated Successfully"}
        return render(request, "spDashboard.html", {"ar": d})
    else:
        d = {"message": "Incorrect Old Password"}
        return render(request, "spChangePassword.html", {"ar": d})


def sendforgotsms(request):
    smsmobile = request.GET["smsmobile"]
    print(smsmobile)
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    query = f"select password from serviceprovider where mobile='{smsmobile}' "
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()

    if result:
        password = result[0]
        print(password)
        try:
            msg = "Your Password is:" + str(password)
            msg = msg.replace(" ", "%20")
            conn = http.client.HTTPConnection("server1.vmm.education")
            conn.request('GET',
                         "/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=" + msg + "&phone_numbers=" + smsmobile)
            response = conn.getresponse()
            res = "SMS Sent Successfuly"
        except:
            res = "Failed due to network or server problem"
    else:
        res = "Invalid Mobile Number !"
    return HttpResponse(res)


@csrf_exempt
def addservices(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    s = "select catname from category"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    d = []
    for row in result:
        d.append(row[0])
    return render(request, "addservices.html", {"ar": d})


@csrf_exempt
def insertservices(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    spemail = request.POST["spemail"]
    # catname = request.POST["catname"]
    print(spemail)
    services = request.POST["services"]
    print(services)
    description = request.POST["description"]
    print(description)
    price = request.POST["price"]
    print(price)
    file = request.FILES["photo"]
    print(file.name)
    photo = "servicesphotos/" + str(random.randint(1, 10000)) + file.name
    print(photo)
    fs = FileSystemStorage()
    fs.save(photo, file)
    # query = f"insert into user values (NULL,'{spemail}','{title}','{description}','{price}','{photo}')"
    query1 = f"INSERT INTO services VALUES ('','{spemail}','{services}','{description}','{price}','{photo}')"
    print(query1)

    try:
        cr = conn.cursor()
        cr.execute(query1)
        conn.commit()
        result = "success"
    except:
        result = "fail"
    return HttpResponse(result)


def searchservice1(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    query = "select DISTINCT city from serviceprovider"
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchall()
    x = []
    for row1 in result:
        x.append(row1[0])

    query2 = "select * from category"
    cr = conn.cursor()
    cr.execute(query2)
    result = cr.fetchall()
    categories = []
    for row2 in result:
        categoriesdict = {
            "catname": row2[0],
            "photo": row2[2]
        }
        categories.append(categoriesdict)
    print(categories)
    return render(request, "searchservice1.html", {"city": x, 'categories': categories})


def searchservice2(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    catname = request.GET['catname']
    city = request.GET['city']
    print(catname, 'and ', city)
    newcatname = ""
    for word in catname:
        if word == '@':
            newcatname += "&"
        elif word == '!':
            newcatname += " "
        else:
            newcatname += word
    query1 = f"select * from serviceprovider where city='{city}' and catname='{newcatname}'"
    print(query1)
    cr = conn.cursor()
    cr.execute(query1)
    result = cr.fetchall()
    datalist = []
    for row in result:
        dist = {}
        dist['email'] = row[0]
        dist['name'] = row[1]
        dist['mobile'] = row[2]
        dist['business'] = row[4]
        dist['catname'] = row[5]
        dist['city'] = row[6]
        dist['address'] = row[7]
        dist['timings'] = row[8]
        dist['price'] = row[9]
        dist['photo'] = row[12]
        datalist.append(dist)
    print(datalist)
    indexname = ""
    try:
        indexname = request.GET['index']
        print(indexname)
    except:
        pass
    if indexname == "index":
        return render(request, "indexservices.html", {'ar': datalist})
    else:
        return render(request, "searchservice2.html", {'ar': datalist})


def spdetails(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    email = request.GET['email']
    avge = (getaveragerating(email))
    query = f"select * from serviceprovider where email='{email}' "
    print(query)
    cr = conn.cursor()
    cr.execute(query)
    row2 = cr.fetchone()
    x = []
    detailsdict = {
        "email": row2[0],
        "name": row2[1],
        "mobile": row2[2],
        "business": row2[4],
        "city": row2[6],
        "address": row2[7],
        "timings": row2[8],
        "servicearea": row2[10],
        "photo": row2[12]
    }
    x.append(detailsdict)
    # ---------start of Searched categories---------
    catname = request.GET['catname']
    city = request.GET['city']
    newcatname = ""
    for word in catname:
        if word == '@':
            newcatname += "&"
        elif word == '!':
            newcatname += " "
        else:
            newcatname += word
    query1 = f"select * from serviceprovider where city='{city}' and catname='{newcatname}'"
    cr = conn.cursor()
    cr.execute(query1)
    result = cr.fetchall()
    datalist = []
    for row in result:
        dist = {}
        dist['email'] = row[0]
        dist['name'] = row[1]
        dist['mobile'] = row[2]
        dist['business'] = row[4]
        dist['catname'] = row[5]
        dist['city'] = row[6]
        dist['address'] = row[7]
        dist['timings'] = row[8]
        dist['price'] = row[9]
        dist['photo'] = row[12]
        datalist.append(dist)
    ratinglist = []
    for row in result:
        dist = {"bid": row[0], "email": row[1], "business": row[2], "rating": row[3], "description": row[4],
                'useremail': row[5]}
        ratinglist.append(dist)

    sp = ""
    try:
        sp = request.GET['index']
    except:
        pass
    if sp == "index":
        return render(request, "indexSPdetails.html",
                      {'detail': x, 'datalist': datalist, 'ratinglist': ratinglist, 'avge': avge})
    else:
        return render(request, "spdetails.html", {'detail': x, 'datalist': datalist,'ratinglist': ratinglist, 'avge': avge})


# def updateservice(request):
#     email=request.session['serviceprovideremail']
#     name=request.POST

@csrf_exempt
def updateserviceprovider(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    email = request.session['serviceprovideremail']
    print(email)
    name = request.POST["name"]
    print(name)
    mobile = request.POST["mobile"]
    print(mobile)
    address = request.POST["address"]
    print(address)
    timings = request.POST["timings"]
    print(timings)
    price = request.POST["price"]
    print(price)
    servicearea = request.POST["servicearea"]
    print(servicearea)
    try:
        file = request.FILES['photo']
    except:
        file = ""
    print(file)
    if file != "":
        print(f"if condition {file}")
        file = request.FILES["photo"]
        uploadname = ("serviceproviderphotos/" + str(random.randint(1, 10000)) + file.name)
        s = "update serviceprovider set name='" + name + "',mobile='" + mobile + "',address='" + address + "',timings='" + timings + "',price='" + price + "',servicearea='" + servicearea + "',photo='" + uploadname + "' where email='" + email + "'"
        print(s)
        fs = FileSystemStorage()
        fs.save(uploadname, file)
        cr = conn.cursor()
        cr.execute(s)
        conn.commit()

    else:
        print(f"else condition:-{file}")
        s1 = "update category set name='" + name + "',mobile='" + mobile + "',address='" + address + "',timings='" + timings + "',price='" + price + "',servicearea='" + servicearea + "' where email='" + email + "'"
        print(s1)
        cr = conn.cursor()
        cr.execute(s1)
        conn.commit()
    return HttpResponseRedirect('spDashboard')


def updateSP(request):
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    email = request.session['serviceprovideremail']
    print(email)
    s = f"select * from serviceprovider where email='{email}'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    d = {"name": str(result[1]), "mobile": str(result[2]), "address": result[7], "timings": result[8],
         "price": result[9], "servicearea": result[10], "photo": result[12]}
    print(d)
    return render(request, "editSP.html", {"ar": d})


# main pages user side templates editing

def index(request):
    query = "select catname from category"
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchall()
    catname = []
    for row in result:
        catname.append(row[0])
    return render(request, "index.html", {'catname': catname})


def contact(request):
    return render(request, 'contact.html')


@csrf_exempt
def searchcity(request):
    catname = request.POST['catname']
    query = f"select city from serviceprovider where catname='{catname}'"
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchall()
    cityname = []
    id = []
    for row in result:
        dist = {}
        if not cityname:
            id.append(row[0])
            dist['city'] = row[0]
            cityname.append(dist)
        elif row[0] in id:
            pass
        else:
            id.append(row[0])
            dist['city'] = row[0]
            cityname.append(dist)
    print(cityname)
    return JsonResponse(cityname, safe=False)


def getserviceprovider(request):
    return render(request, "getserviceprovider.html")


def bookdetails(request):
    if 'useremail' not in request.session:
        return HttpResponseRedirect('userloginpage')
    else:
        conn = connect("127.0.0.1", "root", "", "urbanclap")
        useremail = request.session["useremail"]
        print(useremail)
        query = f"select * from user where email='{useremail}'"
        cr = conn.cursor()
        cr.execute(query)
        result = cr.fetchone()

        spemail = request.GET['email']
        s = f"select * from serviceprovider where email='{spemail}'"
        cr = conn.cursor()
        cr.execute(s)
        result = cr.fetchone()
        d = {"email": str(result[0]), "name": str(result[1]), "mobile": str(result[2]), "address": result[7],
             "timings": result[8],
             "price": result[9], "servicearea": result[10], "photo": result[12]}
        print(d)

        return render(request, 'bookdetails.html', {"ar": d})


# def demo(request):
#     return render(request, 'demo.html')

from datetime import *


@csrf_exempt
def payment_action(request):
    useremail = request.session["useremail"]
    print(useremail)
    spemail = request.POST['spemail']
    date1 = request.POST['date']
    timefrom = request.POST['timefrom']
    timeto = request.POST['timeto']
    place = request.POST['place']
    paymentmode = request.POST['paymentmode']
    price = request.POST['price']
    dateoforder = date.today()
    if paymentmode == "Cash":
        query = f"INSERT INTO `booking`(`email`, `dateofbooking`, `timefrom`, `timeto`, `place`, `status`, `paymentstatus`, `price`, `spemail`, `dates`) VALUES ('{useremail}','{date1}','{timefrom}','{timeto}','{place}','pending','pending','{price}','{spemail}','{dateoforder}')"
    else:
        query = f"INSERT INTO `booking`(`email`, `dateofbooking`, `timefrom`, `timeto`, `place`, `status`, `paymentstatus`, `price`, `spemail`, `dates`) VALUES ('{useremail}','{date1}','{timefrom}','{timeto}','{place}','pending','Complete','{price}','{spemail}','{dateoforder}')"
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    qr = "select bid from booking order by bid DESC"
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr.execute(qr)
    t1 = cr.fetchall()
    bid = t1[0][0]
    return JsonResponse({'bid': bid}, safe=False)


def thankyou(request):
    bid = request.GET['bid']
    return render(request, 'thankyou.html', {"bid": bid})


def viewbookingtoSP(request):
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    spemail = request.session["serviceprovideremail"]

    s = f"select * from booking where status='pending' and spemail='{spemail}'"
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        useremail = row[1]
        query = f"select * from user where email='{useremail}'"
        cr.execute(query)
        rs = cr.fetchone()
        mobile = rs[0]

        d = {"bid": row[0], "email": useremail, "mobile": mobile, "status": row[6]}
        x.append(d)
    return render(request, "viewbookingtoSP.html", {'msg': x})


def viewbookingdetails(request):
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    bid = request.GET['bid']
    status = request.GET['status']
    s = f"select * from booking where bid='{bid}' and status='{status}'"
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        d = {"bid": row[0], "email": row[1], "dateofbooking": row[2], "timefrom": row[3], "timeto": row[4],
             "place": row[5], "status": row[6], "paymentstatus": row[7]}
        x.append(d)
    return render(request, "viewbookingdetails.html", {'msg': x})


def acceptbooking(request):
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    bid = request.GET['bid']
    # status = request.GET['status']
    query = f"UPDATE booking set status='accepted'  where bid={bid}"
    cr.execute(query)
    conn.commit()
    return HttpResponseRedirect('viewbookingtoSP')


def rejectbooking(request):
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    bid = request.GET['bid']
    status = request.GET['status']
    query = f"UPDATE booking set status='rejected'  where bid={bid}"
    cr.execute(query)
    conn.commit()
    return HttpResponseRedirect('viewbookingtoSP')


def viewsuccessbookingtoSP(request):
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    try:
        status = request.GET['status']
    except:
        status = 'accepted'
    if request.session['serviceprovideremail']:
        s = f"select * from booking where status='{status}' and spemail='{request.session['serviceprovideremail']}'"
    else:
        s = f"select * from booking where status='{status}'"
    print(s)
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        useremail = row[1]
        query = f"select * from user where email='{useremail}'"
        cr.execute(query)
        rs = cr.fetchone()
        mobile = rs[0]
        d = {"bid": row[0], "email": useremail, "spemail": row[9], "mobile": mobile, "status": row[6]}
        x.append(d)
    return render(request, "viewsuccessbookingtoSP.html", {'msg': x})


def userbookings(request):
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    useremail = request.session['useremail']
    p = 'pending'
    s = f"select * from booking where  email='{useremail}' and status='{p}'"
    print(s)
    cr.execute(s)
    result = cr.fetchall()
    for row in result:
        timefrom=row[3]
        timeto= row[4]
    usermobile = ""
    s2 = f"select * from user where  email='{useremail}'"
    cr.execute(s2)
    rsuser = cr.fetchone()
    usermobile = rsuser[0]
    x = []
    spemail = ""
    for row in result:
        # useremail = row[1]
        spemail = row[9]
        s3 = f"select * from serviceprovider where  email='{spemail}'"
        cr.execute(s3)
        rssp = cr.fetchone()
        spmobile = rssp[2]
        business = rssp[4]
        d = {"bid": row[0], "email": useremail, "mobile": usermobile, "spemail": row[9], "spmobile": spmobile,
             "business": business, "status": row[6],"timefrom": row[3],"timeto": row[4]}
        x.append(d)
    a = 'accepted'
    s = f"select * from booking where  email='{useremail}' and status='{a}'"
    print(s)
    cr.execute(s)
    result = cr.fetchall()
    usermobile = ""
    s2 = f"select * from user where  email='{useremail}'"
    cr.execute(s2)
    rsuser = cr.fetchone()
    usermobile = rsuser[0]
    y = []
    spemail = ""
    for row in result:
        # useremail = row[1]
        spemail = row[9]
        s3 = f"select * from serviceprovider where  email='{spemail}'"
        cr.execute(s3)
        rssp = cr.fetchone()
        spmobile = rssp[2]
        business = rssp[4]
        d = {"bid": row[0], "email": useremail, "mobile": usermobile, "spemail": row[9], "spmobile": spmobile,
             "business": business, "status": row[6],"timefrom": row[3],"timeto": row[4]}
        y.append(d)
    z = []
    z.append(x)
    z.append(y)
    return render(request, "userbookings.html", {'msg': z})


@csrf_exempt
def rating(request):
    useremail = request.POST['useremail']
    email1 = request.POST['email']
    # business1 = request.POST['business']
    description1 = request.POST['description']
    rating1 = request.POST['rating']
    bid = request.POST['bid']

    query2 = f"select * from booking where email='{useremail}' and bid='{bid}'"
    query1 = f"select * from reviews where useremail='{useremail}'"
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr1 = conn.cursor()
    cr.execute(query1)
    check = cr.fetchall()
    cr1.execute(query2)
    check2 = cr1.fetchall()
    print("check2:-", check2)
    if check2:
        if check:
            # query = f"INSERT INTO `reviews`(`email`, `business`, `rating`, `description`, `useremail`) VALUES ('{email1}','{business1}','{rating1}','{description1}','{useremail}')"
            query = f"UPDATE `reviews` SET `email`='{email1}',`rating`='{rating1}',`description`='{description1}' WHERE useremail='{useremail}' and reviewed={check[0][0]}"
        else:
            query = f"INSERT INTO `reviews`(`email`, `rating`, `description`, `useremail`) VALUES ('{email1}','{rating1}','{description1}','{useremail}')"
        print(query)
        conn = connect("127.0.0.1", "root", "", "urbanclap")
        cr = conn.cursor()
        cr.execute(query)
        conn.commit()
        return HttpResponse('Rating Completed')
    else:
        return HttpResponse('Firstly Book this service')


def addreviews(request):
    # useremail=request.session['useremail']
    bid = request.GET['bid']
    query = f"select * from booking where bid={bid}"
    conn = Connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr.execute(query)
    spemail=""
    result = cr.fetchall()
    x = []
    for row in result:
        d = {'bid': row[0], 'email': row[1], 'dateofbooking': row[2], 'timefrom': row[3], 'timeto': row[4],
             'place': row[5], 'status': row[6], 'paymentstatus': row[7], 'price': row[8], 'spemail': row[9],
             'dates': row[10]}
    x.append(d)
    # query1 = f"select * from reviews where email='{spemail}'"
    # cr2 = conn.cursor()
    # cr2.execute(query1)
    # result2 = cr2.fetchall()
    # y = []
    # for row in result2:
    #     d={'useremail':row[4],'rating':row[2],'description':row[3]}
    # y.append(d)
    #
    # z=[]
    # z.append(x)
    # z.append(y)

    return render(request, "rating.html", {"msg": x})


def reviews(request):
    # useremail = request.session['useremail']
    useremail = request.POST['useremail']
    email1 = request.POST['email']
    business1 = request.POST['business']
    description1 = request.POST['description']
    rating1 = request.POST['rating']
    query1 = f"select * from reviews where useremail='{useremail}'"
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr.execute(query1)
    check = cr.fetchall()
    print(check)
    if check:
        # query = f"INSERT INTO `reviews`(`email`, `business`, `rating`, `description`, `useremail`) VALUES ('{email1}','{business1}','{rating1}','{description1}','{useremail}')"
        query = f"UPDATE `reviews` SET `email`='{email1}',`business`='{business1}',`rating`='{rating1}',`description`='{description1}' WHERE useremail='{useremail}' and reviewed={check[0][0]}"
    else:
        query = f"INSERT INTO `reviews`(`email`, `business`, `rating`, `description`, `useremail`) VALUES ('{email1}','{business1}','{rating1}','{description1}','{useremail}')"
    print(query)
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    return HttpResponse('Rating Completed')

def customerreviews(request):
    email = request.GET['email']
    s=f"select `rating`,`description`,`useremail` from `reviews` where `email`='{email}'"
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    cr.execute(s)
    check = cr.fetchall()
    print(check)
    lt = []
    for i in check:
        d={}
        d['rating'] = i[0]
        d['description'] = i[1]
        d['useremail'] = i[2]
        lt.append(d)
    print(lt)
    return JsonResponse(lt,safe=False)


def getaveragerating(email):
    semail = email
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    query = f"select avg(rating) from reviews where email='{semail}'"
    cr = conn.cursor()
    cr.execute(query)
    rs = cr.fetchone()
    avg = rs[0]
    return avg


def rating2(request):
    return render(request, "rating.html")

@csrf_exempt
def sendratingmsgandemail(request):
    bid = request.GET['bid']
    print(bid)
    email = request.GET['email']
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    query = f"select * from user where email='{email}'"
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()
    mobile = result[0]
    msg = f"http://127.0.0.1:8000/addreviews?bid={bid}"

    conn = http.client.HTTPConnection("server1.vmm.education")
    conn.request('GET',
                 '/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=' + msg + '&phone_numbers=' + str(
                     mobile))
    response = conn.getresponse()
    print(response)

    sender = 'python.vmm@gmail.com'
    receiver = email
    password = 'vmmpython'
    try:
        smtpserver = smtplib.SMTP("smtp.gmail.com", 587)
        smtpserver.ehlo()
        smtpserver.starttls()
        smtpserver.ehlo()
        smtpserver.login(sender, password)
        body = msg
        subject = "Subject:Rating "
        msg = subject + body
        # msg='Subject:Demo <h1>This is a test e-mail message.</h1>'
        smtpserver.sendmail(sender, receiver, msg)
        print('Sent')
        smtpserver.close()
    except smtplib.SMTPException:
        print("Not Sent")

    return HttpResponse("success")


def viewbookingtoadmin(request):
    conn = connect("127.0.0.1", "root", "", "urbanclap")
    cr = conn.cursor()
    status = request.GET['status']
    s = f"select * from booking where status='{status}'"
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        useremail = row[1]
        query = f"select * from user where email='{useremail}'"
        cr2 = conn.cursor()
        cr2.execute(query)
        rs = cr2.fetchone()
        mobile = rs[0]
        d = {"bid": row[0], "email": useremail, "mobile": mobile, "status": row[6],"paymentstatus": row[7],"spemail": row[9]}
        x.append(d)
    return render(request, "viewbookingtoadmin.html", {'msg': x})

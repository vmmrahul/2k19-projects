import random
import math
import http.client
from django.shortcuts import *
from django.http import *
from pymysql import *
from django.views.decorators.csrf import *
from django.core.files.storage import *


def admindashboard(request):
    if 'adminemail' in request.session:
        return render(request, "admindashboard.html")
    else:
        return HttpResponseRedirect("adminlogin")


@csrf_exempt
def addadmin(request):
    if 'adminemail' in request.session:
        return render(request, "addadmin.html")
    else:
        return HttpResponseRedirect("adminlogin")


@csrf_exempt
def insertadmin(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "insert into admin values('" + request.POST["email"] + "','" + request.POST["password"] + "','" + request.POST[
        "type"] + "'," + request.POST["mobile"] + ")"
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    # d = {"message": "Admin Added Successfully"}
    # return render(request, "insertadmin.html", {"ar": d})
    return HttpResponse("Admin Added Successfully")


def viewadmin(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "select email,type,mobile from admin"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        d = {}
        d["email"] = row[0]
        d["type"] = row[1]
        d["mobile"] = row[2]
        x.append(d)
    return JsonResponse(x, safe=False)


def editadmin(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "select * from admin where email='" + request.GET["q"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    d = {"email": result[0], "password": result[1], "type": result[2], "mobile": result[3]}
    return render(request, "editadmin.html", {"ar": d})


@csrf_exempt
def removeadmin(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "delete from admin where email='" + request.POST["email"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("SubAdmin Deleted Successfully")


def saveadmin(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "update admin set password='" + request.POST["password"] + "',type='" + request.POST["type"] + "',mobile='" + \
        request.POST["mobile"] + "'where email='" + request.POST["email"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("Admin Updated")


def adminlogin(request):
    return render(request, "adminlogin.html")


@csrf_exempt
def checklogin(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    e = request.POST["email"]
    p = request.POST["password"]
    s = "select * from admin where email='" + e + "' and password='" + p + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()

    if result:

        request.session['adminemail'] = e
        return render(request, "addcategory.html")
    else:
        d = {"message": "Invalid Credentials"}
        return render(request, "adminlogin.html", {"ar": d})


@csrf_exempt
def changeadminpassword(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    oldpassword = request.POST["oldpassword"]
    newpassword = request.POST["newpassword"]
    em = request.session['adminemail']
    s = "select * from admin where email='" + em + "' and password='" + oldpassword + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    if result:
        s = "update admin set password='" + newpassword + "' where email='" + em + "' and password='" + oldpassword + "'"
        cr = conn.cursor()
        cr.execute(s)
        conn.commit()
        d = {"message": "Password Updated Successfully"}
        return render(request, "admindashboard.html", {"ar": d})
    else:
        d = {"message": "Invalid Old Password"}
        return render(request, "changeadminpassword.html", {"ar": d})


def adminforgotsms(request):
    mobile = request.GET["mobile"]
    print(mobile)
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    query = f"select password from admin where mobile='{mobile}'"
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()
    if result:
        password = result[0]
        print(password)
        try:
            msg = "Your Password is:-" + str(password)
            msg = msg.replace(" ", "%20")
            conn = http.client.HTTPConnection("server1.vmm.education")
            conn.request('GET',
                         "/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=" + msg + "&phone_numbers=" + mobile)
            response = conn.getresponse()
            res = "SMS sent successfully"
        except:
            res = "Failed due to network problem"
    else:
        res = "Invalid Mobile Number"
    return HttpResponse(res)


@csrf_exempt
def adminchangepassword(request):
    if 'adminemail' in request.session:
        return render(request, "changeadminpassword.html")
    else:
        return HttpResponseRedirect("adminlogin")


def adminlogout(request):
    try:
        del request.session["adminemail"]
    except:
        pass
    return render(request, "adminlogin.html")


@csrf_exempt
def addcategory(request):
    return render(request, "addcategory.html")


@csrf_exempt
def insertcategory(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    catname = request.POST["catname"]
    description = request.POST["description"]
    file = request.FILES["photo"]
    photo = "categoryphotos/" + str(random.randint(1, 10000)) + file.name
    query = f"insert into category values('{catname}','{description}','{photo}')"
    fs = FileSystemStorage()
    fs.save(photo, file)
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    return HttpResponse("Category Added Successfully")


def editcategory(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "select * from category where catname='" + request.GET["catname"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    d = {"catname": result[0], "description": result[1], "photo": str(result[2])}
    # return render(request, "editcategory.html", {"ar": d})
    return HttpResponse("Category Updation Successful")


@csrf_exempt
def removecategory(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "delete from category where catname='" + request.POST["catname"] + "'"
    cr = conn.cursor()
    try:
        cr.execute(s)
        conn.commit()
        res = "success"
    except:
        res = "fail"
    # return HttpResponse(res)

    return HttpResponse("Category Deleted Successfully")


@csrf_exempt
def showcategory(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "select catname,description,photo from category"
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


@csrf_exempt
def savecategory(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    try:
        file = request.FILES["editphoto"]
    except:
        file = ""
    if file != "":
        print(f"if condition (file)")
        file = request.FILES["editphoto"]
        uploadname = "categoryphotos/" + str(random.randint(1, 10000)) + file.name
        s = "update category set description='" + request.POST[
            "editdescription"] + "',photo='" + uploadname + "' where catname='" + request.POST["editcatname"] + "'"
        fs = FileSystemStorage()
        fs.save(uploadname, file)
        cr = conn.cursor()
        cr.execute(s)
        conn.commit()
    else:
        print(f"else condition:-{file}")
        s1 = "update category set description='" + request.POST["description"] + "' where catname='" + request.POST[
            "catname"] + "'"
        cr = conn.cursor()
        cr.execute(s1)
        conn.commit()
    return HttpResponse("Category Updated")


@csrf_exempt
def addfurniture(request):
    if 'adminemail' in request.session:
        conn = Connect("127.0.0.1", "root", "", "furlenco")
        s = "select catname from category"
        cr = conn.cursor()
        cr.execute(s)
        result = cr.fetchall()
        d = []
        for row in result:
            d.append(row[0])
        return render(request, "addfurniture.html", {"ar": d})
    else:
        return HttpResponseRedirect("adminlogin")


@csrf_exempt
def insertfurniture(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    catname = request.POST["catname"]
    title = request.POST["title"]
    weight = request.POST["weight"]
    dimensions = request.POST["dimensions"]
    file = request.FILES["coverphoto"]
    photo = "furniturephotos/" + str(random.randint(1, 10000)) + file.name
    quantity = request.POST["quantity"]
    perdayrent = request.POST["perdayrent"]
    permonthrent = request.POST["permonthrent"]
    halfyearrent = request.POST["halfyearrent"]
    query = f"insert into furniture values(NULL," \
            f"'{title}','{catname}','{weight}','{dimensions}','{photo}','{quantity}','{perdayrent}','{permonthrent}','{halfyearrent}')"
    fs = FileSystemStorage()
    fs.save(photo, file)
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    # d = {"message": "Furniture Added Successfully"}
    # return render(request, "insertcategory.html", {"ar": d})
    return HttpResponseRedirect("showfurniture")


@csrf_exempt
def showfurniture(request):
    if 'adminemail' in request.session:
        conn = Connect("127.0.0.1", "root", "", "furlenco")
        s = "select catname from category"
        cr = conn.cursor()
        cr.execute(s)
        result = cr.fetchall()
        d = []
        for row in result:
            d.append(row[0])
        return render(request, "showfurniture.html", {"ar": d})
    else:
        return HttpResponseRedirect("adminlogin")


def viewcategory(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    catname = request.GET['catname']
    print(catname)
    s = "select * from furniture where catname='" + catname + "'"
    print(s)
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x = []
    if result:
        for row in result:
            d = {"furnitureid": row[0], "title": row[1], "catname": row[2], "weight": row[3], "dimensions": row[4],
                 "coverphoto": row[5], "Qtyavailable": row[6], "perdayrent": row[7], "permonthrent": row[8],
                 "halfyearrent": row[9], }
            x.append(d)
    return JsonResponse(x, safe=False)


def deleteaction(request):
    id = request.GET['id']
    print(id)
    query = f"delete from furniture where furnitureid={id}"
    print(query)
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    return HttpResponse('success')


@csrf_exempt
def editdataaction(request):
    conn = connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    furnitureid = request.POST['furnitureid']
    title = request.POST['title']
    catname = request.POST['catname']
    weight = request.POST['weight']
    dimensions = request.POST['dimensions']
    quantity = request.POST['quantity']
    perdayrent = request.POST['perdayrent']
    permonthrent = request.POST['permonthrent']
    halfyearrent = request.POST['halfyearrent']
    try:
        coverphoto = request.FILES['coverphoto']
    except:
        coverphoto = ""
    if coverphoto == "":
        query = f"UPDATE `furniture` SET `title`='{title}',`catname`='{catname}',`weight`='{weight}',`dimensions`='{dimensions}',`Qtyavailable`='{quantity}',`perdayrent`='{perdayrent}',`permonthrent`='{permonthrent}',`halfyearrent`='{halfyearrent}' WHERE `furnitureid`={furnitureid}"
        cr.execute(query)
        conn.commit()
    else:
        print(coverphoto)
        fs = FileSystemStorage()
        filename = fs.save(coverphoto.name, coverphoto)
        query = f"UPDATE `furniture` SET `title`='{title}',`catname`='{catname}',`weight`='{weight}',`dimensions`='{dimensions}',`coverphoto`='{filename}',`Qtyavailable`='{quantity}',`perdayrent`='{perdayrent}',`permonthrent`='{permonthrent}',`halfyearrent`='{halfyearrent}' WHERE `furnitureid`={furnitureid}"
        cr.execute(query)
        conn.commit()
    return HttpResponse("successfully added")


def addphotos(request):
    if 'adminemail' in request.session:
        conn = Connect("127.0.0.1", "root", "", "furlenco")
        furnitureid = request.GET['furnitureid']
        query = f"select * from photos where furnitureid={furnitureid}"
        cr = conn.cursor()
        cr.execute(query)
        result = cr.fetchall()
        x = []
        for row in result:
            d = {"id": row[0], 'photo': row[1], 'remarks': row[2]}

            x.append(d)
        print(x)
        conn.commit()
        return render(request, 'addphotos.html', {"furnitureid": furnitureid, 'image': x})
    else:
        return HttpResponseRedirect("adminlogin")

@csrf_exempt
def insertphotos(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    furnitureid = request.POST["furnitureid"]
    print(furnitureid)
    files = request.FILES["photo"]
    photo = "furniturephotos/" + str(random.randint(1, 10000)) + files.name
    print(photo)
    remarks = request.POST["remarks"]
    query = f"insert into photos values(NULL ,'{photo}','{remarks}','{furnitureid}')"
    fs = FileSystemStorage()
    fs.save(photo, files)
    print(query)
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    return HttpResponseRedirect('showfurniture')


def deletefurniturephotos(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    photoid = request.GET["id"]
    print(photoid)
    query = f"delete from photos where pid={photoid}"
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    return HttpResponseRedirect("showfurniture")


# --User Signup Functions--

def usersignup1(request):
    return render(request, "usersignup_1.html")


def sendotp(request):
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
        returnvalue = 'OTP Sent Successfully'
    except:
        returnvalue = "Failed To Send OTP"
    return HttpResponse(returnvalue)


@csrf_exempt
def verifyotp(request):
    print(request.session['userotp'])
    sendedotp = request.POST['sendotp']
    if str(sendedotp == request.session['userotp']):
        return HttpResponse("OTP Success")
    else:
        return HttpResponse("OTP Not Matched")


def usersignup2(request):
    if 'userotp' in request.session:
        return render(request, "usersignup_2.html")
    else:
        return HttpResponseRedirect('usersignup_1')


@csrf_exempt
def insertuser(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    mobile = request.POST["mobile"]
    name = request.POST["name"]
    email = request.POST["email"]
    address = request.POST["address"]
    landmark = request.POST["landmark"]
    password = request.POST["password"]
    userphoto = request.FILES["userphoto"]
    print(userphoto.name)
    uploadphoto = "userpics/" + str(random.randint(1, 10000)) + userphoto.name
    fs = FileSystemStorage()
    fs.save(uploadphoto, userphoto)
    pan = request.POST["pan"]
    adhaar = request.POST["adhaar"]
    remarks = request.POST["remarks"]
    q = "select * from user"
    cr = conn.cursor()
    cr.execute(q)
    result = cr.fetchall()
    flag = True
    for row in result:
        if row[0] == mobile:
            flag = False
            break
    if flag == False:
        returnvalue = "Duplicate"
    else:
        query = f"insert into user values('{mobile}','{name}','{email}','{address}','{landmark}','{password}','{uploadphoto}','{pan}','{adhaar}','{remarks}')"
        print(query)
        cr = conn.cursor()
        cr.execute(query)
        conn.commit()
        returnvalue = "success"
    return HttpResponse(returnvalue)


def userlogin(request):
    return render(request, "userlogin.html")


@csrf_exempt
def userchecklogin(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    mobile = request.POST["mobile"]
    password = request.POST["password"]
    query = "select * from user where mobile='" + mobile + "' and password='" + password + "'"
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()
    if result:
        request.session['mobile'] = mobile
        result = "success"
        print(result)
    else:
        result = "fail"
    return HttpResponse(result)


def userdashboard(request):
    return render(request, "userdashboard.html")


def sendforgotsms(request):
    mobile = request.GET["mobile"]
    print(mobile)
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    query = f"select password from user where mobile='{mobile}'"
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()
    if result:
        password = result[0]
        print(password)
        try:
            msg = "Your Password is:-" + str(password)
            msg = msg.replace(" ", "%20")
            conn = http.client.HTTPConnection("server1.vmm.education")
            conn.request('GET',
                         "/VMMCloudMessaging/AWS_SMS_Sender?username=shivalidevgan&password=75Y437J7&message=" + msg + "&phone_numbers=" + mobile)
            response = conn.getresponse()
            res = "SMS sent successfully"
        except:
            res = "Failed due to network problem"
    else:
        res = "Invalid Mobile Number"
    return HttpResponse(res)


def searchfurniture1(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    s = "select * from category"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    categories = []
    for row in result:
        categoriesdict = {"catname": row[0], "photo": row[2]}
        categories.append(categoriesdict)
    print(categories)
    return render(request, "searchfurniture1.html", {'categories': categories})


def searchfurniture2(request):
    catname = request.GET['catname']
    query = f"SELECT * FROM `furniture` WHERE `catname`='{catname}'"
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchall()
    print(result)
    listshow = []
    for row in result:
        rowdata = {
            'id': row[0],
            'title': row[1],
            'catname': row[2],
            'weight': row[3],
            'dimensions': row[4],
            'coverphoto': row[5],
            'qty': row[6],
            'perday': row[7],
            'permonth': row[8],
            'halfyear': row[9],
        }
        listshow.append(rowdata)
    return render(request, "searchfurniture2.html", {'listshow': listshow})


@csrf_exempt
def viewfurniture(request):
    catname = request.POST['catname']
    print(catname)
    query = f"SELECT `title` FROM `furniture` WHERE `catname`='{catname}'"
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchall()
    print(result)
    title = []
    for row in result:
        title.append(row[0])
    return JsonResponse(title, safe=False)


@csrf_exempt
def showcard(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    # catname = request.GET['catname']
    title = request.POST['title']
    s = "select * from furniture where  title LIKE '" + title + "%'"
    print(s)
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    listshow = []
    for row in result:
        rowdata = {
            'id': row[0],
            'title': row[1],
            'catname': row[2],
            'weight': row[3],
            'dimensions': row[4],
            'coverphoto': row[5],
            'qty': row[6],
            'perday': row[7],
            'permonth': row[8],
            'halfyear': row[9],
        }
        listshow.append(rowdata)
    return JsonResponse(listshow, safe=False)


def searchfurnituredetails(request):
    return render(request, "searchfurnituredetails.html")


def searchfurnituredetails1(request):
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    furnitureid = request.GET['id']
    catname = request.GET['catname']
    print(furnitureid)
    query = f"select * from photos where furnitureid={furnitureid}"
    cr = conn.cursor()
    cr.execute(query)
    res = cr.fetchall()
    photo = []
    for row1 in res:
        photodetails = {
            'id': row1[0],
            'photo1': row1[1],
            'remarks': row1[2],
        }
        photo.append(photodetails)
    s = f"select * from furniture where furnitureid={furnitureid}"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    furniture = []
    for row in result:
        furnituredetails = {
            'id': row[0],
            'title': row[1],
            'catname': row[2],
            'weight': row[3],
            'dimensions': row[4],
            'coverphoto': row[5],
            'Qtyavailable': row[6],
            'perdayrent': row[7],
            'permonthrent': row[8],
            'halfyearrent': row[9],
        }
        furniture.append(furnituredetails)
    print(furniture)
    print(photo)
    query = f"SELECT * FROM `furniture` WHERE `catname`='{catname}'"
    conn = Connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchall()
    print(result)
    listshow = []
    for row in result:
        rowdata = {
            'id': row[0],
            'title': row[1],
            'catname': row[2],
            'weight': row[3],
            'dimensions': row[4],
            'coverphoto': row[5],
            'qty': row[6],
            'perday': row[7],
            'permonth': row[8],
            'halfyear': row[9],
        }
        listshow.append(rowdata)
    return render(request, "searchfurnituredetails.html",
                  {"furniture": furniture, "photo": photo, 'allfurniture': listshow})

#
# def index(request):
#     return render(request, "index.html")


def single(request):
    return render(request, "single.html")


def contact(request):
    return render(request, 'contact.html')


def userlogout(request):
    try:
        del request.session["mobile"]
    except:
        pass
    return render(request, "userlogin.html")


def findprice(request):
    fid = request.GET['fid']
    renttype = request.GET['renttype']
    query = f"select {renttype} from furniture where furnitureid={fid}"
    conn = connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchone()
    print(result[0])
    return HttpResponse(result[0])


CARTLIST = []


@csrf_exempt
def addtocart(request):
    global CARTLIST
    CARTLIST = []
    try:
        CARTLIST = request.session['addtocart']
    except:
        pass
    print('first', CARTLIST)
    fid = request.POST['fid']
    renttype = request.POST['renttype']
    qty = request.POST['qty']
    froms = ""
    tos = ""
    day = ""
    chosedaymonth = ""
    try:
        froms = request.POST['from']
        tos = request.POST['to']
        day = request.POST['day']
    except:
        pass
    try:
        chosedaymonth = request.POST['chosedaymonth']
    except:
        pass
    totalprice = request.POST['totalprice']
    query = f"select * from furniture where furnitureid={fid}"
    conn = connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    cr.execute(query)
    result = cr.fetchall()
    flag = False
    for row1 in CARTLIST:
        if int(fid) == int(row1['fid']):
            row1['renttype'] = renttype
            row1['qty'] = qty
            row1['fromss'] = froms
            row1['tos'] = tos
            row1['day'] = day
            row1['totalprice'] = totalprice
            row1['chosedaymonth'] = chosedaymonth
            print("hello")
            flag = True
            break
    if flag == False:
        for row in result:
            dict = {}
            dict['fid'] = fid
            dict['title'] = row[1]
            dict['renttype'] = renttype
            dict['qty'] = qty
            dict['fromss'] = froms
            dict['tos'] = tos
            dict['day'] = day
            dict['photo'] = row[5]
            dict['totalprice'] = totalprice
            dict['chosedaymonth'] = chosedaymonth
            CARTLIST.append(dict)
    print(CARTLIST)
    request.session['addtocart'] = CARTLIST
    datalength = len(request.session['addtocart'])
    return HttpResponse(datalength)


def showcartproducat(request):
    totalprice = 0
    li = []
    try:
        li = request.session['addtocart']
        for row in request.session['addtocart']:
            totalprice += float(row['totalprice'])
    except:
        pass
    print(totalprice)
    print(li)
    return render(request, 'showcartproducat.html', {'totalprice': totalprice, 'datalist': li})


def delete_from_cart(request):
    fid = request.GET["fid"]
    print(fid)
    li = request.session['addtocart']
    print(li)
    for i in range(0, len(li)):
        if int(li[i]["fid"]) == int(fid):
            del li[i]
            break
    print(li)
    request.session['addtocart'] = li
    return HttpResponseRedirect('showcartproducat')


def processtopay(request):
    if 'mobile' not in request.session:
        return HttpResponseRedirect('userlogin')
    else:
        total = 0
        for row in request.session['addtocart']:
            total += float(row['totalprice'])
        mobile = request.session["mobile"]
        query = f"select * from user where mobile='{mobile}'"
        conn = connect("127.0.0.1", "root", "", "furlenco")
        cr = conn.cursor()
        cr.execute(query)
        result = cr.fetchone()
        print(result)
        userdata = {'mobile': mobile, 'name': result[1],'email':result[2] ,'address': result[3], 'total': total}
        return render(request, 'processtopay.html', {'userdata': userdata})


from datetime import *


@csrf_exempt
def payment_action(request):
    mobile = request.session["mobile"]
    name = request.POST['name']
    email = request.POST['email']
    address = request.POST['address']
    total = request.POST['total']
    paymentmode = request.POST['paymentmode']
    dateoforder = date.today()
    if paymentmode == "Cash":
        query = f"INSERT INTO `billing`(`totalamount`, `email`, `address`, `mobile`, `paystatus`, `typeofbill`,`dateoforder`,`status`) VALUES ({total},'{email}','{address}','{mobile}','pending','{paymentmode}','{dateoforder}','pending')"
    else:
        query = f"INSERT INTO `billing`(`totalamount`, `email`, `address`, `mobile`, `paystatus`, `typeofbill`,`dateoforder`,`status`) VALUES ({total},'{email}','{address}','{mobile}','completed','{paymentmode}','{dateoforder}','pending')"
    conn = connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    cr.execute(query)
    conn.commit()
    # return HttpResponse(1)
    qr = "select billid from billing order by billid DESC"
    conn = connect("127.0.0.1", "root", "", "furlenco")
    cr = conn.cursor()
    cr.execute(qr)
    t1 = cr.fetchall()
    billid = t1[0][0]
    for row in request.session['addtocart']:
        qr1 = f"INSERT INTO `billdetails`(`title`, `price`, `qty`, `renttype`, `froms`, `tos`, `month`, `photo`, `billid`,`fid`) VALUES ('{row['title']}','{row['totalprice']}','{row['qty']}','{row['renttype']}','{row['fromss']}','{row['tos']}','{row['day']}','{row['photo']}','{billid}','{row['fid']}')"
        print(qr1)
        conn = connect("127.0.0.1", "root", "", "furlenco")
        cr = conn.cursor()
        cr.execute(qr1)
        conn.commit()
    del request.session['addtocart']
    return JsonResponse({'billid': billid}, safe=False)


def thankspage(request):
    bill_id = request.GET['billid']
    return render(request, 'thankyou.html', {"bill_id": bill_id})

def index(request):
    return render(request,'index1.html')

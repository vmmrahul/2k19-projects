import random
from datetime import date
from http.client import HTTPResponse

from django.http import *
from django.shortcuts import *
from math import *

from django.views.decorators.csrf import *
from django.core.files.storage import *
from pymysql import *
import http.client

def random_with_N_digits(n):
    range_start=10**(n-1)
    range_end=(10**n)-1
    from random import randint
    return randint(range_start,range_end)

def addadmin(request):
       return render(request,"addadmin.html")


@csrf_exempt
def add(request):
    conn = connect("127.0.0.1", "root", "", "sparespace")
    q="select * from admin where email='"+request.POST["email"]+"'"
    cr=conn.cursor()
    cr.execute(q)
    result=cr.fetchone()
    if result:
        # d={"message":"Email already exists"}
        return HttpResponse("fail")
    else:
       s = "insert into admin values('"+request.POST["email"]+"','"+request.POST["password"]+"','"+request.POST["type"]+"',"+request.POST["mobile"]+")"
       cr = conn.cursor()
       cr.execute(s)
       conn.commit()
       # d={"message":"Admin added successfully"}
       return HttpResponse("success")

def viewadmin(request):
    if "adminemail" in request.session:
       conn=connect("127.0.0.1","root","","sparespace")
       s="select * from admin"
       cr=conn.cursor()
       cr.execute(s)
       result=cr.fetchall()
       x=[]
       q="select type from admin where email='"+request.session["adminemail"]+"'"
       cr.execute(q)
       result1=cr.fetchone()
       for row in result:
          d={"email":row[0],"password":row[1],"type":row[2],"mobile":row[3]}
          x.append(d)
       return render(request,"viewadmin.html",{"ar":x,'type':result1[0]})
    else:
        return HttpResponseRedirect("adminlogin")


def editadmin(request):
    if "adminemail" in request.session:
       conn=connect("127.0.0.1","root","","sparespace")
       s="select * from admin where email='"+request.GET["q"]+"'"
       cr=conn.cursor()
       cr.execute(s)
       result=cr.fetchone()
       #return HttpResponse(result)
       d={"email":result[0],"type":result[2],"mobile":result[3]}
       #return render(request,"editadmin.html",{"ar":d})
       print(d)
       return JsonResponse(d,safe=False)
    else:
        return HttpResponseRedirect("adminlogin")

@csrf_exempt
def saveadmin(request):
    # print(request.POST["type"])
    # print(request.POST["email"])
    # print(request.POST["mobile"])
    if "adminemail" in request.session:
       conn = connect("127.0.0.1", "root", "", "sparespace")
       s = "update admin set type='" + request.POST["type"] + "',mobile='" + request.POST[
        "mobile"] + "' where email='"+request.POST["email"]+"'"
       cr = conn.cursor()
       cr.execute(s)
       conn.commit()
       return HttpResponse("success")
    else:
        return HttpResponseRedirect("adminlogin")


def removeadmin(request):
    conn=Connection("127.0.0.1","root","","sparespace")
    s="delete from admin where email='"+request.GET["q"]+"'"
    cr=conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponseRedirect("viewadmin")

@csrf_exempt
def adminlogin(request):
    return render(request,"adminlogin.html")

@csrf_exempt
def checkadminlogin(request):
    # print(request.POST['email'],request.POST['password'])
    conn=connect("127.0.0.1","root","","sparespace")
    s="select * from admin where email='"+request.POST["email"]+"'and password='"+request.POST["password"]+"'"
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchone()
    if result:
        request.session['adminemail'] = request.POST["email"]
        # return render(request, "admindashboard.html")
        return HttpResponse("success")
    else:
        # d = {"message": "Invalid email/password"}
        # return render(request,"adminlogin.html" ,{"ar": d})
        return HttpResponse("fail")

def admindashboard(request):
    if "adminemail" in request.session:
        return render(request,"admindashboard.html")
    else:
        return HttpResponseRedirect("adminlogin")

def logout(request):
    try:
        del request.session['adminemail']
    except:
        pass
    return HttpResponseRedirect('adminlogin')

# @csrf_exempt
# def changepassword(request):
#     if "adminemail" in request.session:
#       return render(request,"changepassword.html")
#     else:
#         return render(request,"adminlogin.html")

@csrf_exempt
def adminchangepassword(request):
    if "adminemail" in request.session:
        oldpassword=request.POST["oldpassword"]
        newpassword=request.POST["newpassword"]
        confimpassword=request.POST["confirmpassword"]
        conn=connect("127.0.0.1","root","","sparespace")
        q="select * from admin where email='"+request.session["adminemail"]+"'"
        cr=conn.cursor()
        cr.execute(q)
        result=cr.fetchone()
        if result[1]==oldpassword:
            s="update admin set password='"+newpassword+"' where email='"+request.session["adminemail"]+"'"
            cr=conn.cursor()
            cr.execute(s)
            conn.commit()
       # d={"message":"Password changed Successfully"}
            return HttpResponse("success")
        else:
             # d={"message":"Old Password Incorrect"}
             return HttpResponse("failed due to wrong old password")
    else:
        return HttpResponseRedirect("adminlogin")



@csrf_exempt
def usersignup(request):
    return render(request,"usersignup.html")


def openusersignup2(request):
    mobile=request.GET['mobile']
    return render (request,'usersignup2.html',{"mobile":mobile})

@csrf_exempt
def usersignup2(request):
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s="select * from user where email='"+request.POST["email"]+"' and mobile="+request.POST["mobile"]+""
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchone()
    if result:
        return HttpResponse("fail")
    else:
        file = request.FILES["photo"]
        uploadname = "userphotos/" + str(random.randint(1, 100000)) + file.name

        s="insert into user values('"+request.POST["mobile"]+"','"+request.POST["email"]+"','"+request.POST["password"]+"','"+request.POST["name"]+"','"+request.POST["address"]+"','"+uploadname+"')"
        fs = FileSystemStorage()
        fs.save(uploadname, file)
        cr = conn.cursor()
        cr.execute(s)
        conn.commit()
        # d={"message":"User Added Successfully"}
        return HttpResponse("success")

def sendotp(request):
    mobile=request.GET['mobile']
    print('test',mobile)
    n=random_with_N_digits(6)
    request.session['userotp']=str(n)
    msg="your otp is "+str(n)
    msg=msg.replace(" ","%20")
    conn=http.client.HTTPConnection("server1.vmm.education")
    conn.request('GET','/VMMCloudMessaging/AWS_SMS_Sender?username=ayushidhir&password=6TLLQSSZ&message='+msg+'&phone_numbers='+str(mobile))
    response=conn.getresponse()
    print(response)
    return HttpResponse("success")

def verifyotp(request):
    actualotp=request.session['userotp']
    otp=request.GET['otp']
    if actualotp==otp:
        return HttpResponse("success")
    else:
        return HttpResponse("fail")


@csrf_exempt
def userlogin(request):
    return render(request,"userlogin.html")

@csrf_exempt
def userlogin1(request):
    # print(request.POST['email'],request.POST['password'])
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "select * from user where email='" + request.POST["email"] + "'and password='" + request.POST["password"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    # print(list(result))
    if result:
        # d = {"name": result[3]}
        request.session['useremail'] = request.POST["email"]
        # return render(request, "userdashboard.html",{"ar":d})
        return HttpResponse("success")

    else:
        # d = {"message": "Invalid email/password"}
        # return render(request, "userlogin.html",{"ar": d})
        return HttpResponse("fail")


def userdashboard(request):
    return render(request,'userdashboard.html')

@csrf_exempt
def forgot(request):
    conn=connect("127.0.0.1","root","","sparespace")
    s="select * from user where email='"+request.POST["email"]+"' and mobile="+request.POST["mobile"]+""
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchone()
    if result:
        password = result[2]
        conn = http.client.HTTPConnection("server1.vmm.education")
        conn.request('GET',
                 '/VMMCloudMessaging/AWS_SMS_Sender?username=ayushidhir&password=6TLLQSSZ&message=' + password + '&phone_numbers='
                 + str(request.POST["mobile"]))
        response = conn.getresponse()
        print(response.read())
        return HttpResponseRedirect("userlogin")
    else:
        d={"message":"Invalid Mobile Number"}
        return render(request,"userlogin.html",{"ar":d})


@csrf_exempt
def forgotadmin(request):
    conn=connect("127.0.0.1","root","","sparespace")
    s="select * from admin where mobile="+request.POST["mobile"]+""
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchone()
    if result:
        password = result[2]
        conn = http.client.HTTPConnection("server1.vmm.education")
        conn.request('GET',
                 '/VMMCloudMessaging/AWS_SMS_Sender?username=ayushidhir&password=6TLLQSSZ&message=' + password + '&phone_numbers='
                 + str(request.POST["mobile"]))
        response = conn.getresponse()
        print(response.read())
        # return HttpResponseRedirect("adminlogin")
        return HttpResponse("success")
    else:
        # d={"message":"Invalid Mobile Number"}
        # return render(request,"adminlogin.html",{"ar":d})
        return HttpResponse("fail")

@csrf_exempt
def addcategory(request):
    if "adminemail" in request.session:
        return render(request,"addcategory.html")
    else:
        return HttpResponseRedirect("adminlogin")

@csrf_exempt
def insercategory(request):
    # file = request.FILES["photo"]
    # uploadname = "categoryphotos/" + str(random.randint(1, 10000)) + file.name
    conn=Connection("127.0.0.1","root","","sparespace")
    q="select * from category where cname='"+request.POST["cname"]+"'"
    cr=conn.cursor()
    cr.execute(q)
    result=cr.fetchone()
    if result:
        d={"message":"Category already exists"}
        return render(request,"addcategory.html",{"ar":d})
    else:
        file = request.FILES["photo"]
        uploadname = "categoryphotos/" + str(random.randint(1, 10000)) + file.name
        s="insert into category values('"+ request.POST["cname"]+"','"+request.POST["description"]+"','"+uploadname+"')"
        fs = FileSystemStorage()
        fs.save(uploadname, file)
        cr=conn.cursor()
        cr.execute(s)
        conn.commit()
        d={"message":"category added successfully"}
        return render(request,"addcategory.html",{"ar":d})

def showcategory(request):
    if "adminemail" in request.session:
        conn=Connection("127.0.0.1","root","","sparespace")
        s="select * from category"
        cr=conn.cursor()
        cr.execute(s)
        result=cr.fetchall()
        x=[]
        for row in result:
           d={}
           d["cname"]=row[0]
           d["description"]=row[1]
           d["photo"]=row[2]
           x.append(d)
        return render(request,"showcategory.html",{"ar":x})
    else:
        return HttpResponseRedirect("adminlogin")

def removecategory(request):
    conn=connect("127.0.0.1","root","","sparespace")
    s="delete from category where cname='"+request.GET["q"]+"'"
    print(s)
    cr=conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponseRedirect("showcategory")

@csrf_exempt
def editcategory(request):
    conn=connect("127.0.0.1","root","","sparespace")
    s="select * from category where cname='"+request.GET["q"]+"'"
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchone()
    #return HttpResponse(result)
    d={"cname":result[0],"description":result[1],"photo":result[2]}
    return render(request,"editcategory.html",{"ar":d})

@csrf_exempt
def savecategory(request):
    file=request.FILES["photo"]
    uploadname="categoryphotos/"+str(random.randint(1,1000))+file.name
    conn=connect("127.0.0.1","root","","sparespace")
    s="update category set description='"+request.POST["description"]+"',photo='"+uploadname+"'where cname='"+request.POST["cname"]+"'"
    fs=FileSystemStorage()
    fs.save(uploadname,file)
    cr=conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponseRedirect("showcategory")


@csrf_exempt
def hostsignup(request):
    return render(request,"host_signup.html")

@csrf_exempt
def inserthost(request):
    conn=connect("127.0.0.1","root","","sparespace")
    s="select * from host where email='"+request.POST["email"]+"' and mobile="+request.POST["mobile"]+""
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchone()
    if result:
        return HttpResponse("fail")
    else:
       file = request.FILES["photo"]
       uploadname = "hostphotos/" + str(random.randint(1, 1000)) + file.name
       q="insert into host values(NULL,'"+request.POST["name"]+"','"+request.POST["email"]+"','"+request.POST["password"]+"','"+request.POST["city"]+"',"+request.POST["mobile"]+",'"+uploadname+"','"+request.POST["description"]+"','"+request.POST["location"]+"','pending')"
       fs=FileSystemStorage()
       fs.save(uploadname,file)
       cr=conn.cursor()
       cr.execute(q)
       conn.commit()
       return HttpResponse("success")



def index(request):
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "select city from host"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x= []
    id=[]
    for row in result:
        d={}
        if not x:
            id.append((row[0]))
            d['city']=row[0]
            x.append(d)
        elif row[0] in id:
           pass
        else:
            id.append(row[0])
            d['city']=row[0]
            x.append(d)
    print(x)

    s = "select cname from category"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()

    catname = []
    for row in result:
        d = {"category": row[0]}
        catname.append(d)
    return render(request,"index.html",{'city':x,'catname':catname})

def login(request):
    return render(request,"login.html")

def register(request):
    return render(request,"register.html")

def contact(request):
    return render(request,'contactus.html')

def userlogout(request):
    try:
        del request.session['useremail']
    except:
        pass
    return HttpResponseRedirect('/')

def hostlogout(request):
    try:
        del request.session['hostemail']
    except:
        pass
    return HttpResponseRedirect('/')


@csrf_exempt
def hostlogin(request):
    return render(request,"hostlogin.html")

@csrf_exempt
def hostlogin1(request):
    # print(request.POST['email'],request.POST['password'])
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "select * from host where email='" + request.POST["email"] + "'and password='" + request.POST["password"] + "' and status='active'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    # print(list(result))
    if result:
        # d = {"name": result[3]}
        request.session['hostemail'] = request.POST["email"]
        request.session['hostid']=result[0]
        # return render(request, "userdashboard.html",{"ar":d})
        return HttpResponse("success")

    else:
        # d = {"message": "Invalid email/password"}
        # return render(request, "userlogin.html",{"ar": d})
        return HttpResponse("fail")

@csrf_exempt
def addrooms(request):
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "select cname from category"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        d = {"cname": row[0]}
        x.append(d)
    return render(request,"addrooms.html",{"ar":x})

@csrf_exempt
def addrooms1(request):
    conn = Connect("127.0.0.1", "root", "", "sparespace")
    q="select * from host where email ='"+request.session['hostemail']+"'"
    cr=conn.cursor()
    cr.execute(q)
    result=cr.fetchone()
    print(result[0])
    hid = result[0]
    file = request.FILES["coverphoto"]
    uploadname = "spacephotos/" + str(random.randint(1, 10000)) + file.name
    s = "insert into rooms values(NULL,'"+request.POST["roomname"]+"','"+request.POST["area"]+"','"+request.POST["description"]+"','"+uploadname+"',"+str(hid)+",'"+request.POST["tariffsingle"]+"','"+request.POST["tariffdouble"]+"','"+request.POST["extraperson"]+"','"+request.POST["rating"]+"','"+request.POST["count"]+"','"+request.POST["category"]+"')"
    fs = FileSystemStorage()
    fs.save(uploadname, file)
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("success")


def viewrooms(request):
    conn = Connection("127.0.0.1", "root", "", "sparespace")
    s = "select * from rooms where hid="+str(request.session['hostid'])+""
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x = []
    for row in result:
        d = {"roomid":row[0],"roomname":row[1],"area":row[2],"description":row[3],"coverphoto":row[4],"hid":row[5],"tariffsingle":row[6],"tariffdouble":row[7],"extraperson":row[8],"rating":row[9],"count":row[10],"category":row[11]}
        x.append(d)
    return render(request, "viewrooms.html", {"ar": x})

def removerooms(request):
    conn=connect("127.0.0.1","root","","sparespace")
    s="delete from rooms where roomid="+request.GET["q"]+""
    cr=conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponseRedirect("viewrooms")

def editrooms(request):
    conn=connect("127.0.0.1","root","","sparespace")
    print(request.GET["q"])
    s="select * from rooms where roomid='"+request.GET["q"]+"'"
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchone()
    d={"roomid":result[0],"roomname":result[1],"area":result[2],"description":result[3],"coverphoto":result[4],"tariffsingle":result[6],"tariffdouble":result[7],"extraperson":result[8]}
    return JsonResponse(d,safe=False)

@csrf_exempt
def saverooms(request):
    file = request.FILES["coverphoto"]
    uploadname = "spacephotos/" + str(random.randint(1, 10000)) + file.name
    conn = connect("127.0.0.1", "root", "system", "sparespace")
    s = "update rooms set roomname='" + request.POST["roomname"] + "',area='" + request.POST[
        "area"] + "',description='"+request.POST["description"]+"',coverphoto='"+uploadname+"',tariffsingle='"+request.POST["tariffsingle"]+"',tariffdouble='"+request.POST["tariffdouble"]+"',extraperson='"+request.POST["extraperson"]+"' where roomid='" + request.POST["roomid"] + "'"
    fs = FileSystemStorage()
    fs.save(uploadname, file)
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("success")

def insertphotos(request):
    roomid=request.GET['q']
    # description=request.GET['q1']
    conn=connect("127.0.0.1","root","","sparespace")
    s="select * from photos where roomid='"+roomid+"'"
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchall()
    x=[]
    for row in result:
        d={"pid":row[0],"photo":row[1],"description":row[2]}
        x.append(d)
    return render(request,"addroomphotos.html",{"ar":roomid,"ar1":x})

@csrf_exempt
def addroomphotos(request):
    file = request.FILES["photo"]
    uploadname = "addspacephotos/" + str(random.randint(1, 10000)) + file.name
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s="insert into photos values(NULL,'"+uploadname+"','"+request.POST['description']+"',"+request.POST['roomid']+")"
    fs=FileSystemStorage()
    fs.save(uploadname,file)
    cr=conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("success")

def deleteroomphoto(request):
    pid=request.GET['id']
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s="delete from photos where pid='"+pid+"'"
    cr=conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponseRedirect("viewrooms")

def viewroomdetails(request):
    roomid=request.GET["q"]
    conn = connect("127.0.0.1", "root", "", "sparespace")
    q="select * from photos where roomid='"+roomid+"'"
    cr=conn.cursor()
    cr.execute(q)
    result=cr.fetchall()
    x=[]
    for row in result:
        d1={"photo":row[1]}
        x.append(d1)
    s="select * from rooms where roomid='"+roomid+"'"
    cr=conn.cursor()
    cr.execute(s)
    row=cr.fetchone()

    d = {"roomid": row[0], "roomname": row[1], "area": row[2], "description": row[3], "coverphoto": row[4],
             "hid": row[5], "tariffsingle": row[6], "tariffdouble": row[7], "extraperson": row[8], "rating": row[9],
             "count": row[10], "category": row[11]}
    return render(request,"roomdetails.html",{"ar":d,"ar1":x})



# def findproperty(request):
#     conn=connect("127.0.0.1","root","system","sparespace")
#     s="select cname from category"
#     cr=conn.cursor()
#     cr.execute(s)
#     result=cr.fetchall()
#
#     x = []
#     for row in result:
#         d={"category":row[0]}
#         x.append(d)
#     return render(request, "findpropertyresult.html", {"ar":x})

@csrf_exempt
def findpropertyresult(request):
    conn = connect("127.0.0.1", "root", "", "sparespace")
    city=request.POST["city"]
    category=request.POST["category"]
    # s="select * from host inner join rooms on host.hid=rooms.hid"
    s=f"select * from host inner join rooms on host.hid=rooms.hid where city='{city}' and category='{category}'"
    print(s)
    cr=conn.cursor()
    cr.execute(s)
    result=cr.fetchall()
    print(result)
    x=[]
    for row in result:
       d={"hid":row[0],"city":row[4],"roomid":row[10],"coverphoto":row[14],"roomname":row[11],"area":row[12],"hostname":row[1],"category":row[21]}
       x.append(d)
    print(x)
    return render(request, "findpropertyresult.html", {"ar":x})

def viewdetailproperty(request):
    hid=request.GET['hid']
    roomid=request.GET['roomid']
    category=request.GET['category']
    city=request.GET['city']
    s = f"select * from host inner join rooms on host.hid=rooms.hid where host.hid='{hid}' and rooms.roomid='{roomid}'"
    conn = connect("127.0.0.1", "root", "", "sparespace")
    cr = conn.cursor()
    cr.execute(s)
    row = cr.fetchone()
    tspd=round(row[16]/30,2)
    tdpd=round(row[17]/30,2)
    texpd=round(row[18]/30,2)
    d={"hid":row[0],"hostname":row[1],"email":row[2],"city":row[4],"mobile":row[5],"dp":row[6],"descriptionhost":row[7],"location":row[8],"roomid":row[10],"roomname":row[11],"area":row[12],"description":row[13],"coverphoto":row[14],"tariffsingle":row[16],"tariffdouble":row[17],"extraperson":row[18],"rating":row[19],"count":row[20],"category":row[21],"tariffsingleperday":tspd,
            "tariffdoubleperday":tdpd,"extraperday":texpd}


    query=f'select * from photos where roomid={roomid}'
    cr = conn.cursor()
    cr.execute(query)
    result1 = cr.fetchall()
    x1=[]
    for row in result1:
        d1={"pid":row[0],"photo":row[1],"description":row[2],"roomid":row[3]}
        x1.append(d1)

    q = "select * from host inner join rooms on host.hid=rooms.hid where host.city='"+city+"'and rooms.category='"+category+"'"
    cr = conn.cursor()
    cr.execute(q)
    result = cr.fetchall()
    x2 = []
    if result:
        for row in result:
            d2 = {"city":row[4],"roomid": row[10], "roomname": row[11], "area": row[12], "description": row[13], "coverphoto": row[14],
                  "hid": row[15], "tariffsingle": row[16], "tariffdouble": row[17], "extraperson": row[18],
                  "rating": row[19],
                  "count": row[20], "category": row[21]}

            x2.append(d2)
    return render(request,'viewdetailproperty.html',{"alldata":d,"photos":x1,"related":x2})

def findproperty(request):
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "select city from host"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x= []
    id=[]
    for row in result:
        d={}
        if not x:
            id.append((row[0]))
            d['city']=row[0]
            x.append(d)
        elif row[0] in id:
           pass
        else:
            id.append(row[0])
            d['city']=row[0]
            x.append(d)
    print(x)

    s = "select cname from category"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()

    catname = []
    for row in result:
        d = {"category": row[0]}
        catname.append(d)
    print(x,catname)
    return render(request,'findproperty.html',{'city':x,'catname':catname})


#admin view host
def viewhost(request):
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s="select * from host where status='pending'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    x=[]
    for row in result:
        d={"hid":row[0],"hostname":row[1],"email":row[2],"city":row[4],"mobile":row[5],"photo":row[6],"description":row[7],"location":row[8]}
        x.append(d)
    s = "select * from host where status='active'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchall()
    y = []
    for row in result:
        d = {"hid": row[0], "hostname": row[1], "email": row[2], "city": row[4], "mobile": row[5], "photo": row[6],
             "description": row[7], "location": row[8]}
        y.append(d)
    z=[]
    z.append(x)
    z.append(y)

    return render(request,"viewhost.html",{"ar":z})

def activehost(request):
    hid=request.GET['q']
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s="update host set status='active' where hid="+hid+""
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponseRedirect("viewhost")


def pendinghost(request):
    hid = request.GET['q']
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "update host set status='pending' where hid=" + hid + ""
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponseRedirect("viewhost")

#admin view space
def viewspace(request):
    hid=request.GET['q']
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s="select * from rooms where hid="+hid+""
    cr = conn.cursor()
    cr.execute(s)
    result=cr.fetchall()
    x=[]
    for row in result:
        d={"roomid":row[0],"roomname":row[1],"area":row[2],"description":row[3],"coverphoto":row[4],"hid":row[5],"tariffsingle":row[6],"tariffdouble":row[7],"extraperson":row[8],"rating":row[9],"count":row[10],"category":row[11]}
        x.append(d)
    return render(request,"viewspace.html",{"ar":x})

#admin view space details
def viewspacedetails(request):
        roomid = request.GET["q"]
        conn = connect("127.0.0.1", "root", "", "sparespace")
        q = "select * from photos where roomid='" + roomid + "'"
        cr = conn.cursor()
        cr.execute(q)
        result = cr.fetchall()
        x = []
        for row in result:
            d1 = {"photo": row[1]}
            x.append(d1)
        s = "select * from rooms where roomid='" + roomid + "'"
        cr = conn.cursor()
        cr.execute(s)
        row = cr.fetchone()

        d = {"roomid": row[0], "roomname": row[1], "area": row[2], "description": row[3], "coverphoto": row[4],
             "hid": row[5], "tariffsingle": row[6], "tariffdouble": row[7], "extraperson": row[8], "rating": row[9],
             "count": row[10], "category": row[11]}
        return render(request, "spacedetails.html", {"ar": d, "ar1": x})


#host view profile
def viewprofile(request):
    conn = Connection("127.0.0.1", "root", "", "sparespace")
    s = "select * from host where email='" +request.session['hostemail'] +"'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    x = []
    d = {"hid": result[0], "hostname": result[1], "email": result[2], "city": result[4], "mobile": result[5], "photo": result[6],
             "description": result[7], "location": result[8]}
    x.append(d)
    return render(request,"viewprofile.html",{"ar":x})

#host edit profile
def editprofile(request):
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "select * from host where hid='" + request.GET["q"] + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    d = {"hid": result[0], "hostname": result[1], "email": result[2],"city":result[4],"mobile":result[5],"photo":result[6],"description":result[7],"location":result[8]}
    return JsonResponse(d, safe=False)

@csrf_exempt
def savehostprofile(request):
    hid=request.POST['hid']
    hostname=request.POST['hostname']
    email = request.POST['email']
    city = request.POST['city']
    mobile = request.POST['mobile']
    description = request.POST['description']
    location = request.POST['location']
    file = request.FILES["photo"]
    uploadname = "hostphotos/" + str(random.randint(1, 10000)) + file.name
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s="update host set hostname='"+hostname+"',email='"+email+"',city='"+city+"',mobile="+mobile+",dp='"+uploadname+"',description='"+description+"',location='"+location+"' where hid="+hid+""
    fs = FileSystemStorage()
    fs.save(uploadname, file)
    cr = conn.cursor()
    cr.execute(s)
    conn.commit()
    return HttpResponse("success")

@csrf_exempt
def checkout(request):
    checkin = request.POST['checkin']
    roomid  = request.POST['roomid']
    checkout = request.POST['checkout']
    person = request.POST['person']
    extraperson = request.POST['extraperson']
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "select * from booking where roomid='"+str(roomid)+"' and (checkin and checkout between '"+str(checkin)+"' and '"+str(checkout)+"')"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    if result:
       return  HttpResponse("fail")
    else:
        conn = connect("127.0.0.1", "root", "", "sparespace")
        q = "select * from rooms where roomid='"+str(roomid)+"'"
        print(roomid)
        cr=conn.cursor()
        cr.execute(q)
        result = cr.fetchone()
        tariffsingle = result[6]
        tariffdouble = result[7]
        extra = result[8]
        tsperday=tariffsingle/30
        print(tsperday)
        tdperday=tariffdouble/30
        texperday=extra/30
        from datetime import date
        print(checkout,checkin)
        c1=str(checkin).split("-")
        c2=str(checkout).split("-")
        d0 = date((int)(c1[0]),(int)(c1[1]),(int)(c1[2]))
        d1 = date((int)(c2[0]),(int)(c2[1]),(int)(c2[2]))
        delta = d1 - d0
        print('no of days ',delta)
        total=0
        nd = str(delta).split(" ")
        totaldays=(int)(nd[0])
        if person =='single':
            total = ((float)(tsperday) +((int)(extraperson)*(float)(texperday)))*((int)(totaldays))
            total=round(total)
        elif person=='double':
            total = ((float)(tdperday) +((int)(extraperson)*(float)(texperday)))*((int)(totaldays))
            total=round(total)
        # elif person=='single' and totaldays>=30:
        #      total=((float)(tariffsingle) +((int)(extraperson)*(float)(extra)))*((int)(totaldays-30))
        # elif person=='double' and totaldays>=30:
        #      total=((float)(tariffdouble) +((int)(extraperson)*(float)(extra)))*((int)(totaldays-30))
        d={"roomid":roomid,"person":person,"extrap":extraperson,"checkin":checkin,"checkout":checkout,"charges":total}
        return JsonResponse(d,safe=False)

@csrf_exempt
def checkout1(request):
    checkin = request.POST['checkin']
    roomid = request.POST['roomid']
    checkout = request.POST['checkout']
    conn = connect("127.0.0.1", "root", "", "sparespace")
    s = "select * from booking where roomid='" + str(roomid) + "' and (checkin and checkout between '" + str(
        checkin) + "' and '" + str(checkout) + "')"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    if result:
        return JsonResponse("fail")
    else:
        q = "select * from rooms where roomid='" + str(roomid) + "'"
        cr = conn.cursor()
        cr.execute(q)
        result = cr.fetchone()
        tariffsingle = result[6]
        tsperday = tariffsingle / 30
        from datetime import date
        print(checkout, checkin)
        c1 = str(checkin).split("-")
        c2 = str(checkout).split("-")
        d0 = date((int)(c1[0]), (int)(c1[1]), (int)(c1[2]))
        d1 = date((int)(c2[0]), (int)(c2[1]), (int)(c2[2]))
        delta = d1 - d0
        print('no of days ', delta)
        total = 0
        nd = str(delta).split(" ")
        totaldays = (int)(nd[0])
        total=total+(float(tsperday))*((int)(totaldays))
        total1=round(total)
        d = {"roomid": roomid, "person": "single", "extrap": "0", "checkin": checkin, "checkout": checkout,
             "charges": total1}
        return JsonResponse(d, safe=False)

def proceedtopayment(request):
    rid=request.GET['rid']
    persons=request.GET['p']
    experson=request.GET['ex']
    ckin=request.GET['cin']
    ckout=request.GET['cout']
    total=request.GET['total']
    print(total)
    hostid=request.GET['hid']
    s=str(total).split(".")
    print(s)
    ts=(float)(s[0])*100
    d={"rid":rid,"persons":persons,"extra":experson,"checkin":ckin,"checkout":ckout,"total":total,"ts":ts,"hid":hostid}
    conn=connect("127.0.0.1","root","","sparespace")
    s="select * from rooms where roomid='"+rid+"'"
    cr=conn.cursor()
    cr.execute(s)
    row=cr.fetchone()
    d1={"roomname":row[1],"area":row[2],"description":row[3],"coverphoto":row[4],"hid":row[5]}
    # print(d1)
    q="select * from user where email='"+request.session['useremail']+"'"
    cr.execute(q)
    row1=cr.fetchone()
    d2={"mobile":row1[0],"email":row1[1],"name":row1[3],"address":row1[4]}
    return render(request,"proceedtopayment.html",{"ar":d,"ar1":d1,"ar2":d2})


def proceedtopayment1(request):
    rid=request.GET['rid']
    ckin=request.GET['cin']
    ckout=request.GET['cout']
    total=request.GET['total']
    hostid = request.GET['hid']
    s=str(total).split(".")
    ts=(float)(s[0])*100
    d={"rid":rid,"checkin":ckin,"checkout":ckout,"total":total,"ts":ts,"hid":hostid}
    conn=connect("127.0.0.1","root","","sparespace")
    s="select * from rooms where roomid='"+rid+"'"
    cr=conn.cursor()
    cr.execute(s)
    row=cr.fetchone()
    d1={"roomname":row[1],"area":row[2],"description":row[3],"coverphoto":row[4],"hid":row[5],"tariffsingle": row[6], "tariffdouble": row[7], "extraperson": row[8], "rating": row[9],
             "count": row[10], "category": row[11]}
    # print(d1)
    q = "select * from user where email='" + request.session['useremail'] + "'"
    cr.execute(q)
    row1 = cr.fetchone()
    d2 = {"mobile": row1[0], "email": row1[1], "name": row1[3], "address": row1[4]}
    return render(request,"proceedtopayment1.html",{"ar":d,"ar1":d1,"ar2":d2})

@csrf_exempt
def userbooking(request):
    dateofbooking = date.today()
    roomid = request.POST['roomid']
    tariff = request.POST['persons']
    extraperson = request.POST['extraperson']
    checkin = request.POST['checkin']
    chkout = request.POST['checkout']
    bookeremail=request.POST['email']
    bookeraddress=request.POST['address']
    bookermobile=request.POST['mobile']
    hostid=request.POST['hostid']
    total=request.POST['total']
    print(total)
    paymentmode = request.POST['paymentmode']
    paymentstatus = "success"
    if paymentmode == "Cash":
        total = 0.0
        paymentstatus = "pending"
    conn = Connect("127.0.0.1", "root", "", "sparespace")
    q = f"insert into booking values(NULL,'{roomid}','{tariff}','{extraperson}','{checkin}','{chkout}','{bookeremail}','{bookeraddress}','{bookermobile}','{hostid}','{total}','{dateofbooking}','{paymentmode}','{paymentstatus}','pending')"
    print(q)
    cr=conn.cursor()
    cr.execute(q)
    bookingid = cr.lastrowid
    conn.commit()
    msg = "Your booking is successfully Done!!"
    return JsonResponse({"bookingid": bookingid}, safe=False)

def thankspage(request):
    bookingid = request.GET["bookingid"]
    amount = request.GET["amount"]
    status = request.GET["status"]
    return render(request,"thankspage.html",{"amount":amount,"bookingid":bookingid,"status":status})
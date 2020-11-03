import math
import random
from datetime import date
from database import *

from django.http import *
from django.shortcuts import *
from pymysql import *
from django.views.decorators.csrf import *
from django.core.files.storage import *
import http.client
import rssfeed


def getsubcat(request):
    catname = request.GET['catname']
    s = "select * from newsdata where catname='" + catname + "'"

    result = Fetchall(s)
    x = []
    for row in result:
        x.append(row)
    return HttpResponse(str(x))


def loginwithajax(request):
    conn = Connect("127.0.0.1", "root", "", "news")
    e = request.GET["email"]
    p = request.GET["password"]
    s = "select * from admins where email='" + e + "' and password='" + p + "'"
    cr = conn.cursor()
    cr.execute(s)
    result = cr.fetchone()
    if result:
        return HttpResponse("success")
    else:
        return HttpResponse("fail")


def openajaxpage(request):
    return render(request, "ajaxdemo.html")


@csrf_exempt
def addadmin(request):
    if 'adminemail' in request.session:
        return render(request, "addadmin.html")
    else:
        return HttpResponseRedirect('adminlogin')


def admindashboard(request):
    if 'adminemail' in request.session:
        return render(request, "admindashboard.html")
    else:
        return HttpResponseRedirect('adminlogin')


@csrf_exempt
def insertadmin(request):
    email = request.POST["email"]
    password = request.POST["password"]
    type = request.POST["type"]
    mobile = request.POST["mobile"]
    s = f"insert into admins values ('{email}','{password}','{type}','{mobile}')"
    Insert(s)
    return HttpResponse("Admin Added Successfully")


@csrf_exempt
def viewadmin(request):
    s = "select email,type,mobile from admins"
    result = Fetchall(s)
    x = []
    for row in result:
        d = {"email": row[0], "type": row[1], "mobile": row[2]}
        x.append(d)
    return JsonResponse(x, safe=False)


@csrf_exempt
def deladmin(request):
    s = "delete from admins where email ='" + request.POST["email"] + "'"
    Delete(s)
    return HttpResponse("Admin Deleted Successfully")


def editadmin(request):
    s = "select * from admins where email='" + request.GET["q"] + "'"
    result = Fetchone(s)
    d = {"email": result[0], "password": result[1], "type": result[2], "mobile": result[3]}
    return render(request, "editadmin.html", {"ar": d})

@csrf_exempt
def save(request):
    email = request.POST["editemail"]
    type = request.POST["edittype"]
    mobile = request.POST["editmobile"]
    s = f"update admins set type='{type}', mobile='{mobile}' where email='{email}'"
    Update(s)
    return HttpResponse("Admin Updated Successfully")


def adminlogin(request):
    return render(request, "adminlogin.html")

def adminlogout(request):
    try:
        del request.session["adminemail"]
    except:
        pass
    return render(request, "adminlogin.html")

@csrf_exempt
def checkadminlogin(request):
    e = request.POST["email"]
    p = request.POST["password"]
    s = "select * from admins where email='" + e + "' and password='" + p + "'"
    result = Fetchone(s)
    if result:
        request.session['adminemail'] = e
        return render(request, "admindashboard.html")
    else:
        d = {"msg": "Invalid Credentials"}
        return render(request, "adminlogin.html", {"ar": d})

def changeadminpassword(request):
    if 'adminemail' in request.session:
        return render(request, "adminchangepassword.html")
    else:
        return HttpResponseRedirect('adminlogin')

@csrf_exempt
def adminchangepassword(request):
    conn = Connect("127.0.0.1", "root", "", "news")
    oldpassword = request.POST["oldpassword"]
    newpassword = request.POST["newpassword"]
    em = request.session['adminemail']
    s = "select * from admins where email='" + em + "' and password='" + oldpassword + "'"
    result = Fetchone(s)
    if result:
        s1 = "update admins set password='" + newpassword + "' where email='" + em + "' and password='" + oldpassword + "'"
        cr = conn.cursor()
        cr.execute(s1)
        conn.commit()
        d = {"message": "Password Updaqated Succesfully!"}
        return render(request, "admindashboard.html", {"ar": d})
    else:
        d = {"message": "Enter correct password"}
        return render(request, "adminchangepassword.html", {"ar": d})

# =======================Category Table==================#
@csrf_exempt
def insertcategory(request):
    catname = request.POST["catname"]
    description = request.POST["description"]
    files = request.FILES["photo"]
    photo = "categoryphotos/" + str(random.randint(1, 10000)) + files.name
    query = f"insert into category values ('{catname}','{description}','{photo}')"
    fs = FileSystemStorage()
    fs.save(photo, files)
    Insert(query)
    return HttpResponse("Category added Successfully")


def addcategory(request):
    return render(request, "addcategory.html")

@csrf_exempt
def removecategory(request):
    s = "delete from category where catname='" + request.POST["catname"] + "'"
    try:
        Delete(s)
        res = "sucess"
    except:
        res = "fail"
    return HttpResponse("Category Deleted Successfully")

def editcategory(request):
    s = "select * from category where catname='" + request.GET["q"] + "'"
    result = Fetchone(s)
    d = {"catname": str(result[0]), "description": str(result[1]), "photo": str(result[2])}
    return render(request, "editcategory.html", {"ar": d})

@csrf_exempt
def savecat(request):
    file = ""
    try:
        file = request.FILES['editphoto']
    except:
        file = ""
    print("hello")
    if (file != ""):
        print(f"if condition{file}")
        file = request.FILES["editphoto"]
        uploadname = "categoryphotos/" + str(random.randint(1, 10000)) + file.name
        s = "update category set description ='" + request.POST[
            "editcatdescription1"] + "' , photo='" + uploadname + "'where catname='" + request.POST["editcatname"] + "'"
        print(s)
        fs = FileSystemStorage()
        fs.save(uploadname, file)
        Update(s)
    else:
        print("else hello")
        print(f"else condition:-{file}")
        s = "update category set description ='" + request.POST["editcatdescription1"] + "' where catname='" + \
            request.POST["editcatname"] + "'"
        Update(s)
    return HttpResponse("Category edited Successfully")


def showcategory(request):
    s = "select * from category"
    result = Fetchall(s)
    x = []
    for row in result:
        d = {}
        d['catname'] = row[0]
        d['description'] = row[1]
        d['photo'] = row[2]
        x.append(d)
    return JsonResponse(x, safe=False)


# ==========================News==============================#
def addnews(request):
    s = "select catname from category"
    result = Fetchall(s)
    d = []
    for row in result:
        d.append(row[0])
    return render(request, "addnews.html", {"ar": d})


def viewnews(request):
    catname = request.GET['catname']
    print(catname)
    s = "select * from newsdata where catname='" + catname + "'"
    print(s)
    result = Fetchall(s)
    x = []
    if result:
        for row in result:
            d = {"newsid": row[0],
                 "newstitle": row[1],
                 "description": row[2],
                 "hashtag": row[3],
                 "dateofnews": row[4],
                 "catname": row[5]
                 }
            x.append(d)
    return JsonResponse(x, safe=False)


@csrf_exempt
def insertnews(request):
    newstitle = request.POST["newstitle"]
    newsdescription = request.POST["newsdescription"]
    newshashtag = request.POST["newshashtag"]
    newscatname = request.POST["newscatname"]
    tops = request.POST['tops']
    d1 = date.today()
    title = newstitle.replace("'", "\"")
    newsdesc = newsdescription.replace("'", "\"")
    print(newsdescription)
    s = f"insert into newsdata(`newstitle`,`description`,`hashtag`,`dateofnews`,`catname`) value ('{title}','{newsdesc}','{newshashtag}','{d1}','{newscatname}')"
    Insert(s)
    if tops == 'yes':
        query2 = "SELECT newsid FROM `newsdata` ORDER BY newsid DESC"
        result = Fetchone(query2)
        todaydate = date.today()
        query3 = f"INSERT INTO `trending`(`newsid`, `date`) VALUES ('{result[0]}','{todaydate}')"
        Insert(query3)
    d = {"message": "News Added successfully"}
    return render(request, "insertnews.html", {"ar": d})


def shownews(request):
    s = "select catname from category"
    result = Fetchall(s)
    d = []
    for row in result:
        d.append(row[0])
    return render(request, "shownews.html", {"ar": d})


def deleteaction(request):
    id = request.GET['id']
    print(id)
    query = f"delete from newsdata where newsid={id}"
    print(query)
    Delete(query)
    return HttpResponse('success')


@csrf_exempt
def editdataaction(request):
    id = request.POST['id']
    newscatname = request.POST['newscatname']
    newstitle = request.POST['newstitle']
    newsdescription = request.POST['newsdescription']
    newshashtag = request.POST['newshashtag']
    query = f"update newsdata set newstitle='{newstitle}',description='{newsdescription}',hashtag='{newshashtag}',catname='{newscatname}' where newsid={id}"
    print(query)
    Update(query)
    return HttpResponse("sucess")


def addphotos(request):
    newsid = request.GET['newsid']
    query = f"select * from photo where newsid={newsid}"
    result = Fetchall(query)
    x = []
    for row in result:
        d = {"id": row[0], 'photo': row[1], 'desc': row[2]}
        x.append(d)
    print(x)
    return render(request, 'addphotos.html', {"newsid": newsid, 'image': x})


@csrf_exempt
def insertphotos(request):
    newsid = request.POST["newsid"]
    print(newsid)
    description = request.POST["description"]
    files = request.FILES["photo"]
    photo = "categoryphotos/" + str(random.randint(1, 10000)) + files.name
    print(photo)
    query = f"insert into photo values (NULL ,'{photo}','{description}',{newsid})"
    fs = FileSystemStorage()
    fs.save(photo, files)
    print(query)
    Insert(query)
    return HttpResponseRedirect('shownews')


def deletenewsphoto(request):
    id = request.GET["id"]
    print(id)
    query = f"delete from photo where photoid={id}"
    Delete(query)
    return HttpResponseRedirect('shownews')


# ========================News Videos============================#
def insertvideos(request):
    id = request.GET['newsid']
    query = f"select * from videos where newsid={id}"
    print(query)
    result = Fetchall(query)
    print(result)
    x = []
    if result:
        for row in result:
            d = {"id": row[0], 'videolink': row[1], 'desc': row[2]}
            x.append(d)
    print(x)
    return render(request, 'addvideos.html', {'newsid': id, 'video': x})


@csrf_exempt
def insertvideosaction(request):
    newsid = request.POST["newsid"]
    print(newsid)
    description = request.POST["description"]
    videolink = request.POST["videolink"]
    query = f"insert into videos values (NULL ,'{videolink}',{newsid},'{description}')"
    print(query)
    Insert(query)
    return HttpResponseRedirect('shownews')


def deletenewsvideo(request):
    id = request.GET["id"]
    print(id)
    query = f"delete from videos where videoid={id}"
    Delete(query)
    return HttpResponseRedirect('shownews')


def readnews(request):
    id = request.GET['newsid']
    query = f"select * from newsdata where newsid={id}"
    newsdata = Fetchone(query)
    return render(request, 'readnews.html',
                  {'title': newsdata[1].replace("\"", "'"), 'description': newsdata[2].replace("\"", "'")})


# =====================User=======================#


def usersignup1(request):
    return render(request, 'usersignup1.html')


def resizetitle(obj):
    lists = obj.split(" ")
    newline = []
    for word in lists:
        newline.append(word)
        if len(newline) > 10:
            break
    if len(newline) > 6:
        newline.append("......")
    lists2 = " ".join(newline)
    return lists2

def index(request):
    selectcat = ""
    try:
        selectcat = request.GET['select']
    except:
        pass
    query = ""
    if selectcat == "":
        ndtvnewslist=""
        try:
            ndtvnewslist = rssfeed.trending('/')
        except:
            pass
        print(ndtvnewslist)
        selectcat = '/'
        query = "select newsdata.newsid,newsdata.newstitle, photo.photoid,photo.photo,newsdata.dateofnews from newsdata INNER JOIN photo on newsdata.newsid=photo.newsid ORDER BY newsdata.newsid DESC"
        print(query)
    else:
        d = f'{selectcat}'
        ndtvnewslist = rssfeed.trending(d)
        print(ndtvnewslist)
        query = f"select newsdata.newsid,newsdata.newstitle, photo.photoid,photo.photo,newsdata.dateofnews from newsdata INNER JOIN photo on newsdata.newsid=photo.newsid where newsdata.catname='{selectcat}' ORDER BY newsdata.newsid DESC"
        print(query)
    result = Fetchall(query)
    newslist = []
    id = []
    for row in result:
        dist = {}
        if not newslist:
            id.append(row[0])
            dist['newsid'] = row[0]
            dist['title'] = resizetitle(row[1])
            dist['photo'] = row[3]
            dist['dates'] = row[4]
            newslist.append(dist)
        elif row[0] in id:
            pass
        else:
            id.append(row[0])
            dist['newsid'] = row[0]
            dist['title'] = resizetitle(row[1])
            dist['photo'] = row[3]
            dist['dates'] = row[4]
            newslist.append(dist)
    query1 = "SELECT * FROM `trending` ORDER BY  date DESC LIMIT 5"
    result1 = Fetchall(query1)
    newsid = []
    for row in result1:
        newsid.append(row[1])
    # print(newsid)
    trendinglist = []
    for id in newsid:
        datalist = []
        query3 = f"select newsdata.newsid,newsdata.newstitle,photo.photo from newsdata INNER JOIN photo on newsdata.newsid=photo.newsid where newsdata.newsid='{id}'"
        result2 = Fetchone(query3)
        if datalist:
            datalist.append(result2[0])
            datalist.append(result2[1].replace("\"", "'"))
            datalist.append(result2[2])
            trendinglist.append(datalist)
    print(trendinglist)
    query = "select * from videos order by videoid LIMIT 5"
    result2 = Fetchall(query)
    videodata = []
    for row in result2:
        d = {"id": row[0], "title": row[2], "videolink": row[1]}
        videodata.append(d)
    return render(request, 'index2.html',
                  {'newsdata': newslist, "trending": trendinglist, "videodata": videodata, 'catname': selectcat,
                   'ndtvnews': ndtvnewslist})


def find(request):
    vid = request.GET['id']
    query = f"select youtubelink from videos where videoid={vid}"
    result2 = Fetchone(query)
    return HttpResponse(result2[0])


def contact(request):
    return render(request, 'contact.html')


def user_signup1(request):
    return render(request, "user_signup1.html")


def senduserotp(request):
    mobile = request.GET["otpmobile"]
    digits = "0123456789"
    otp = ""
    for i in range(6):
        otp = otp + digits[math.floor(random.random() * 10)]
    print(otp)
    try:
        msg = "Your OTP is" + str(otp)
        msg = msg.replace(" ", "%20")
        conn = http.client.HTTPConnection("server1.vmm.education")
        conn.request('GET',
                     '/VMMCloudMessaging/AWS_SMS_Sender?username=ritikadogra&password=D10BTF1F&message=' + msg + '&phone_numbers=' + str(
                         mobile))
        response = conn.getresponse()
        request.session['userotp'] = str(otp)
        returnvalue = "OTP sent successfully !!"
    except:
        returnvalue = "OTP sending failed.... :("
    return HttpResponse(returnvalue)


def checkotp(request):
    print(request.session['userotp'])
    sendedotp = request.GET['otp']
    if str(sendedotp == request.session['userotp']):
        returnvalue = "success"
    else:
        returnvalue = "failed"
    return HttpResponse(returnvalue)


def usersignup2(request):
    usermobile = request.GET["mobile"]
    d = {"mobile": usermobile}
    return render(request, "usersignup2.html", {"ar": d})


@csrf_exempt
def register_user(request):
    userphoto = request.FILES["userphoto"]
    uploadphoto = "user_pics/" + str(random.randint(1, 10000)) + userphoto.name
    usermobile = request.POST["usermobile"]
    useremail = request.POST["useremail"]
    username = request.POST["username"]
    userpassword = request.POST["userpassword"]
    useraddress = request.POST["useraddress"]
    userstate = request.POST["userstate"]

    fs = FileSystemStorage()
    fs.save(uploadphoto, userphoto)
    q = "select * from user"
    result = Fetchall(q)
    flag = True
    for row in result:
        if row[0] == useremail:
            flag = False
            break
    if flag == False:
        returnvalue = "duplicate"
    else:
        query = f"insert into user values ('{useremail}','{userpassword}','{username}','{useraddress}','{userstate}','{usermobile}','{uploadphoto}')"
        Insert(query)
        returnvalue = "success"
    return HttpResponse(returnvalue)


def userlogin(request):
    return render(request, "userlogin.html")


def userlogout(request):
    try:
        del request.session["user_email"]
    except:
        pass
    return HttpResponseRedirect("/")


@csrf_exempt
def checkuserlogin(request):
    user_email = request.POST["useremail"]
    user_password = request.POST["userpassword1"]
    request.session['user_email'] = user_email
    q = f"select * from user where email = '{user_email}' and password ='{user_password}'"
    result = Fetchone(q)
    if result:
        returnvalue = "success"
    else:
        returnvalue = "failed"
    return HttpResponse(returnvalue)


# @csrf_exempt
def sendforgotsms(request):
    smsemail = request.GET["email"]
    print(smsemail)
    query = f"select password,mobile from user where email ='{smsemail}'"
    result = Fetchone(query)
    if result:
        password = result[0]
        mobile = result[1]
        try:
            msg = "Your Password is" + str(password)
            msg = msg.replace(" ", "%20")
            conn = http.client.HTTPConnection("server1.vmm.education")
            conn.request('GET',
                         '/VMMCloudMessaging/AWS_SMS_Sender?username=ritikadogra&password=D10BTF1F&message=' + msg + '&phone_numbers=' + str(
                             mobile))
            response = conn.getresponse()
            returnvalue = f"Your Password has been successfully sent to your Phone:-{result[1]}"
        except:
            returnvalue = f"Failed due to network error"
    else:
        returnvalue = "fail"
    return HttpResponse(returnvalue)


def userdashboard(request):
    return render(request, "userdashboard.html")


# ==========================Author===========================#
def addauthor(request):
    return render(request, "addauthor.html")


@csrf_exempt
def author(request):
    name = request.POST["name"]
    photo = request.FILES["photo"]
    description = request.POST["description"]
    uploadphoto = "user_pics/" + str(random.randint(1, 10000)) + photo.name
    fs = FileSystemStorage()
    fs.save(uploadphoto, photo)

    type = request.POST["type"]

    query = f"insert into author values(NULL ,'{name}','{uploadphoto}','{description}','{type}') "
    Insert(query)
    return HttpResponse("Author Added Successfully")


def viewauthor(request):
    s = "select * from author"
    result = Fetchall(s)
    x = []
    for row in result:
        d = {"id": row[0], "name": row[1], "photo": row[2], "description": row[3], "type": row[4]}
        x.append(d)
    return JsonResponse(x, safe=False)


@csrf_exempt
def delauthor(request):
    aid = request.POST["id"]
    print(aid)
    query = f"delete from author where aid={aid}"
    try:
        Delete(query)
        res = "sucess"
    except:
        res = "fail"
    return HttpResponse("Author Deleted Successfully")


@csrf_exempt
def saveauthor(request):
    aid = request.POST["id"]
    aname = request.POST['editname']
    atype = request.POST['edittype']
    adesc = request.POST['editdesc']
    print(aname, atype, adesc)
    try:
        file = request.FILES['editphoto']
    except:
        file = ""
    print("hello")
    if (file != ""):
        file = request.FILES["editphoto"]
        uploadname = "user_pics/" + str(random.randint(1, 10000)) + file.name
        s = f"update author SET `name`='{aname}',`photo`='{uploadname}',`type`='{atype}',`description`='{adesc}' where `aid`='{aid}'"
        print(s)
        fs = FileSystemStorage()
        fs.save(uploadname, file)
        Update(s)
    else:
        s = f"update author SET `name`='{aname}',`type`='{atype}',`description`='{adesc}' where `aid`='{aid}'"
        print(s)
        Update(s)
    return HttpResponse("Author edited Successfully")


# ======================Blogs=========================#
def bolgs(request):
    return render(request, "bolgs.html")


def blogs(request):
    query = f"select aid,name from author "
    # cr.execute(query)
    result = Fetchall(query)
    x = []
    for row in result:
        d = {"id": row[0], "name": row[1]}
        x.append(d)

    return render(request, "blogs.html", {'msg': x})


from datetime import *


@csrf_exempt
def saveblog(request):
    aid = request.POST['aid']
    title = request.POST['title']
    blogtext = request.POST['blogtext']
    title = title.replace("'", "\"")
    text1 = (blogtext.replace("'", "\""))
    print(text1)
    obj = date.today()
    print(obj)
    query = f"insert into blog(`title`,`blog text`,`dateofpublish`,`aid`) value ('{title}','{text1}','{obj}',{aid})"
    print(query)
    Insert(query)
    return HttpResponseRedirect("viewblog")


def viewblog(request):
    return render(request, "viewblog.html")


def blogview(request):
    id = request.GET['aid']
    s = f"select * from blog where aid='{id}'"
    result = Fetchall(s)
    x = []
    for row in result:
        d = {"blogid": row[0], "title": row[1], "dateofpublish": row[3]}
        x.append(d)
    return render(request, "viewblog.html", {'msg': x})


def moreblog(request):
    id = request.GET['bid']
    s = f"select * from blog where blogid={id}"
    result = Fetchone(s)
    d = {"blogid": result[0], "title": result[1], "blogtext": result[2], "dateofpublish": result[3]}
    return render(request, "moreblog.html", {'msg': d})


def deleteblog(request):
    id = request.GET['bid']
    s = f"delete from blog where blogid={id}"
    Delete(s)
    return HttpResponseRedirect('addauthor')


def readblog(request):
    s = f"select * from author where type = 'blogger'"
    result = Fetchall(s)
    x = []
    for row in result:
        d = {"id": row[0], "name": row[1], "photo": row[2]}
        x.append(d)

    s1 = f"select * from author where type = 'columnist'"
    result = Fetchall(s1)
    x1 = []
    for row in result:
        d1 = {"id": row[0], "name": row[1], "photo": row[2]}
        x1.append(d1)
    s2 = "select blog.title,blog.dateofpublish,blog.aid,blog.blogid ,author.photo,author.name from blog INNER  JOIN author on blog.aid = author.aid ORDER BY  blog.aid DESC"
    result = Fetchall(s2)
    print(result)
    x2 = []
    for row in result:
        d = {'title': row[0].replace("\"", "'"), 'dateofpublish': str(row[1]), 'aid': row[2], 'blogid': row[3],
             'photo': row[4], 'name': row[5]}
        x2.append(d)
    print(x2)
    return render(request, "readblog.html", {'ar': x, 'ar1': x1, 'ar3': x2})


def readblog2(request):
    id = request.GET['blogid']
    s = f"select * from blog where blogid={id}"
    result = Fetchone(s)
    t = (result[2].replace("\"", "'"))
    print(t)
    d = {"blogid": result[0], "title": result[1].replace("\"", "'"), "blogtext": t, "dateofpublish": result[3]}
    s2 = f"select user.name,user.photo,comments.comment,comments.date from comments INNER JOIN user on user.email = comments.email order by comments.date "

    result = Fetchall(s2)
    x = []
    for row in result:
        d1 = {'name': row[0], 'photo': row[1], 'cmnt': row[2], 'date': row[3]}
        x.append(d1)
    return render(request, "readblog2.html", {'ar': d, 'ar2': x})


def viewauthorblog(request):
    aid = request.GET['aid']
    s2 = f"select blog.title,blog.dateofpublish,blog.aid,blog.blogid ,author.photo,author.name from blog INNER  JOIN author on blog.aid = author.aid where blog.aid={aid} ORDER BY  blog.aid DESC"
    result = Fetchall(s2)
    print(result)
    x2 = []
    for row in result:
        d = {'title': row[0].replace("\"", "'"), 'dateofpublish': str(row[1]), 'aid': row[2], 'blogid': row[3],
             'photo': row[4], 'name': row[5]}
        x2.append(d)
    print(x2)
    return JsonResponse(x2, safe=False)


@csrf_exempt
def comment(request):
    d = date.today()
    cmnt = request.POST["comment1"]
    blogid = request.POST["blogid"]
    email = request.session["user_email"]
    query = f"insert into comments VALUES (NULL ,'{cmnt}','{email}','pending','{blogid}','{d}')"
    Insert(query)
    return HttpResponse("Success")


def searchcont(request):
    searchdata = request.GET['searchdata']
    query = f"select * from newsdata where (newstitle Like CONCAT('%','{searchdata}','%') or catname LIKE CONCAT('%','{searchdata}','%') or description LIKE CONCAT('%','{searchdata}','%'))"
    print(query)
    result = Fetchall(query)
    query1 = "select newsdata.newsid,newsdata.newstitle, photo.photoid,photo.photo,newsdata.dateofnews from newsdata INNER JOIN photo on newsdata.newsid=photo.newsid "
    result2 = Fetchall(query1)
    searchdata = []
    for row in result2:
        d = {"newsid": row[0], "newstitle": row[1], "photo": row[3], "dateofnews": row[4]}
        searchdata.append(d)
    return render(request, 'searchpage.html', {'ar': searchdata})


def searchpage(request):
    return render(request, 'searchpage.html')


def navexmple(request):
    return render(request, 'navexmple.html')

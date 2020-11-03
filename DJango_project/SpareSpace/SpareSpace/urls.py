"""SpareSpace URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from views import *
urlpatterns = [
    path('admin/', admin.site.urls),
    path("addadmin",addadmin),
    path("add",add),
    path("viewadmin",viewadmin),
    path("adminlogin",adminlogin),
    path("checkadminlogin",checkadminlogin),
    path("admindashboard",admindashboard),
    path("adminchangepassword",adminchangepassword),
    path("removeadmin",removeadmin),
    path("editadmin",editadmin),
    path("saveadmin",saveadmin),
    path("logout",logout),
    path("usersignup",usersignup),
    path("sendotp",sendotp),
    path("verifyotp",verifyotp),
    path('openusersignup2',openusersignup2),
    path("usersignup2",usersignup2),
    path("userlogin",userlogin),
    path("userlogin1",userlogin1),
    path("userdashboard",userdashboard),
    path("forgot",forgot),
    path("forgotadmin",forgotadmin),
    path("addcategory",addcategory),
    path("insertcategory",insercategory),
    path("showcategory",showcategory),
    path("removecategory",removecategory),
    path("editcategory",editcategory),
    path("savecategory",savecategory),
    path("hostsignup",hostsignup),
    path("inserthost",inserthost),
    path("hostlogin",hostlogin),
    path("hostlogin1",hostlogin1),
    path("addrooms",addrooms),
    path("addrooms1",addrooms1),
    path("viewrooms",viewrooms),
    path("editrooms",editrooms),
    path("saverooms",saverooms),
    path("insertphotos",insertphotos),
    path("addroomphotos",addroomphotos),
    path("deleteroomphoto",deleteroomphoto),
    path("viewroomdetails",viewroomdetails),
    path("findpropertyresult",findpropertyresult),
    path("findproperty",findproperty),
    path("viewdetailproperty",viewdetailproperty),
    path("viewhost",viewhost),
    path("activehost",activehost),
    path('pendinghost',pendinghost),
    path('viewspace',viewspace),
    path('viewspacedetails',viewspacedetails),
    path('viewprofile',viewprofile),
    path('editprofile',editprofile),
    path('savehostprofile',savehostprofile),
    path('viewdetailproperty',viewdetailproperty),
    path("checkout",checkout),
    path("checkout1",checkout1),
    path("proceedtopayment",proceedtopayment),
    path("proceedtopayment1",proceedtopayment1),
    path("userbooking",userbooking),
    path("thankspage",thankspage),

    #-----------------------------------

    path("", index),
    path("login", login),
    path("register", register),
    path("contact", contact),
    path("userlogout", userlogout),
    path("hostlogout",hostlogout),

]

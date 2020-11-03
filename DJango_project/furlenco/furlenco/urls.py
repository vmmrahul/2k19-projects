"""furlenco URL Configuration

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
    path('addadmin', addadmin),
    path('insertadmin', insertadmin),
    path('viewadmin', viewadmin),
    path('removeadmin', removeadmin),
    path('editadmin', editadmin),
    path('saveadmin', saveadmin),
    path('adminlogin', adminlogin),
    path('checklogin', checklogin),
    path('admindashboard', admindashboard),
    path('changeadminpassword', changeadminpassword),
    path('adminchangepassword', adminchangepassword),
    path('addcategory', addcategory),
    path('insertcategory', insertcategory),
    path('showcategory', showcategory),
    path('editcategory', editcategory),
    path('removecategory', removecategory),
    path('savecategory', savecategory),
    path('addfurniture', addfurniture),
    path('insertfurniture', insertfurniture),
    path('showfurniture', showfurniture),
    path('viewcategory',viewcategory),
    path('deleteaction', deleteaction),
    path('editdataaction', editdataaction),
    path('addphotos', addphotos),
    path('insertphotos', insertphotos),
    path('deletefurniturephotos', deletefurniturephotos),
    path('adminlogout', adminlogout),

    # ----USer Signup---
    path('usersignup1', usersignup1),
    path('sendotp', sendotp),
    path('verifyotp', verifyotp),
    path('usersignup2', usersignup2),
    path('insertuser', insertuser),
    path('userlogin', userlogin),
    path('userchecklogin', userchecklogin),
    path('userdashboard', userdashboard),
    path('sendforgotsms', sendforgotsms),
    path('adminforgotsms', adminforgotsms),

    path('userlogout', userlogout),

    # ----search fruniture---
    path('searchfurniture1', searchfurniture1),
    path('searchfurniture2',searchfurniture2),
    path('showcard',showcard),
    path('searchfurnituredetails',searchfurnituredetails),
    path('searchfurnituredetails1',searchfurnituredetails1),
    # main pages
    path('', index),
    path('single', single),
    path('contact', contact),
    path('addtocart', addtocart),
    path('findprice', findprice),
    path('showcartproducat', showcartproducat),
    path('delete_from_cart', delete_from_cart),
    path('processtopay', processtopay),
    path('thankspage', thankspage),
    path('payment_action', payment_action),
]

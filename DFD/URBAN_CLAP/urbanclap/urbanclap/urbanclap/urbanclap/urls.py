"""urbanclap URL Configuration

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
    path('admindashboard', admindashboard),
    path('saveadmin', saveadmin),
    path('adminlogin', adminlogin),
    path('checkadminlogin', checkadminlogin),
    path('adminchangepassword', adminchangepassword),
    path('changeadminpassword', changeadminpassword),
    path('insertcategory', insertcategory),
    path('addcategory', addcategory),
    path('showcategory', showcategory),
    path('editcategory', editcategory),
    path('removecategory', removecategory),
    path('savecat', savecat),
    path('updatecategory', updatecategory),
    path('adminlogout', adminlogout),
    path('sendadminforgotsms', sendadminforgotsms),
    # path('viewbookingtoadminsuccess', viewbookingtoadminsuccess),
    path('viewbookingtoadmin', viewbookingtoadmin),

    # ----User
    path('usersignup1', usersignup1),
    path('usersignupotpveryfy', usersignupotpveryfy),
    path('sendotpmobile', sendotpmobile),
    path('verifyotp', verifyotp),
    path('usersignup2', usersignup2),
    path('userlogin', userlogin),
    path('insertuser', insertuser),
    path('userloginpage', userloginpage),
    path('userDashboard', userDashboard),
    path('senduserforgotsms', senduserforgotsms),
    path('userlogout', userlogout),
    path('payment_action', payment_action),
    path('thankyou', thankyou),
    path('userbookings', userbookings),
    path('rating', rating),
    path('rating2', rating2),
    path('sendratingmsgandemail', sendratingmsgandemail),
    path('reviews', reviews),
    path('addreviews', addreviews),
    path('getaveragerating', getaveragerating),
    path('customerreviews', customerreviews),

    # path('viewallrating', viewallrating),


    # ----Service provider
    path('serviceprovidersignup', serviceprovidersignup),
    path('insertserviceprovider', insertserviceprovider),
    path('checkserviceproviderlogin', checkserviceproviderlogin),
    path('serviceproviderlogin', serviceproviderlogin),
    path('sendforgotsms', sendforgotsms),
    path('addservices', addservices),
    path('insertservices', insertservices),
    path('spDashboard', spDashboard),
    path('searchservice1', searchservice1),
    path('searchservice2',searchservice2),
    path('splogout', splogout),
    path('spchangepassword',spchangepassword),
    path('spChangePassword', spChangePassword),
    path('spdetails', spdetails),
    path('updateSP', updateSP),
    path('updateserviceprovider',updateserviceprovider),
    path('bookdetails',bookdetails),
    path('viewbookingtoSP',viewbookingtoSP),
    path('viewbookingdetails',viewbookingdetails),
    path('acceptbooking',acceptbooking),
    path('rejectbooking',rejectbooking),
    path('viewsuccessbookingtoSP',viewsuccessbookingtoSP),
    # -------------user side temp
    path('', index),
    path('contact', contact),
    path('searchcity', searchcity),
    # path('demo', demo),

]

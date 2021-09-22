from django.contrib import admin
from django.urls import path,include
from login import views

app_name = 'login'

urlpatterns = [
    path('', views.login),
    path('login/', views.login),
    path('register/', views.register),
    path('logout/', views.logout),
]

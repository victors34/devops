from django.urls import path
from deploy import views

app_name = 'deploy'

urlpatterns = [
    path('jenkins_test/', views.jenkins_test, name='jenkins_test'),
    path('sonarqube/', views.sonarqube, name='sonarqube'),
]
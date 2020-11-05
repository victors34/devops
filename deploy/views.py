from django.shortcuts import render
from assets.views import login_status

# Create your views here.

@login_status
def jenkins_test(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    deploy_active = 'active'
    return render(request, 'deploy/jenkins_test.html', locals())

@login_status
def sonarqube(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    deploy_active = 'active'
    return render(request, 'deploy/sonarqube.html', locals())
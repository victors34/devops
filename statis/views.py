from django.shortcuts import render
from assets.views import login_status
from statis.models import Cicd_status

# Create your views here.

@login_status
def fe_tag(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    statis_active = 'active'
    service_info = Cicd_status.objects.all()
    return render(request, 'statis/fe_tag.html', locals())

@login_status
def server_tag(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']    
    statis_active = 'active'
    service_info = Cicd_status.objects.all()
    return render(request, 'statis/server_tag.html', locals())

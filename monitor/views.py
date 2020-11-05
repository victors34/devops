from django.shortcuts import render
from assets.views import login_status

# Create your views here.

@login_status
def service_info(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    monitor_active = 'active'
    return render(request, 'monitor/service_info.html', locals())

@login_status
def tps_info(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    monitor_active = 'active'
    return render(request, 'monitor/tps_info.html', locals())

@login_status
def grafana(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    monitor_active = 'active'
    return render(request, 'monitor/grafana.html', locals())

@login_status
def skywalking(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    monitor_active = 'active'
    return render(request, 'monitor/skywalking.html', locals())

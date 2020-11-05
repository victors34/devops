from django.shortcuts import render
from django.shortcuts import HttpResponse,redirect
from django.views.decorators.csrf import csrf_exempt
import json
from assets import models
from assets import asset_handler
from django.shortcuts import get_object_or_404
from functools import wraps

# Create your views here.
def login_status(func):
    """判断登陆状态的装饰器，并返回登陆用户和登陆时间给前端页面"""
    @wraps(func)
    def login_info(request,*args,**kwargs):
        if not request.session.get('is_login', None):
            return redirect('/login/')
        return func(request,*args,**kwargs)
    return login_info

@csrf_exempt
def report(request):
    """
    可以在客户端，使用自定义的认证token，进行身份验证。这部分工作，请根据实际情况，自己进行。
    :param request:
    :return:
    """
    if request.method == "POST":
        asset_data = request.POST.get('asset_data')
        data = json.loads(asset_data)
        # 各种数据检查，请自行添加和完善！
        if not data:
            return HttpResponse("没有数据！")
        if not issubclass(dict, type(data)):
            return HttpResponse("数据必须为字典格式！")
        # 是否携带了关键的sn号
        sn = data.get('sn', None)
        if sn:
            # 进入审批流程
            # 首先判断是否在上线资产中存在该sn
            asset_obj = models.Asset.objects.filter(sn=sn)
            if asset_obj:
                # 进入已上线资产的数据更新流程
                update_asset = asset_handler.UpdateAsset(request, asset_obj[0], data)
                return HttpResponse("资产数据已经更新！")
            else:   # 如果已上线资产中没有，那么说明是未批准资产，进入新资产待审批区，更新或者创建资产。
                obj = asset_handler.NewAsset(request, data)
                response = obj.add_to_new_assets_zone()
                return HttpResponse(response)
        else:
            return HttpResponse("没有资产sn序列号，请检查数据！")
    return HttpResponse('200 ok')

@login_status
def index(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    assets = models.Asset.objects.all()
    return render(request, 'assets/index.html', locals())

@login_status
def dashboard(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    total = models.Asset.objects.count()
    upline = models.Asset.objects.filter(status=0).count()
    offline = models.Asset.objects.filter(status=1).count()
    unknown = models.Asset.objects.filter(status=2).count()
    breakdown = models.Asset.objects.filter(status=3).count()
    backup = models.Asset.objects.filter(status=4).count()
    up_rate = round(upline/total*100)
    o_rate = round(offline/total*100)
    un_rate = round(unknown/total*100)
    bd_rate = round(breakdown/total*100)
    bu_rate = round(backup/total*100)
    server_number = models.Server.objects.count()
    networkdevice_number = models.NetworkDevice.objects.count()
    storagedevice_number = models.StorageDevice.objects.count()
    securitydevice_number = models.SecurityDevice.objects.count()
    software_number = models.Software.objects.count()

    return render(request, 'assets/dashboard.html', locals())

@login_status
def detail(request, asset_id):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    """
    以显示服务器类型资产详细为例，安全设备、存储设备、网络设备等参照此例。
    :param request:
    :param asset_id:
    :return:
    """
    asset = get_object_or_404(models.Asset, id=asset_id)
    return render(request, 'assets/detail.html', locals())

@login_status
def fe_tag(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    return render(request, 'assets/fe_tag.html', locals())

@login_status
def server_tag(request):
    user = request.session['user_name']
    sign_time = request.session['sign_time']
    return render(request, 'assets/server_tag.html', locals())


from django.urls import path
from monitor import views

app_name = 'monitor'

urlpatterns = [
    path('service_info/', views.service_info, name='service_info'),
    path('tps_info/', views.tps_info, name='tps_info'),
    path('grafana/', views.grafana, name='grafana'),
    path('skywalking/', views.skywalking, name='skywalking'),
]
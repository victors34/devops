from django.urls import path
from statis import views

app_name = 'statis'

urlpatterns = [
    path('server_tag/',views.server_tag,name='server_tag'),
    path('fe_tag/', views.fe_tag, name='fe_tag'),
]
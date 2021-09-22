from django.db import models

# Create your models here.
# class tps(models.Model):
#
#     weeker = (
#         ('1', '周一'),
#         ('2', '周二'),
#         ('3', '周三'),
#         ('4', '周四'),
#         ('5', '周五'),
#         ('6', '周六'),
#         ('7', '周日'),
#     )
#
#     service_name = models.CharField(max_length=254)
#     day = models.DateTimeField(auto_now_add=True)
#     pv = models.CharField(max_length=30)
#     uv = models.CharField(max_length=30)
#     week = models.CharField(max_length=32, choices=weeker)

class Cicd_status(models.Model):
    service_status = (
        (1,'ongoing'),
        (2,'end'),
    )

    service_env = (
        (1,'prod'),
        (2,'pre'),
        (3,'test'),
        (4,'dev'),
    )
    service_name = models.CharField( max_length=64, verbose_name="服务名")
    env = models.CharField(max_length=10, choices=service_env, default='prod', verbose_name="服务环境")
    version = models.CharField( max_length=64, null=True, verbose_name="服务版本")
    version_old = models.CharField( max_length=64, null=True, verbose_name="上一个服务版本")
    status = models.CharField(max_length=10, choices=service_status, default='end', verbose_name='发布状态')
    active_time = models.DateTimeField(auto_now=True, verbose_name='发布日期')

    def __str__(self):
        return self.service_name

    class Meta:
        ordering = ["-active_time"]
        verbose_name = "服务名"
        verbose_name_plural = "服务名"
# -*- coding:utf-8 -*-

import os

# 远端接收数据的服务器
Params = {
    "server": "devops.ops.morebit.com.cn",
    "port": 80,
    'url': '/assets/report/',
    'request_timeout': 30,
}

# 日志文件配置

PATH = os.path.join(os.path.dirname(os.getcwd()), 'log', 'cmdb.log')



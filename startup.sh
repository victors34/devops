#!/bin/bash
pkill -9 python3
cd ~/Desktop/devops
nohup python3 manage.py runserver 0.0.0.0:8020 &

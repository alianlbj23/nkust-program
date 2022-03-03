import pathlib
import os
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mblog.settings')
django.setup()
from robot.models import *


t = Userdata.objects.filter(pk=55).delete()
print(t)
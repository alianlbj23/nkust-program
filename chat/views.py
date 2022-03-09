from django.shortcuts import render
from robot.models import *
# Create your views here.

def lobby(request, pk):
    individual = Userdata.objects.get(pk=pk)
    return render(request, 'chat/ready.html', locals())

def game(request, pk):
    individual = Userdata.objects.get(pk=pk)
    return render(request, 'chat/game.html', locals())

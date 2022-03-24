from django.shortcuts import render
from robot.models import *
import random
# Create your views here.

def lobby(request, pk):
    individual = Userdata.objects.get(pk=pk)
    return render(request, 'chat/ready.html', locals())

def game_area(request, pk):
    individual = Userdata.objects.get(pk=pk)
    n_first = Songlist.objects.all().first()
    n_last = Songlist.objects.all().last()

    return render(request, 'chat/game.html', locals())

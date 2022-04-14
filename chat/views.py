from django.shortcuts import render
from robot.models import *
from django.http.response import JsonResponse
import random
# Create your views here.

def lobby(request, pk):
    # tmp = Userdata.objects.get(pk=pk)
    # new = GameMod.objects.filter(username = tmp, game_mod="NostalgiaGame")
    # if new.count() == 0:#如果玩家沒有懷舊的資料這裡新增一個
    #     new = GameMod.objects.create(username = tmp, game_mod="NostalgiaGame")
    #     new.save()
    individual = Userdata.objects.get(pk=pk)
    return render(request, 'chat/ready.html', locals())

def game_area(request, pk):
    individual = Userdata.objects.get(pk=pk)
    n_first = Songlist.objects.all().first()
    n_last = Songlist.objects.all().last()
    tmp = Userdata.objects.get(pk=pk)
    new = GameMod.objects.filter(username = tmp, game_mod="NostalgiaGame") 
    if new.count() == 0:#如果玩家沒有懷舊搶答的資料這裡新增一個
        new = GameMod.objects.create(username = tmp, game_mod="NostalgiaGame")
        new.save()
    return render(request, 'chat/game.html', locals())

def game_area_ajax(request, pk):
    if request.headers.get('x-requested-with') == 'XMLHttpRequest':
        correct = int(request.GET.get("correct"))
        count_number = int(request.GET.get("count_number"))#答題時間
        nostalgiaGame_round_pk = int(request.GET.get("nostalgiaGame_round_pk"))
        print("user後台，目前pk: ", nostalgiaGame_round_pk)
        nostalgiaGame_round = NostalgiaGame_round.objects.get(pk=nostalgiaGame_round_pk)
        gamemod = GameMod.objects.get(username = Userdata.objects.get(pk=pk), game_mod="NostalgiaGame") 
        new = NostalgiaGame_player.objects.create(nostalgiaGame_round=nostalgiaGame_round,mod=gamemod,Response_time=count_number,
        Correct=correct)
        return JsonResponse(correct, safe=False)

def game_area_end(request,pk):
    nostalgiaGame_round = NostalgiaGame_round.objects.all().first()
    gamemod = GameMod.objects.get(username = Userdata.objects.get(pk=pk), game_mod="NostalgiaGame")
    nostalgiaGame_player = NostalgiaGame_player.objects.filter(mod=gamemod).first()
    return  render(request, 'chat/gameEnd.html', locals())

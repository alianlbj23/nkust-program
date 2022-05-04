from ast import NotIn
from cgi import test
import json
import os
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mblog.settings')
from channels.generic.websocket import WebsocketConsumer
#from channels.generic.websocket import AsyncWebsocketConsumer
from asgiref.sync import async_to_sync
from robot.models import *
from django.shortcuts import redirect
import threading
import time
from django.shortcuts import render
from robot.models import *
import random
from random import choice, shuffle
#--------------------------------------------------------------------------------
import socket
from robot.models import *
# HOST = '192.168.0.7'
# PORT = 9559
# server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# server.bind((HOST, PORT))
# server.listen(40)
from email.header import Header
import socket
import threading
from turtle import Turtle
from datetime import date
from datetime import datetime
global EnterGameKey
EnterGameKey = 0
global people_inroom#在遊戲防
people_inroom=0
ans_list = list()
def start():
    
    HOST = socket.gethostbyname(socket.gethostname())
    #PORT = 9559 #學校
    PORT = 5050 #家裡
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind((HOST, PORT))
    server.listen(40)
    while 1:
        print("running")
        conn, addr = server.accept()
        clientMessage = str(conn.recv(1024), encoding='utf-8')
        print('Client message is:', clientMessage)
        #serverMessage = 'I\'m here!'
        if clientMessage == "end":#機器人關機時做的動作
            serverMessage = "[Server system state]: Close"
            conn.sendall(serverMessage.encode())
            conn.close()
        elif clientMessage == "EnterGame":
            if people_inroom == 0:
                message = "NoPeople"
                conn.sendall(message.encode())
                print("[都沒人，無法開始]")
            else:
                correct_people = 0
                error_people = 0
                global ans_number
                ans_list.clear()
                ans_number = ''
                n_last = Songlist.objects.all().first()
                n_first = Songlist.objects.all().last()
                while 1:
                    pk = random.randint(n_first.pk,n_last.pk)
                    target = Songlist.objects.filter(pk=pk)
                    if target.count() != 0:
                        break
                print("pk", pk)
                ans = Songlist.objects.filter(pk=pk)
                ans_url = list(ans.values('url'))[0]['url']
                ans_songName = list(ans.values('song_name'))[0]['song_name']#先處理答案在處理剩餘3個題目
                ans_list.append(ans_songName)
                for i in range(3):#處理剩餘題目
                    while 1:#直到這個pk是有東西且陣列中沒有
                        pk = random.randint(n_first.pk,n_last.pk)
                        target = Songlist.objects.filter(pk=pk)
                        target_songName = list(target.values('song_name'))[0]['song_name']
                        replace_check = target_songName in ans_list
                        if target.count() != 0 and replace_check != True:
                            break
                    ans_list.append(target_songName)
                shuffle(ans_list)
                ans_number = ans_list.index(ans_songName)
                print("[ans_songName]:", ans_songName)
                print("[ans_number]", ans_number)
                print("List:!!!!!!!!!!!!!!!!!!!",ans_list)
                serverMessage = ans_url
                conn.sendall(serverMessage.encode())#傳送url給機器人
                EnterGameKey = 1
                nostalgiaGame_round = NostalgiaGame_round.objects.create(Total_poeple=people_inroom)
                nostalgiaGame_round.save()
                nostalgiaGame_round_pk = NostalgiaGame_round.objects.all().first().pk
t = threading.Thread(target = start)
t.start()

class ChatConsumer(WebsocketConsumer):
    
    #print("WebsocketConsumer", WebsocketConsumer)
    def connect(self):
        #print("connect")
        self.room_group_name = 'test'
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )
        test = self.channel_layer.groups.get('test', {}).items()
        
        self.accept()

    def disconnect(self, close_code):
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )
        
    def receive(self, text_data=None):
       
        text_data_json = json.loads(text_data)
        readyPeople = int(text_data_json['readyPeople'])
        #selfFlag = int(text_data_json['selfFlag'])
        try:#準備好的人數
            global readyPeople_in
            global testflag
            selfFlag = int(text_data_json['selfFlag'])
            if selfFlag == 3:#好像是偵測有沒有跳掉
                print("trig!!!!!!!!!!!!")
                readyPeople_in -= 1
            readyPeople_in += 1
            print("readyPeople Number:", readyPeople_in)
        except:
            pass
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type':'chat_message',
                'count':count,
                'readyPeople':readyPeople,
                'readyPeople_in':readyPeople_in,
                #'readyPeopleNumber':readyPeopleNumber,
            }
        )
    def chat_message(self, event):
        global EnterGameKey
        global readyPeople_in
        readyPeople = event['readyPeople']
        self.send(text_data=json.dumps({
            'type':'chat',
            'count':count,
        #'readyPeopleNumber':readyPeopleNumber,
        })) 


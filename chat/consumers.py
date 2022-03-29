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
# HEADER = 1000
# SERVER = socket.gethostbyname(socket.gethostname()) #自動讀取server端IPv4網路IP
# print("ipv4:", SERVER)
# PORT = 9559
# ADDR = (SERVER, PORT) #將IP跟PORT放入ADDR中
# FORMAT = 'utf-8'
# DISCONNECT_MESSAGE = "!DISCONNECT" #設置連接失敗訊息


# server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  #socket.AF_INET	於伺服器與伺服器之間進行串接
#                                                             #socket.SOCK_STREAM	使用TCP(資料流)的方式提供可靠、雙向、串流的通信頻道
# server.bind(ADDR) #bind函式，用於伺服器端需監聽的IP位址和Port。

# def handle_client(conn, addr):
#     global readyPeople_in
#     print(f"[NEW CONNECTIONS] {addr} connected.") #print(f+"string")運算式嵌入在字串常數中

#     connected = True
#     while connected:
#         #msg_length = conn.recv(HEADER).decode(FORMAT) #recv(bufsize)。bufsize: 為宣告接收最多字數值
#         msg_length = conn.recv(HEADER).decode(FORMAT)
#         if msg_length:
#             msg = str(conn.recv(1024), encoding='utf-8')
#             if msg == DISCONNECT_MESSAGE:
#                 connected = False
#             print("收到訊息:", msg)
#             break
            
# def start():
#     server.listen()
#     print(f"[LISTENING] Server is listening on {SERVER}")
#     while True:
#         conn, addr = server.accept()
#         thread = threading.Thread(target=handle_client, args=(conn, addr))
#         thread.start()
#         print(f"[ACTIVE CONNECTIONS] {threading.activeCount() -1}") #顯示有幾比連線傳來的資料
#         serverMessage = 'I\'m here!'
#         conn.send(serverMessage.encode())
#--------------------------------------------------------------------------------server.py
global EnterGameKey
EnterGameKey = 0
global ans_number
ans_number = ''
ans_list = list()
def start():
    global EnterGameKey
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
        elif clientMessage == "ready":
            serverMessage = str(count)+'/'+str(readyPeople_in)
            conn.sendall(serverMessage.encode())
        elif clientMessage == "EnterGame":
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
            conn.sendall(serverMessage.encode())
            EnterGameKey = 1
            
            


t = threading.Thread(target = start)
t.start()

global count
global readyPeople_in
count = 0
readyPeople_in = 0
class ChatConsumer(WebsocketConsumer):
    
    #print("WebsocketConsumer", WebsocketConsumer)
    def connect(self):
        #print("connect")
        global count
        self.room_group_name = 'test'
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )
        test = self.channel_layer.groups.get('test', {}).items()
        count+=1
        print("在現人數: ", count)
        
        self.accept()

    def disconnect(self, close_code):
        global count
        global readyPeople_in
        #print("goodbyte")
        count-=1
        print("在現人數: ", count)
        print("readyPeople_in", readyPeople_in)
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )
        
    def receive(self, text_data=None):
        #print("text_data",text_data)
        global EnterGameKey
        #print("self check", self)
        text_data_json = json.loads(text_data)
        global count
        readyPeople = int(text_data_json['readyPeople'])
        #selfFlag = int(text_data_json['selfFlag'])
        try:#準備好的人數
            global readyPeople_in
            selfFlag = int(text_data_json['selfFlag'])
            if selfFlag == 3:
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
                'EnterGameKey':EnterGameKey,
                #'readyPeopleNumber':readyPeopleNumber,
            }
        )
    def chat_message(self, event):
        global EnterGameKey
        #print("broadcast")
        #print("event",event)
        #message = event['readyPeopleNumber']
        global readyPeople_in
        readyPeople = event['readyPeople']
        EnterGameKey = event['EnterGameKey']
        self.send(text_data=json.dumps({
            'type':'chat',
            'count':count,
            'readyPeople_in':readyPeople_in,
            'EnterGameKey':EnterGameKey,
        #'readyPeopleNumber':readyPeopleNumber,
        })) 
        if EnterGameKey==1:
            EnterGameKey = 0
        
class ChatConsumer2(WebsocketConsumer):
    
    def connect(self):
        print("connect")
        global count
        self.room_group_name = 'test2'
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )
        test = self.channel_layer.groups.get('test2', {}).items()
        
        
        self.accept()

    def disconnect(self, close_code):
        
        
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )
        
    def receive(self, text_data):
        global ans_number
        text_data_json = json.loads(text_data)
        goBack = text_data_json['goBack']
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type':'chat_message',
                'choice0':ans_list[0],
                'choice1':ans_list[1],
                'choice2':ans_list[2],
                'choice3':ans_list[3],
                'ans_number':ans_number,
                'goBack':goBack,
            }
        )
    def chat_message(self, event):
        choice0 = event['choice0']
        choice1 = event['choice1']
        choice2 = event['choice2']
        choice3 = event['choice3']
        ans_number = event['ans_number']
        goBack = event['goBack']
        self.send(text_data=json.dumps({
            'type':'chat',
            'choice0':choice0,
            'choice1':choice1,
            'choice2':choice2,
            'choice3':choice3,
            'ans_number':ans_number,
            'goBack':goBack,
        #'readyPeopleNumber':readyPeopleNumber,
        }))
    
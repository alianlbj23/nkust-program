from cgi import test
import json
from channels.generic.websocket import WebsocketConsumer
#from channels.generic.websocket import AsyncWebsocketConsumer
from asgiref.sync import async_to_sync
from robot.models import *
from django.shortcuts import redirect
import threading
import time

from django.shortcuts import render
from robot.models import *
#--------------------------------------------------------------------------------
import socket
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
            serverMessage = "[Server system state]: Next state"
            conn.sendall(serverMessage.encode())
            EnterGameKey = 1
            

t = threading.Thread(target = start)
t.start()

global count
global readyPeople_in
count = 0
readyPeople_in = 0
class ChatConsumer(WebsocketConsumer):
    def connect(self):
        print("connect")
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
        print("goodbyte")
        count-=1
        print("在現人數: ", count)
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )
        
    def receive(self, text_data):
        global EnterGameKey
        print("receive")
        text_data_json = json.loads(text_data)
        global count
        readyPeople = int(text_data_json['readyPeople'])
        try:#準備好的人數
            selfFlag = int(text_data_json['selfFlag'])
            global readyPeople_in
            readyPeople_in += 1
            print("readyPeople Number:", readyPeople_in)
        except:
            pass
        # if EnterGameKey == 1:
        #     async_to_sync(self.channel_layer.group_send)(
        #         self.room_group_name,
        #         {
        #             'type':'chat_message',
        #         }
        #     )   
        # else:
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
        print("!!!!!", self, event)
        global EnterGameKey
        print("broadcast")
        #message = event['readyPeopleNumber']
        global readyPeople_in
        readyPeople = event['readyPeople']
        self.send(text_data=json.dumps({
            'type':'chat',
            'count':count,
            'readyPeople_in':readyPeople_in,
            'EnterGameKey':EnterGameKey,
        #'readyPeopleNumber':readyPeopleNumber,
        }))
        if EnterGameKey==1:
            EnterGameKey = 0
        
# class ChatConsumer(WebsocketConsumer):
#     def connect(self):
#         print("connect")
#         global count
#         self.room_group_name = 'test'
#         async_to_sync(self.channel_layer.group_add)(
#             self.room_group_name,
#             self.channel_name
#         )
#         test = self.channel_layer.groups.get('test', {}).items()
#         count+=1
#         print("在現人數: ", count)
#         self.accept()

#     def disconnect(self, close_code):
#         global count
#         print("goodbyte")
#         count-=1
#         print("在現人數: ", count)
#         async_to_sync(self.channel_layer.group_discard)(
#             self.room_group_name,
#             self.channel_name
#         )
#         # global readyPeople_in
#         # readyPeople_in -= 1
#         # print("執行減一")
#         # self.send(text_data=json.dumps({
#         #     'type':'chat',
#         #     'count':count,
#         #     'readyPeople_in':readyPeople_in,
#         #     #'readyPeopleNumber':readyPeopleNumber,
#         # }))
        

#     def receive(self, text_data):
#         flag = 0
#         print("receive")
#         text_data_json = json.loads(text_data)
#         global count
#         readyPeople = int(text_data_json['readyPeople'])
#         try:#準備好的人數
#             selfFlag = int(text_data_json['selfFlag'])
#             global readyPeople_in
#             readyPeople_in += 1
#             flag = 1
#             print("readyPeople Number:", readyPeople_in)
#         except:
#             pass
#         #readyPeopleNumber = text_data_json['readyPeopleNumber']
#         if flag == 0:
#             print("no flag")
#             async_to_sync(self.channel_layer.group_send)(
#                 self.room_group_name,
#                 {
#                     'type':'chat_message',
#                     'count':count,
#                     'readyPeople':readyPeople,
#                     'readyPeople_in':readyPeople_in,
#                     #'readyPeopleNumber':readyPeopleNumber,
#                 }
#             )
#         else:
#             print("detect flag")
#             async_to_sync(self.channel_layer.group_send)(
#                 self.room_group_name,
#                 {
#                     'type':'chat_message',
#                     'count':count,
#                     'readyPeople':readyPeople,
#                     'readyPeople_in':readyPeople_in,
#                     'flag':flag,
#                     #'readyPeopleNumber':readyPeopleNumber,
#                 }
#             )
#     def chat_message(self, event):
#         print("broadcast")
#         #message = event['readyPeopleNumber']
#         global readyPeople_in
#         readyPeople = event['readyPeople']
#         flag2 = 0
#         try:
#             print("detect flag2")
#             flag = event['flag']
#             flag2 = 1
#             self.send(text_data=json.dumps({
#                 'type':'chat',
#                 'count':count,
#                 'readyPeople':readyPeople,
#                 'readyPeople_in':readyPeople_in,
#                 'flag2':flag2,
#             #'readyPeopleNumber':readyPeopleNumber,
#             }))
#         except:
#             print("no flag2")
#             flag2 = 0
#             self.send(text_data=json.dumps({
#                 'type':'chat',
#                 'count':count,
#                 'readyPeople':readyPeople,
#                 'readyPeople_in':readyPeople_in,
#                 'flag2':flag2,
#                 #'readyPeopleNumber':readyPeopleNumber,
#             }))
    
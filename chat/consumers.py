import json
from channels.generic.websocket import WebsocketConsumer
from asgiref.sync import async_to_sync
from robot.models import *
from email.header import Header
import socket
import threading
from turtle import Turtle

HEADER = 64
SERVER = socket.gethostbyname(socket.gethostname()) #自動讀取server端IPv4網路IP
PORT = 9559
ADDR = (SERVER, PORT) #將IP跟PORT放入ADDR中
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "!DISCONNECT" #設置連接失敗訊息
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  #socket.AF_INET	於伺服器與伺服器之間進行串接
                                                            #socket.SOCK_STREAM	使用TCP(資料流)的方式提供可靠、雙向、串流的通信頻道
server.bind(ADDR) #bind函式，用於伺服器端需監聽的IP位址和Port。

def handle_client(conn, addr):
    print(f"[NEW CONNECTIONS] {addr} connected.") #print(f+"string")運算式嵌入在字串常數中

    connected = True
    while connected:
        msg_length = conn.recv(HEADER).decode(FORMAT) #recv(bufsize)。bufsize: 為宣告接收最多字數值
        if msg_length:
            msg_length = int(msg_length)
            msg = conn.recv(msg_length).decode(FORMAT)
            if msg == DISCONNECT_MESSAGE:
                connected = False

            print(f"[{addr}] {msg}")
def start():
    key = 0
    server.listen()
    print(f"[LISTENING] Server is listening on {SERVER}")
    while key==0:
        key = 1
        conn, addr = server.accept()
        thread = threading.Thread(target=handle_client, args=(conn, addr))
        thread.start()
        break
        print("noBreak")
        print(f"[ACTIVE CONNECTIONS] {threading.activeCount() -1}") #顯示有幾比連線傳來的資料

'''
class ChatConsumer(WebsocketConsumer):
    def connect(self):
        self.room_group_name = 'test'
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )

        self.accept()

    def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json['message']

        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type':'chat_message',
                'message':message
            }
        )

    def chat_message(self, event):
        message = event['message']

        self.send(text_data=json.dumps({
            'type':'chat',
            'message':message
        }))
'''
global count
global readyPeople_in
count = 0
readyPeople_in = 0
class ChatConsumer(WebsocketConsumer):
    def connect(self):
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
        text_data_json = json.loads(text_data)
        
        readyPeople = int(text_data_json['readyPeople'])
        try:
            selfFlag = int(text_data_json['selfFlag'])
            global readyPeople_in
            readyPeople_in += 1
            print("test!!!!!!!!!!!!!",readyPeople_in)
        except:
            pass
        #readyPeopleNumber = text_data_json['readyPeopleNumber']
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
        #message = event['readyPeopleNumber']
        global readyPeople_in
        readyPeople = event['readyPeople']
        self.send(text_data=json.dumps({
            'type':'chat',
            'count':count,
            'readyPeople':readyPeople,
            'readyPeople_in':readyPeople_in,
            #'readyPeopleNumber':readyPeopleNumber,
        }))

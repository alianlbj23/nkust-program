from email.header import Header
import socket
import threading
from turtle import Turtle


HEADER = 64
PORT = 5050
#SERVER = "192.168.0.13" 
SERVER = socket.gethostbyname(socket.gethostname())
ADDR = (SERVER, PORT)
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "!DISCONNECT"


server = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #socket.AF_INET 於伺服器與伺服器之間進行串接 
                                                           #socket.SOCK_STREAM	使用TCP(資料流)的方式提供可靠、雙向、串流的通信頻道
server.bind(ADDR)

def handle_client(conn, addr):
    print(f"[NEW CONNECTIONS] {addr} connected.") 

    connected = True
    while connected:
        msg_length = conn.recv(HEADER).decode(FORMAT)
        if msg_length:
            msg_length = int(msg_length)
            msg = conn.recv(msg_length).decode(FORMAT)
            if msg == DISCONNECT_MESSAGE:
                connected = False

            print(f"[{addr}] {msg}")





def start():
    server.listen()
    print(f"[LISTENING] Server is listening on {SERVER}")
    while True:
        conn, addr = server.accept()
        thread = threading.Thread(target=handle_client, args=(conn, addr))
        thread.start()
        print(f"[ACTIVE CONNECTIONS] {threading.activeCount() -1}")

print("[STARTING] server is starting...")
start()
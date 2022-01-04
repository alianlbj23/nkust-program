# 樂齡活化大腦遊戲系統 

## <u><font size=6 color="red">系</font></u>統介紹
本系統利用***MMSE***量表中的**定向感**、**注意力**、**記憶**和**懷舊治療**做延伸而製作成，將透過**網站**和**Pepper機器人**做到人機互動的效果，主要目的是活化高齡者的腦袋。
- 網站框架:Django
- 前台撰寫語言:Html、Jquery、Javascript、Css、Django內建前端邏輯語言
- 後台撰寫語言:Python
- 資料庫:Mysql
- 部屬平台:Apache

## <u><font size=6 color="red">該</font></u>如何執行程式碼?
(在WINDOWS環境底下是使用ANACONDA，若在LINUX底下是用UBUNTU的終端機)
### 環境安裝與啟動系統
1. **安裝Apache網頁伺服器**
    在Ubuntu環境下安裝:
    ```
    sudo apt-get update
    sudo apt-get install apache2
    ```
    讓Apache2辨識Python程式，安裝mod_wsgi:
    `sudo apt-get install libapache2-mod-wsgi`
    
2. **安裝虛擬環境**
    安裝Pyhton的pip和虛擬環境程式如下:
    ```
    sudo apt-get install python-pip
    sudo apt-get install virtualenv
    ```
    去/var/www底下，使用virtualenv建立虛擬環境並啟用
    ```
    cd /var/www #到/var/www底下
    virtualenv VENV #建立虛擬環境
    source VENV/bin/active #啟動虛擬環境
    sudo mkdir -r nkust-program 
    cd nkust-program
    ```
    到nkust-program底下將程式碼clone下來
3. **下載相關模組**
    將此程式需要的所有模組都下載到虛擬環境中:
    `sudo pip install -r requirement.txt`
    
    :warning:<font color="red">注意!:輸入這段程式後，可能會出現錯誤，那是utf-8的問題，解決方法如下:
    </font>
    
    `
    vim /etc/apache2/envvars 
    `
    開啟這個檔案後輸入以下這兩行:
    ```
    export LANG='en_US.UTF-8'
    export LC_ALL='en_US.UTF-8'
    ```
    並將這行註解掉:
    `export LANG=C`

4. **讓Apache存取到wsgi檔**
    為了讓Apache能順利讀到wsgi.py檔，要去/etc/apache2/site-enabled/000-default.conf修改檔案:
    (本程式的wsgi.py檔在nkust-program/mblog/底下)
    `vim /etc/apache2/site-enabled/000-default.conf`
    接著在<VirtualHost *:80>到</VirtualHost>之間輸入以下程式:
    ```
    WSGIDaemonProcess nkust-porgram python-path=/var/www/nkust-program:/var/www/VENV/lib/python3.8/site-packages
    WSGIProcessGroup nkust-program
    WSGIScriptAlias / /var/www/nkust-program/mblog/wsgi.py
    ```
5. **讓Apache讀取靜態檔**
    本程式的靜態檔位於nkust-program/media底下，要讓Apache把這個資料夾的存取權限打開，一樣去/etc/apache2/site-enabled/000-default.conf輸入以下程式碼:
    ```
    Alias /static/ /var/www/nkust-program/media/
    <Directory /var/www/nkust-program/media>
        Require all granted
    </Directory>
    
    <Directory /var/www/nkust-program/mblog>
        <Files wsgi.py>
            Require all granted
        </Files>
    </Directory>
    ```
    
6. **在Django使用MySQL資料庫**
    先在終端機輸入以下指令下載MySQL:
    ```
    sudo apt-apt update
    sudo apt-apt upgrade
    sudo apt-apt install mysql-server
    sudo apt-apt install mysql-client
    ```
    創立MySQL的帳密，於終端機輸入:
    `mysql_secure_installation`
    (輸入密碼時要輸入:<font color="red">@asdfg@</font>，因為在/nkust-porgram/mblog/setting.py中，此程式的MySQL密碼是設定為@asdfg@，此外也建議密碼強度設定在弱或中，不然後續會很多麻煩)
    
    於終端機輸入以下程式，進入MySQL交談式操作系統介面:
    `mysql -u root -p`
    登入之後，輸入以下程式，創建資料庫:
    `create database ch07www;`
    (在此設定資料庫名稱為ch07www，是因為在/nkust-porgram/mblog/setting.py中，是將資料庫設命名為ch07www)
    
    安裝Python的MySQL的驅動程式如下:
    `sudo apt-get install python3-dev libmysqlclient-dev`
    進入虛擬環境後，安裝pip需要的套件:
    `sudo pip install mysqlclient`
    
    以上都做完後，執行底下程式，讓Django連接本地端的資料庫:
    ```
    sudo pyhton3 manage.py makemigrations robot
    sudo pyhton3 manage.py migrate 
    ```
7. **重啟Apache**
    在做完一系列的修改之後，輸入以下指令重新開啟Apache:
    `sudo service apache2 restart`
    (修改過任何文件，都要重啟Apache)

8. **開啟系統**
    有兩種方法可以開啟系統
    - 在本地端開啟
    - 在架好伺服器開啟
    
    在本地端開啟的方式是在/nkust-program/manage.py同個目錄下輸入:
    `sudo python3 manage.py runserver`
    接著在瀏覽器上輸入:
    `127.0.0.1:8000`
    
    在伺服器上開啟只要在瀏覽器上輸入以下網址:
    `127.0.0.1`

9. ![warning](https://i.imgur.com/aqihbIN.png =20x20)<font color="red">**注意事項**</font>
    若照著以上步驟還是出現錯誤的話，可以去查看/var/www/apache2/log裡面的erro檔，將最底下的錯誤訊息複製到網路上，通常會有解。
    

## <u><font size=6 color="red">系</font></u>統各部分介紹
### 註冊及登入
- ### 操作方式
    使用者在註冊頁面時，需填寫的資料為**姓名、出生年月日、性別、大頭貼**這四筆資料，做為帳號個人資料。
    註冊成功後，登入畫面會出現使用者註冊時上傳的"頭像"，**點擊頭像**後即可登入。
  <a href="https://imgur.com/nBslCpW"><img src="https://i.imgur.com/nBslCpW.gif" title="source: imgur.com" /></a>
### 短期記憶
- ### 遊玩方式
    本遊戲一開始會出現**三張不同物種或可明顯區分類別**的圖片出現五秒，供高齡者記憶，然後出現**五張圖片**，一樣是不同物種或可明顯區分類別的圖片，高齡者要找出一開始出現的那三張圖片。
<a href="https://imgur.com/meeFpvJ"><img src="https://i.imgur.com/meeFpvJ.gif" title="source: imgur.com" /></a>
- ### 可以在哪裡找到該程式，以及該如何製作?
    在views.py底下可找到該部分的實作，可先從以下部份開始看起
    `def SortTermMemoryGame(request, pk, n, gameName):`
    該部分是處理如何運用資料夾的圖片選出五張完全不一樣的圖片輸出給前端，前端在經過互動之後，會利用ajax，將互動過後的數據回傳到後台的以下部分:
    `def sort_term_memory_ajax(request, pk):`
    進行對遊玩數據讀入資料庫的動作
### 定向力
- ### 遊玩方式
    該遊戲的設計為訓練高齡者的**方位感**及**記憶力**。利用四個顏色鮮明的色塊組合成一個正方形，供高齡者記憶，記憶五秒後，色塊消失，高齡者要用手指拖拉色塊至原先對應的位置。


### 注意力
- ### 遊玩方式
    當高齡者聽到明顯不同的**異音**時，高齡者須馬上**按下電腦按鈕**，由電腦紀錄其按鈕之正確性與延遲性。


### 老歌懷舊搶答
- ### 遊玩方式
    利用歌曲搶答的方式，讓高齡者聽取**前奏或副歌**等猜出此歌曲名稱。

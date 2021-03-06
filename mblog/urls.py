"""mblog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from robot.views import *
from django.conf import settings
from django.conf.urls.static import static
from chat.views import *


urlpatterns = [
    
    path('', login),
    path('index/<str:pk>/', index),
    path('logout/', logout),
    path('Signup/', signup),
    path('admin/', admin.site.urls),
    path('SortTermMemoryGame/<int:pk>/<int:n>/<str:gameName>/', SortTermMemoryGame),
    path('sort_term_memory_ajax/<int:pk>/', sort_term_memory_ajax),
    path('introduction/<int:pk>/<str:gameName>/',introduction),
    path('settlement/<int:pk>/<str:gameMod>/', settlement),
    path('AttentionGame/<int:pk>/<int:n>/<str:gameName>/', AttentionGame),
    path('AttentionGameAjax/<int:pk>/', AttentionGameAjax),
    path('OrientationGame/<int:pk>/<int:n>/<str:gameName>/',OrientationGame),
    path('OrientationAjax/<int:pk>/',OrientationAjax),
    path('OrientationPadGame/<int:pk>/<int:n>/<str:gameName>/',OrientationPadGame),
    path('NostalgiaGame/<int:pk>/<int:n>/<str:gameName>/', NostalgiaGame),
    path('historyEnterPage/<int:pk>/', historyEnterPage),
    path("historyYear/<int:pk>/<str:gameName>/", historyYear),
    path("historyMonth/<int:pk>/<str:gameName>/<int:year>/", historyMonth),
    path("historyDay/<int:pk>/<str:gameName>/<int:year>/<int:month>/", historyDay),
    path("historyChart/<int:pk>/<str:gameName>/<int:year>/<int:month>/<int:day>/", historyChart),
    path('chat/<int:pk>/', lobby),#????????????????????????
    path('chat/game/<int:pk>/', game_area),#????????????????????????
    path('chat/gameAjax/<int:pk>/', game_area_ajax),#????????????????????????
    path('chat/gameEnd/<int:pk>/', game_area_end),#????????????????????????
    #path('chat/<int:pk>/', include('chat.urls')),#????????????????????????
    #path('chat/game/<int:pk>/', ),
]
if settings.DEBUG: #???debug???????????????
    #django???????????????????????????????????????????????????????????????http://127.0.0.1:8000/media/image/~~~~~.jpg ??????????????????????????????????????????????????????
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)    

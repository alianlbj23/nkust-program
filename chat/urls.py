from django.urls import path 
from . import views 

urlpatterns = [
    path('', views.lobby),
    #path('game/<int:pk>/<int:n>/', views.game),
]
from django.urls import path
from . import views

urlpatterns = [
    path('', views.layout),
    path('avengers/', views.heroes),
]
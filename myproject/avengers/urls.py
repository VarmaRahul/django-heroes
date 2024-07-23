from django.urls import path
from . import views

urlpatterns = [
    path('', views.heros),
    path('layout/', views.layout),
]
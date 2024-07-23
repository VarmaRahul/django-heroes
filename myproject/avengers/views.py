from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from .models import *

# Create your views here.
def heros(request):
    hero = Avengers.objects.all().order_by('id')

    return render(request, 'avengers/heros.html', {'hero': hero})


def layout(request):
    #returns the layout page
    return render(request, 'avengers/layout.html')
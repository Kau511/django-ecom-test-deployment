from django.shortcuts import render
from .models import *
from .forms import *
from django.http import JsonResponse
# Create your views here.

def home(request):
    form = CommentForm()
    if request.method == 'POST':
        form = CommentForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            comment = Comment(
                name = cd['name'],
                text = cd['text']
            )
            comment.save()
            return JsonResponse({'message':'success'})
            
    return render(request, 'index.html', context={'form':form})

def product(request):
    product = Product.objects.all().values()
    return JsonResponse({'message':list(product)})
from django.db import models

# Create your models here.

class Comment(models.Model):
    name = models.CharField(max_length=55)
    text = models.TextField()
    
class Product(models.Model):
    name = models.CharField(max_length=55)
    price =models.DecimalField(max_digits=5,decimal_places=2)
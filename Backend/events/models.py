from django.db import models
from accounts.models import User

# Create your models here.
class Club(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    members = models.ManyToManyField(to=User, related_name='clubs')
    joining_fee = models.FloatField(default=0.0)

    def __str__(self):
        return self.name


class Event(models.Model):

    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    date = models.DateTimeField()
    location = models.CharField(max_length=100)
    club = models.ForeignKey(Club, on_delete=models.CASCADE)
    joining_fee = models.FloatField(default=0.0)

    def __str__(self):
        return self.name
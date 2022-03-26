from django.db import models
from accounts.models import ClubProfile
from accounts.models import User


class Event(models.Model):

    name = models.CharField(max_length=100)
    description = models.TextField(blank=True)
    date = models.DateTimeField()
    location = models.CharField(max_length=100)
    club = models.ForeignKey(ClubProfile, on_delete=models.CASCADE)
    members = models.ManyToManyField(to=User, related_name='events')
    joining_fee = models.FloatField(default=0.0)

    def __str__(self):
        return self.name
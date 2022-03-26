from django.contrib import admin
from .models import Event, ClubProfile

# Register your models here.

admin.site.register([Event, ClubProfile])

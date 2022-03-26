from django.contrib import admin
from .models import InitialCounters, StudentProfile, User

# Register your models here.

@admin.register(User)
class UserProfileAdmin(admin.ModelAdmin):
    pass

admin.site.register(StudentProfile)
admin.site.register(InitialCounters)
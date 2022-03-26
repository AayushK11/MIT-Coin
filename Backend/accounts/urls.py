from django.urls import path
from .views import AuthViewSet

login = AuthViewSet.as_view({
    "post": "login"
})

register = AuthViewSet.as_view({
    "post": "regitser"
})

urlaptterns = [
    path("register/", register, name="register"),
    path("login/", login, name="login"),
]

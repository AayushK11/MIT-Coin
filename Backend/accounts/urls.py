from django.urls import path
from .views import AuthViewSet

login = AuthViewSet.as_view({
    "post": "login"
})

register = AuthViewSet.as_view({
    "post": "regitser"
})

transact = AuthViewSet.as_view({
    "get": "transact"
})

urlaptterns = [
    path("register/", register, name="register"),
    path("login/", login, name="login"),
    path("transact/<str:from_user>/<str:to_user>/<float:amount>/<str:description>/", transact, name="transact"),
]

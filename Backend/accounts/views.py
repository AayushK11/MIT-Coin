from rest_framework.viewsets import ViewSet
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated

from django.contrib.auth.password_validation import validate_password
from django.core.validators import validate_email
from django.forms import ValidationError
from django.db import IntegrityError
from django.contrib.auth import authenticate

from .models import InitialCounters, Ledger, Rewards, StudentProfile, User
from .serializers import StudentProfileSerializer, UserSerializer
from django.db.models import Sum
import random

def price_decrease(Amount, total_student_coins, coin_value):

    percentage_change = (
        (total_student_coins - Amount) - total_student_coins
    ) / total_student_coins
    coin_value = coin_value + (coin_value * percentage_change)
    return coin_value

def price_increase(Amount, total_student_coins, coin_value):

    percentage_change = (
        (total_student_coins + Amount) - total_student_coins
    ) / total_student_coins
    coin_value = coin_value + (coin_value * percentage_change)
    return coin_value


class AuthViewSet(ViewSet):
    def register(self, request: Request) -> Response:

        data = request.data
        email = data.get("email", None)
        password = data.get("password", None)
        name = data.get("name", None).split(" ")
        message, status_code = None, None

        if email and password:

            try:
                validate_email(email)
                if "@vmware.com" not in email:
                    raise ValidationError("Only VMware members allowed")

                try:
                    validate_password(password=password)

                    try:
                        user = User.objects.create_user(
                            email=email, password=password, role="student"
                        )
                        user.student_profile.create(first_name=name[0], last_name=name[1])
                        message, status_code = (
                            "User registered scuccessfully",
                            status.HTTP_201_CREATED,
                        )

                    except IntegrityError as e:
                        message, status_code = (
                            "User with this email already exists",
                            status.HTTP_400_BAD_REQUEST,
                        )

                except ValidationError as e:
                    message, status_code = e, status.HTTP_400_BAD_REQUEST

            except ValidationError as e:
                message, status_code = e, status.HTTP_400_BAD_REQUEST

            # implement otp auth if required and create a separate view for user creation after that
            # or check if the vmware email exisits in vmware database through vmware api

        else:

            message, status_code = (
                "Supply fields: email, password",
                status.HTTP_400_BAD_REQUEST,
            )

        return Response(data={"message": message}, status=status_code)

    def login(self, request) -> Response:

        data = request.data
        email = data.get("email", "shantanu@mit.com")
        password = data.get("password", "password")
        message, status_code = None, None

        if not any((email, password)):

            message, status_code = (
                "Supply fields: email, password",
                status.HTTP_400_BAD_REQUEST,
            )

        else:

            user = authenticate(request, username=email, password=password)

            if user:

                token = Token.objects.get(user=user)
                student_profile = StudentProfile.objects.get(owner=user)
                serialized_user = StudentProfileSerializer(student_profile)
                data = serialized_user.data

                ledgers = Ledger.objects.filter(from_user=user)

                s = 0
                for i in ledgers:
                    s += i.amount

                data["total_spent"] = s
                data["total_cashback"] = user.rewards.all().annotate(total_cashback=Sum("amount"))
                if(len(data["total_cashback"]) != 0):
                    data["total_cashback"] = data["total_cashback"].last().total_cashback
                data["coin_value"] = InitialCounters.objects.get().value_of_coin
                message, status_code = {
                    "token": token.key,
                    "profile": data,
                }, status.HTTP_200_OK

            else:

                message, status_code = "Wrong credentails", status.HTTP_400_BAD_REQUEST

        return Response(data={"message": message}, status=status_code)

    def forgot_password(self, request: Request) -> Response:
        pass

    def validate_token(self, request: Request) -> Response:
        data = request.data
        token = data.get("token")
        if Token.objects.filter(key=token).exists():
            return Response({}, status=status.HTTP_200_OK)
        return Response({}, status=status.HTTP_401_UNAUTHORIZED)
    
    def transact(self, request, from_user, to_user, amount):
        
        from_user = User.objects.get(wallet_link=from_user)
        to_user = User.objects.get(wallet_link=to_user)
        if from_user.wallet_balance < amount:
            raise ValidationError("Insuffiecient balance")
        from_user.wallet_balance -= amount
        to_user.wallet_balance += amount
        Ledger.objects.create(
            from_user=from_user,
            to_user=to_user,
            amount=amount,
            description="default desc",
        )
        from_user.save()
        to_user.save()
        Ledger.objects.create(
            from_user=from_user,
            to_user=to_user,
            amount=amount,
            description=f"Vendor paid {to_user.email}",
        )
        ic = InitialCounters.objects.get()
        total_student_coins = ic.student_balance
        current_coin_value = price_decrease(amount, total_student_coins, ic.value_of_coin)
        ic.value_of_coin = current_coin_value
        ic.save()
        cashback = "Better luck next time"
        if not amount < 5:
            upper_limit = amount * 0.5
            lower_limit = amount * 0.1
            cashback = round(random.uniform(lower_limit, upper_limit), 2)
            Rewards.objects.create(
                to_user=from_user,
                amount=cashback,
            )
            from_user.wallet_balance += cashback
            from_user.save()
            ic = InitialCounters.objects.get()
            total_student_coins = ic.student_balance
            current_coin_value = price_increase(cashback, total_student_coins, ic.value_of_coin)
            ic.value_of_coin = current_coin_value
            ic.save()
        return Response(str(cashback), status=200)


class LoggedInOpsViewSet(ViewSet):

    persmission_classes = (IsAuthenticated,)

    def profile(self, request: Request) -> Response:
        message, status_code = None, None
        serialized_user = UserSerializer(request.user)
        message, status_code = serialized_user.data, status.HTTP_200_OK
        return Response({"message": message}, status=status_code)

    def update_user_info(self, request: Request) -> Response:
        pass
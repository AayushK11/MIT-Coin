import hashlib

from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser,
    BaseUserManager,
    PermissionsMixin,
)
from django.db import models
from django.utils import timezone

from rest_framework.authtoken.models import Token


class UserManager(BaseUserManager):
    def _create_user(self, email, password, is_staff, is_superuser, **extra_fields):
        if not email:
            raise ValueError("Users must have an email address")
        now = timezone.now()
        email = self.normalize_email(email)
        user = self.model(
            email=email,
            is_staff=is_staff,
            is_active=True,
            is_superuser=is_superuser,
            last_login=now,
            date_joined=now,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        Token.objects.create(user=user)
        return user

    def create_user(self, email, password, **extra_fields):
        return self._create_user(email, password, False, False, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        user = self._create_user(email, password, True, True, **extra_fields)
        return user


class User(AbstractBaseUser, PermissionsMixin):

    ROLES = (
        ("student", "student"),
        ("college", "college"),
    )

    email = models.EmailField(max_length=254, unique=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = "email"
    EMAIL_FIELD = "email"
    REQUIRED_FIELDS = []

    objects = UserManager()

    phone_no = models.CharField(max_length=10, blank=True, null=True)
    transaction_pin = models.CharField(max_length=4, blank=True, null=True)
    wallet_link = models.CharField(max_length=100, blank=True, null=True)
    wallet_balance = models.FloatField(default=100.0)
    role = models.CharField(max_length=10, blank=True, null=True, choices=ROLES)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        self.wallet_link = hashlib.sha256(f"{self.pk}{self.email}".encode()).hexdigest()
        super().save(*args, **kwargs)


class ClubProfile(models.Model):

    DEPARTMENTS = (
        ("CSE", "Department of computer Science"),
        ("ECE", "Department of E&TC"),
        ("IT", "Department of IT"),
    )

    owner = models.ForeignKey(to=User, on_delete=models.CASCADE, related_name="club_profile")
    dept_name = models.CharField(max_length=255, default="CSE", choices=DEPARTMENTS)
    name = models.CharField(max_length=100)
    description = models.TextField()
    members = models.ManyToManyField(to=User, related_name='clubs')
    joining_fee = models.FloatField(default=0.0)

    def save(self, *args, **kwargs):
        if self.owner.role == "college":
            super().save(*args, **kwargs)


class VendorProfile(models.Model):
    owner = models.ForeignKey(to=User, on_delete=models.CASCADE, related_name="vendor_profiles")
    name = models.CharField(max_length=255, default="Tuck")


class CollegeProfile(models.Model):
    owner = models.ForeignKey(to=User, on_delete=models.CASCADE, related_name="college_profiles")
    name = models.CharField(max_length=255, default="Tuck")


class StudentProfile(models.Model):
    owner = models.ForeignKey(to=User, on_delete=models.CASCADE, related_name="student_profiles")
    first_name = models.CharField(max_length=30, blank=True, null=True)
    last_name = models.CharField(max_length=30, blank=True, null=True)


class InitialCounters(models.Model):

    mit_balance = models.FloatField(default=75000.0)
    value_of_coin = models.FloatField(default=10.0)

    @property
    def student_balance(self):
        total = 0
        for student in User.objects.filter(role=student):
            total += student.wallet_balance
        return total


class Ledger(models.Model):

    from_user = models.ForeignKey(to=User, on_delete=models.CASCADE, related_name="my_trans")
    to_user = models.ForeignKey(to=User, on_delete=models.CASCADE)
    amount = models.FloatField(default=0.0)
    description = models.TextField(default="")

class Rewards(models.Model):

    to_user = models.ForeignKey(to=User, on_delete=models.CASCADE, related_name="rewards")
    amount = models.FloatField(default=0.0)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        ic = InitialCounters.objects.get()
        ic.mit_balance -= self.amount
        ic.save()
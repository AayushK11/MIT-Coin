from rest_framework import serializers


class UserSerializer(serializers.Serializer):

    email = serializers.EmailField(max_length=254)
    wallet_link = serializers.CharField(max_length=254)
    wallet_balance = serializers.CharField(max_length=254)


class StudentProfileSerializer(serializers.Serializer):

    owner = UserSerializer()
    pk = serializers.IntegerField()
    first_name = serializers.CharField(max_length=30)
    last_name = serializers.CharField(max_length=30)

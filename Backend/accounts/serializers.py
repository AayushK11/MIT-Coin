from rest_framework import serializers


class UserSerializer(serializers.Serializer):

    email = serializers.EmailField(max_length=254)
    name = serializers.CharField(max_length=254)
    wallet_link = serializers.CharField(max_length=254)
from rest_framework import serializers
from accounts.serializers import UserSerializer


class ClubSerializer(serializers.Serializer):

    pk =serializers.IntegerField()
    owner = UserSerializer()
    dept_name = serializers.CharField(max_length=255)
    name = serializers.CharField(max_length=100)
    description = serializers.CharField()
    members = UserSerializer(many=True)
    joining_fee = serializers.FloatField(default=0.0)

class EventSerializer(serializers.Serializer):

    name = serializers.CharField(max_length=100)
    description = serializers.TextField(blank=True)
    date = serializers.DateTimeField()
    location = serializers.CharField(max_length=100)
    club = ClubSerializer()
    joining_fee = serializers.FloatField()
    members = UserSerializer(many=True)

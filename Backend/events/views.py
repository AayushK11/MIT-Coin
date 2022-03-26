from django.forms import ValidationError
from .models import Event
from accounts.models import ClubProfile, StudentProfile
from .serializers import EventSerializer, ClubSerializer
from rest_framework.viewsets import ViewSet
from rest_framework.response import Response


class ClubViewSet(ViewSet):
    
    def list_clubs(self, request):
        clubs = ClubProfile.objects.all()
        serilaized_clubs = ClubSerializer(clubs, many=True)
        return Response(serilaized_clubs.data, status=200)

    def club_details(self, request, pk):
        club = ClubProfile.objects.get(pk=pk)
        serilaized_club = ClubSerializer(club)
        return Response(serilaized_club.data, status=200)

    def join_club(self, request, club_pk, student_pk):
        club = ClubProfile.objects.get(pk=club_pk)
        student = StudentProfile.objects.get(pk=student_pk)
        if student.owner.wallet_balance < club.joining_fee:
            raise ValidationError("Cannot join club due to low balance")
        else:
            student.owner.wallet_balance -= club.joining_fee
            club.owner.wallet_balance += club.joining_fee
            club.members.add(student)
            club.owner.save()
            student.owner.save()


class EventViewSet(ViewSet):
    
    def list_events(self, request):
        events = Event.objects.all()
        serilaized_events = EventSerializer(events, many=True)
        return Response(serilaized_events.data, status=200)

    def event_details(self, request, pk):
        event = Event.objects.get(pk=pk)
        serilaized_event = ClubSerializer(event)
        return Response(serilaized_event.data, status=200)

    def register_for_an_event(self, request, event_pk, student_pk):
        event = Event.objects.get(pk=event_pk)
        student = StudentProfile.objects.get(pk=student_pk)
        if student.owner.wallet_balance < event.joining_fee:
            raise ValidationError("Cannot join event due to low balance")
        else:
            student.owner.wallet_balance -= event.joining_fee
            event.club.owner.wallet_balance += event.joining_fee
            event.members.add(student)
            event.club.owner.save()
            student.owner.save()

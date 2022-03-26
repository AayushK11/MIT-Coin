from django.forms import ValidationError
from .models import Event
from accounts.models import ClubProfile, InitialCounters, Ledger, Rewards, StudentProfile
from .serializers import EventSerializer, ClubSerializer
from rest_framework.viewsets import ViewSet
from rest_framework.response import Response
import random
from accounts.models import User


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
            Ledger.objects.create(
                from_user=student.owner,
                to_user=club.owner,
                amount=club.joining_fee,
                description=f"Joining {club.name}",
            )
            ic = InitialCounters.objects.get()
            total_student_coins = ic.student_balance
            current_coin_value = price_decrease(club.joining_fee, total_student_coins, ic.value_of_coin)
            ic.value_of_coin = current_coin_value
            ic.save()
            cashback = "Better luck next time"
            if not club.joining_fee < 5:
                upper_limit = club.joining_fee * 0.5
                lower_limit = club.joining_fee * 0.1
                cashback = round(random.uniform(lower_limit, upper_limit), 2)
                Rewards.objects.create(
                    to_user=student.owner,
                    amount=cashback,
                )
                student.owner.wallet_balance += cashback
                student.owner.save()
                ic = InitialCounters.objects.get()
                total_student_coins = ic.student_balance
                current_coin_value = price_increase(cashback, total_student_coins, ic.value_of_coin)
                ic.value_of_coin = current_coin_value
                ic.save()
        return Response({"cashback": cashback}, status=200)

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
            Ledger.objects.create(
                from_user=student.owner,
                to_user=event.club.owner,
                amount=event.joining_fee,
                description=f"Joining {event.name}",
            )
            ic = InitialCounters.objects.get()
            total_student_coins = ic.student_balance
            current_coin_value = price_decrease(event.joining_fee, total_student_coins, ic.value_of_coin)
            ic.value_of_coin = current_coin_value
            ic.save()
            cashback = "Better luck next time"
            if not event.joining_fee < 5:
                upper_limit = event.joining_fee * 0.5
                lower_limit = event.joining_fee * 0.1
                cashback = round(random.uniform(lower_limit, upper_limit), 2)
                Rewards.objects.create(
                    to_user=student.owner,
                    amount=cashback,
                )
                student.owner.wallet_balance += cashback
                student.owner.save()
                ic = InitialCounters.objects.get()
                total_student_coins = ic.student_balance
                current_coin_value = price_increase(cashback, total_student_coins, ic.value_of_coin)
                ic.value_of_coin = current_coin_value
                ic.save()

        return Response({"cashback": cashback}, status=200)

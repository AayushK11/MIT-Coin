from django.urls import path
from .views import ClubViewSet, EventViewSet

list_events = EventViewSet.as_view({
    "get": "list_events"
})

event_details = EventViewSet.as_view({
    "get": "event_details"
})

register_for_an_event = EventViewSet.as_view({
    "get": "register_for_an_event"
})

list_clubs = ClubViewSet.as_view({
    "get": "list_clubs"
})

club_details = ClubViewSet.as_view({
    "get": "club_details"
})

join_club = ClubViewSet.as_view({
    "get": "join_club"
})

urlpatterns = [
    path("list_events/", list_events, name="list_events"),
    path("event_details/<int:pk>/", event_details, name="event_details"),
    path("register_for_an_event/<int:event_pk>/<int:student_pk>/", register_for_an_event, name="register_for_an_event"),
    path("join_club/<int:club_pk>/<int:student_pk>/", join_club, name="join_club"),
    path("list_clubs/", list_clubs, name="list_clubs"),
    path("club_details/<int:pk>/", club_details, name="club_details"),
]
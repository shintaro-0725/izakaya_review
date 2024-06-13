from django.urls import path
from .views import izakaya_list

urlpatterns = [
    path('', izakaya_list, name='izakaya_list'),
]

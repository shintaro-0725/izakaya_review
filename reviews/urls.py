from django.urls import path
from . import views

urlpatterns = [
    path('izakaya/<int:izakaya_id>/reviews/create/', views.create_review, name='create_review'),
]

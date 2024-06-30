from django.urls import path
from izakaya_review.reviews import views  # 絶対インポート

urlpatterns = [
    path('izakaya/<int:izakaya_id>/reviews/create/', views.create_review, name='create_review'),
]

from django.contrib import admin
from django.urls import include, path
from .views import home 
from django.urls import path
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts.urls')),  # 追加
    path('reviews/', include('reviews.urls')),
    path('lists/', include('lists.urls')),
    path('', home, name='home'),
    path('izakaya/<int:izakaya_id>/reviews/create/', views.create_review, name='create_review'),
]

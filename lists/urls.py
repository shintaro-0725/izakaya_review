from django.urls import path
from . import views
from django.urls import path, include

urlpatterns = [
    path('create/', views.create_list, name='create_list'),
    path('add_to_list/', views.add_to_list, name='add_to_list'),
    path('save_list/', views.save_list, name='save_list'),
    path('<int:list_id>/', views.list_detail, name='list_detail'),
    path('', views.list_all, name='list_all'),
    path('reviews/', include('reviews.urls')),  # reviewsアプリのURL設定を読み込む
]

from django.contrib import admin
from django.urls import include, path
from .views import home 

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('accounts.urls')),  # 追加
    path('reviews/', include('reviews.urls')),
    path('lists/', include('lists.urls')),
    path('', home, name='home'),
]

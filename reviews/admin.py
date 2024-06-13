from django.contrib import admin
from .models import Izakaya, Review  # すべてのモデルをインポート

admin.site.register(Izakaya)
admin.site.register(Review)  # 他のモデルも同様に登録

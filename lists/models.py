from django.db import models
from django.conf import settings

class List(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True)

    def __str__(self):
        return self.name

class ListItem(models.Model):
    list = models.ForeignKey(List, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)  # 新しいフィールド
    latitude = models.FloatField()
    longitude = models.FloatField()
    comment = models.TextField(blank=True)

    def __str__(self):
        return f"{self.name} in {self.list.name}"

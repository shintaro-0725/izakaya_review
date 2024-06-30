from django.db import models

class Izakaya(models.Model):
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=255)
    lat = models.FloatField()
    lng = models.FloatField()

    def __str__(self):
        return self.name

class Review(models.Model):
    izakaya = models.ForeignKey(Izakaya, on_delete=models.CASCADE, related_name='reviews')
    rating = models.PositiveIntegerField()  # 評価は0以上の整数に修正
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)  # 投稿日時を追加

    def __str__(self):
        return f'Review for {self.izakaya.name}'

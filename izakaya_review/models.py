from django.db import models
from django.contrib.auth.models import User

class Review(models.Model):
    izakaya = models.ForeignKey('izakaya_review.Izakaya', on_delete=models.CASCADE, related_name='reviews')
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rating = models.PositiveIntegerField()
    comment = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} - {self.izakaya.name} ({self.rating})"

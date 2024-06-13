from django.db import models

class Izakaya(models.Model):
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=255)
    lat = models.FloatField()
    lng = models.FloatField()

    def __str__(self):
        return self.name

class Review(models.Model):
    izakaya = models.ForeignKey(Izakaya, on_delete=models.CASCADE)
    rating = models.IntegerField()
    comment = models.TextField()

    def __str__(self):
        return f'Review for {self.izakaya.name}'

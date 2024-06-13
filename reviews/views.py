import json
from django.shortcuts import render
from .models import Izakaya, Review

def izakaya_list(request):
    izakayas = Izakaya.objects.all()
    izakayas_json = json.dumps([
        {
            'name': izakaya.name,
            'address': izakaya.address,
            'lat': izakaya.lat,
            'lng': izakaya.lng,
            'reviews': [
                {'rating': review.rating, 'comment': review.comment}
                for review in Review.objects.filter(izakaya=izakaya)
            ]
        } for izakaya in izakayas
    ])
    return render(request, 'izakaya_list.html', {'izakayas': izakayas, 'izakayas_json': izakayas_json})

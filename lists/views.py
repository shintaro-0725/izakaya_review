import json
from django.shortcuts import render, redirect
from django.http import JsonResponse
from .models import List, ListItem
from django.core.serializers.json import DjangoJSONEncoder

def create_list(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        list_name = data.get('list_name')
        description = data.get('description')
        new_list = List.objects.create(name=list_name, description=description, user=request.user)
        return JsonResponse({'status': 'success', 'list_id': new_list.id})
    return render(request, 'lists/create_list.html')

def add_to_list(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            list_id = data.get('list_id')
            place_name = data.get('place_name')
            place_lat = data.get('place_lat')
            place_lng = data.get('place_lng')

            if list_id and place_name and place_lat and place_lng:
                new_item = ListItem.objects.create(
                    list_id=list_id,
                    name=place_name,
                    latitude=place_lat,
                    longitude=place_lng
                )
                return JsonResponse({'status': 'success', 'item': {
                    'name': place_name,
                    'latitude': place_lat,
                    'longitude': place_lng
                }})
            else:
                return JsonResponse({'status': 'failed', 'reason': 'Missing data'}, status=400)
        except json.JSONDecodeError:
            return JsonResponse({'status': 'failed', 'reason': 'Invalid JSON'}, status=400)
    return JsonResponse({'status': 'failed', 'reason': 'Invalid request'}, status=400)

def save_list(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        list_id = data.get('list_id')
        return JsonResponse({'status': 'success', 'list_id': list_id})

def list_detail(request, list_id):
    list_instance = List.objects.get(id=list_id)
    list_items = ListItem.objects.filter(list=list_instance)
    place_coordinates = [{'name': item.name, 'lat': item.latitude, 'lng': item.longitude} for item in list_items]
    return render(request, 'lists/list_detail.html', {
        'list': list_instance,
        'place_coordinates': json.dumps(place_coordinates, cls=DjangoJSONEncoder),
        'list_items': list_items
    })

def list_all(request):
    lists = List.objects.filter(user=request.user)
    return render(request, 'lists/list_all.html', {'lists': lists})

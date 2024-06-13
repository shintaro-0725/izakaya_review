import os
import sys
import django
import requests
from django.db.utils import IntegrityError

# プロジェクトのルートディレクトリをパスに追加
sys.path.append('/path/to/your/project')  # <- この行を追加

# Djangoの設定を読み込み
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'izakaya_review.settings')
django.setup()

from reviews.models import Izakaya

# Google Places APIの設定
API_KEY = 'AIzaSyCQ5gLRlVyYJZNvG3hIwdOtWS3O8xIdj7Q'
LOCATION = '35.658034,139.701636'  # 渋谷の緯度経度 <- LOCATIONを修正
RADIUS = 1500  # 半径1500メートル
TYPE = 'restaurant'

# データを取得する関数を追加
def fetch_places(api_key, location, radius, place_type):
    url = f'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location={location}&radius={radius}&type={place_type}&key={api_key}'
    response = requests.get(url)
    data = response.json()
    
    return data

# データベースに保存する関数を追加
def save_places(data):
    for place in data['results']:
        name = place['name']
        address = place['vicinity']
        lat = place['geometry']['location']['lat']
        lng = place['geometry']['location']['lng']

        try:
            izakaya = Izakaya(name=name, address=address, lat=lat, lng=lng)
            izakaya.save()
            print(f'Saved: {name}')
        except IntegrityError as e:
            print(f'Error saving {name}: {e}')

# 複数ページのデータを取得して保存する関数を追加
def fetch_and_save_all_places(api_key, location, radius, place_type):
    data = fetch_places(api_key, location, radius, place_type)
    save_places(data)

    # ページネーションの処理
    while 'next_page_token' in data:
        next_page_token = data['next_page_token']
        print(f"Fetching next page with token: {next_page_token}")
        # ページネーションの間隔を考慮（APIの仕様で数秒待つ必要がある）
        import time
        time.sleep(2)
        
        next_page_url = f'https://maps.googleapis.com/maps/api/place/nearbysearch/json?pagetoken={next_page_token}&key={API_KEY}'
        response = requests.get(next_page_url)
        data = response.json()
        save_places(data)

# データの取得と保存を実行
fetch_and_save_all_places(API_KEY, LOCATION, RADIUS, TYPE)

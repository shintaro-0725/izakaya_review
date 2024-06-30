from django import forms
from .models import Review

class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = ['rating', 'comment']  # レビューモデルのどのフィールドをフォームに含めるか指定
        widgets = {
            'rating': forms.NumberInput(attrs={'min': 1, 'max': 5}),  # 評価の範囲を1〜5に制限
            'comment': forms.Textarea(attrs={'rows': 4}),  # コメント入力欄のサイズを調整
        }
        labels = {
            'rating': '評価（5点満点）',
            'comment': 'コメント',
        }  

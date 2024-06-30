from django import forms
from izakaya_review.reviews.models import Review  # 絶対インポート

class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = ['rating', 'comment']
        widgets = {
            'rating': forms.NumberInput(attrs={'min': 1, 'max': 5}),
            'comment': forms.Textarea(attrs={'rows': 4}),
        }
        labels = {
            'rating': '評価（5点満点）',
            'comment': 'コメント',
        }
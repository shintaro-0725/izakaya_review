from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Izakaya, Review
from .forms import ReviewForm

@login_required  # ログイン必須のデコレーター
def create_review(request, izakaya_id):
    izakaya = get_object_or_404(Izakaya, pk=izakaya_id)  # レビュー対象の居酒屋を取得
    if request.method == 'POST':
        form = ReviewForm(request.POST)
        if form.is_valid():
            review = form.save(commit=False)
            review.izakaya = izakaya
            review.user = request.user
            review.save()
            return redirect('izakaya_detail', pk=izakaya_id)  # 居酒屋詳細ページにリダイレクト
    else:
        form = ReviewForm()
    return render(request, 'reviews/review_form.html', {'form': form, 'izakaya': izakaya})

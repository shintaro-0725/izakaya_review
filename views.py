from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Izakaya, Review
from .forms import ReviewForm

def home(request):
    return render(request, 'home.html')
@login_required  # ログイン済ユーザーのみアクセス可能
def create_review(request, izakaya_id):
    izakaya = get_object_or_404(Izakaya, pk=izakaya_id)  # レビュー対象の居酒屋を取得
    if request.method == 'POST':  # POSTリクエストの場合（フォーム送信時）
        form = ReviewForm(request.POST)
        if form.is_valid():  # フォームの入力値が有効な場合
            review = form.save(commit=False)  # まだデータベースに保存しない
            review.izakaya = izakaya  # レビューと居酒屋を関連付け
            review.user = request.user  # レビューとユーザーを関連付け
            review.save()  # データベースに保存
            return redirect('izakaya_detail', pk=izakaya_id)  # 居酒屋詳細ページにリダイレクト
    else:  # GETリクエストの場合（フォーム表示時）
        form = ReviewForm()
    return render(request, 'izakaya_review/review_form.html', {'form': form, 'izakaya': izakaya})  # テンプレートにフォームと居酒屋情報を渡す
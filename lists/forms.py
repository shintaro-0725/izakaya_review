from django import forms
from .models import List

class ListCreateForm(forms.ModelForm):
    class Meta:
        model = List
        fields = ['name', 'description']

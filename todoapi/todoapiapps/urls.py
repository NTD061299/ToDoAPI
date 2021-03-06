from django.urls import path, include
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register("todoes", views.ToDoViewSet, 'todoes')
router.register("users", views.UserViewSet, 'user')


urlpatterns = [
    path('', include(router.urls)),
    path('oauth2-info/', views.AuthInfo.as_view()),
    path('sign-in/', views.user_login, name='sign-in'),
]
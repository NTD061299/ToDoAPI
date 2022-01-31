from rest_framework import viewsets, generics, status, permissions
from rest_framework.decorators import action
from django.contrib.auth import authenticate, login
from django.shortcuts import render, redirect
from .models import Todo, User
from .serializers import TodoSerializer, UserSerializer
from django.conf import settings
from rest_framework.response import Response
from rest_framework.views import APIView

# Create your views here.


class ToDoViewSet(viewsets.ViewSet,
                    generics.ListAPIView,
                    generics.CreateAPIView,
                    generics.UpdateAPIView,
                    generics.DestroyAPIView,
                    generics.RetrieveAPIView):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer
    #permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=True,
            url_path="get-all-task-by-user", url_name="get-all-task-by-user")
    def get_queryset(self):
        todo = Todo.objects.all()
        q = self.request.query_params.get('q')
        if q is not None:
            todo = todo.filter(subject__icontains=q)

        user_id = self.request.query_params.get('user_id')
        if user_id is not None:
            todo = todo.filter(user_id=user_id)

        id = self.request.query_params.get('id')
        if id is not None:
            todo = todo.filter(id=id)

        return todo

    # @action(methods=['post'], detail=True, url_path='remove-to-do')
    def delete(self, request, *args, **kwargs):
        todo = self.get_object()
        if todo.status == 'New':
            return self.destroy(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)

    @action(methods=['post'], detail=True, url_path='update-to-do')
    def put(self, request, *args, **kwargs):
        todo = self.get_object()
        if todo.status == 'New':
            return self.update(request, *args, **kwargs)

        return Response(status=status.HTTP_403_FORBIDDEN)

    @action(methods=['post'], detail=False, url_path='add-to-do')
    def add_to_do(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

    @action(methods=['get'], detail=False, url_path='get-all-to-do')
    def get(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)

    @action(methods=['get'], detail=True, url_path='get-to-do-by-id')
    def get(self, request, *args, **kwargs):
        return self.retrieve(request, *args, **kwargs)


def user_login(request):
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                if 'next' in request.POST:
                    return redirect(request.POST["next"])
                else:
                    return redirect("/")
        else:
            err_msg = "Sai tài khoản hoặc mật khẩu"
            return render(request, template_name='login.html', context={'err_msg': err_msg})

    return render(request, template_name='login.html')


class UserViewSet(viewsets.ViewSet,
                    generics.CreateAPIView,
                    generics.RetrieveAPIView,
                    generics.ListAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]

    @action(methods=['post'], detail=False, url_path="sign_up")
    def post(self, request, *args, **kwargs):
        return self.create(request, *args, **kwargs)

    def get_permissions(self):
        if self.action == 'get_current_user':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    @action(methods=['get'], detail=False, url_path="current_user")
    def get_current_user(self, request):
        return Response(self.serializer_class(requests.user).data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True, url_path="get-all-task-by-user")
    def get_todoes(self, request, pk):
        user = User.objects.get(pk=pk)
        todoes = user.todoes.filter(user_id=pk)

        return Response(TodoSerializer(todoes, many=True).data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=False, url_path='get-all-user')
    def get_user(self, request, *args, **kwargs):
        return self.list(request, *args, **kwargs)


class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)
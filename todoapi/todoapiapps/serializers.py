from rest_framework.serializers import ModelSerializer
from .models import Todo, User

class TodoSerializer(ModelSerializer):
    class Meta:
        model = Todo
        fields = "__all__"


class UserSerializer(ModelSerializer):
    def create(self, validate_data):
        user = User(**validate_data)
        user.set_password(validate_data['password'])
        user.save()
        return user

    class Meta:
        model = User
        fields = ["id", "first_name", "last_name",
                  "username", "password", "email", "date_joined"]
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }


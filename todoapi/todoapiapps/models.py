from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class User(AbstractUser):
    phone = models.CharField(max_length=10, null=True, verbose_name='Điện thoại')

class Todo(models.Model):
    class ToDoStatus(models.TextChoices):
        NEW = 'New'
        COMPLETE = 'Complete'

    name = models.CharField(max_length=100, null=False, verbose_name='Tên')
    description = models.TextField(null=True, verbose_name='Mô tả')
    user = models.ForeignKey(User,
                             related_name="todoes",
                             on_delete=models.SET_NULL,
                             null=True, verbose_name='Người dùng')
    completed_date = models.DateTimeField(auto_now=False, verbose_name='Ngày hoàn thành')
    status = models.CharField(max_length=10, choices=ToDoStatus.choices,
                              default=ToDoStatus.NEW, verbose_name='Trạng thái')
    created_date = models.DateTimeField(auto_now_add=True, verbose_name='Ngày tạo')
    updated_date = models.DateTimeField(auto_now=True, verbose_name='Ngày cập nhật')

    def __str__(self):
        return self.name

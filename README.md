TODOAPI PROJECT
Lệnh để tải thư viện và chạy ứng dụng
Để nhanh chóng trong việc cài đặt các thư viện, ta chỉ cần install file requirements.txt trong terminal
<< pip install -r requirements.txt
Trong file bao gồm các thư viện, biến cài đặt môi trường
<<pip install django
Kết nối cơ sở dữ liệu
<< pip install mysqlclient
Cài đặt môi trường Django Rest API
<<pip install djangorestframework
Cài đặt Django OAuth Toolkits
<<pip install django-oauth-toolkit
Cài đặt swagger drf-yasg
<<pip install drf-yasg

Tạo project mới cho chương trình
<<django-admin startproject todoapi
Tạo app cho project
<<django-admin startapp todoapiapps
Khỏi chạy project
<<python manage.py runserver
Truy cập port http://127.0.0.1:8000/

Kết nối cơ sở dữ liệu 
Vào settings.py dùng biến DATABASES để cấu hình CSDL
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'todoapidb',
        'USER': 'root',
        'PASSWORD': '123456',
        'HOST': ''
    }
}
Ở chương trình này, sử dụng MySQL Workbench 8.0 CH. Như cấu hình ta đăng nhập vào MySQL với username là root, password là ‘123456’. Sau đó tạo mới một database mới có tên 'todoapidb'.
Chọn tab Server->Data Import và chỉ đường dẫn đến file todoapidb.sql có trong source để lấy CSDL mẫu thực thi chạy chương trình.

Cấu hình một số biếng trong setttings.py
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'todoapiapps.apps.TodoapiappsConfig',
    'rest_framework',
    'oauth2_provider',
'drf_yasg',
]
Swagger
'drf_yasg' : cập nhật biến cho swagger
Cập nhật urls cho swagger
schema_view = get_schema_view(
        openapi.Info(
            title="To Do API",
            default_version='v1',
            description="APIs for ToDoApp",
            contact=openapi.Contact(email="ntdentidi0612@gmail.com"),
            license=openapi.License(name="Nguyễn Trung Dũng @2022"),
        ),
        public=True,
        permission_classes=(permissions.AllowAny,),
)
urlpatterns = [
	...
    re_path(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    re_path(r'^swagger/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    re_path(r'^redoc/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
]

Cài đặt Django Rest API thì cập biến trong INSTALLED_APP như đã cấu hình
'rest_framework'
Cài đặt Django OAuth Toolkits 
'oauth2_provider' trong INSTALLED_APP
Và thông tin cấu hình REST_FRAMEWORK trong settings.py
REST_FRAMEWORK = {
...
'DEFAULT_AUTHENTICATION_CLASSES': (
'oauth2_provider.contrib.rest_framework.OAuth2Authentication',
)
}

Cập nhật urls cho URLConfig
from django.urls import include, path
urlpatterns = [
...
path('o/', include('oauth2_provider.urls',
namespace='oauth2_provider')),

]
Sau đó thực thi migrate
python manage.py migrate oauth2_provider
Truy cập: http://127.0.0.1:8000/o/applications/
Yêu cầu lấy access token
– Url: /o/token/
– Method: POST
– Body data
{
"grant_type": "password",
"username": "<username>",
"password": "<password>",
"client_id": "<client-id>",
"client_serect": "<client-serect>"
}

 Để cho biết sự thay đổi trong models.py khi tạo ,sửa, xóa các model thì ta dùng lệnh makemigrations 
<<python manage.py makemigrations
Để thực thi migration áp dụng những thay đổi xuống CSDL ta thực hiện lệnh
<<python manage.py migrate 

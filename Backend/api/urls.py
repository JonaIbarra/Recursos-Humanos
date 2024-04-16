from django.urls import path,include
from rest_framework import routers
from api import views

router = routers.DefaultRouter()

router.register(r'Puesto', views.PuestoViewSet)
router.register(r'DepartamentoPuesto', views.DepartamentoPuestoViewSet)
router.register(r'HorarioPersonal', views.HorarioPersonalViewSet)
router.register(r'Personal', views.PersonalViewSet)
router.register(r'Personas', views.PersonasViewSet)

urlpatterns = [
	path('api/v1',include(router.urls))
]


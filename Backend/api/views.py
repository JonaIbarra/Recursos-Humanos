from rest_framework import viewsets
from .models import  Puesto, DepartamentoPuesto,  HorarioPersonal, Personal, Personas
from .serializer import  PuestoSerializer, DepartamentoPuestoSerializer, HorarioPersonalSerializer, PersonalSerializer, PersonasSerializer



class PuestoViewSet(viewsets.ModelViewSet):
	queryset = Puesto.objects.all()
	serializer_class = PuestoSerializer

class DepartamentoPuestoViewSet(viewsets.ModelViewSet):
	queryset = DepartamentoPuesto.objects.all()
	serializer_class = DepartamentoPuestoSerializer

class HorarioPersonalViewSet(viewsets.ModelViewSet):
	queryset = HorarioPersonal.objects.all()
	serializer_class = HorarioPersonalSerializer

class PersonalViewSet(viewsets.ModelViewSet):
	queryset = Personal.objects.all()
	serializer_class = PersonalSerializer


class PersonasViewSet(viewsets.ModelViewSet):
    queryset = Personas.objects.all()
    serializer_class = PersonasSerializer
    lookup_field = 'curp'  # Set lookup field to 'curp'






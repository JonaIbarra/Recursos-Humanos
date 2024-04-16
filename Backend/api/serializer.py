from rest_framework import serializers
from .models import  Puesto, HorarioPersonal, Personal, DepartamentoPuesto, Personas

class PuestoSerializer(serializers.ModelSerializer):
	class Meta:
		model = Puesto
		fields = '__all__'

class DepartamentoPuestoSerializer(serializers.ModelSerializer):
	class Meta:
		model = DepartamentoPuesto
		fields = '__all__'

class HorarioPersonalSerializer(serializers.ModelSerializer):
	class Meta:
		model = HorarioPersonal
		fields = '__all__'


class PersonalSerializer(serializers.ModelSerializer):
	class Meta:
		model = Personal
		fields = '__all__'


class PersonasSerializer(serializers.ModelSerializer):
	class Meta:
		model = Personas
		fields = '__all__'

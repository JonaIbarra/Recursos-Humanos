from django.contrib import admin
from .models import  Puesto, DepartamentoPuesto, HorarioPersonal, Personal, Personas

# Register your models here.

admin.site.register(Puesto)
admin.site.register(DepartamentoPuesto)
admin.site.register(HorarioPersonal)
admin.site.register(Personal)
admin.site.register(Personas)

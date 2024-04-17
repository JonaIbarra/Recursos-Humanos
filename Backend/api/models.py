from django.db import models

class AccountEmailaddress(models.Model):
    email = models.CharField(max_length=254)
    verified = models.IntegerField()
    primary = models.IntegerField()
    user = models.ForeignKey('AuthUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'account_emailaddress'
        unique_together = (('user', 'email'),)


class AccountEmailconfirmation(models.Model):
    created = models.DateTimeField()
    sent = models.DateTimeField(blank=True, null=True)
    key = models.CharField(unique=True, max_length=64)
    email_address = models.ForeignKey(AccountEmailaddress, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'account_emailconfirmation'


class AreasMedicas(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=150)  # Field name made lowercase.
    descripcion = models.TextField(db_column='Descripcion', blank=True, null=True)  # Field name made lowercase.
    estatus = models.TextField(db_column='Estatus', blank=True, null=True)  # Field name made lowercase. This field type is a guess.
    fecha_registro = models.DateTimeField(db_column='Fecha_Registro')  # Field name made lowercase.
    fecha_actualizacion = models.DateTimeField(db_column='Fecha_Actualizacion', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'areas_medicas'
        db_table_comment = 'Esta tabla guardara las areas medicas con las que cuenta el hospital '


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Bitacora(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre_tabla = models.CharField(db_column='Nombre_Tabla', max_length=80)  # Field name made lowercase.
    usuario = models.CharField(db_column='Usuario', max_length=80)  # Field name made lowercase.
    operacion = models.CharField(db_column='Operacion', max_length=6)  # Field name made lowercase.
    descripcion = models.TextField(db_column='Descripcion')  # Field name made lowercase.
    fecha_hora = models.DateTimeField(db_column='Fecha_Hora')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'bitacora'
        db_table_comment = 'La tabla Bitacora el nombre del usuario que se conecte a esta base de datos asi como la operacion que este usuario Realice incluyendo la fecha y hora de modificacion '


class DepartamentoPuesto(models.Model):
    departamento = models.OneToOneField('Departamentos', models.DO_NOTHING, db_column='Departamento_ID', primary_key=True)  # Field name made lowercase. The composite primary key (Departamento_ID, Puesto_ID) found, that is not supported. The first column is selected.
    puesto = models.ForeignKey('Puesto', models.DO_NOTHING, db_column='Puesto_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'departamento_puesto'
        unique_together = (('departamento', 'puesto'),)


class Departamentos(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=100)  # Field name made lowercase.
    areamedica = models.ForeignKey(AreasMedicas, models.DO_NOTHING, db_column='AreaMedica_ID', blank=True, null=True)  # Field name made lowercase.        
    departamento_superior = models.ForeignKey('self', models.DO_NOTHING, db_column='Departamento_Superior_ID', blank=True, null=True)  # Field name made lowercase.
    responsable_id = models.PositiveIntegerField(db_column='Responsable_ID', blank=True, null=True)  # Field name made lowercase.
    estatus = models.TextField(db_column='Estatus')  # Field name made lowercase. This field type is a guess.
    fecha_registro = models.DateTimeField(db_column='Fecha_Registro')  # Field name made lowercase.
    fecha_actualizacion = models.DateTimeField(db_column='Fecha_Actualizacion', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'departamentos'
        db_table_comment = 'Esta tabla guardara todos los departamentos con los que cuenta el hosital, mismo que tendra un responble, el estatus de activo o inactivo '


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Horario(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=100)  # Field name made lowercase.
    descripcion = models.TextField(db_column='Descripcion', blank=True, null=True)  # Field name made lowercase.
    tipo_jornada = models.CharField(db_column='Tipo_Jornada', max_length=16)  # Field name made lowercase.
    dia_laboral = models.CharField(db_column='Dia_Laboral', max_length=50, blank=True, null=True)  # Field name made lowercase.
    hora_inicio = models.TimeField(db_column='Hora_Inicio', blank=True, null=True)  # Field name made lowercase.
    hora_fin = models.TimeField(db_column='Hora_Fin', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'horario'


class HorarioPersonal(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    personal = models.ForeignKey('Personal', models.DO_NOTHING, db_column='Personal_ID', blank=True, null=True)  # Field name made lowercase.
    fecha_inicio = models.DateField(db_column='Fecha_inicio')  # Field name made lowercase.
    dia_descanso = models.CharField(db_column='Dia_descanso', max_length=50, blank=True, null=True)  # Field name made lowercase.
    turno = models.CharField(db_column='Turno', max_length=6)  # Field name made lowercase.
    horario_entrada = models.CharField(db_column='Horario_entrada', max_length=20)  # Field name made lowercase.
    horario_salida = models.CharField(db_column='Horario_salida', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'horario_personal'


class Medicamentos(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre_comercial = models.CharField(db_column='Nombre_Comercial', max_length=250)  # Field name made lowercase.
    nombre_generico = models.CharField(db_column='Nombre_Generico', max_length=250)  # Field name made lowercase.
    via_administracion = models.CharField(db_column='Via_Administracion', max_length=11, blank=True, null=True)  # Field name made lowercase.
    presentacion = models.CharField(db_column='Presentacion', max_length=12, blank=True, null=True)  # Field name made lowercase.
    estatus = models.TextField(db_column='Estatus', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'medicamentos'
        db_table_comment = 'Esta tabla guardara los medicamentos que se encuentran en el hospital '


class Pacientes(models.Model):
    persona = models.OneToOneField('Personas', models.DO_NOTHING, db_column='Persona_ID', primary_key=True)  # Field name made lowercase.
    nss = models.CharField(db_column='NSS', unique=True, max_length=15, blank=True, null=True)  # Field name made lowercase.
    tipo_seguro = models.CharField(db_column='Tipo_Seguro', max_length=50)  # Field name made lowercase.
    fecha_registro = models.DateTimeField(db_column='Fecha_Registro')  # Field name made lowercase.
    fecha_ultimacita = models.DateTimeField(db_column='Fecha_UltimaCita')  # Field name made lowercase.
    estatus_medico = models.CharField(db_column='Estatus_Medico', max_length=100, blank=True, null=True)  # Field name made lowercase.
    estatus_vida = models.CharField(db_column='Estatus_Vida', max_length=10)  # Field name made lowercase.
    estatus = models.TextField(db_column='Estatus', blank=True, null=True)  # Field name made lowercase. This field type is a guess.

    class Meta:
        managed = False
        db_table = 'pacientes'
        db_table_comment = 'En esta tabla se guardaran los datos de los pacientes que se encuentran en el hospital '


class Personal(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    persona = models.ForeignKey('Personas', models.DO_NOTHING, db_column='Persona_ID', blank=True, null=True)  # Field name made lowercase.
    direccion = models.CharField(db_column='Direccion', max_length=500, blank=True, null=True)  # Field name made lowercase.
    telefono = models.CharField(db_column='Telefono', max_length=15, blank=True, null=True)  # Field name made lowercase.
    puesto = models.ForeignKey('Puesto', models.DO_NOTHING, db_column='Puesto_ID', blank=True, null=True)  # Field name made lowercase.
    estatus = models.CharField(db_column='Estatus', max_length=8)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=100, blank=True, null=True) 

    class Meta:
        managed = False
        db_table = 'personal'


class PersonalMedico(models.Model):
    persona = models.OneToOneField('Personas', models.DO_NOTHING, db_column='Persona_ID', primary_key=True)  # Field name made lowercase.
    departamento = models.ForeignKey(Departamentos, models.DO_NOTHING, db_column='Departamento_ID')  # Field name made lowercase.
    especialidad = models.CharField(db_column='Especialidad', max_length=50, blank=True, null=True)  # Field name made lowercase.
    tipo = models.CharField(db_column='Tipo', max_length=14)  # Field name made lowercase.
    cedula_profesional = models.IntegerField(db_column='Cedula_Profesional', unique=True, blank=True, null=True)  # Field name made lowercase.
    estatus = models.CharField(db_column='Estatus', max_length=8)  # Field name made lowercase.
    fecha_contratacion = models.DateTimeField(db_column='Fecha_Contratacion')  # Field name made lowercase.
    fecha_terminacion_contrato = models.DateTimeField(db_column='Fecha_Terminacion_Contrato', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'personal_medico'
        db_table_comment = 'Esta tabla guarda los dartos del personal medico, personales asi como tambien detalles de su contratacion'


class Personas(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    titulo = models.CharField(db_column='Titulo', max_length=20, blank=True, null=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=80)  # Field name made lowercase.
    primer_apellido = models.CharField(db_column='Primer_Apellido', max_length=80)  # Field name made lowercase.
    segundo_apellido = models.CharField(db_column='Segundo_Apellido', max_length=80, blank=True, null=True)  # Field name made lowercase.
    curp = models.CharField(db_column='CURP', unique=True, max_length=18, blank=True, null=True)  # Field name made lowercase.
    genero = models.CharField(db_column='Genero', max_length=3)  # Field name made lowercase.
    grupo_sanguineo = models.CharField(db_column='Grupo_Sanguineo', max_length=2)  # Field name made lowercase.
    tipo_sanguineo = models.CharField(db_column='Tipo_Sanguineo', max_length=1)  # Field name made lowercase.
    fecha_nacimiento = models.DateField(db_column='Fecha_Nacimiento')  # Field name made lowercase.
    estatus = models.BooleanField(db_column='Estatus', default=True)
    fecha_registro = models.DateTimeField(db_column='Fecha_Registro', auto_now_add=True)
    fecha_actualizacion = models.DateTimeField(db_column='Fecha_Actualizacion', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'personas'
        db_table_comment = 'La tabla persona guarda datos de toda aquella persona que tenga interaccion con el hpspital'



class Puesto(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(db_column='Nombre', max_length=100)  # Field name made lowercase.
    descripcion = models.TextField(db_column='Descripcion', blank=True, null=True)  # Field name made lowercase.
    requisitos = models.TextField(db_column='Requisitos', blank=True, null=True)  # Field name made lowercase.
    tipo_contrato = models.CharField(db_column='Tipo_Contrato', max_length=50, blank=True, null=True)  # Field name made lowercase.
    salario_minimo = models.DecimalField(db_column='Salario_Minimo', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase. 
    salario_maximo = models.DecimalField(db_column='Salario_Maximo', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase. 
    estatus = models.CharField(db_column='Estatus', max_length=8)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'puesto'


class SocialaccountSocialaccount(models.Model):
    provider = models.CharField(max_length=200)
    uid = models.CharField(max_length=191)
    last_login = models.DateTimeField()
    date_joined = models.DateTimeField()
    extra_data = models.JSONField()
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'socialaccount_socialaccount'
        unique_together = (('provider', 'uid'),)


class SocialaccountSocialapp(models.Model):
    provider = models.CharField(max_length=30)
    name = models.CharField(max_length=40)
    client_id = models.CharField(max_length=191)
    secret = models.CharField(max_length=191)
    key = models.CharField(max_length=191)
    provider_id = models.CharField(max_length=200)
    settings = models.JSONField()

    class Meta:
        managed = False
        db_table = 'socialaccount_socialapp'


class SocialaccountSocialtoken(models.Model):
    token = models.TextField()
    token_secret = models.TextField()
    expires_at = models.DateTimeField(blank=True, null=True)
    account = models.ForeignKey(SocialaccountSocialaccount, models.DO_NOTHING)
    app = models.ForeignKey(SocialaccountSocialapp, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'socialaccount_socialtoken'
        unique_together = (('app', 'account'),)


class Usuarios(models.Model):
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    email = models.CharField(max_length=100)
    contrasena = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'usuarios'


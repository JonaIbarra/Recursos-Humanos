<template>
  <div class="recursos-humanos">
    <!-- Encabezado con el logo y título -->
    <header class="header">
      <img src="@/views/RecursosHumanos/logoRH.png" alt="Logo del Hospital" class="logo">
      <h1 class="titulo">Recursos Humanos</h1>
    </header>

    <!-- CRUD -->
    <div class="crud-container">
      <!-- Aquí irá tu componente CRUD -->
    </div>

    <!-- Secciones adicionales -->
    <div class="secciones">
      <!-- Sección de personas -->
      <section class="seccion">
        <h2 class="seccion-titulo">Personas</h2>
        <!-- Aquí va el componente para agregar y ver personas -->
      </section>

      <!-- Sección de personal médico -->
      <section class="seccion">
        <h2 class="seccion-titulo">Personal Médico</h2>
        <!-- Aquí va el componente para agregar y ver personal médico -->
      </section>

      <!-- Sección de puestos -->
      <section class="seccion">
        <h2 class="seccion-titulo">Puestos</h2>
        <!-- Aquí va el componente para agregar y ver puestos -->
      </section>

      <!-- Sección de horarios de trabajo -->
      <section class="seccion">
        <h2 class="seccion-titulo">Horarios de Trabajo</h2>
        <!-- Aquí va el componente para asignar y ver horarios de trabajo -->
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: 'RecursosHumanos',
  // Lógica necesaria
}
</script>

<style scoped>
/* Estilos para el encabezado */
.header {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.logo {
  width: 100px; /* Ajusta el tamaño según necesites */
  height: auto;
  margin-right: 20px;
}

.titulo {
  font-size: 36px;
  color: #333; /* Color del texto */
}

/* Estilos para el contenedor del CRUD */
.crud-container {
  /* Estilos del contenedor */
}

/* Estilos para las secciones */
.secciones {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  grid-gap: 20px;
  margin-top: 20px;
}

.seccion {
  background-color: #f5f5f5; /* Color de fondo de las secciones */
  border-radius: 5px;
  padding: 20px;
}

.seccion-titulo {
  font-size: 24px;
  color: #333; /* Color del texto */
}
</style>

<template>
  <b-container fluid>
    <b-row>
      <b-col md="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title text-center">ACTUALIZAR INFORMACIÓN DEL PERSONAL</h4>
          </template>
          <template v-slot:body>
            <b-row>
              <div class="col-md-6 mb-3">
                <div class="form-group">
                  <b-form-group label="Para buscar personal ingrese el CURP de la persona" label-for="curpInput">
                    <b-form-input id="curpInput" type="text" v-model="curp"
                      placeholder="Inserta el curp"></b-form-input>
                  </b-form-group>
                </div>
                <a href="#personal" class="btn btn-primary next action-button float-end" @click="buscarPersonal"
                  value="Buscar">Buscar Por CURP</a>

                <div v-if="persona"></div>
                <div v-else>
                  <h4 class="text-danger">Persona no encontrada</h4>
                  <p>No se encontró información para el CURP ingresado.</p>
                </div>
              </div>

              <b-modal id="modal" size="xl" v-model="modalEditar" title="">
                <b-row>
                  <b-col md="3">
                    <ul id="top-tabbar-vertical" class="p-0">
                      <li class="active" :class="`${currentindex == 1 ? 'active' : ''} ${currentindex > 1 ? 'done active' : ''
                      } `" id="personal">
                        <a href="#">
                          <i class="fa fa-id-card text-primary"></i><span>Editar datos <br> del Personal</span>
                        </a>
                      </li>
                    </ul>
                  </b-col>
                  <b-col md="9">
                    <b-form id="form-wizard3" class="text-center">
                      <!-- fieldsets -->
                      <div :class="`${currentindex == 1 ? 'show' : 'd-none'}`">
                        <form ref="FormUpdatePersonal">
                          <fieldset>
                            <div class="form-card text-start">
                              <b-row>
                                <div class="col-7">
                                  <h4 class="mb-4 text-primary"> Editar datos del empleado <h4>{{ nombreCompletoPersonal }}</h4> </h4>
                                  <br>
                                  <p>Domicilio: {{ listPersonal.direccion }}. Si editara datos del domicio ingrese código postal, colonia y calle. </p>
                                </div>
                              </b-row>
                              <b-row>
                                <b-col md="6">
                                  <div class="form-group">
                                    <b-form-group label="Ingresa codigo Postal" label-for="buscarCP">
                                      <b-form-input id="buscarCP" type="text" v-model="codigoPostal"
                                        placeholder="Inserta CodigoPostal"></b-form-input>
                                    </b-form-group>
                                  </div>
                                  <a href="#" class="btn btn-primary next action-button float-end"
                                    @click="obtenerDomicilio()" value="Buscar">Buscar</a>

                                  <div v-if="Domicilio"></div>
                                  <div v-else>
                                    <h4 class="text-danger">
                                      Codigo Postal no existe
                                    </h4>
                                    <p>
                                      No se encontró información del Codigo
                                      Postal ingresado.
                                    </p>
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div v-if="pais">
                                    <div class="form-group">
                                      <label for="fname" class="mb-2">Pais</label>
                                      <input type="text" class="form-control" id="fname" name="fname" placeholder=""
                                        spellcheck="false" data-ms-editor="true" :disabled="isDisabled"
                                        v-model="pais" />
                                    </div>
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div v-if="estado">
                                    <div class="form-group">
                                      <label for="fname" class="mb-2">Estado:
                                      </label>
                                      <input type="text" class="form-control" id="fname" name="fname" placeholder=""
                                        spellcheck="false" data-ms-editor="true" :disabled="isDisabled"
                                        v-model="estado" />
                                    </div>
                                  </div>
                                </b-col>

                                <b-col md="6">
                                  <div v-if="municipio">
                                    <div class="form-group">
                                      <label for="fname" class="mb-2">Municipio</label>
                                      <input type="text" class="form-control" id="fname" name="fname" placeholder=""
                                        spellcheck="false" data-ms-editor="true" :disabled="isDisabled"
                                        v-model="municipio" />
                                    </div>
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group>
                                    <label class="mb-2">Colonia: *</label>
                                    <b-form-select id="selectedGrupoSanguineo" plain v-model="selectedColonia"
                                      :options="optionsColonia" size="sm" class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Colonia
                                          --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="calle" class="mb-2">Calle:*</label>
                                    <input type="text" class="form-control" id="calle" name="calle" placeholder=""
                                      spellcheck="false" data-ms-editor="true" />
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div v-if="personalInformacionEditar" class="form-group">
                                    <label for="email" class="mb-2">Correo:*</label>
                                    <input type="text" class="form-control" id="email" name="email" placeholder=""
                                      spellcheck="false" data-ms-editor="true" v-model="personalInformacionEditar.email" />
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div v-if="personalInformacionEditar" class="form-group">
                                    <label for="telefono" class="mb-2">Telefono:*</label>
                                    <input type="text" class="form-control" id="telefono" name="telefono" placeholder=""
                                      spellcheck="false" data-ms-editor="true" v-model="personalInformacionEditar.telefono" />
                                  </div>
                                </b-col>
                            
                                <b-col md="6">
                                  <b-form-group  v-if="personalInformacionEditar">
                                    <label class="mb-2">Estatus: *</label>
                                    <b-form-select id="selectedEstatus" plain v-model="selectedEstatus"
                                                  :options="optionsEstatus" size="sm" class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">
                                          {{listPersonal.estatus}}
                                        </b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                              </b-row>
                            </div>
                            <a href="#personal" class="btn btn-primary next action-button float-end"
                              @click="updatePersonal()" value="Next">Guardar</a>
                          </fieldset>
                        </form>
                      </div>
                    </b-form>
                  </b-col>
                </b-row>
                <template #footer> </template>
              </b-modal>

              <b-col md="12" class="table-responsive w-100">
                <b-table striped bordered hover :items="rows" :fields="columns">
                </b-table>
                <div v-if="mensajePersonalNoEliminado">
                  <h4 class="text-danger">Personal no eliminado</h4>
                  <p>No se puedo eliminar al personal porque este tiene un horario asignado</p>
                </div>
                <div v-if= "mensajePersonalEliminado">
                  <h4 class="text-success">Personal eliminado</h4>
                </div>
                <div v-if="personaRegistrada">
                  <h4 class="text-danger">Personal no encontrado</h4>
                  <p>Es probable que la persona no se encuentra registrada como personal</p>
                </div>
                <div class="table-ad mb-3 me-2 mt-3">
                  <b-button variant="btn btn-sm iq-bg-success float-end mb-3 me-3" @click="editarPersonal()">
                    <i class="las la-edit"></i> Editar</b-button>

                  <b-button variant="btn btn-sm iq-bg-danger float-end mb-3 me-3" @click="eliminarPersonalBuscado()">
                    <i class="fa fa-trash"></i> Eliminar</b-button>
                </div>
              </b-col>
            </b-row>
          </template>
        </iq-card>
      </b-col>
    </b-row>
  </b-container>
  <b-container fluid>
    <b-row>
      <b-col md="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title text-center">PERSONAL DEL HOSPITAL</h4>
          </template>
          <template v-slot:body>
            <b-row>
              <div class="table-ad mb-3 me-2">
                <b-button variant="btn btn-sm iq-bg-success float-end" @click="add">Asignar Personal</b-button>
              </div>

              <b-modal id="modal" size="xl" v-model="modalOpen" title="">
                <b-row>
                  <b-col md="3">
                    <ul id="top-tabbar-vertical" class="p-0">
                      <li class="active" :class="`${currentindex == 1 ? 'active' : ''} ${currentindex > 1 ? 'done active' : ''
                      } `" id="personal">
                        <a href="#">
                          <i class="fa fa-id-card text-primary"></i><span>Datos personales</span>
                        </a>
                      </li>

                      <li id="official" :class="`${currentindex == 2 ? 'active' : ''} ${currentindex > 2 ? 'done active' : ''
                      }`">
                        <a href="#">
                          <i class="ri-calendar-event-fill text-success"></i><span><br />Datos laborales</span>
                        </a>
                      </li>
                    </ul>
                  </b-col>
                  <b-col md="9">
                    <b-form id="form-wizard3" class="text-center">
                      <!-- fieldsets -->
                      <div :class="`${currentindex == 1 ? 'show' : 'd-none'}`">
                        <form ref="FormPersona">
                          <fieldset>
                            <div class="form-card text-start">
                              <b-row>
                                <div class="col-7">
                                  <h4 class="mb-4"> REGISTRO DE PERSONAL:</h4>
                                </div>
                              </b-row>
                              <b-row>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="nombre" class="mb-2">Nombre(s): *</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder=""
                                      spellcheck="false" data-ms-editor="true" />
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="primerApellido" class="mb-2">Primer Paterno: *</label>
                                    <input type="text" class="form-control" id="primerApellido" name="primerApellido"
                                      placeholder="" spellcheck="false" data-ms-editor="true" />
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="segundoApellido" class="mb-2">Apellido Materno(s): *</label>
                                    <input type="text" class="form-control" id="segundoApellido" name="segundoApellido"
                                      placeholder="" spellcheck="false" data-ms-editor="true" />
                                  </div>
                                </b-col>

                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="curp" class="mb-2">CURP*</label>
                                    <input type="text" class="form-control" id="curp" name="curp" placeholder=""
                                      spellcheck="false" data-ms-editor="true" />
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group>
                                    <label class="mb-2">Género: *</label>
                                    <b-form-select id="selectedGenero" plain v-model="selectedGenero"
                                      :options="optionsGenero" size="sm" class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Género
                                          --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group>
                                    <label class="mb-2">Grupo Sanguineo: *</label>
                                    <b-form-select id="selectedGrupoSanguineo" plain v-model="selectedGrupoSanguineo"
                                      :options="optionsGrupoSanguineo" size="sm" class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Grupo Sanguineo
                                          --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group>
                                    <label class="mb-2">Tipo Sanguineo: *</label>
                                    <b-form-select id="selectedTipoSanguineo" plain v-model="selectedTipoSanguineo"
                                      :options="optionsTipoSanguineo" size="sm" class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Tipo Sanguineo
                                          --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="fechaNacimiento" class="mb-2">Fecha de Inicio: *</label>
                                    <input type="date" class="form-control" id="fechaNacimiento"
                                      name="fechaNacimiento" />
                                  </div>
                                </b-col>
                              </b-row>
                            </div>
                            <a href="#personal" class="btn btn-primary next action-button float-end"
                              @click="extractFormData()" value="Next">Next</a>
                          </fieldset>
                        </form>
                      </div>
                      <div :class="`${currentindex == 2 ? 'show' : 'd-none'}`">
                        <form ref="FormPersonal">
                          <fieldset>
                            <div class="form-card text-start">
                              <b-row>
                                <div class="col-7">
                                  <h3 class="mb-4">User Information:</h3>
                                </div>
                              </b-row>
                              <b-row>
                                <b-col md="6">
                                  <div class="form-group">
                                    <b-form-group label="Ingresa codigo Postal" label-for="buscarCP">
                                      <b-form-input id="buscarCP" type="text" v-model="codigoPostal"
                                        placeholder="Inserta CodigoPostal"></b-form-input>
                                    </b-form-group>
                                  </div>
                                  <a href="#" class="btn btn-primary next action-button float-end"
                                    @click="obtenerDomicilio()" value="Buscar">Buscar</a>

                                  <div v-if="Domicilio"></div>
                                  <div v-else>
                                    <h4 class="text-danger">
                                      Codigo Postal no existe
                                    </h4>
                                    <p>
                                      No se encontró información del Codigo
                                      Postal ingresado.
                                    </p>
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div v-if="pais">
                                    <div class="form-group">
                                      <label for="fname" class="mb-2">Pais</label>
                                      <input type="text" class="form-control" id="fname" name="fname" placeholder=""
                                        spellcheck="false" data-ms-editor="true" :disabled="isDisabled"
                                        v-model="pais" />
                                    </div>
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div v-if="estado">
                                    <div class="form-group">
                                      <label for="fname" class="mb-2">Estado:
                                      </label>
                                      <input type="text" class="form-control" id="fname" name="fname" placeholder=""
                                        spellcheck="false" data-ms-editor="true" :disabled="isDisabled"
                                        v-model="estado" />
                                    </div>
                                  </div>
                                </b-col>

                                <b-col md="6">
                                  <div v-if="municipio">
                                    <div class="form-group">
                                      <label for="fname" class="mb-2">Municipio</label>
                                      <input type="text" class="form-control" id="fname" name="fname" placeholder=""
                                        spellcheck="false" data-ms-editor="true" :disabled="isDisabled"
                                        v-model="municipio" />
                                    </div>
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group>
                                    <label class="mb-2">Colonia: *</label>
                                    <b-form-select id="selectedGrupoSanguineo" plain v-model="selectedColonia"
                                      :options="optionsColonia" size="sm" class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Colonia
                                          --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="calle" class="mb-2">Calle:*</label>
                                    <input type="text" class="form-control" id="calle" name="calle" placeholder=""
                                      spellcheck="false" data-ms-editor="true" />
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="email" class="mb-2">Correo:*</label>
                                    <input type="text" class="form-control" id="email" name="email" placeholder=""
                                      spellcheck="false" data-ms-editor="true" />
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="telefono" class="mb-2">Telefono:*</label>
                                    <input type="text" class="form-control" id="telefono" name="telefono" placeholder=""
                                      spellcheck="false" data-ms-editor="true" />
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group>
                                    <label class="mb-2">Puesto: *</label>
                                    <b-form-select id="selectedPuesto" plain v-model="selectedPuesto"
                                      :options="optionsPuesto" size="sm" class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Puesto
                                          --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group>
                                    <label class="mb-2">Estatus: *</label>
                                    <b-form-select id="selectedEstatus" plain v-model="selectedEstatus"
                                      :options="optionsEstatus" size="sm" class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Estatus
                                          --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                              </b-row>
                            </div>
                            <a href="#personal" class="btn btn-primary next action-button float-end"
                              @click="extractFormPersonal()" value="Next">Next</a>
                          </fieldset>
                        </form>
                      </div>
                    </b-form>
                  </b-col>
                </b-row>
                <template #footer> </template>
              </b-modal>

              <b-col md="12" class="table-responsive w-100">
                <iq-card>
                  <template v-slot:headerTitle>
                    <h4 class="card-title">Tabla de personal del hospital</h4>
                  </template>
                  <template v-slot:body>
                    <div class="table-responsive" v-if="filas.length > 0">
                      <table class="table table-striped table-bordered">
                        <thead>
                          <tr>
                            <th v-for="columna in columna" :key="columna.field">
                              {{ columna.label }}
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="items in paginatedRows" :key="items.id">
                            <td>{{ items.id }}</td>
                            <td>{{ items.direccion }}</td>
                            <td>{{ items.email }}</td>
                            <td>{{ items.telefono }}</td>
                            <td>{{ items.persona }}</td>
                            <td>{{ items.puesto }}</td>
                          </tr>
                        </tbody>
                        <div class="pagination-controls mb-3 me-2 mt-3">
                          <button class="btn btn-sm iq-bg-success  float-end mb-3 me-3" @click="nextPage" :disabled="currentPage >= totalPages">Siguiente → </button>
                          <button class="btn btn-sm iq-bg-danger float-end mb-3 me-3" @click="previousPage" :disabled="currentPage === 1"> ← Anterior</button>
                        </div>
                      </table>
                    </div>
                    <!-- <div v-else class="text-center" v-if="isLoading">
                      <b-spinner variant="primary"></b-spinner>
                      <p>Cargando datos...</p>
                    </div>
                    <div v-else class="text-center" v-if="isError">
                      <p>Error al cargar datos. Intente de nuevo más tarde.</p>
                    </div> -->
                  </template>
                </iq-card>
              </b-col>
            </b-row>
          </template>
        </iq-card>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import axios from "axios";
import { xray } from "../../config/pluginInit";
import iqCard from "../../components/xray/cards/iq-card";

export default {
  name: "CombinedComponent",
  components: { iqCard },
  data() {
    return {
      pais: "",
      estado: "",
      municipio: "",
      curp: "",
      isDisabled: true,
      //
      codigoPostal: "",
      Domicilio: [],
      persona: {},
      listPersonal: {},
      nombreCompletoPersonal: "",
      personalData: {},
      Puesto: {},
      newlyCreatedUserId: "",
      datosDomicilio: "",

      // Paginacion de la tabla
      currentPage: 1,
      pageSize: 10,
      //


      personalInformacionEditar: {},

      // Controla mensajes de validacion
      personaRegistrada: "",
      mensajePersonalNoEliminado: "",
      mensajePersonalEliminado: "",

      modalOpen: false,
      modalEditar: false,
      currentindex: 1,
      selectedEstatus: null,
      selectedDiasSemana: null,
      selectedPuesto: null,
      selectedGenero: null,
      selectedColonia: null,
      selectedGrupoSanguineo: null,
      selectedTipoSanguineo: null,

      optionsColonia: [],

      optionsDias: [
        {
          value: "Lunes a Domingo, excepto Lunes",
          text: "Lunes a Domingo, excepto Lunes",
        },
        {
          value: "Lunes a Domingo, excepto Martes",
          text: "Lunes a Domingo, excepto Martes",
        },
        {
          value: "Lunes a Domingo, excepto Miércoles",
          text: "Lunes a Domingo, excepto Miércoles",
        },
        {
          value: "Lunes a Domingo, excepto Jueves",
          text: "Lunes a Domingo, excepto Jueves",
        },
        {
          value: "Lunes a Domingo, excepto Viernes",
          text: "Lunes a Domingo, excepto Viernes",
        },
        {
          value: "Lunes a Domingo, excepto Sábado",
          text: "Lunes a Domingo, excepto Sábado",
        },
        { value: "Lunes a Sabado", text: "Lunes a Sadodo" },
      ],

      optionsGrupoSanguineo: [
        {
          value: "A",
          text: "A",
        },
        {
          value: "B",
          text: "B",
        },
        {
          value: "AB",
          text: "AB",
        },
        {
          value: "O",
          text: "O",
        },
      ],

      optionsGenero: [
        {
          value: "M",
          text: "Masculino",
        },
        {
          value: "F",
          text: "Femenino",
        },
      ],

      optionsTipoSanguineo: [
        {
          value: "+",
          text: "Positivo",
        },
        {
          value: "-",
          text: "Negativo",
        },
      ],

      optionsPuesto: [
        { value: 1, text: "Doctor" },
        { value: 2, text: "Enfermera" },
        { value: 3, text: "Auxiliar de enfermería" },
        { value: 4, text: "Técnico de laboratorio" },
        { value: 5, text: "Técnico de radiografías" },
        { value: 6, text: "Farmacéutico" },
        { value: 7, text: "Asistente médico" },
        { value: 8, text: "Recepcionista" },
      ],

      optionsEstatus: [
        {
          value: "activo",
          text: "Activo",
        },
        {
          value: "inactivo",
          text: "Inactivo",
        },
      ],

      columns: [
        { label: "Nombre Completo", key: "name", class: "text-left" },
        { label: "CURP", key: "curp", class: "text-left text-primary" },
        { label: "Direccion", key: "direccion", class: "text-left" },
        { label: "TelÉfono", key: "telefono", class: "text-left" },
        { label: "Correo", key: "email", class: "text-left" },
        { label: "Puesto", key: "puesto", class: "text-left" },
        { label: "Estatus", key: "estatus", class: "text-left" },
      ],
      // Add the 'this.listPersonal' object to the 'rows' array
      rows: [],


      columna: [
        { label: 'ID del Empleado', field: 'id', headerClass: 'text-left' },
        { label: 'Dirección del empleado', field: 'direccion', headerClass: 'text-left' },
        { label: 'Correo electrónico', field: 'email', headerClass: 'text-left' },
        { label: 'TelÉfono', field: 'telefono', headerClass: 'text-left' },
        { label: 'Id de la Persona', field: 'persona', headerClass: 'text-left' },
        { label: 'Id del puesto', field: 'puesto', headerClass: 'text-left' },
      ],
      filas: [],
    };
  },
  mounted() {
    xray.index();
    this.fetchData1()
  },


  // Servira para rastrear la pagina de la tabla
  computed: {
    paginatedRows() {
      const startIndex = (this.currentPage - 1) * this.pageSize;
      const endIndex = startIndex + this.pageSize;
      return this.filas.slice(startIndex, endIndex);
    },
    totalPages() {
    return Math.ceil(this.filas.length / this.pageSize);
  },
    
  },

  methods: {


    // Controla la paginacion de la tabla
    previousPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
    }
    },
    nextPage() {
      if (this.currentPage < this.totalPages) {
        this.currentPage++;
      }
    },

    // -----------------------------------

    async fetchData1() {
      this.isLoading = true; // Indicate loading state
      try {
        const response = await axios.get('http://127.0.0.1:8000/hospital/api/v1Personal/'); // Assuming endpoint fetches a single position
        this.filas = response.data;

        console.log("Arreglo datos", response.data);
      } catch (error) {
        console.error('Error fetching data:', error);
        this.isError = true; // Flag error state
      } finally {
        this.isLoading = false; // Clear loading state
      }
    }, 



    obtenerDomicilio() {
      const apiDomicilio = `https://api.copomex.com/query/info_cp/${this.codigoPostal}?token=c8b0908c-0ce2-4e8e-87f6-4db734093caa`;
      axios
        .get(apiDomicilio)
        .then((response) => {
          this.Domicilio = response.data;

          // Access and display the 'pais' property for each object
          for (const domicilio of this.Domicilio) {
            this.pais = domicilio.response.pais;
            this.estado = domicilio.response.estado;
            this.municipio = domicilio.response.municipio;
          }

          this.datosDomicilio =
            this.municipio + ", " + this.estado + ", " + this.pais;

          this.optionsColonia = this.Domicilio.map(
            (response) => response.response.asentamiento
          );
          console.log("colonias", this.optionsColonia);
        })

        .catch((error) => {
          console.error("Error fetching personal data:", error);
        });
    },

    extractFormData() {
      this.currentindex = 2;
      // Access form data using Vue's $refs
      const form = this.$refs.FormPersona;

      // Create an object to hold form data
      const personaInformacion = {
        nombre: form.nombre.value,
        primer_apellido: form.primerApellido.value,
        segundo_apellido: form.segundoApellido.value,
        curp: form.curp.value,
        genero: form.selectedGenero.value,
        grupo_sanguineo: form.selectedGrupoSanguineo.value,
        tipo_sanguineo: form.selectedTipoSanguineo.value,
        fecha_nacimiento: form.fechaNacimiento.value,
        estatus: 1,
        fecha_registro: this.getFormattedDateTime(),
      };

      console.log(personaInformacion); // This will log the updated object

      // Send HTTP POST request to the API
      const apiUrl = "http://127.0.0.1:8000/hospital/api/v1Personas/";

      axios
        .post(apiUrl, personaInformacion)
        .then((response) => {
          this.newlyCreatedUserId = response.data.id; // Assuming "id" is the property name
          console.log("Datos enviados a la base:", response.data);
          console.log("Newly created user ID:", this.newlyCreatedUserId);
        })
        .catch((error) => {
          // Handle API request errors (e.g., show error message)
          console.error("Error sending data:", error);
        });
    },


    updatePersonal() {

      const persona = this.listPersonal.id
      
      // Access form data using Vue's $refs
      const constFormUpdate = this.$refs.FormUpdatePersonal;

        const personalUpdateInformacion = {
              direccion: constFormUpdate.calle.value === ""
              ? this.personalInformacionEditar.direccion
              : constFormUpdate.calle.value + "," + this.datosDomicilio,
              email: constFormUpdate.email.value,
              telefono: constFormUpdate.telefono.value,
              estatus: constFormUpdate.selectedEstatus.value
        };

      console.log("datos del formulario actualizar", personalUpdateInformacion); // This will log the updated object

      // Send HTTP POST request to the API
      const apiUrl = `http://127.0.0.1:8000/hospital/api/v1Personal/${persona}/`;

      axios
        .put(apiUrl, personalUpdateInformacion)
        .then((response) => {
          console.log("Datos enviados a la base:", response.data);
          this.personalInformacionEditar = {};
          this.listPersonal = {};
        })
        .catch((error) => {
          // Handle API request errors (e.g., show error message)
          console.error("Error sending data:", error);
        });
    },


    getFormattedDateTime() {
      const now = new Date();
      const year = now.getFullYear();
      const month = String(now.getMonth() + 1).padStart(2, "0"); // Add leading zero for single-digit months
      const day = String(now.getDate()).padStart(2, "0"); // Add leading zero for single-digit days
      const hour = String(now.getHours()).padStart(2, "0"); // Add leading zero for single-digit hours
      const minute = String(now.getMinutes()).padStart(2, "0"); // Add leading zero for single-digit minutes
      const second = String(now.getSeconds()).padStart(2, "0"); // Add leading zero for single-digit seconds

      return `${year}-${month}-${day}T${hour}:${minute}:${second}`;
    },

    extractFormPersonal() {
      // Access form data using Vue's $refs
      const formulario = this.$refs.FormPersonal;

      // Create an object to hold form data
      const personalInformacion = {
        persona: this.newlyCreatedUserId,
        direccion: formulario.calle.value + "," + this.datosDomicilio,
        email: formulario.email.value,
        telefono: formulario.telefono.value,
        puesto: formulario.selectedPuesto.value,
        estatus: formulario.selectedEstatus.value,
      };




      console.log(personalInformacion); // This will log the updated object

      // Send HTTP POST request to the API
      const apiUrl = "http://127.0.0.1:8000/hospital/api/v1Personal/";

      axios
        .post(apiUrl, personalInformacion)
        .then((response) => {
          this.$refs.FormPersona.reset();
          this.$refs.FormPersonal.reset();
          this.modalOpen = false;
          console.log("Datos enviados a la base:", response.data);
        })
        .catch((error) => {
          // Handle API request errors (e.g., show error message)
          console.error("Error sending data:", error);
        });
    },

    buscarPersonal() {
      // Construct URL for person data based on CURP
      const personDataURL = `http://127.0.0.1:8000/hospital/api/v1Personas/${this.curp}/`;

      // Fetch person data using Axios
      axios
        .get(personDataURL)
        .then((response) => {
          // Check if person data is found
          if (response.data) {
            // Store person data in 'persona' property
            this.persona = response.data;

            console.log("Person Data:", this.persona);

            // Get person ID from the response
            const personID = this.persona.id;

            // Construct URL for personal data based on person ID
            const personalDataURL = `http://127.0.0.1:8000/hospital/api/v1Personal/${personID}/`;
            console.log("Personal Data URL:", personalDataURL); // Added for debugging

            // Fetch personal data using Axios
            axios
              .get(personalDataURL)
              .then((response) => {
                if (response.data) {
                  // Store personal data in 'personalData' property (assuming you have this property)
                  this.personalData = response.data;

                  // Log person ID and first name from the person data
                  console.log("Personal Data:", this.personalData);

                  const id = this.personalData.puesto;
                  const PuestoDataURL = `http://127.0.0.1:8000/hospital/api/v1Puesto/${id}/`;

                  axios.get(PuestoDataURL).then((response) => {
                    this.Puesto = response.data;
                    

                  this.nombreCompletoPersonal = this.persona.nombre +" " +this.persona.primer_apellido + " " + this.persona.segundo_apellido;


                    this.listPersonal = {
                      id: personID,
                      name:this.persona.nombre +" " +this.persona.primer_apellido + " " + this.persona.segundo_apellido,
                      curp: this.persona.curp,
                      telefono: this.personalData.telefono,
                      puesto: this.Puesto.nombre,
                      direccion: this.personalData.direccion,
                      email: this.personalData.email,
                      estatus: this.personalData.estatus,
                    };

                    this.rows = [];

                    this.rows.push(this.listPersonal);

                    
                    this.personalInformacionEditar = {
  
                      ...this.listPersonal,
                      ...this.curp
                    }

                    console.log("Personal a editar", this.personalInformacionEditar);

                    // Log person ID and first name from the person data
                    console.log("Personal Data:", this.listPersonal);

                    // Log person ID and first name from the person data
                    console.log("Personal Puesto:", this.Puesto);
                  });

                  // Restable la persona encontrada
                  this.personaRegistrada = "";
                  // Use the person and personal data as needed in your application
                } else {
                  // Handle the case where person data is not found
                  console.warn("Persona no encontrada.");
                  this.personalData = null;
                  
                }
              })
              .catch((error) => {
                console.error("Error fetching personal data:", error);
                this.personaRegistrada = "false";
                this.personalData = null;
              });
          } else {
            // Handle the case where person data is not found
            console.warn("Persona no encontrada.");
            this.persona = null;
            this.personalData = " ";
          }
        })
        .catch((error) => {
          console.error("Error fetching person data:", error);
          
          this.persona = null;
        });
    },



    editarPersonal() {
      this.modalEditar = true;
      this.currentindex = 1;
    },



    eliminarPersonalBuscado() {
  const persona = this.personalInformacionEditar.id;

  // Send HTTP DELETE request to the API
  const deleteapiUrl = `http://127.0.0.1:8000/hospital/api/v1Personal/${persona}/`;

  console.log("Elemento antes de ser eliminado:", persona);

  axios
    .delete(deleteapiUrl)
    .then((response) => {
      if (response.status === 200 || response.status === 204) {
        // Successful deletion (assuming success codes are 200 or 204)
        console.log("Elemento eliminado:", persona);
        this.mensajePersonalEliminado = "a";
        this.rows = [];
        // Update UI or perform other actions after successful deletion
        // (e.g., remove element from list, show success message)
      } else {
        console.error("Unexpected status code:", response.status);
        
        // Handle unexpected response status codes
        // (e.g., show error message to user)
      }
    })
    .catch((error) => {
      console.error("Error eliminando persona:", error);
      this.mensajePersonalNoEliminado = "a";
      this.rows = [];
      // Handle errors during request (e.g., network issues, server errors)
      // (e.g., show error message to user)
    });
},




    //
    add() {
      let obj = this.default();
      this.rows.push(obj);
      this.modalOpen = true;
      this.currentindex = 1;
    },
    default() {
      return {
        id: this.rows.length,
        name: "",
        position: "",
        office: "",
        age: "",
        start_date: "2011/04/25",
        salary: "$0",
        editable: false,
      };
    },
    edit(item) {
      item.editable = true;
    },
    submit(item) {
      item.editable = false;
    },
    remove(item) {
      let index = this.rows.indexOf(item);
      this.rows.splice(index, 1);
    },
    changeTab(val) {
      this.currentindex = val;
    },
  },
};
</script>

<template>
  <b-container fluid>
    <b-row>
      <b-col md="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title text-left">Asignacion de un horario a Personal</h4>
          </template>
          <template v-slot:body>
            <b-row>
              <div class="table-ad mb-3 me-2">
                <b-button variant="btn btn-sm iq-bg-success float-end" @click="add">Asignar Horario</b-button>
              </div>



              <b-modal id="modal" size="lg" v-model="modalOpen" title="">
                <b-row>
                  <b-col md="3">
                    <ul id="top-tabbar-vertical" class="p-0">
                      <li class="active" :class="`${currentindex == 1 ? 'active' : ''} ${currentindex > 1 ? 'done active' : ''
                  } `" id="personal">
                        <a href="#">
                          <i class="fa fa-id-card text-primary"></i><span>Personal</span>
                        </a>
                      </li>
       
                      <li id="official" :class="`${currentindex == 2 ? 'active' : ''} ${currentindex > 2 ? 'done active' : ''
                  }`">
                        <a href="#">
                          <i class="ri-calendar-event-fill text-success"></i><span><br>Asignar Horario</span>
                        </a>
                      </li>
                    </ul>
                  </b-col>
                  <b-col md="9">
                      <!-- fieldsets -->
                      <div :class="`${currentindex == 1 ? 'show' : 'd-none'}`">
                        <form ref="FormPersona">
                          <fieldset>
                          <div class="form-card text-start">
                            <b-row>
                              <b-col>
                                <h4 class="mb-4">ASIGNAR HORARIO A PERSONAL</h4>
                              </b-col>
                            </b-row>
                            <b-row>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <b-form-group label="Buscar personal por CURP" label-for="curpInput">
                                 <b-form-input id="curpInput" type="text"  v-model="curp" placeholder="Inserta el curp"></b-form-input>
                                 </b-form-group>
                                </div>
                                  <a href="#personal" class="btn btn-primary next action-button float-end" @click="buscarPersona"
                                  value="Buscar">Buscar Por CURP</a>

                                <div v-if="persona">
                                  
                                </div>
                                <div v-else>
                                  <h4 class="text-danger">Persona no encontrada</h4>
                                  <p>No se encontró información para el CURP ingresado.</p>
                                </div>

                                <div v-if="personalData">
                              
                                </div>
                                <div v-else>
                                  <h4 class="text-danger">La persona no es un trabajador</h4>
                                  <p>No se enc.</p>
                                </div>

                              </div>
                            
                              <div class="col-md-12">
                                <div v-if="persona">
                                  <div class="form-group">
                                    <label for="fname" class="mb-2">Nombre(s): *</label>
                                    <input type="text" class="form-control" id="fname" name="fname"
                                          placeholder="" spellcheck="false" data-ms-editor="true"
                                          :disabled="isDisabled" v-model="persona.nombre">
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div v-if="persona">
                                  <div class="form-group">
                                    <label for="fname" class="mb-2">Apelldo Paterno: </label>
                                    <input type="text" class="form-control" id="fname" name="fname"
                                          placeholder="" spellcheck="false" data-ms-editor="true"
                                          :disabled="isDisabled" v-model="persona.primer_apellido">
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div v-if="persona">
                                  <div class="form-group">
                                    <label for="fname" class="mb-2">Apellido Materno</label>
                                    <input type="text" class="form-control" id="fname" name="fname"
                                    placeholder="" spellcheck="false" data-ms-editor="true"
                                    :disabled="isDisabled" v-model="persona.segundo_apellido">
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div v-if="personalData">
                                  <div class="form-group">
                                    <label for="fname" class="mb-2">Empleo</label>
                                    <input type="text" class="form-control" id="fname" name="fname"
                                          placeholder="" spellcheck="false" data-ms-editor="true"
                                          :disabled="isDisabled" v-model="Puesto.nombre">
                                  </div>
                                </div>
                              </div>
                              
                            </b-row>
                          </div>
                          <a href="#personal" class="btn btn-primary next action-button float-end" @click="changeTab(2)"
                            value="Next">Next</a>
                        </fieldset>                          
                        </form>
                      </div>
                      <div :class="`${currentindex == 2 ? 'show' : 'd-none'}`">
                        <form ref="FormHorario">
                          <fieldset>
                          <div class="form-card text-start">
                            <div class="row">
                              <div class="col-12">
                                <h3 class="mb-4">Información del Puesto:</h3>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="dob" class="mb-2">Fecha de Inicio: *</label>
                                  <input type="date" class="form-control" id="dob" name="dob" />
                                </div>
                              </div>
                              <div class="col-md-12">
                                <b-form-group>
                                  <label class="mb-2">Dia de descanso: *</label>
                                  <b-form-select  id="selectedDiasSemana" plain v-model="selectedDiasSemana" :options="optionsDias" size="sm"
                                    class="mb-2">
                                    <template v-slot:first>
                                      <b-form-select-option :value="null">-- Seleccionar dia de descanso --</b-form-select-option>
                                    </template>
                                  </b-form-select>
                                </b-form-group>
                              </div>
                              <div class="col-md-12">
                                <b-form-group >
                                  <label class="mb-2">Turno: *</label>
                                  <b-form-select id="selecteTurno" plain v-model="selecteTurno" :options="optionsTurnos" size="sm"
                                    class="mb-2">
                                    <template v-slot:first>
                                      <b-form-select-option :value="null">-- Seleccionar Turno --</b-form-select-option>
                                    </template>
                                  </b-form-select>
                                </b-form-group>
                              </div>                          
                            </div>
                          </div>

                            <a href="#payment" id="saveButton" class="btn btn-primary next action-button float-end"
                             value="Guardar" @click="extractFormData()">Guardar (Save)</a>

                             <!-- <button type="button" id="saveButton" class="btn btn-primary next action-button float-end">Guardar (Save)</button> -->


                          <a href="#account" @click="changeTab(1)"
                            class="btn btn-dark previous action-button-previous float-end me-1"
                            value="Previous">Previous</a>
                        </fieldset>
                        </form>
                      </div>
                   
                  </b-col>
                </b-row>
                <template #footer>
                </template>
              </b-modal>

              <b-col md="12">
                <iq-card>
                  <template v-slot:headerTitle>
                    <h4 class="card-title">Tabla para todos los puestos</h4>
                  </template>
                  <template v-slot:body>
                    <div class="table-responsive" v-if="rows.length > 0">
                      <table class="table table-striped table-bordered">
                        <thead>
                          <tr>
                            <th v-for="column in columns" :key="column.field">
                              {{ column.label }}
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr v-for="item in paginatedRows" :key="item.id">
                            <td>{{ item.id }}</td>
                            <td>{{ item.personal }}</td>
                            <td>{{ item.dia_descanso }}</td>
                            <td>{{ item.fecha_inicio }}</td>
                            <td>{{ item.turno }}</td>
                          </tr>
                        </tbody>
                        <div class="pagination-controls mb-3 me-2 mt-3">
                          <button class="btn btn-sm iq-bg-success   mb-3 me-3" @click="nextPage" :disabled="currentPage >= totalPages">Siguiente → </button>
                          <button class="btn btn-sm iq-bg-danger  mb-3 me-3" @click="previousPage" :disabled="currentPage === 1"> ← Anterior</button>
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

import axios from 'axios';
import { xray } from "../../config/pluginInit";
import iqCard from "../../components/xray/cards/iq-card";








export default {
  name: "CombinedComponent",
  components: { iqCard },
  data() {
    return {

      isDisabled:true,
      // 
      curp: "",
      persona: {},
      personalData: {},
      Puesto: {},
  
    // Paginacion de la tabla
      currentPage: 1,
      pageSize: 10,
      //

      // 
      modalOpen: false,
      currentindex: 1,
      selectedDiasSemana: null,
      selecteTurno: null,

    optionsDias: [
    { value: 'Lunes', text: 'Lunes' },
    { value: 'Martes', text: 'Martes' },
    { value: 'Miércoles', text: 'Miércoles' },
    { value: 'Jueves', text: 'Jueves' },
    { value: 'Viernes', text: 'Viernes' },
    { value: 'Sábado', text: 'Sábado' },
    { value: 'Domingo', text: 'Domingo' }
    ],

    optionsTurnos: [
    { 
        value: 'Mañana', 
        text: 'Mañana (7:00 - 15:00)' 
    },
    { 
        value: 'Tarde', 
        text: 'Tarde (13:00- 23:00)' 
    },
    { 
        value: 'Noche', 
        text: 'Noche (23:00 - 7:00)' 
    }
],



      columns: [
        { label: 'ID', field: 'id', headerClass: 'text-left' },
        { label: 'Persona_ID', field: 'personal', headerClass: 'text-left' },
        { label: 'Dia de Descanso', field: 'dia_descanso', headerClass: 'text-left' },
        { label: 'Fecha de Inicio', field: 'fecha_inicio', headerClass: 'text-left' },
        { label: 'Turno', field: 'turno', headerClass: 'text-left' },
      ],
      rows: [],
      isLoading: false,
      isError: false,
    };
  },
  mounted() {
    xray.index();
    this.fetchData()
  },

  // Servira para rastrear la pagina de la tabla
  computed: {
    paginatedRows() {
      const startIndex = (this.currentPage - 1) * this.pageSize;
      const endIndex = startIndex + this.pageSize;
      return this.rows.slice(startIndex, endIndex);
    },
    totalPages() {
    return Math.ceil(this.rows.length / this.pageSize);
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
   
    async fetchData() {
      this.isLoading = true; // Indicate loading state
      try {
        const response = await axios.get('http://127.0.0.1:8000/hospital/api/v1HorarioPersonal/'); // Assuming endpoint fetches a single position
        this.rows = response.data;

        console.log("Arreglo datos", response.data);
      } catch (error) {
        console.error('Error fetching data:', error);
        this.isError = true; // Flag error state
      } finally {
        this.isLoading = false; // Clear loading state
      }
    }, 


    extractFormData() {
  // Access form data using Vue's $refs
  const form = this.$refs.FormHorario;

  // Create an object to hold form data
  const puestoInformation = {
    fecha_inicio: form.dob.value,
    dia_descanso: form.selectedDiasSemana.value,
    turno: form.selecteTurno.value,
    personal: this.personalData.id,
  };

  console.log(puestoInformation);  // Log for debugging

  // Send HTTP POST request to the API
  const apiUrl = 'http://127.0.0.1:8000/hospital/api/v1HorarioPersonal/';

  axios.post(apiUrl, puestoInformation)
    .then(response => {
      // Handle successful response (e.g., show success message)
      console.log("Datos enviados a la base:", response.data); // Log response data for debugging
      this.$refs.FormHorario.reset();
      this.$refs.FormPersona.reset();
      this.modalOpen = false;
    })
    .catch(error => {
      // Handle API request errors (e.g., show error message)
      console.error('Error sending data:', error);
    });
},


  buscarPersona() {
  // Construct URL for person data based on CURP
  const personDataURL = `http://127.0.0.1:8000/hospital/api/v1Personas/${this.curp}/`;

  // Fetch person data using Axios
  axios.get(personDataURL)
    .then(response => {
      // Check if person data is found
      if (response.data) {
        // Store person data in 'persona' property
        this.persona = response.data;

        console.log('Person Data:', this.persona);

        // Get person ID from the response
        const personID = this.persona.id;

        // Construct URL for personal data based on person ID
        const personalDataURL = `http://127.0.0.1:8000/hospital/api/v1Personal/${personID}/`;
        console.log('Personal Data URL:', personalDataURL); // Added for debugging

        // Fetch personal data using Axios
        axios.get(personalDataURL)
          .then(response => {
            if (response.data) {
            // Store personal data in 'personalData' property (assuming you have this property)
            this.personalData = response.data;

            // Log person ID and first name from the person data
            console.log('Personal Data:', this.personalData);


            const id = this.personalData.puesto;
            const PuestoDataURL = `http://127.0.0.1:8000/hospital/api/v1Puesto/${id}/`;

            axios.get(PuestoDataURL)
            .then(response => {

              this.Puesto = response.data;

              // Log person ID and first name from the person data
              console.log('Personal Puesto:', this.Puesto);

            })
            
            
            // Use the person and personal data as needed in your application
         }
         else {
        // Handle the case where person data is not found
        console.warn('Persona no encontrada.');
        this.personalData = null;
        }
        })
          .catch(error => {
            console.error('Error fetching personal data:', error);
            this.personalData = null;
          });
      } else {
        // Handle the case where person data is not found
        console.warn('Persona no encontrada.');
        this.persona = null;
        this.personalData= " "
      }
    })
    .catch(error => {
      console.error('Error fetching person data:', error);
      this.persona = null;
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


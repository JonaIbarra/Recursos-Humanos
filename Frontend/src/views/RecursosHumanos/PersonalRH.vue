<template>
  <b-container fluid>
    <b-row>
      <b-col md="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4 class="card-title">Personal del hospital</h4>
          </template>
          <template v-slot:body>
            <b-row>
              <div class="table-ad mb-3 me-2">
                <b-button variant="btn btn-sm iq-bg-success float-end" @click="add">Asignar Personal</b-button>
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
                          <i class="ri-calendar-event-fill text-success"></i><span><br>Asgignar Horario</span>
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
                                <b-col>
                                  <h3 class="mb-4">Agregar Personal</h3>
                                </b-col>
                              </b-row>
                              <b-row>
                              
                                <div class="col-md-12">
                                    <div class="form-group">
                                      <label for="nombre" class="mb-2">Nombre(s): *</label>
                                      <input type="text" class="form-control" id="nombre" name="nombre"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                      <label for="primerApellido" class="mb-2">Primer Paterno: *</label>
                                      <input type="text" class="form-control" id="primerApellido" name="primerApellido"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                      <label for="segundoApellido" class="mb-2">Apellido Materno(s): *</label>
                                      <input type="text" class="form-control" id="segundoApellido" name="segundoApellido"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </div>                            
                                <div class="col-md-12">
                                    <div class="form-group">
                                      <label for="curp" class="mb-2">CURP*</label>
                                      <input type="text" class="form-control" id="curp" name="curp"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </div>

                                <div class="col-md-12">
                                  <b-form-group >
                                    <label class="mb-2">Género: *</label>
                                    <b-form-select id="selectedGenero" plain v-model="selectedGenero" :options="optionsGenero" size="sm"
                                      class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Género --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </div>                             
 
 


                                <div class="col-md-12">
                                  <b-form-group >
                                    <label class="mb-2">Grupo Sanguineo: *</label>
                                    <b-form-select id="selectedGrupoSanguineo" plain v-model="selectedGrupoSanguineo" :options="optionsGrupoSanguineo" size="sm"
                                      class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Grupo Sanguineo --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </div>  
                                <div class="col-md-12">
                                  <b-form-group >
                                    <label class="mb-2">Tipo Sanguineo: *</label>
                                    <b-form-select id="selectedTipoSanguineo" plain v-model="selectedTipoSanguineo" :options="optionsTipoSanguineo" size="sm"
                                      class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Tipo Sanguineo --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </div> 
                                <div class="col-md-12">
                                  <div class="form-group">
                                    <label for="fechaNacimiento" class="mb-2">Fecha de Inicio: *</label>
                                    <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" />
                                  </div>
                                </div>

                              </b-row>
                            </div>
                            <a href="#personal" class="btn btn-primary next action-button float-end" @click="extractFormData()"
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
                                  <label class="mb-2">Dias de la semana: *</label>
                                  <b-form-select  id="selectedDiasSemana" plain v-model="selectedDiasSemana" :options="optionsDias" size="sm"
                                    class="mb-2">
                                    <template v-slot:first>
                                      <b-form-select-option :value="null">-- Seleccionar Dias --</b-form-select-option>
                                    </template>
                                  </b-form-select>
                                </b-form-group>
                              </div>
                              <div class="col-md-12">
                                <b-form-group >
                                  <label class="mb-2">Dias de la semana: *</label>
                                  <b-form-select id="selecteTurno" plain v-model="selecteTurno" :options="optionsTurnos" size="sm"
                                    class="mb-2">
                                    <template v-slot:first>
                                      <b-form-select-option :value="null">-- Seleccionar Turno --</b-form-select-option>
                                    </template>
                                  </b-form-select>
                                </b-form-group>
                              </div>                          
                            </div>
                            <div class="col-md-12">
                            <b-form-group label="Horario de Entrada" label-for="exampleInputtime">
                              <b-form-input id="exampleInputtime" type="time" value="13:45"></b-form-input>
                             </b-form-group>
                            </div>
                            <div class="col-md-12">
                            <b-form-group label="Horario de Salida" label-for="exampleInputtime">
                              <b-form-input id="exampleInputtime2" type="time" value="13:45"></b-form-input>
                             </b-form-group>
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
                    </b-form>
                  </b-col>
                </b-row>
                <template #footer>
                </template>
              </b-modal>

              <b-col md="12" class="table-responsive w-100">
                <b-table striped bordered hover :items="rows" :fields="columns">
                  <template v-slot:cell(name)="data">
                    <span v-if="!data.item.editable">{{ data.item.name }}</span>
                    <input type="text" v-model="data.item.name" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(age)="data">
                    <span v-if="!data.item.editable">{{ data.item.age }}</span>
                    <input type="text" v-model="data.item.age" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(company_name)="data">
                    <span v-if="!data.item.editable">{{
                  data.item.company_name
                }}</span>
                    <input type="text" v-model="data.item.company_name" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(country)="data">
                    <span v-if="!data.item.editable">{{
                  data.item.country
                }}</span>
                    <input type="text" v-model="data.item.country" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(city)="data">
                    <span v-if="!data.item.editable">{{ data.item.city }}</span>
                    <input type="text" v-model="data.item.city" v-else class="form-control text-center" />
                  </template>
                  <template v-slot:cell(sort)>
                    <td>
                      <a href="#!" class="indigo-text"><i class="fa fa-long-arrow-up" aria-hidden="true"></i>
                        <i class="fa fa-long-arrow-down ms-1" aria-hidden="true"></i></a>
                    </td>
                  </template>
                  <template v-slot:cell(remove)="data">
                    <b-button variant=" iq-bg-danger" size="sm" @click="remove(data.item)">Remove
                    </b-button>
                  </template>

                  <!-- Boton para edita -->
                  <template v-slot:cell(edit)="data">
                    <b-button variant=" iq-bg-primary" size="sm" @click="edit(data.item)">Edit
                    </b-button>
                  </template>
                </b-table>
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
     
 

      // 
      modalOpen: false,
      currentindex: 1,
      selectedDiasSemana: null,
      selectedGenero: null,
      selectedGrupoSanguineo: null,
      selectedTipoSanguineo: null,

    optionsDias: [
    { value: 'Lunes a Domingo, excepto Lunes', text: 'Lunes a Domingo, excepto Lunes' },
    { value: 'Lunes a Domingo, excepto Martes', text: 'Lunes a Domingo, excepto Martes' },
    { value: 'Lunes a Domingo, excepto Miércoles', text: 'Lunes a Domingo, excepto Miércoles' },
    { value: 'Lunes a Domingo, excepto Jueves', text: 'Lunes a Domingo, excepto Jueves' },
    { value: 'Lunes a Domingo, excepto Viernes', text: 'Lunes a Domingo, excepto Viernes' },
    { value: 'Lunes a Domingo, excepto Sábado', text: 'Lunes a Domingo, excepto Sábado' },
    { value: 'Lunes a Sabado', text: 'Lunes a Sadodo' }
    ],

    optionsGrupoSanguineo: [
    { 
        value: 'A', 
        text: 'A' 
    },
    { 
        value: 'B', 
        text: 'B' 
    },
    { 
        value: 'AB', 
        text: 'AB' 
    },
    { 
        value: 'O', 
        text: 'O' 
    }
],

optionsGenero: [
    { 
        value: 'M', 
        text: 'Masculino' 
    },
    { 
        value: 'F', 
        text: 'Femenino' 
    }
],

optionsTipoSanguineo: [
    { 
        value: '+', 
        text: 'Positivo' 
    },
    { 
        value: '-', 
        text: 'Negativo' 
    }
],



      columns: [
        { label: "Nombre", key: "name", class: "text-left" },
        { label: "Género", key: "genero", class: "text-left" },
        { label: "Telefono", key: "telefono", class: "text-left" },
        { label: "Puesto", key: "puesto", class: "text-left" },
        { label: "Horario", key: "horario", class: "text-left" },
        { label: "Estatus", key: "estatus", class: "text-left" },
        { label: "Remove", key: "remove", class: "text-center" },
        { label: "Edit", key: "edit", class: "text-center" },
      ],
      rows: [
        {
          id: 1,
          name: "Jonathan Ibarra",
          genero: "Masculino",
          telefono: "7761090829",
          puesto: "Enfermero",
          horario: "Horario Matutino",
          estatus: false,
        },
        {
          id: 2,
          name: "María García",
          genero: "Femenino",
          telefono: "5551234567",
          puesto: "Médico Residente",
          horario: "Horario Vespertino",
          estatus: true,
        },
        {
          id: 3,
          name: "Luisa Martínez",
          genero: "Femenino",
          telefono: "7229876543",
          puesto: "Médico Cirujano",
          horario: "Horario Nocturno",
          estatus: true,
        },
        {
          id: 4,
          name: "Javier González",
          genero: "Masculino",
          telefono: "3338901234",
          puesto: "Administrativo",
          horario: "Horario Mixto",
          estatus: true,
        },
        {
          id: 5,
          name: "Sofía López",
          genero: "Femenino",
          telefono: "8115678901",
          puesto: "Enfermera",
          horario: "Horario Matutino",
          estatus: false,
        },
      ],
    };
  },
  mounted() {
    xray.index();
  },


  methods: {



    extractFormData() {
  // Access form data using Vue's $refs
  const form = this.$refs.FormPersona;




  // Create an object to hold form data
  const personaInformacion = {
    nombre:  form.nombre.value,
    primer_apellido: form.primerApellido.value,
    segundo_apellido: form.segundoApellido.value,
    curp: form.curp.value,
    genero: form.selectedGenero.value,
    grupo_sanguineo: form.selectedGrupoSanguineo.value,
    tipo_sanguineo: form.selectedTipoSanguineo.value,
    fecha_nacimiento: form.fechaNacimiento.value,
    estatus: 1,
    fecha_registro: this.getFormattedDateTime()
    
  };
  


  console.log(personaInformacion); // This will log the updated object



  // Send HTTP POST request to the API
  const apiUrl = 'http://127.0.0.1:8000/hospital/api/v1Personas/';

  axios.post(apiUrl, personaInformacion)
    .then(response => {
    
      const newlyCreatedUserId = response.data.id; // Assuming "id" is the property name
      console.log("Datos enviados a la base:", response.data);
      console.log("Newly created user ID:", newlyCreatedUserId);
    })
    .catch(error => {
      // Handle API request errors (e.g., show error message)
      console.error('Error sending data:', error);
    });
},


getFormattedDateTime() {
  const now = new Date();
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, '0'); // Add leading zero for single-digit months
  const day = String(now.getDate()).padStart(2, '0'); // Add leading zero for single-digit days
  const hour = String(now.getHours()).padStart(2, '0'); // Add leading zero for single-digit hours
  const minute = String(now.getMinutes()).padStart(2, '0'); // Add leading zero for single-digit minutes
  const second = String(now.getSeconds()).padStart(2, '0'); // Add leading zero for single-digit seconds

  return `${year}-${month}-${day}T${hour}:${minute}:${second}`;
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


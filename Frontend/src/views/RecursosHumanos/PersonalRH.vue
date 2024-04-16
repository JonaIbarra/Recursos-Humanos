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



              <b-modal id="modal" size="xl" v-model="modalOpen" title="">
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
                                <div class="col-7">
                                  <h3 class="mb-4">User Information:</h3>
                                </div>
                              </b-row>
                              <b-row>
                                <b-col md="6">
                                  <div class="form-group">
                                      <label for="nombre" class="mb-2">Nombre(s): *</label>
                                      <input type="text" class="form-control" id="nombre" name="nombre"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                      <label for="primerApellido" class="mb-2">Primer Paterno: *</label>
                                      <input type="text" class="form-control" id="primerApellido" name="primerApellido"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                      <label for="segundoApellido" class="mb-2">Apellido Materno(s): *</label>
                                      <input type="text" class="form-control" id="segundoApellido" name="segundoApellido"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </b-col>

                                <b-col md="6">
                                  <div class="form-group">
                                      <label for="curp" class="mb-2">CURP*</label>
                                      <input type="text" class="form-control" id="curp" name="curp"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group >
                                    <label class="mb-2">Género: *</label>
                                    <b-form-select id="selectedGenero" plain v-model="selectedGenero" :options="optionsGenero" size="sm"
                                      class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Género --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group >
                                    <label class="mb-2">Grupo Sanguineo: *</label>
                                    <b-form-select id="selectedGrupoSanguineo" plain v-model="selectedGrupoSanguineo" :options="optionsGrupoSanguineo" size="sm"
                                      class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Grupo Sanguineo --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group >
                                    <label class="mb-2">Tipo Sanguineo: *</label>
                                    <b-form-select id="selectedTipoSanguineo" plain v-model="selectedTipoSanguineo" :options="optionsTipoSanguineo" size="sm"
                                      class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Tipo Sanguineo --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                    <label for="fechaNacimiento" class="mb-2">Fecha de Inicio: *</label>
                                    <input type="date" class="form-control" id="fechaNacimiento" name="fechaNacimiento" />
                                  </div>
                                </b-col>
                              </b-row>
                            </div>
                            <a href="#personal" class="btn btn-primary next action-button float-end" @click="extractFormData()"
                              value="Next">Next</a>
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
                                 <b-form-input id="buscarCP" type="text"  v-model="codigoPostal" placeholder="Inserta CodigoPostal"></b-form-input>
                                 </b-form-group>
                                </div>
                                  <a href="#" class="btn btn-primary next action-button float-end" @click="obtenerDomicilio()"
                                  value="Buscar">Buscar</a>

                                <div v-if="Domicilio">
                                  
                                </div>
                                <div v-else>
                                  <h4 class="text-danger">Codigo Postal no existe</h4>
                                  <p>No se encontró información del Codigo Postal ingresado.</p>
                                </div>
                                </b-col>
                                <b-col md="6">
                                  <div v-if="pais">
                                  <div class="form-group">
                                    <label for="fname" class="mb-2">Pais</label>
                                    <input type="text" class="form-control" id="fname" name="fname"
                                          placeholder="" spellcheck="false" data-ms-editor="true"
                                          :disabled="isDisabled" v-model="pais">
                                  </div>
                                </div>
                                </b-col>
                                <b-col md="6">
                                  <div v-if="estado">
                                  <div class="form-group">
                                    <label for="fname" class="mb-2">Estado: </label>
                                    <input type="text" class="form-control" id="fname" name="fname"
                                          placeholder="" spellcheck="false" data-ms-editor="true"
                                          :disabled="isDisabled" v-model="estado">
                                  </div>
                                </div>
                                </b-col>

                                <b-col md="6">
                                  <div v-if="municipio">
                                  <div class="form-group">
                                    <label for="fname" class="mb-2">Municipio</label>
                                    <input type="text" class="form-control" id="fname" name="fname"
                                    placeholder="" spellcheck="false" data-ms-editor="true"
                                    :disabled="isDisabled" v-model="municipio">
                                  </div>
                                </div>
                                </b-col>
                                <b-col md="6">
                                  <b-form-group >
                                    <label class="mb-2">Colonia: *</label>
                                    <b-form-select id="selectedGrupoSanguineo" plain v-model="selectedColonia" :options="optionsColonia" size="sm"
                                      class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Colonia --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                                <b-col md="6">
                                  <div class="form-group">
                                      <label for="email" class="mb-2">Correo:*</label>
                                      <input type="text" class="form-control" id="email" name="email"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                                </b-col>
                                <b-col md="6">
                                
                                  <div class="form-group">
                                      <label for="telefono" class="mb-2">Telefono:*</label>
                                      <input type="text" class="form-control" id="telefono" name="telefono"
                                            placeholder="" spellcheck="false" data-ms-editor="true">
                                  </div>
                               
                                </b-col>
                                <b-col md="6">
                                <b-form-group>
                                  <label class="mb-2">Puesto: *</label>
                                    <b-form-select id="selectedGrupoSanguineo" plain v-model="selectedPuesto" :options="optionsPuesto" size="sm"
                                      class="mb-2">
                                      <template v-slot:first>
                                        <b-form-select-option :value="null">-- Seleccionar Puesto --</b-form-select-option>
                                      </template>
                                    </b-form-select>
                                  </b-form-group>
                                </b-col>
                              </b-row>
                            </div>
                            <a href="#personal" class="btn btn-primary next action-button float-end" @click="extractFormPersonal()"
                              value="Next">Next</a>
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
      pais: "",
      estado: "",
      municipio: "",
      isDisabled:true,
      // 
      codigoPostal: "",
      Domicilio: [],
      personalData: {},
      Puesto: {},
     
 

      // 
      modalOpen: false,
      currentindex: 1,
      selectedDiasSemana: null,
      selectedPuesto: null,
      selectedGenero: null,
      selectedColonia: null,
      selectedGrupoSanguineo: null,
      selectedTipoSanguineo: null,



    optionsColonia: [],

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
        value: '+', text: 'Positivo' 
    },
    { 
        value: '-', text: 'Negativo' 
    }
],


optionsPuesto: [
  { value: 1, text: "Doctor" },
  { value: 2, text: "Enfermera" },
  { value: 3, text: "Auxiliar de enfermería" },
  { value: 4, text: "Técnico de laboratorio" },
  { value: 5, text: "Técnico de radiografías" },
  { value: 6, text: "Farmacéutico" },
  { value: 7, text: "Asistente médico" },
  { value: 8, text: "Recepcionista" }
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


obtenerDomicilio(){

  const apiDomicilio = `https://api.copomex.com/query/info_cp/${this.codigoPostal}?token=c8b0908c-0ce2-4e8e-87f6-4db734093caa`
        axios.get(apiDomicilio)
            .then(response => {

              this.Domicilio = response.data;

                    // Access and display the 'pais' property for each object
              for (const domicilio of this.Domicilio) {
              
                this.pais = domicilio.response.pais;
                this.estado = domicilio.response.estado;
                this.municipio = domicilio.response.municipio;
              }

              this.optionsColonia = this.Domicilio.map(response => response.response.asentamiento);
              console.log("colonias", this.optionsColonia);

            })
     
           .catch(error => {
            console.error('Error fetching personal data:', error);
            
          });

},




    extractFormData() {

      this.currentindex = 2;
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

extractFormPersonal() {

// Access form data using Vue's $refs
const form = this.$refs.FormPersonal;




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


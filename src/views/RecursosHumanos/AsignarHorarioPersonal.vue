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
                <b-button variant="btn btn-sm iq-bg-success float-end" @click="add">+ Add New</b-button>
              </div>

              <b-modal id="modal-4" size="lg" v-model="modalOpen" title="Modal title" ok-title="Save Changes"
                cancel-title="Close">
                <b-row>
                  <b-col md="3">
                    <ul id="top-tabbar-vertical" class="p-0">
                      <li class="active" :class="`${currentindex == 1 ? 'active' : ''} ${currentindex > 1 ? 'done active' : ''
                  } `" id="personal">
                        <a href="#">
                          <i class="ri-lock-unlock-line text-primary"></i><span>Personal</span>
                        </a>
                      </li>
                      <li id="contact" :class="`${currentindex == 2 ? 'active' : ''} ${currentindex > 2 ? 'done active' : ''
                  }`">
                        <a href="#">
                          <i class="ri-user-fill text-danger"></i><span>Contact</span>
                        </a>
                      </li>
                      <li id="official" :class="`${currentindex == 3 ? 'active' : ''} ${currentindex > 3 ? 'done active' : ''
                  }`">
                        <a href="#">
                          <i class="ri-camera-fill text-success"></i><span><br>Official</span>
                        </a>
                      </li>
                    </ul>
                  </b-col>
                  <b-col md="9">
                    <b-form id="form-wizard3" class="text-center">
                      <!-- fieldsets -->
                      <div :class="`${currentindex == 1 ? 'show' : 'd-none'}`">
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
                                  <label for="fname" class="mb-2">Nombre(s): *</label>
                                  <input type="text" class="form-control" id="fname" name="fname"
                                    placeholder="First Name" spellcheck="false" data-ms-editor="true" />
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="lname" class="mb-2">Apellido paterno: *</label>
                                  <input type="text" class="form-control" id="lname" name="lname"
                                    placeholder="Last Name" spellcheck="false" data-ms-editor="true" />
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="lname" class="mb-2">Apellido materno: *</label>
                                  <input type="text" class="form-control" id="lname" name="lname"
                                    placeholder="Last Name" spellcheck="false" data-ms-editor="true" />
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label class="my-2">Género: *</label>
                                  <div class="form-check d-flex ps-0">
                                    <div class="custom-control custom-radio custom-control-inline me-4">
                                      <input type="radio" id="customRadio1" name="customRadio"
                                        class="custom-control-input" />
                                      <label class="custom-control-label" for="customRadio1">
                                        Masculino</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                      <input type="radio" id="customRadio2" name="customRadio"
                                        class="custom-control-input" />
                                      <label class="custom-control-label" for="customRadio2">
                                        Femenino</label>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="dob" class="mb-2">Fecha de Nacimiento: *</label>
                                  <input type="date" class="form-control" id="dob" name="dob" />
                                </div>
                              </div>
                            </b-row>
                          </div>
                          <a href="#personal" class="btn btn-primary next action-button float-end" @click="changeTab(2)"
                            value="Next">Next</a>
                        </fieldset>
                      </div>
                      <div :class="`${currentindex == 2 ? 'show' : 'd-none'}`">
                        <fieldset>
                          <div class="form-card text-start">
                            <b-row>
                              <b-col>
                                <h3 class="mb-4">Informacion del contacto:</h3>
                              </b-col>
                            </b-row>
                            <b-row>
                              <b-col md="12">
                                <b-form-group label=" Correo Electronico : *">
                                  <!-- <label for="email">Email Id: *</label> -->
                                  <b-form-input type="email" class="form-control" id="email" name="email"
                                    placeholder="Correo Electronico" />
                                </b-form-group>
                              </b-col>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="ccno">Numero de Contacto: *</label>
                                  <input type="text" class="form-control" id="ccno" name="ccno"
                                    placeholder="Ingresa tu numero de contacto" spellcheck="false"
                                    data-ms-editor="true" />
                                </div>
                              </div>
                            </b-row>
                          </div>
                          <a href="#payment" @click="changeTab(3)" class="btn btn-primary next action-button float-end"
                            value="Next">Next</a>
                          <a href="#account" @click="changeTab(1)"
                            class="btn btn-dark previous action-button-previous float-end me-1"
                            value="Previous">Previous</a>
                        </fieldset>
                      </div>
                      <div :class="`${currentindex == 3 ? 'show' : 'd-none'}`">
                        <fieldset>
                          <div class="form-card text-start">
                            <div class="row">
                              <div class="col-12">
                                <h3 class="mb-4">Información del Puesto:</h3>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-md-12">
                                <b-form-group>
                                  <label for="accname">Seleccione el Puesto: *</label>
                                  <b-form-select plain v-model="selectedPuesto" :options="optionsPuesto" size="sm"
                                    class="mb-3">
                                    <template v-slot:first>
                                      <b-form-select-option :value="null">-- Seleccionar Puesto --</b-form-select-option>
                                    </template>
                                  </b-form-select>
                                </b-form-group>
                              </div>


                              <div class="col-md-12">
                                <b-form-group>
                                  <label for="accname">Seleccione el Horario: *</label>
                                  <b-form-select plain v-model="selectedHorario" :options="optionsHorario" size="sm"
                                    class="mb-3">
                                    <template v-slot:first>
                                      <b-form-select-option :value="null">-- Seleccionar Horario --</b-form-select-option>
                                    </template>
                                  </b-form-select>
                                </b-form-group>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label class="my-2">Estatus: *</label>
                                  <div class="form-check d-flex ps-0">
                                    <div class="custom-control custom-radio custom-control-inline me-4">
                                      <input type="radio" id="customRadio3" name="customRadio2"
                                        class="custom-control-input" />
                                      <label class="custom-control-label" for="customRadio3">
                                        Activo</label>
                                    </div>
                                    <div class="custom-control custom-radio custom-control-inline">
                                      <input type="radio" id="customRadio4" name="customRadio2"
                                        class="custom-control-input" />
                                      <label class="custom-control-label" for="customRadio4">
                                        Inactivo</label>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <div class="col-md-12">
                                <div class="form-group">
                                  <label for="dob" class="mb-2">Selciona la fecha de Inicio: *</label>
                                  <input type="date" class="form-control" id="dob" name="dob" />
                                </div>
                              </div>
                            </div>
                          </div>
                          <a href="#payment" @click="changeTab(1)" class="btn btn-primary next action-button float-end"
                            value="Next">Guardar</a>

                          <a href="#account" @click="changeTab(2)"
                            class="btn btn-dark previous action-button-previous float-end me-1"
                            value="Previous">Previous</a>
                        </fieldset>
                      </div>
                      <div :class="`${currentindex == 4 ? 'show' : 'd-none'}`"></div>
                    </b-form>
                  </b-col>
                </b-row>
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
import { xray } from "../../config/pluginInit";
import iqCard from "../../components/xray/cards/iq-card";

export default {
  name: "CombinedComponent",
  components: { iqCard },
  data() {
    return {
      modalOpen: false,
      currentindex: 1,
      selectedPuesto: null,
      selectedHorario: null,   
      optionsPuesto: [
  { value: null, text: 'Por favor selecciona una opción' },
  { value: 'Encargado de Mantenimiento', text: 'Encargado de Mantenimiento' },
  { value: 'Recepcionista', text: 'Recepcionista' },
  { value: 'Auxiliar Administrativo', text: 'Auxiliar Administrativo' },
  { value: 'Técnico de Rayos X', text: 'Técnico de Rayos X' },
  { value: 'Técnico de Laboratorio', text: 'Técnico de Laboratorio' },
  { value: 'Enfermero/a', text: 'Enfermero/a' },
  { value: 'Médico Residente', text: 'Médico Residente' },
  { value: 'Médico de Guardia', text: 'Médico de Guardia' },
  { value: 'Especialista en Neurología', text: 'Especialista en Neurología' },
  { value: 'Especialista en Cardiología', text: 'Especialista en Cardiología' },
  { value: 'Especialista en Oncología', text: 'Especialista en Oncología' },
  { value: 'Especialista en Gastroenterología', text: 'Especialista en Gastroenterología' },
  { value: 'Especialista en Pediatría', text: 'Especialista en Pediatría' },
  { value: 'Especialista en Ginecología', text: 'Especialista en Ginecología' },
  { value: 'Especialista en Cirugía General', text: 'Especialista en Cirugía General' }
],
optionsHorario: [
    { value: 'Horario Matutino', text: 'Horario Matutino' },
    { value: 'Horario Vespertino', text: 'Horario Vespertino' },
    { value: 'Horario Nocturno', text: 'Horario Nocturno' },
    { value: 'Horario de Fin de Semana', text: 'Horario de Fin de Semana' },
    { value: 'Horario Rotativo A', text: 'Horario Rotativo A' },
    { value: 'Horario Rotativo B', text: 'Horario Rotativo B' },
    { value: 'Horario Flexible', text: 'Horario Flexible' },
    { value: 'Horario de Turnos Cortos', text: 'Horario de Turnos Cortos' },
    { value: 'Horario de Turnos Largos', text: 'Horario de Turnos Largos' },
    { value: 'Horario de Guardia Diurna', text: 'Horario de Guardia Diurna' }
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

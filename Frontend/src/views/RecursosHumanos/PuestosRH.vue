  <template>
    <b-container fluid>
      <b-row>
        <b-col md="12">
          <iq-card>
            <template v-slot:headerTitle>
              <h4 class="card-title">Tabla para todos los puestos</h4>
            </template>
            <template v-slot:body>
    
              <div class="table-responsive">
                <table class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th v-for="data in columns" :key="data">
                        {{ data.label }}
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                  <tr v-for="puesto in puestos" :key="puesto">
                      <td>{{ puesto.id }}</td>
                      <td>{{ puesto.nombre }}</td>
                      <td>{{ puesto.descripcion }}</td>
                      <td>{{ puesto.requisitos }}</td>
                      <td>{{ puesto.tipo_contrato }}</td>
                      <td>{{ puesto.salario_maximo }}</td>
                      <td>{{ puesto.salario_minimo }}</td>
                      <td>{{ puesto.estatus }}</td>
      
                  </tr>
                </tbody>
                  <tfoot>
                    <tr>
                      <th v-for="data in columns" :key="data">
                        {{ data.label }}
                      </th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </template>
          </iq-card>
        </b-col>
      </b-row>
    </b-container>
  </template>
  <script>
  import { xray } from '../../config/pluginInit'
  import iqCard from '../../components/xray/cards/iq-card'
  export default {
    name: 'UiDataTable',
    components: { iqCard },
    mounted() {
      xray.index()
      // Call your function to fetch data from the API
      this.fetchPuestos();
    },

    methods: {
      async fetchPuestos() {
        try {
          const response = await fetch('http://127.0.0.1:8000/hospital/api/v1Puesto/');
          const puestos = await response.json();
          this.puestos = puestos;
          console.log(puestos);
        } catch (error) {
          console.error(error);
        }
      },
    },

    data() {
      return {
        // Replace with actual column labels from your API respons
        columns: [
          { label: 'ID', field: 'ID', headerClass: 'text-left' },
          { label: 'Nombre', field: 'Nombre', headerClass: 'text-left' },
          { label: 'Descripcion', field: 'Descripcion', headerClass: 'text-left' },
          { label: 'Requisitos', field: 'Requisitos', headerClass: 'text-left' },
          { label: 'Tipo Contrato', field: 'Tipo Contrato', headerClass: 'text-left' },
          { label: 'Salario_Maximo', field: 'Salario_Maximo', headerClass: 'text-left' },
          { label: 'Salario_Minimo', field: 'Salario_Minimo', headerClass: 'text-left' },
          { label: 'Estatus', field: 'Estatus', headerClass: 'text-left' }
        ],
        puestos: [], // Array to store fetched puestos data
      };
    }
    
  }
  </script>
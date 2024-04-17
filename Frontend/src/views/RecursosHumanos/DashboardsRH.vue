<template>
  <b-container fluid>
    <b-row>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Frecuencia de Dias de Descanso del Personal</h4>
          </template>
          <template v-slot:body>
            <DoughnutChart :chartData="DoughnutChartData" />
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Bar Chart</h4>
          </template>
          <template v-slot:body>
            <BarChart :chartData="BarChartData" />
          </template>
        </iq-card>
      </b-col>
      <b-col lg="6" sm="12">
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Pie Charts</h4>
          </template>
          <template v-slot:body>
            <PieChart :chartData="PieChartData" />
          </template>
        </iq-card>
        <iq-card>
          <template v-slot:headerTitle>
            <h4>Line chart</h4>
          </template>
          <template v-slot:body>
            <LineChart :chartData="LineChartData" />
          </template>
        </iq-card>
      </b-col>


    </b-row>
  </b-container>
</template>
<script>
import axios from 'axios'
import { xray } from '../../config/pluginInit'
import iqCard from '../../components/xray/cards/iq-card'

// Chart
import { LineChart, BarChart, PieChart, DoughnutChart } from 'vue-chart-3'
import { Chart, registerables } from 'chart.js'
Chart.register(...registerables)
export default {
  name: 'ChartJs',
  components: { iqCard, LineChart, BarChart, DoughnutChart, PieChart },
  mounted() {
    xray.index()
    this.extraerDatosPersonal()
  },
  data() {


   
    const LineChartData = {
      labels: ['August', 'September', 'October', 'November', 'December', 'January', 'February'],
      datasets: [
        {
          label: 'Line Chart',
          data: [65, 59, 80, 81, 55, 55],

          backgroundColor: 'rgba(8, 155, 171, 1)',
          borderColor: 'rgba(8, 155, 171, 1)',
          tension: 0.1,
          borderSkipped: false
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legends: {
            display: false
          }
        }
      }
    }

    const BarChartData = {
      labels: ['August', 'September', 'October', 'November', 'December', 'January', 'February'],
      datasets: [
        {
          label: 'Fully Rounded',
          data: [65, 59, 80, 81, 55, 55],

          backgroundColor: 'rgba(8, 155, 171, 1)',
          borderColor: 'rgba(8, 155, 171, 1)',
          tension: 0.1,
          borderSkipped: false
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legends: {
            display: false
          }
        }
      }
    }



    // const DoughnutChartData = {
    //   type: 'doughnut',
      
    //   labels : ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],

    //   datasets: [
    //     {
    //       label: 'Donut Chart',
    //       data: this.frecuenciasDias,
    //       backgroundColor: ['rgba(8, 155, 171, 1)', 'rgba(252, 159, 91, 1)', 'rgba(242, 99, 97, 1)', 'rgba(87, 222, 83, 1)', 'rgba(97, 226, 252, 1)'],
    //       hoverOffset: 4,
    //       borderSkipped: false
    //     }
    //   ],
    //   options: {
    //     responsive: true,
    //     plugins: {
    //       legend: {
    //         position: 'top'
    //       },
    //       title: {
    //         display: true,
    //         text: 'Chart.js Doughnut Chart'
    //       }
    //     }
    //   }
    // }

    // const PieChartData = {
    //   type: 'pie',
    //   labels: ['January', 'February', 'March', 'April', 'May'],
    //   datasets: [
    //     {
    //       label: 'Pie Chart',
    //       data: [10, 20, 15, 30, 25],
    //       backgroundColor: ['rgba(8, 155, 171, 1)', 'rgba(252, 159, 91, 1)', 'rgba(242, 99, 97, 1)', 'rgba(87, 222, 83, 1)', 'rgba(97, 226, 252, 1)'],
    //       hoverOffset: 4,
    //       borderSkipped: false
    //     }
    //   ],
    //   options: {
    //     responsive: true,
    //     plugins: {
    //       legend: {
    //         position: 'top'
    //       },
    //       title: {
    //         display: true,
    //         text: 'Chart.js Doughnut Chart'
    //       }
    //     }
    //   }
    // }


 

    return { LineChartData, BarChartData,
    
      

      
     DoughnutChartData : {
      type: 'doughnut',
      
      labels : ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],

      datasets: [
        {
          label: 'Frencuencia de Dias de descanso del personal',
          data: [],
          backgroundColor: ['rgba(8, 155, 171, 1)', 'rgba(252, 159, 91, 1)', 'rgba(242, 99, 97, 1)', 'rgba(87, 222, 83, 1)', 'rgba(97, 226, 252, 1)', '#ba01ff', '#b6ff00'],
          hoverOffset: 4,
          borderSkipped: false
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top'
          },
          title: {
            display: true,
            text: 'Chart.js  Frecuencia de Dias de descanso del personal'
          }
        }
      }
    },

    PieChartData : {
      type: 'pie',
      labels: ['January', 'February', 'March', 'April', 'May'],
      datasets: [
        {
          label: 'Pie Chart',
          data: [10, 20, 15, 30, 25],
          backgroundColor: ['rgba(8, 155, 171, 1)', 'rgba(252, 159, 91, 1)', 'rgba(242, 99, 97, 1)', 'rgba(87, 222, 83, 1)', 'rgba(97, 226, 252, 1)'],
          hoverOffset: 4,
          borderSkipped: false
        }
      ],
      options: {
        responsive: true,
        plugins: {
          legend: {
            position: 'top'
          },
          title: {
            display: true,
            text: 'Chart.js Doughnut Chart'
          }
        }
      }
    }


    }
  },

  methods : {
    extraerDatosPersonal() {


        const apiUrl = 'http://127.0.0.1:8000/hospital/api/v1HorarioPersonal/';

        axios.get(apiUrl)
          .then(response => {


        
                // Lista de días de la semana
            const DIAS_SEMANA = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"];
              // Contar los días de descanso
              const diasDescanso = DIAS_SEMANA.reduce((obj, dia) => ({ ...obj, [dia]: 0 }), {});
              for (const registro of response.data) {
                const diaDescanso = registro["dia_descanso"];
                diasDescanso[diaDescanso] += 1;
              }
              // Extraer las frecuencias y almacenar en un arreglo
               const frecuenciasDias = Object.values(diasDescanso);
               this.DoughnutChartData.datasets[0].data = frecuenciasDias
            // Mostrar el resultado
            console.log("datos", frecuenciasDias);
            // Handle successful response (e.g., show success message)
            console.log("Datos recibidos", response.data); // Log response data for debugging



            



          })
          .catch(error => {
            // Handle API request errors (e.g., show error message)
            console.error('Error sending data:', error);
          });
        },
  }
}
</script>
<style scoped></style>

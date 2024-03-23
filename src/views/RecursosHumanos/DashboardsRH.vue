<template>
    <b-container fluid>
      <b-row>
        <b-col lg="6">
          <iq-card>
            <template v-slot:headerTitle>
              <h4 class="card-title">Default Validation</h4>
            </template>
            <template v-slot:body>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi vulputate, ex ac venenatis mollis, diam nibh finibus leo</p>
              
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
    name: 'FormValidates',
    components: { iqCard },
    mounted() {
      xray.index()
    }
  }
  </script>
  
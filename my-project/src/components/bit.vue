<script setup>
import computing from './computing.vue'
import { defineProps, inject } from 'vue'
const mes = inject('mes')

defineProps({
  bit: String,
  bdu: String,
  se: String
})
</script>
messageimport computing frimport message from './computing.vue'om './computing.vue'


<template>
  <h1>{{ bit }}</h1>
  <h1>{{ bdu }}</h1>
  <h1>{{ mes }}</h1>
  <h1>{{ se }}</h1>
  <computing message="I am Computing from BIT"/>
</template>
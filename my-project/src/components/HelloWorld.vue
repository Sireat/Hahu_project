<script setup>
import { ref,provide } from 'vue'
import bit from './bit.vue'
provide('provide','I am also Computing from Hello World')
defineProps({
  msg: String,
  sireat: String,
})

const count = ref(0)
</script>

<template>
  <h1>{{ msg }}</h1>
  <h1>{{ sireat }}</h1>

  <div class="card">
    <button type="button" @click="count++" class="bg-red-500">count is {{ count }}</button>
  </div>

  <p>
    Check out
    <a href="https://vuejs.org/guide/quick-start.html#local" target="_blank"
      >create-vue</a
    >, the official Vue + Vite starter
  </p>
  <p>
    Install
    <a href="https://github.com/vuejs/language-tools" target="_blank">Volar</a>
    in your IDE for a better DX
  </p>
  <p class="read-the-docs">Click on the Vite and Vue logos to learn more</p>
  <bit bit="hey bit" bdu="hey bdu" se="SE"/>
</template>

<style scoped>

</style>

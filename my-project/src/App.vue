<script setup>
import { ref, provide } from 'vue'
import HelloWorld from './components/HelloWorld.vue'
provide('mes','Sireat')
</script>
<template>
    <!-- <div>
    <a href="https://vitejs.dev" target="_blank">
      <img src="/vite.svg" class="logo" alt="Vite logo" />
    </a>
    <a href="https://v    <p>
      Edit
      <code>components/HelloWorld.vue</code> to test HMR
    </p>uejs.org/" target="_blank">
      <img src="./assets/vue.svg" class="logo vue" alt="Vue logo" />
    </a>
    <h1 class="text-3xl font-bold texta">HEY I am VUE</h1>
  </div> -->
  <div>
  <HelloWorld msg="Vite + Vue" sireat="I am vue"/>
</div>

</template>

<style scoped>

</style>

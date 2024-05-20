<template>
  <header class="bg-gray-900 text-white">
    <div class="container mx-auto py-4 flex justify-between items-center">
      <!-- Logo -->
      <router-link to="/" class="text-7xl font-bold"> Rick & Morty </router-link>

      <!-- Navigation Links -->
      <nav class="flex space-x-4">
        <a href="/" class="hover:text-gray-300">Home</a>
        <a href="/#character" class="hover:text-gray-300">Characters</a>
        <a href="/#episode" class="hover:text-gray-300">Episodes</a>
        <a href="/#location" class="hover:text-gray-300">Locations</a>
      </nav>
    </div>
  </header>
</template>

<script>
import { defineComponent } from "vue";

export default defineComponent({});
</script>

<style scoped>
/* Add styling for the header */
</style>

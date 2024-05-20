<template>
  <footer class="bg-gray-900 text-white mt-8">
    <div class="container mx-auto py-4 flex justify-between items-center">
      <!-- Links -->
      <div class="text-white">
        <a
          href="https://github.com/sireat"
          target="_blank"
          class="mr-4 hover:text-gray-300 font-bold"
          >GitHub</a
        >
        <a
          href="https://www.figma.com/design/y0AXso9tfnMy83HbIDLSG2/Rick-%26-Morty?m=dev&node-id=0%3A1&t=Gs9sLoitQgmhkjDr-1"
          target="_blank"
          class="mr-4 hover:text-gray-300 font-bold"
          >Figma</a
        >
        <a
          href="https://github.com/yourusername/rick-and-morty-project"
          target="_blank"
          class="hover:text-gray-300 font-bold"
          >Rick and Morty Source Code</a
        >
      </div>

      <!-- Date and Year -->
      <p class="text-white">{{ currentDate }}</p>

      <!-- Attribution -->
      <p class="text-white">Designed by <span class="font-bold">Sireat</span></p>
    </div>
  </footer>
</template>

<script>
import { defineComponent, computed } from "vue";

export default defineComponent({
  setup() {
    const currentDate = computed(() => {
      const date = new Date();
      return `${date.toLocaleDateString(undefined, {
        month: "long",
        day: "numeric",
      })}, ${date.getFullYear()}`;
    });

    return { currentDate };
  },
});
</script>

<style scoped>
/* Add styling for the footer */
</style>

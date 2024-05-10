
<script>
export default {
  data() {
    return {
      query: '',
    };
  },
  methods: {
    handleSearch() {
      this.$emit('search', this.query);
    },
  },
};
</script>

<template>
  <div class="flex items-center">
    <input v-model="query" type="text" placeholder="Search Google or Type a URL..." class="rounded-full border border-gray-300 px-4 py-2 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 w-full" @keyup.enter="handleSearch"/>
    <button type="button" @click="handleSearch" class="bg-blue-500 text-white px-4 py-2 rounded-md ml-2">Search</button>
  </div>
</template>



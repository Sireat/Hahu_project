<script setup>
import { ref } from 'vue';
import SearchBox from './components/SearchBox.vue';

const searchResults = ref(null);

const searchGoogle = async (query) => {
  try {
    const response = await fetch(`https://www.googleapis.com/customsearch/v1?key=AIzaSyD5jjpGsjxvEDDqEeJs0BT6QADF50YD7kk&cx=10b10ce6ac98c4430&q=${query}`);    
    const data = await response.json();
    searchResults.value = data.items.map(item => ({
      title: item.title,
      link: item.link,
      snippet: item.snippet,
    }));
  } catch (error) {
    console.error('Error searching Google:', error);
  }
};
</script>

<template>
  <div class="flex justify-center items-center min-h-screen">
    <div class="max-w-lg w-full">
      <img v-if="!searchResults" src="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png" alt="Google Logo" class="mb-8" />
      <img v-else src="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png" alt="Google Logo" class="absolute top-4 left-4 w-24 h-auto" />

      <!-- Original SearchBox component -->
      <SearchBox @search="searchGoogle" />

      <!-- Display search results -->
      <div v-if="searchResults" class="mt-4">
        <h2 class="text-xl font-semibold mb-4">Search Results:</h2>
        <ul>
          <li v-for="(result, index) in searchResults" :key="index" class="mb-4">
            <a :href="result.link" target="_blank" class="text-blue-500 font-medium hover:underline">{{ result.title }}</a>
            <p class="text-gray-700">{{ result.snippet }}</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="bg-gray-200 text-gray-600 p-4">
  <footer class="text-center text-blue-600 text-sm mt-8">
    &copy; 2024 Google. All rights reserved.
</footer>
</div>
</template>

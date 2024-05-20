<template>
  <div class="flex flex-col min-h-screen bg-gray-300">
    <Header />
    <div class="container mx-auto mt-8 flex-grow">
      <div class="container mx-auto mt-8" v-if="location || loading || error">
        <div class="max-w-3xl mx-auto" v-if="location">
          <div>
            <h2 class="text-2xl font-bold">{{ location.name }}</h2>
            <p class="text-lg text-gray-600">
              Type: {{ location.type }} - Dimension: {{ location.dimension }}
            </p>
            <p class="text-lg text-gray-600">Created: {{ location.created }}</p>
          </div>
          <div class="border-t border-gray-300 mt-4 pt-4">
            <h3 class="text-xl font-bold mb-2">Residents</h3>
            <ul
              class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-3 gap-6"
            >
              <li
                v-for="(resident, index) in location.residents"
                :key="index"
                class="mb-4"
              >
                <div class="flex items-center">
                  <img
                    :src="resident.image"
                    :alt="resident.name"
                    class="w-12 h-12 rounded-full mr-4"
                  />
                  <div>
                    <h4 class="text-lg font-bold">{{ resident.name }}</h4>
                    <p class="text-md text-gray-600">Status: {{ resident.status }}</p>
                    <p class="text-md text-gray-600">Species: {{ resident.species }}</p>
                    <p class="text-md text-gray-600">Gender: {{ resident.gender }}</p>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div v-else-if="loading">Loading location data...</div>
        <div v-else-if="error">Error loading location data: {{ error.message }}</div>
        <router-view v-else></router-view>
      </div>
    </div>
    <Footer />
  </div>
</template>

<script setup>
import { ref, watchEffect } from "vue";
import { useQuery } from "@vue/apollo-composable";
import { gql } from "graphql-tag";
import { useRoute } from "vue-router";
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";

const route = useRoute();
const locationId = ref(route.params.id);

const { result, loading, error } = useQuery(
  gql`
    query GetLocation($id: ID!) {
      location(id: $id) {
        name
        type
        dimension
        created
        residents {
          name
          status
          species
          gender
          image
        }
      }
    }
  `,
  { id: locationId.value }
);

const location = ref(null);

watchEffect(() => {
  if (result.value && result.value.location) {
    location.value = result.value.location;
    console.log("Location data:", location.value);
  }
  if (loading.value) {
    console.log("Loading location data...");
  }
  if (error.value) {
    console.error("Error loading location data:", error.value);
  }
});
</script>

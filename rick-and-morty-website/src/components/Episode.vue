<template>
  <!-- Episodes Section -->
  <div class="container mx-auto flex flex-wrap justify-center bg-slate-300 py-8">
    <!-- Episodes Title -->
    <div class="text-5xl w-full text-center mb-8" id="episode">
      Episodes for the Rick and Morty TV Show
    </div>
    <!-- Loading State -->
    <div
      v-if="episodesResult && episodesResult.loading"
      class="text-center mt-8 text-lg font-semibold text-gray-800"
    >
      Loading...
    </div>
    <!-- Error State -->
    <div
      v-else-if="episodesResult && episodesResult.error"
      class="text-center mt-8 text-lg font-semibold text-red-600"
    >
      Error: {{ episodesResult.error.message }}
    </div>
    <!-- Episodes List -->
    <div
      v-else-if="episodes.length > 0"
      class="grid grid-cols-1 gap-4 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5"
    >
      <div
        v-for="(episode, index) in episodes"
        :key="episode.id"
        class="border border-gray-200 rounded-lg overflow-hidden shadow-md mx-4 mb-4"
      >
        <router-link :to="`/episode/${episode.id}`">
          <!-- Episode Image -->
          <img
            :src="getUniqueCharacterImage(episode, index)"
            alt="Episode Image"
            class="w-full h-auto object-cover rounded-lg"
          />
        </router-link>
        <div class="p-4">
          <!-- Episode Title -->
          <router-link :to="`/episode/${episode.id}`">
            <h3 class="text-xl font-semibold text-gray-800">{{ episode.name }}</h3>
          </router-link>
        </div>
      </div>
    </div>
    <!-- No Episodes Available State -->
    <div v-else class="text-center mt-8 text-lg font-semibold text-gray-800">
      No episodes available.
    </div>
  </div>
  <!-- End Episodes Section -->
</template>

<script setup>
import { useQuery } from "@vue/apollo-composable";
import { gql } from "graphql-tag";
import { ref, watchEffect } from "vue";

const GET_EPISODES = gql`
  query GetEpisodes {
    episodes {
      results {
        id
        name
        characters {
          image
        }
      }
    }
  }
`;

const { result: episodesResult } = useQuery(GET_EPISODES);
const episodes = ref([]);

const getUniqueCharacterImage = (episode, index) => {
  if (episode.characters.length > 0) {
    const characterIndex = index % episode.characters.length;
    return episode.characters[characterIndex].image;
  }
  return "default-image-url.jpg";
};

watchEffect(() => {
  if (episodesResult.value && episodesResult.value.episodes) {
    episodes.value = episodesResult.value.episodes.results;
  }
});
</script>

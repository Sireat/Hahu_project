<template>
  <div class="bg-slate-300 container mx-auto relative">
    <Carousel
      :items-to-show="4"
      :wrap-around="true"
      :snap-align="'start'"
      class="carousel py-4"
      ref="carousel"
    >
      <Slide v-for="(show, index) in shows" :key="index">
        <div class="carousel-item flex-shrink-0 w-full">
          <div class="aspect-w-1 aspect-h-1">
            <img
              :src="show.image"
              alt="Show image"
              class="w-full h-auto object-cover"
              :style="{ width: imgWidth + 'px', height: imgHeight + 'px' }"
            />
          </div>
          <div class="mt-4 bg-slate-300 p-4 rounded-lg shadow-md w-full">
            <h2 class="text-xl font-bold mb-2">{{ show.title }}</h2>
            <p class="text-gray-700 mb-2">
              <strong>Description:</strong> {{ show.description }}
            </p>
            <p class="text-gray-700 mb-2"><strong>Genre:</strong> {{ show.genre }}</p>
            <p class="text-gray-700 mb-2">
              <strong>Creators:</strong> {{ show.creators }}
            </p>
            <p class="text-gray-700 mb-2"><strong>Stars:</strong> {{ show.stars }}</p>
            <p class="text-gray-700"><strong>Rating:</strong> {{ show.rating }}</p>
          </div>
        </div>
      </Slide>
    </Carousel>
    <button
      @click="prev"
      class="prev-btn absolute left-0 top-1/2 transform -translate-y-1/2 text-red-600 text-lg"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-6 w-6"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M15 19l-7-7 7-7"
        />
      </svg>
    </button>
    <button
      @click="next"
      class="next-btn absolute right-0 top-1/2 transform -translate-y-1/2 text-red-600 text-lg"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-6 w-6"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M9 5l7 7-7 7"
        />
      </svg>
    </button>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { Carousel, Slide } from "vue3-carousel";
import "vue3-carousel/dist/carousel.css";

const carousel = ref(null);

const shows = [
  {
    image: "/assets/images/1.jpeg",
    title: "Show Title 1",
    description: "Description of show 1.",
    genre: "Drama, Action",
    creators: "John Doe, Jane Smith",
    stars: "Actor A, Actor B, Actor C",
    rating: "8.5/10",
  },
  {
    image: "/assets/images/2.jpeg",
    title: "Show Title 2",
    description: "Description of show 2.",
    genre: "Comedy, Romance",
    creators: "Alice Johnson, Bob Brown",
    stars: "Actor D, Actor E, Actor F",
    rating: "7.8/10",
  },
  // Add more shows as needed
  {
    image: "/assets/images/3.jpeg",
    title: "Show Title 3",
    description: "Description of show 3.",
    genre: "Sci-Fi, Adventure",
    creators: "Charlie Davis, Dana White",
    stars: "Actor G, Actor H, Actor I",
    rating: "9.0/10",
  },
  {
    image: "/assets/images/4.jpeg",
    title: "Show Title 4",
    description: "Description of show 4.",
    genre: "Thriller, Mystery",
    creators: "Eve King, Frank Moore",
    stars: "Actor J, Actor K, Actor L",
    rating: "8.2/10",
  },
  {
    image: "/assets/images/5.jpeg",
    title: "Show Title 5",
    description: "Description of show 5.",
    genre: "Fantasy, Drama",
    creators: "Grace Lee, Henry Scott",
    stars: "Actor M, Actor N, Actor O",
    rating: "8.7/10",
  },
  {
    image: "/assets/images/6.jpeg",
    title: "Show Title 6",
    description: "Description of show 6.",
    genre: "Horror, Thriller",
    creators: "Ivy Martinez, Jack Robinson",
    stars: "Actor P, Actor Q, Actor R",
    rating: "7.5/10",
  },
  {
    image: "/assets/images/7.jpeg",
    title: "Show Title 7",
    description: "Description of show 7.",
    genre: "Documentary, Biography",
    creators: "Kevin Adams, Laura Nelson",
    stars: "Actor S, Actor T, Actor U",
    rating: "9.3/10",
  },
  {
    image: "/assets/images/8.jpeg",
    title: "Show Title 8",
    description: "Description of show 8.",
    genre: "Musical, Drama",
    creators: "Megan Foster, Nathan Brooks",
    stars: "Actor V, Actor W, Actor X",
    rating: "8.1/10",
  },
  {
    image: "/assets/images/9.jpeg",
    title: "Show Title 9",
    description: "Description of show 9.",
    genre: "Crime, Drama",
    creators: "Olivia Reed, Paul Sanders",
    stars: "Actor Y, Actor Z, Actor AA",
    rating: "8.9/10",
  },
];

const next = () => {
  carousel.value.next();
};

const prev = () => {
  carousel.value.prev();
};
</script>

<style scoped>
.carousel-container {
  width: 100%;
  overflow: hidden;
}

.carousel-item {
  flex: 0 0 auto;
  width: 100%; /* Set a flexible width */
  max-width: 20rem; /* Set a maximum width */
  height: auto; /* Adjust height to content */
}

.carousel-item img {
  width: 100%;
  height: auto; /* Adjust height as needed */
  object-fit: cover;
}

.prev-btn,
.next-btn {
  background-color: #fff;
  border: none;
  padding: 10px;
  cursor: pointer;
  font-size: 16px;
  margin: 5px;
  border-radius: 50%;
  box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
  transition: background-color 0.3s;
}

.prev-btn:hover,
.next-btn:hover {
  background-color: #ddd;
}
</style>

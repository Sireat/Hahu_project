<template>
  <div class="bg-slate-200">
    <!-- header Section -->
    <Header />
    <!-- carousel Section-->
    <Carousel />
    <!-- Characters Section -->
    <Character />
    <!-- Episodes Section -->
    <Episode />
    <!-- Locations Section -->
    <Location />
    <!-- footer Section -->
    <Footer />
  </div>
</template>

<script setup>
import Header from "../components/Header.vue";
import Footer from "../components/Footer.vue";
import Carousel from "../components/Carousel.vue";
import Episode from "../components/Episode.vue";
import Character from "../components/Character.vue";
import Location from "../components/Location.vue";
</script>

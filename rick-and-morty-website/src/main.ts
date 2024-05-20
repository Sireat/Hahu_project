import "./style.css";

import { ApolloClient, InMemoryCache } from "@apollo/client/core";
import { createRouter, createWebHistory } from 'vue-router'

import App from './App.vue'
import CharacterPage from './pages/CharacterPage.vue'
import { DefaultApolloClient } from '@vue/apollo-composable'
import EpisodePage from './pages/EpisodePage.vue'
import HomePage from './pages/HomePage.vue'
import LocationPage from "./pages/LocationPage.vue"
import { createApp } from 'vue'

// Apollo Client setup
export const apolloClient = new ApolloClient({
  uri: 'https://rickandmortyapi.com/graphql',
  cache: new InMemoryCache()
})

// Router setup
const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: HomePage },
    { path: '/episode/:id', component: EpisodePage },
    { path: '/character/:id', component: CharacterPage },
    { path: '/location/:id', component: LocationPage }
  ]
})

// Create and mount the Vue app
createApp(App)
  .use(router)
  .provide(DefaultApolloClient, apolloClient)
  .mount('#app')

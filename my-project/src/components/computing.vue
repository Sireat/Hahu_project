<script setup>
import { defineProps, inject } from 'vue';
import se from './se.vue'
import fifth from './fifth.vue'
import sireat from './sireat.vue'
const provide=inject('provide')
defineProps({
    message:String
})

</script>

<template>
    <h1>{{message}}</h1>
    <h1>{{provide}}</h1>
    <p>using text interpolation:{{rowHtml}}</p>
    <p>using v-html directive:<span v-html="rowHtml"></span></p>
    <div><se/></div>
    <div><fifth/></div>
    <div><sireat title="My Journy With VUE"/></div>
</template>
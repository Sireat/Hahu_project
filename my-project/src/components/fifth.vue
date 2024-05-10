
<script setup>
import {ref, onMounted} from 'vue'
const count=ref(0)
function incrment(){
    count.value++
}
const items=ref([{message:'I am'},{mesage:'Software Engineer'}])
</script>
<template>
    <li v-for=" item in items">{{item.mesage}}</li>
  <button @click="incrment" class="bg-red-500">Count is: {{count}}</button>
</template>
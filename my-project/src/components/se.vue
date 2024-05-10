
  <script>
  export default {
    data() {
      return {
        count:1
      };
    },
    methods: {
        incrment() {
        this.count*=2
      }
    },
    mounted(){
        console.log('the initial count is ${{count}}')
    }
  };
  </script>
<template>
    <button @click="incrment" class="bg-red-500">Count is: {{count}}</button>
</template>
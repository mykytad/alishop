import { createApp } from 'vue'
// import { createApp, ref } from 'vue'
import DemoGrid from './grid.js'

// const { createApp } = Vue

// createApp({
//   data() {
//     return {
//       message: 'Привіт, Vue!'
//     }
//   }
// }).mount('#app')


createApp({
  components: {
    DemoGrid
  },
  data: () => ({
    searchQuery: '',
    gridColumns: [
      "Order number",
      "Order status",
      "Order price",
      "Store",
      "Created at"
    ],
    gridData: [
      {
        "Order number": 1,
        "Order status": "new",
        "Order price": "$200.50",
        Store: "cactus",
        "Created at": "12.03.2023"
      },
    ]
  })
}).mount('#app')
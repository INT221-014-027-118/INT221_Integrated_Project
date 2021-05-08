import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/tailwind.css'
import BaseColor from './components/BaseColor.vue'

const app = createApp(App);

app.use(router);
app.component('base-color',BaseColor)
app.mount('#app')
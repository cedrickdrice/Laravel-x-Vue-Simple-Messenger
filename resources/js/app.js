require('./bootstrap');
import {createApp} from 'vue'
import Messenger from "./components/views/Messenger";
import router from './router.js';

/**
 * Boostrap
 */
import "bootstrap";
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

/**
 * Fa Icons
 */
import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { fas } from '@fortawesome/free-solid-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'

library.add(fas, fab, far);

/**
 * Vue Component
 */

createApp(Messenger)
    .use(router)
    .component('fa', FontAwesomeIcon)
    .mount("#app")

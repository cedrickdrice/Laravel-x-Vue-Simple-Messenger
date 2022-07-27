import { createRouter, createWebHistory } from "vue-router";

//components
import Messenger from './components/views/Messenger'

const routes = [
    {
        path: '/',
        name: 'messenger',
        component: Messenger,
    }
];

export default createRouter({
    history: createWebHistory(),
    routes,
});


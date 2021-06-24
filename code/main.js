import Vue from 'vue'
import VueRouter from 'vue-router'
import axios from 'axios'
import App from './App'
import qs from 'qs';

import cuCustom from './colorui/components/cu-custom.vue'
Vue.component('cu-custom', cuCustom)

Vue.config.productionTip = false

const router = new VueRouter({
	mode: 'history',
	scorllBehavior: () => ({
		y: 0

	})

});

Vue.prototype.$http = axios;

App.mpType = 'app'

const app = new Vue({
	...App
})
app.$mount()

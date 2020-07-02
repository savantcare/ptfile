// This file is structured based on https://github.com/vuex-orm/vuex-orm-examples-nuxt/tree/master/store
import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import VuexORMSearch from '@vuex-orm/plugin-search'
import VuexORM from '@vuex-orm/core'
import axios from 'axios'
import VuexORMAxios from '@vuex-orm/plugin-axios'
import layer2MultiTabDialogStateModule from '@/components/l2-tab-manager/layer2MultiTabDialogState'
import database from '@/database'

VuexORM.use(VuexORMAxios, { axios })
VuexORM.use(VuexORMSearch, {
  // Configure default fuse.js options here (see "Configuration" section below).
})
Vue.use(Vuex)

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      counter: 0,
    }),
    mutations: {
      increment(state) {
        state.counter++
      },
    },
    modules: {
      multiTabDialogLayer2: layer2MultiTabDialogStateModule,
    },
    plugins: [createPersistedState(), VuexORM.install(database)],
  })
}

export default createStore

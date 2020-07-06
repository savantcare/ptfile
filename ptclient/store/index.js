// This file is structured based on https://github.com/vuex-orm/vuex-orm-examples-nuxt/tree/master/store
import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate'
import VuexORMSearch from '@vuex-orm/plugin-search'
import VuexORM from '@vuex-orm/core'
import axios from 'axios'
import VuexORMAxios from '@vuex-orm/plugin-axios'
import l2DialogAndTabsStateModule from '@/components/l2-tab-manager/l2DialogAndTabsState'
import database from '@/database'

VuexORM.use(VuexORMAxios, { axios })
VuexORM.use(VuexORMSearch, {
  // Configure default fuse.js options here (see "Configuration" section below).
})
Vue.use(Vuex)

const createStore = () => {
  return new Vuex.Store({
    state: () => ({}),
    modules: {
      dialogHoldingTabsInL2: l2DialogAndTabsStateModule,
    },
    plugins: [createPersistedState(), VuexORM.install(database)],
  })
}

export default createStore

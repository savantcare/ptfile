// This file is structured based on https://github.com/vuex-orm/vuex-orm-examples-nuxt/tree/master/store
import Vue from 'vue'
import Vuex from 'vuex'
import VuexormSearchUiToCT from '@vuex-orm/plugin-search'
import VuexORM from '@vuex-orm/core'
import axios from 'axios'
import VuexORMAxios from '@vuex-orm/plugin-axios'
import VuexORMisDirtyPlugin from '@vuex-orm/plugin-change-flags'

// Ref: https://github.com/eldomagan/vuex-orm-localforage#installation
import VuexORMLocalForage from 'vuex-orm-localforage'
import clDialogAndTabsStateModule from '@/components/cl-tabs-manager/clDialogAndTabsState'
import vlCardsStateModule from '@/components/vl-search-box/vlCardsState'
import database from '@/database'

VuexORM.use(VuexORMAxios, { axios })
VuexORM.use(VuexORMisDirtyPlugin)
VuexORM.use(VuexormSearchUiToCT, {
  tokenize: true, // Ref: https://github.com/vuex-orm/plugin-search#configurations needed so "goal add" works when list has "add goal"
  matchAllTokens: true, // needed so "goal add" shows only opyion 1 when list has "add goal" and "multi rate goal"
  threshold: 0.4, // the following will match goal: gool gaal gaaal gloa Following not match: gloq
})

Vue.use(Vuex)

const createStore = () => {
  return new Vuex.Store({
    state: () => ({}),
    modules: {
      dialogHoldingTabsInCL: clDialogAndTabsStateModule,
      cardsInCSOfVL: vlCardsStateModule,
    },
    plugins: [VuexORM.install(database)],
  })
}

VuexORM.use(VuexORMLocalForage, {
  database,
})

export default createStore

// This file is structured based on https://github.com/vuex-orm/vuex-orm-examples-nuxt/tree/master/store
import Vue from 'vue'
import Vuex from 'vuex'

import VuexormSearchUiToCT from '@vuex-orm/plugin-search'
import VuexORM from '@vuex-orm/core'
import axios from 'axios'
import VuexORMAxios from '@vuex-orm/plugin-axios'

// Ref: https://github.com/eldomagan/vuex-orm-localforage#installation
import VueStateOfTabsAndDialogInCLModule from '@/cts/core/cl-tabs-manager/VueStateOfTabsAndDialogInCL'

// Full form: Vue State Of Cards In Current state Of View layer Module
import VstOfCardsInCSOfVLModule from '@/cts/core/vl-search-box/VstOfCardsInCSOfVL'

import VueStateOfFeedDrawerModule from '@/cts/core/feed/VueStateOfFeedDrawer'
import VueStateOfMapDrawerModule from '@/cts/core/map/VueStateOfMapDrawer'

import database from '@/database'

// Ref: https://stackoverflow.com/a/62247034
const { v1: uuidv1 } = require('uuid')

VuexORM.use(VuexORMAxios, { axios })
VuexORM.use(VuexormSearchUiToCT, {
  tokenize: true, // Ref: https://github.com/vuex-orm/plugin-search#configurations needed so "goal add" works when list has "add goal"
  matchAllTokens: true, // needed so "goal add" shows only opyion 1 when list has "add goal" and "multi rate goal"
  threshold: 0.4, // the following will match goal: gool gaal gaaal gloa Following not match: gloq
})

Vue.use(uuidv1)

Vue.use(Vuex)

const createStore = () => {
  return new Vuex.Store({
    state: () => ({}),
    modules: {
      vstObjTabsInCL: VueStateOfTabsAndDialogInCLModule,

      // Full form: view state object feed drawer
      vstObjFeedDrawer: VueStateOfFeedDrawerModule,
      vstObjMapDrawer: VueStateOfMapDrawerModule,

      // Full form: view state object cards in current state of view layer
      vstObjCardsInCSOfVL: VstOfCardsInCSOfVLModule,
    },
    plugins: [VuexORM.install(database)],
  })
}

export default createStore

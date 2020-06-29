// This file is structured based on https://github.com/vuex-orm/vuex-orm-examples-nuxt/tree/master/store

import VuexORM from '@vuex-orm/core'
import database from '@/database'

export const plugins = [VuexORM.install(database)]

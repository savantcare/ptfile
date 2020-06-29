// This file is structured based on https://github.com/vuex-orm/vuex-orm-examples-nuxt/tree/master/store
import VuexORM from '@vuex-orm/core'
import axios from 'axios'
import VuexORMAxios from '@vuex-orm/plugin-axios'
import database from '@/database'

VuexORM.use(VuexORMAxios, { axios })

export const plugins = [VuexORM.install(database)]

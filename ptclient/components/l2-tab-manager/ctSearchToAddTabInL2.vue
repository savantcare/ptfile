<template>
  <div style="text-align: center;">
    <el-autocomplete
      class="inline-input"
      v-model="keyword"
      :fetch-suggestions="mfQuerySearch"
      :trigger-on-focus="true"
      placeholder="Please Input"
      prefix-icon="el-icon-search"
      @select="mfHandleSelect"
      clearable
    ></el-autocomplete>
  </div>
</template>

<script>
import ormSearch from '../../models/CtSearchInL2'
import { ADD_GOAL /*, MULTIPLE_RATE_GOAL */ } from '@/static/others.js'

export default {
  data() {
    return {}
  },
  mounted() {},
  methods: {
    mfQuerySearch(pQueryString, pCallBack) {
      const resultSet = ormSearch.query().search(pQueryString).get()
      console.log('search result from orm model', resultSet)
      pCallBack(resultSet)
    },
    mfHandleSelect(item) {
      const { key } = item
      if (key === ADD_GOAL) {
        const objAddGTab = {
          nameToShowUser: 'Add goal',
          ctInsideTab: require('../goal/layer-2/ctAddGoal.vue').default,
          name: 'tab-add-goal',
        }
        this.$store.commit('mtfAddAdditionalTab', objAddGTab)
      }
    },
  },
}
</script>

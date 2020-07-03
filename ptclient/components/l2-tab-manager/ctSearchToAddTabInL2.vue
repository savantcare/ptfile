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
import ormCtSearch from '../../models/CtSearchInL2'
import { ADD_GOAL /*, MULTIPLE_RATE_GOAL */ } from '@/static/others.js'

export default {
  data() {
    return {}
  },
  mounted() {},
  methods: {
    mfQuerySearch(pQueryString, pCallBack) {
      const resultSet = ormCtSearch.query().search(pQueryString).get() // TODO: Why is this ormCtSearch and not ormSearch

      console.log('search result from orm model', resultSet)

      console.log(resultSet)
      pCallBack(resultSet)
    },
    mfHandleSelect(item) {
      const { key } = item
      if (key === ADD_GOAL) {
        const doAddGTab = {
          // Why is this called doAddGTab. Should it be objAddGTab ?
          nameToShowUser: 'Add goal',
          ctInsideTab: require('../goal/layer-2/ctAddGoal.vue').default,
          name: 'tab-add-goal',
        }
        this.$store.commit('mtfAddAdditionalTab', doAddGTab)
      }
    },
  },
}
</script>

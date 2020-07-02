<template>
  <div style="text-align: center;">
    <el-autocomplete
      class="inline-input"
      v-model="keyword"
      :fetch-suggestions="mfQuerySearch"
      :trigger-on-focus="false"
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
    mfQuerySearch(queryString, cb) {
      const arCtGoalInSearch = ormCtSearch.query().search(queryString).get() // TODO: Why is this ormCtSearch and not ormSearch

      console.log('search result from orm model', arCtGoalInSearch)

      console.log(arCtGoalInSearch)
      cb(arCtGoalInSearch)
    },
    mfHandleSelect(item) {
      const { key } = item
      if (key === ADD_GOAL) {
        const doAddGTab = {
          nameToShowUser: 'Add goal',
          ctInsideTab: require('../goal/layer-2/ctAddGoal.vue').default,
          name: 'tab-add-goal',
        }
        this.$store.commit('mtfAddAdditionalTab', doAddGTab)
      } /* else if (key == MULTIPLE_RATE_GOAL) {
        const multiChangeGoalTab = {
          label: 'Multi rate goal',
          value: require('../patient/goal/layer2/MultiChangeGoal').default,
          name: 'tab-multi-change-goal',
        }
        this.$store.commit('mtfAddAdditionalTab', multiChangeGoalTab)
      } */
    },
  },
}
</script>

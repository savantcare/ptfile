<template>
  <div style="text-align: center;">
    <el-autocomplete
      class="inline-input"
      v-model="keyword"
      :fetch-suggestions="querySearch"
      :trigger-on-focus="false"
      placeholder="Please Input"
      prefix-icon="el-icon-search"
      @select="handleSelect"
      clearable
    ></el-autocomplete>
  </div>
</template>

<script>
import { ADD_GOAL /*, MULTIPLE_RATE_GOAL */ } from '@/static/others.js'
export default {
  data() {
    return {
      keyword: '',
      componentList: [
        {
          value: 'Add goal',
          key: ADD_GOAL,
        },
        /* {
          value: 'Multi rate goals',
          key: MULTIPLE_RATE_GOAL,
        }, */
      ],
    }
  },
  mounted() {},
  methods: {
    querySearch(queryString, cb) {
      let results = []
      if (queryString.length === 0) {
        results = []
      }

      results = this.componentList.filter((item) => {
        return item.value.toLowerCase().search(queryString) > -1
      })

      cb(results)
    },
    handleSelect(item) {
      const { key } = item
      if (key === ADD_GOAL) {
        const addGoalTab = {
          label: 'Add goal',
          value: require('../goal/layer-2/addGoal.vue').default,
          name: 'tab-add-goal',
        }
        this.$store.commit('addNewTab', addGoalTab)
      } /* else if (key == MULTIPLE_RATE_GOAL) {
        const multiChangeGoalTab = {
          label: 'Multi rate goal',
          value: require('../patient/goal/layer2/MultiChangeGoal').default,
          name: 'tab-multi-change-goal',
        }
        this.$store.commit('addNewTab', multiChangeGoalTab)
      } */
    },
  },
}
</script>

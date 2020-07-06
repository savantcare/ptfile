<template>
  <el-select v-model="value" placeholder="Select" @change="mfHandleChange">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value"
    >
    </el-option>
  </el-select>
</template>

<script>
import ormSearch from '../../models/ormSearch'
export default {
  data() {
    return {
      options: [
        {
          value: 'assessment-tabset',
          label: 'Assessment tabset',
        },
        {
          value: 'plan-tabset',
          label: 'Plan tabset',
        },
      ],
      value: '',
    }
  },
  methods: {
    mfHandleChange(pValue) {
      console.log('value changed', pValue)
      if (pValue === 'assessment-tabset') {
        // cannot hardcode, need to query since dont know the ID created when inserted
        const resultSet = ormSearch.query().search('Add goal').get()
        const resultData = resultSet[0]
        const objAddTab = {
          label: resultData.value,
          ctToShowInsideTab: require('@/components/' +
            resultData.ctToShowInsideTab).default,
          ctAbbr: resultData.ctAbbr,
          id: resultData.id,
          closable: true,
        }
        this.$store.commit('mtfShowNewFirstTabInL2', objAddTab)
        this.$store.state.dialogHoldingTabsInL2.vsSelectedTabId = this.$store.state.dialogHoldingTabsInL2.arTabs[0].id
      } else if (pValue === 'plan-tabset') {
        let resultSet = ormSearch.query().search('Add diagnosis').get()
        let resultData = resultSet[0]
        let objAddTab = {
          label: resultData.value,
          ctToShowInsideTab: require('@/components/' +
            resultData.ctToShowInsideTab).default,
          ctAbbr: resultData.ctAbbr,
          id: resultData.id,
          closable: true,
        }
        this.$store.commit('mtfShowNewFirstTabInL2', objAddTab)
        resultSet = ormSearch.query().search('Multi rate goal').get()
        resultData = resultSet[0]
        objAddTab = {
          label: resultData.value,
          ctToShowInsideTab: require('@/components/' +
            resultData.ctToShowInsideTab).default,
          ctAbbr: resultData.ctAbbr,
          id: resultData.id,
          closable: true,
        }
        this.$store.commit('mtfAdditionalTabAddOrActivate', objAddTab)
        this.$store.state.dialogHoldingTabsInL2.vsSelectedTabId = this.$store.state.dialogHoldingTabsInL2.arTabs[0].id
      }
    },
  },
}
</script>

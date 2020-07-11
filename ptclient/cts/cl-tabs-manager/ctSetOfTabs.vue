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
import ormSearchPhraseUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'
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
        const resultArFromORM = ormSearchPhraseUiToCT
          .query()
          .search('add goal')
          .get()
        const resultData = resultArFromORM[0]
        const objAddTab = {
          label: resultData.value,
          ctToShow: require('@/cts/' + resultData.ctToShowInCL).default,
          ctAbbr: resultData.ctAbbr,
          id: resultData.id,
          closable: true,
        }
        this.$store.commit('mtfShowNewFirstTabInCl', objAddTab)
        this.$store.state.vstObjTabsInCL.vsSelectedTabId = this.$store.state.vstObjTabsInCL.arTabs[0].id
      } else if (pValue === 'plan-tabset') {
        let resultArFromORM = ormSearchPhraseUiToCT
          .query()
          .search('add diagnosis')
          .get()
        let resultData = resultArFromORM[0]
        let objAddTab = {
          label: resultData.value,
          ctToShow: require('@/cts/' + resultData.ctToShowInCL).default,
          ctAbbr: resultData.ctAbbr,
          id: resultData.id,
          closable: true,
        }
        this.$store.commit('mtfShowNewFirstTabInCl', objAddTab)
        resultArFromORM = ormSearchPhraseUiToCT
          .query()
          .search('multi rate goal')
          .get()
        resultData = resultArFromORM[0]
        objAddTab = {
          label: resultData.value,
          ctToShow: require('@/cts/' + resultData.ctToShowInCL).default,
          ctAbbr: resultData.ctAbbr,
          id: resultData.id,
          closable: true,
        }
        this.$store.commit('mtfAdditionalTabAddOrActivate', objAddTab)
        this.$store.state.vstObjTabsInCL.vsSelectedTabId = this.$store.state.vstObjTabsInCL.arTabs[0].id
      }
    },
  },
}
</script>

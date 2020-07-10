<template>
  <div></div>
</template>

<script>
import ormSearchPhraseUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },
  mounted() {
    // Search interfaces to this component
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'add goal',
        ctAbbr: 'addg',
        ctToShowInCL: 'goal/cl/ctAddGoal.vue',
        layer: 'change',
      },
    })

    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'multi rate goal',
        ctAbbr: 'mcg',
        ctToShowInCL: 'goal/cl/ctMultiRateGoal.vue',
        layer: 'change',
      },
    })

    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'goal',
        ctAbbr: 'g',
        ctToShowInCL: 'goal/g-vl.vue',
        layer: 'view',
      },
    })
  },
}
</script>

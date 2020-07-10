<template>
  <div></div>
</template>

<script>
import ormSearchUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },
  mounted() {
    // Search interfaces to this component
    ormSearchUiToCT.insert({
      data: {
        value: 'add goal',
        ctAbbr: 'addg',
        ctToShowInCL: 'goal/cl/ctAddGoal.vue',
        layer: 'change',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'multi rate goal',
        ctAbbr: 'mcg',
        ctToShowInCL: 'goal/cl/ctMultiRateGoal.vue',
        layer: 'change',
      },
    })

    ormSearchUiToCT.insert({
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

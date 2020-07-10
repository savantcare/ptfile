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
    ormSearchUiToCT.insert({
      data: {
        value: 'reminders',
        ctAbbr: 'rem',
        ctToShowInMSVL: 'rem/vl/table.vue', // MSVL -> Multi state view layer
        ctToShowInCSVL: 'rem/vl/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'add reminder',
        ctAbbr: 'arem',
        ctToShowInCL: 'rem/cl/add.vue',
        layer: 'change',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'multi change reminder',
        ctAbbr: 'arem',
        ctToShowInCL: 'rem/cl/mc.vue',
        layer: 'change',
      },
    })
  },
}
</script>

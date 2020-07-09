<template>
  <div></div>
</template>

<script>
import ormSearchUiToCT from '@/components/vl-search-box/vuex-orm/searchUIToCT'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },
  mounted() {
    ormSearchUiToCT.insert({
      data: {
        value: 'Reminders',
        ctAbbr: 'rem',
        ctToShowInMSVL: 'rem/vl/table.vue', // MSVL -> Multi state view layer
        ctToShowInCSVL: 'rem/vl/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'Add Reminder',
        ctAbbr: 'arem',
        ctToShowInCL: 'rem/cl/add.vue',
        layer: 'change',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'Multi change Reminder',
        ctAbbr: 'arem',
        ctToShowInCL: 'rem/cl/mc.vue',
        layer: 'change',
      },
    })
  },
}
</script>

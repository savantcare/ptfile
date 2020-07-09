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
        ctToShowInsideTab: '',
        ctToShowInsideMSVL: 'rem/vl/table.vue', // MSVL -> Multi state view layer
        ctToShowInsideCSVL: 'rem/vl/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'Add Reminder',
        ctAbbr: 'arem',
        ctToShowInsideTab: 'rem/cl/add.vue',
        ctToShowInsideMSVL: '',
        ctToShowInsideCSVL: '',
        layer: 'change',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'Multi change Reminder',
        ctAbbr: 'arem',
        ctToShowInsideTab: 'rem/cl/mc.vue',
        layer: 'change',
        ctToShowInsideMSVL: '',
        ctToShowInsideCSVL: '',
      },
    })
  },
}
</script>

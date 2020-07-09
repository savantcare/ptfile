<template>
  <div></div>
</template>

<script>
import ormSearchUiToCT from '@/components/vl-search-box/vuex-orm/searchUiToCT'

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
        ctToShowInsideMSVL: 'rem/vl/table.vue',
        ctToShowInsideCSVL: 'rem/vl/timeline.vue',
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

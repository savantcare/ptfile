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
        ctToShow: '',
        ctToShowInsideMSVL: 'rem/vl/table.vue',
        ctToShowInsideCSVL: 'rem/vl/timeline.vue',
        layer: 'view',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'Add Reminder',
        ctAbbr: 'arem',
        ctToShow: 'rem/cl/add.vue',
        ctToShowInsideMSVL: '',
        ctToShowInsideCSVL: '',
        layer: 'change',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'Multi change Reminder',
        ctAbbr: 'arem',
        ctToShow: 'rem/cl/mc.vue',
        layer: 'change',
        ctToShowInsideMSVL: '',
        ctToShowInsideCSVL: '',
      },
    })
  },
}
</script>

<template>
  <div></div>
</template>

<script>
import ormSearchUiToCT from '@/components/vl-search-box/vuex-orm/searchUiToCT'
import ormCTLifeCycle from '@/models/ormCTLifeCycle'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },
  mounted() {
    // Why do I check for lifecycle before defining search terms. Reason given at: rex-l1.vue:49
    const resultSet = ormCTLifeCycle.query().where('name', 'Reminder').get()
    const resultData = resultSet[0]
    if (typeof resultData !== 'undefined') {
      console.log('already mounted')
    } else {
      ormCTLifeCycle.insert({
        data: {
          name: 'Reminder',
          status: 3,
        },
      })
      ormSearchUiToCT.insert({
        data: {
          value: 'Reminders',
          ctAbbr: 'rem',
          ctToShowInsideTab: 'rem/cl/add.vue',
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
          ctToShowInsideMSVL: 'rem/vl/table.vue',
          ctToShowInsideCSVL: 'rem/vl/timeline.vue',
          layer: 'change',
        },
      })

      ormSearchUiToCT.insert({
        data: {
          value: 'Multi change Reminder',
          ctAbbr: 'arem',
          ctToShowInsideTab: 'rem/cl/mc.vue',
          layer: 'change',
        },
      })
    }
  },
}
</script>

<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Reminders</span>
        <el-button style="float: right; padding: 3px 0;" type="text"
          >X</el-button
        >
        <el-button style="float: right; padding: 3px 0;" type="text"
          >D</el-button
        >
        <el-button style="float: right; padding: 3px 0;" type="text"
          >M</el-button
        >
      </div>
      <el-timeline>
        <el-timeline-item
          v-for="row in dataTable"
          :key="row.createdAt"
          :timestamp="row.createdAt"
        >
          {{ row.remDescription }}
        </el-timeline-item>
      </el-timeline>
    </el-card>
  </div>
</template>

<script>
import ormSearchUiToCT from '@/models/ormSearchUiToCT'
import ormCTLifeCycle from '@/models/ormCTLifeCycle'
import ormRem from '@/components/rem/vuex-orm/model.js'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },
  computed: {
    dataTable() {
      const dataTable = []
      const resultSet = ormRem.query().where('$isNew', true).get()
      if (resultSet.length) {
        let obj = []
        console.log('unsaved data found', resultSet, resultSet[0].uuid)
        for (let i = 0; i < resultSet.length; i++) {
          obj = {}
          obj.remDescription = resultSet[i].remDescription
          obj.createdAt = '1'
          dataTable.push(obj)
        }
      }
      console.log(dataTable)
      return dataTable
    },
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
          ctToShowInsideTab: 'rem/vl/table.vue',
          layer: 'view',
        },
      })

      ormSearchUiToCT.insert({
        data: {
          value: 'Add Reminder',
          ctAbbr: 'arem',
          ctToShowInsideTab: 'rem/cl/add.vue',
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

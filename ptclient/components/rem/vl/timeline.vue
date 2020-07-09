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
import ormSearchUiToCT from '@/components/vl-search-box/vuex-orm/searchUiToCT'
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
        let date = ''
        console.log('unsaved data found', resultSet, resultSet[0].uuid)
        for (let i = 0; i < resultSet.length; i++) {
          obj = {}
          obj.remDescription = resultSet[i].remDescription
          /*
          To get the number of the month:
          obj.createdAt = date.getMonth() + 1 + "-" + date.getDate()

          To get the name of the month:
          Ref: https://stackoverflow.com/questions/1643320/get-month-name-from-date
          */
          date = new Date(resultSet[i].ROW_START)
          obj.createdAt = date.toLocaleString('default', { month: 'long' }) + "-" + date.getDate()

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
    }
  },
}
</script>

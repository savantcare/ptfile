<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Reminders</span>
        <el-button-group style="float: right;">
          <el-button style="padding: 3px;" type="primary" plain>M</el-button>
          <el-button style="padding: 3px;" type="warning" plain>D</el-button>
          <el-button style="padding: 3px;" type="info" plain>X</el-button>
        </el-button-group>
      </div>
      <el-table
        :data="dataTable"
        :showHeader="false"
        :size="mini"
        style="width: 100%;"
      >
        <el-table-column type="expand">
          <template slot-scope="props">
            <p>Created: {{ props.row.createdAt }}</p>
          </template>
        </el-table-column>
        <el-table-column prop="remDescription" label="Description" width="180">
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
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
          // For date format ref: /components/rem/vl/timeline.vue:53
          date = new Date(resultSet[i].ROW_START)
          obj.createdAt =
            date.toLocaleString('default', { month: 'long' }) +
            '-' +
            date.getDate()
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

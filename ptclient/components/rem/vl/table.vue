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
      <el-table
        :data="dataTable"
        :showHeader="false"
        :size="mini"
        style="width: 100%;"
      >
        <el-table-column type="expand">
          <template slot-scope="props">
            <p>Created at: {{ props.row.createdAt }}</p>
          </template>
        </el-table-column>
        <el-table-column prop="remDescription" label="Description" width="180">
        </el-table-column>
      </el-table>
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
        console.log('unsaved data found', resultSet, resultSet[0].uuid)
        for (let i = 0; i < resultSet.length; i++) {
          obj = {}
          obj.remDescription = resultSet[i].remDescription
          obj.createdAt = resultSet[i].ROW_START
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

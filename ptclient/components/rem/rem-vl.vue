<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Reminder</span>
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
      <el-table :data="daTable" style="width: 100%;">
        <el-table-column prop="description" label="Description" width="180">
        </el-table-column>
        <el-table-column prop="createdAt" label="Created At" width="180">
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import ormSearchUiToCT from '../../models/ormSearchUiToCT'
import ormCTLifeCycle from '../../models/ormCTLifeCycle'
export default {
  data() {
    return {
      daTable: [
        {
          createdAt: '2016-05-03',
          description: 'TSH test in 3 months',
        },
      ],
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
          ctToShowInsideTab: 'rem/rem-vl.vue',
          layer: 'view',
        },
      })
    }
  },
}
</script>

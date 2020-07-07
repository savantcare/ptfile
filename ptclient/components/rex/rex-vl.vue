<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Recommendations</span>
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
        <el-table-column prop="createdAt" label="CreatedAt" width="180">
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import ormSearchUiToCT from '../../models/ormSearchUiToCT'
import ormCTLifeCycle from '../../models/ormCTLifeCycle'
export default {
  name: 'rex-vl',
  data() {
    return {
      daTable: [
        {
          createdAt: '2016-05-03',
          description: 'Walk 10 mins everday',
        },
        {
          createdAt: '2016-05-02',
          description: 'Sleep 8 hours every day',
        },
      ],
    }
  },
  // activated lifecycle hook, is called whenever a keep-alive component is activated.
  // Ref: https://stackoverflow.com/questions/46974234/vue-router-keep-alive-and-mounted-behavior
  mounted() {
    // Inserting Search interfaces to this component
    const resultSet = ormCTLifeCycle
      .query()
      .where('name', 'Recommendations')
      .get()
    const resultData = resultSet[0]
    if (typeof resultData !== 'undefined') {
      console.log('already mounted')
    } else {
      ormSearchUiToCT.insert({
        data: {
          value: 'Recommendations',
          ctAbbr: 'rex',
          ctToShowInsideTab: 'rex/rex-vl.vue',
          layer: 'view',
        },
      })
      ormCTLifeCycle.insert({
        data: {
          name: 'Recommendations',
          status: 3,
        },
      })
      console.log('mounted')
    }
  },
}
</script>

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
import ormSearchUiToCT from '@/models/ormSearchUiToCT'
import ormCTLifeCycle from '@/models/ormCTLifeCycle'
export default {
  name: 'vl/table',
  data() {
    return {
      daTable: [],
    }
  },
  // activated lifecycle hook, is called whenever a keep-alive component is activated.
  // Ref: https://stackoverflow.com/questions/46974234/vue-router-keep-alive-and-mounted-behavior
  mounted() {
    /* 
    Goal: Check if this Ct was already mounted. 
    Why? If Ct is already mounted I do not want to do 3 things have already happened
        For the description of the 3 things read Line 65,74,83
        For e.g. If I let search.insert happen multiple times then in the search dropdown multiple results will come
    Why not use keepalive?    
        Sorrounding component with keepAlive in pf/_uuid/index.vue does not help. Since previous rendering of rex
        is not hidden. When user types rex 2 times, rex is being displayed 2 times
    */
    const resultSet = ormCTLifeCycle
      .query()
      .where('name', 'Recommendations')
      .get()
    const resultData = resultSet[0]
    if (typeof resultData !== 'undefined') {
      console.log('already mounted')
    } else {
      // Step 1/3: Store information that this Ct has already been mounted
      // I run this before API to server since API to server takes time and during the wait time 2 Ct may end up running
      // This ORM is used by the vl-search-ct and once the state is set then the existing ct's update their view
      ormCTLifeCycle.insert({
        data: {
          name: 'Recommendations',
          status: 3,
        },
      })

      // Step 2/3: Inserting Search interfaces to this component
      ormSearchUiToCT.insert({
        data: {
          value: 'Recommendations',
          ctAbbr: 'rex',
          ctToShowInsideTab: '',
          ctToShowInsideMSVL: 'rec/vl/table.vue',
          ctToShowInsideCSVL: 'rec/vl/timeline.vue',
          layer: 'view',
        },
      })

      ormSearchUiToCT.insert({
        data: {
          value: 'Add Recommendations',
          ctAbbr: 'arex',
          ctToShowInsideTab: 'rec/vl/table.vue',
          layer: 'change',
        },
      })
      // Step 3/3: Run API to get data from server

      console.log('Done mounting')
    }
  },
}
</script>

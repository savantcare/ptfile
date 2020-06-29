<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Goal</span>
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
import ormGoal from '@/models/Goal'
const { GOAL_API_URL } = 'http://localhost:8000/goals'
export default {
  data() {
    return {
      daTable: [
        {
          createdAt: '2016-05-03',
          description: 'Test goal 1',
        },
        {
          createdAt: '2016-05-02',
          description: 'Test goal 2',
        },
      ],
      oneQueryIsRunningGate: false,
    }
  },
  mounted() {
    this.dbGetGoals()
  },
  methods: {
    async dbGetGoals() {
      if (!this.oneQueryIsRunningGate) {
        this.oneQueryIsRunningGate = true
        console.log('Testing kkkkk')
        const countGoal = await ormGoal.query().count()

        console.log('Number of recs before query =>', countGoal)
        if (countGoal === 0) {
          await ormGoal.api().get(GOAL_API_URL)
          console.log('Number of goal in model =>', ormGoal.query().count())
        }
        this.oneQueryIsRunningGate = false
      }
    },
  },
  getters: {},
}
</script>

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
      <el-table :data="daGTable" style="width: 100%;">
        <el-table-column prop="description" label="Description" width="180">
        </el-table-column>
        <el-table-column prop="score" label="Score" width="180">
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import ormGoal from '@/models/Goal'
// const { GOAL_API_URL } = 'http://localhost:8000/goals'
export default {
  data() {
    return {
      daGTable: ormGoal.query().get(),
      // daGTable: [],
      dblOneQueryIsRunningGate: false,
    }
  },
  mounted() {
    this.dbGetGoals()
  },
  methods: {
    async dbGetGoals() {
      try {
        if (!this.dblOneQueryIsRunningGate) {
          this.dblOneQueryIsRunningGate = true
          const countGoal = await ormGoal.query().count()

          console.log('Number of recs before query =>', countGoal)
          if (countGoal === 0) {
            const goalEvalList = await ormGoal
              .api()
              .get(
                'http://localhost:8000/goals?patientUUID=bfe041fa-073b-4223-8c69-0540ee678ff8'
              )

            // console.log('goalEvalList - ' + goalEvalList.ok)
            // let arGoalEvalList = null
            if (goalEvalList.ok) {
              // console.log('goal==== ' + JSON.stringify(arGoalEvalList, null, 4))
            }
            // await ormGoal.api().get(GOAL_API_URL)
            console.log('Number of goal in model =>', ormGoal.query().count())
            const arGoalEvalList = ormGoal.query().get()
            this.daGTable = arGoalEvalList
          }
          this.dblOneQueryIsRunningGate = false
        }
      } catch (ex) {
        console.log('failed')
      }
    },
  },
}
</script>

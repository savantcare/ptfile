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
        <el-button
          @click.prevent="mfOpenADialog()"
          style="float: right; padding: 3px 0;"
          type="text"
          >A
        </el-button>
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
// import addGoal from './layer-2/addGoal.vue'
import ormCtSearch from '../../models/CtSearchInL2'
import ormGoal from '@/models/Goal'
import { ADD_GOAL } from '@/static/others.js'

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
    this.mfdaGetG()
  },
  methods: {
    async mfdaGetG() {
      try {
        if (!this.dblOneQueryIsRunningGate) {
          this.dblOneQueryIsRunningGate = true
          const dnCountG = await ormGoal.query().count()

          console.log('Number of recs before query =>', dnCountG)
          if (dnCountG === 0) {
            await ormGoal
              .api()
              .get(
                'http://localhost:8000/goals?patientUUID=bfe041fa-073b-4223-8c69-0540ee678ff8'
              )

            console.log('Number of goal in model =>', ormGoal.query().count())
            const arGoalEvalList = ormGoal.query().get()
            this.daGTable = arGoalEvalList

            const obCtGoalInSearch = {
              ctName: 'Add goal',
              ctAbbr: 'addg',
              value: 'Add goal',
              key: ADD_GOAL,
            }

            ormCtSearch.insert({
              data: obCtGoalInSearch,
            })
          }
          this.dblOneQueryIsRunningGate = false
        }
      } catch (ex) {
        console.log('failed')
      }
    },
    mfOpenADialog() {
      console.log('show add dialog')
      const tab = {
        nameToShowUser: 'Add goal',
        ctInsideTab: require('@/components/goal/layer-2/ctAddGoal.vue').default,
        name: 'tab-add-goal',
      }

      this.$store.commit('mtfShowNewTabInL2', tab)
    },
  },
}
</script>

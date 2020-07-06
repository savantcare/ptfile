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
import ormSearch from '../../models/ormSearch'
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
    // Search interfaces to this component
    ormSearch.insert({
      data: {
        value: 'Add goal',
        ctAbbr: 'addg',
        ctToShowInsideTab: 'goal/l2/ctAddGoal.vue',
        layer: 'change',
      },
    })

    ormSearch.insert({
      data: {
        value: 'Multi rate goal',
        ctAbbr: 'mcg',
        ctToShowInsideTab: 'goal/l2/ctMultiRateGoal.vue',
        layer: 'change',
      },
    })

    ormSearch.insert({
      data: {
        value: 'Goal',
        ctAbbr: 'g',
        ctToShowInsideTab: 'goal/g-l1.vue',
        layer: 'view',
      },
    })

    this.mfdaGetG()
  },
  methods: {
    async mfdaGetG() {
      // TODO: what does da in the name indicate?
      try {
        if (!this.dblOneQueryIsRunningGate) {
          this.dblOneQueryIsRunningGate = true
          const dnCountG = await ormGoal.query().count()

          console.log('Number of goals before query =>', dnCountG)
          if (dnCountG === 0) {
            await ormGoal
              .api()
              .get(
                'http://localhost:8000/goals?patientUUID=bfe041fa-073b-4223-8c69-0540ee678ff8'
              )

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
    mfOpenADialog() {
      console.log('show add dialog')
      const resultSet = ormSearch.query().search('Add goal').get()
      const resultData = resultSet[0]
      const tab = {
        label: resultData.value,
        ctToShowInsideTab: require('@/components/' +
          resultData.ctToShowInsideTab).default,
        ctAbbr: resultData.ctAbbr,
        id: resultData.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInL2', tab)
    },
  },
}
</script>

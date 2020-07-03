<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Diagnoses</span>
        <el-button style="float: right; padding: 3px 0;" type="text"
          >X</el-button
        >
        <el-button style="float: right; padding: 3px 0;" type="text"
          >D</el-button
        >
        <el-button style="float: right; padding: 3px 0;" type="text"
          >M</el-button
        >
        <el-button
          @click.prevent="mfOpenADialog()"
          style="float: right; padding: 3px 0;"
          type="text"
          >A</el-button
        >
      </div>
      <el-table :data="daDxTable" style="width: 100%;">
        <el-table-column prop="dxName" label="Diagnosis name" width="180">
        </el-table-column>
        <el-table-column prop="dxOnDate" label="Diagnosed on" width="180">
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import ormSearch from '../../models/CtSearchInL2'
import ormDx from '@/models/Dx'

/* export default {
  async asyncData({ params }) {
    const { data } = await axios.get(
      `http://localhost:8000/diagnosis/?patientId=bfe041fa-073b-4223-8c69-0540ee678ff8`
    )
    return { daTable: data }
  },
} */
export default {
  data() {
    return {
      daDxTable: ormDx.query().get(),
      dblOneDxQueryIsRunningGate: false,
    }
  },
  mounted() {
    // Search interfaces to this component
    ormSearch.insert({
      data: {
        value: 'Add diagnosis',
        ctAbbr: 'adddx',
        ctToShowInsideTab:
          '/Users/vk-tech/gt/sc-prog-repos/ptfile/ptclient/components/goal/layer-2/ctAddGoal.vue',
      },
    })
    this.fnFetchDxFromApi()
  },
  methods: {
    async fnFetchDxFromApi() {
      try {
        if (!this.dblOneDxQueryIsRunningGate) {
          this.dblOneDxQueryIsRunningGate = true
          const countDxCountFromORM = ormDx.query().count()
          console.log('Number of dx before query =>', countDxCountFromORM)
          if (countDxCountFromORM === 0) {
            const dxEvalList = await ormDx
              .api()
              .get(
                `http://localhost:8000/diagnosis/?patientId=bfe041fa-073b-4223-8c69-0540ee678ff8`
              )

            if (dxEvalList.ok) {
            }
            this.daDxTable = ormDx.query().get()
            // ormDx.query('').get()
            console.log('Number of dx in model =>', ormDx.query().count())
          } else {
            this.daDxTable = ormDx.query().get()
          }
          this.dblOneDxQueryIsRunningGate = false
        }
      } catch (e) {}

      // console.log(dxList);
    },
    mfOpenADialog() {
      console.log('show add dialog')
      const tab = {
        value: 'Add Dx',
        ctToShowInsideTab: require('@/components/goal/layer-2/ctAddGoal.vue')
          .default,
        id: 'tab-add-dx',
      }
      this.$store.commit('mtfShowNewFirstTabInL2', tab)
    },
  },
}
</script>

<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Screening</span>
        <el-button style="float: right; padding: 3px 0;" type="text"
          >G</el-button
        >
        <el-button style="float: right; padding: 3px 0;" type="text"
          >A</el-button
        >
      </div>
      <el-table :data="daScrTable" style="width: 100%;">
        <el-table-column
          prop="scientificName"
          label="scientificName"
          width="150"
        >
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import ormScr from '@/models/Screening'
export default {
  data() {
    return {
      daTable: [
        {
          scientificName: 'PHQ9',
        },
      ],
      daScrTable: ormScr.query().get(),
      dblOneQueryIsRunningGate: false,
    }
  },
  computed: {},
  beforeCreate() {},
  mounted() {
    this.dbGetScreenings()
  },
  methods: {
    async dbGetScreenings() {
      try {
        if (!this.dblOneQueryIsRunningGate) {
          this.dblOneQueryIsRunningGate = true
          const countScr = await ormScr.query().count()

          console.log('Number of recs before query =>', countScr)
          if (countScr === 0) {
            const scrEvalList = await ormScr
              .api()
              .get(
                'http://localhost:8000/screening?patientUUID=bfe041fa-073b-4223-8c69-0540ee678ff8'
              )

            // console.log('sctEvalList - ' + scrEvalList.ok)
            // let arScrEvalList = null
            if (scrEvalList.ok) {
              // console.log('screen==== ' + JSON.stringify(arScrEvalList, null, 4))
            }
            // await ormScr.api().get(GOAL_API_URL)
            console.log('Number of screen in model =>', ormScr.query().count())
            const arScrEvalList = ormScr.query().get()
            this.daScrTable = arScrEvalList
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

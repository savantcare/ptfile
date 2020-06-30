<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Screening</span>
        <el-button style="float: right; padding: 0 3px;" type="text"
          >G</el-button
        >
        <el-button style="float: right; padding: 0 3px;" type="text"
          >A</el-button
        >
      </div>
      <el-table :data="daScrTable" style="width: 100%;">
        <el-table-column
          prop="scientificName"
          label="Scientific name"
          width="150"
        >
        </el-table-column>
        <el-table-column>
          <template slot-scope="scope">
            <el-button type="text" size="mini" @click="fnTakeScrL2(scope.row)"
              >T</el-button
            ><el-button type="text" size="mini" @click="fnAddScrL2(scope.row)"
              >G</el-button
            >
          </template>
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
    fnTakeScrL2(data) {
      console.log('show take a screen dialog', data)
      // this.$store.commit("showTakeAScreenTabInLayer2", data);
    },
    fnAddScrL2(data) {
      console.log('show screen graph dialog', data)
    },
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

            if (scrEvalList.ok) {
              // console.log('screen==== ' + JSON.stringify(arScrEvalList, null, 4))
            }
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

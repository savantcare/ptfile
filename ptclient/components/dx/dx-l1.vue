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
      </div>
      <el-table :data="daTable" style="width: 100%;">
        <el-table-column
          prop="diagnosisName"
          label="Diagnosis name"
          width="180"
        >
        </el-table-column>
        <el-table-column
          prop="diagnosedOnDate"
          label="Diagnosed on"
          width="180"
        >
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import ormDx from '@/models/Diagnosis'

/* export default {
  async asyncData({ params }) {
    const { data } = await axios.get(
      `http://localhost:8000/diagnosis/?patientId=bfe041fa-073b-4223-8c69-0540ee678ff8`
    )
    return { daTable: data }
  },
} */
export default {
  components: {},
  props: {},
  data() {
    return {
      daTable: ormDx.query().get(),
    }
  },
  computed: {},
  mounted() {
    this.fnFetchDxFromApi()
  },
  methods: {
    async fnFetchDxFromApi() {
      const countDxCountFromORM = ormDx.query().count()
      if (countDxCountFromORM === 0) {
        const dxEvalList = await ormDx
          .api()
          .get(
            `http://localhost:8000/diagnosis/?patientId=bfe041fa-073b-4223-8c69-0540ee678ff8`
          )
        let arDxEvalList = null
        if (dxEvalList.ok) {
          arDxEvalList = dxEvalList.json()
          this.daTable = arDxEvalList
          console.log('====' + JSON.stringify(arDxEvalList, null, 4))
        }
        // ormDx.query('').get()
        console.log('######', arDxEvalList)
      } else {
        this.daTable = ormDx.query().get()
      }

      // console.log(dxList);
    },
  },
}
</script>

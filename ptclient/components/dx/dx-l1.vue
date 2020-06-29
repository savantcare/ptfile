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
        <el-table-column prop="description" label="Description" width="180">
        </el-table-column>
        <el-table-column prop="createdAt" label="CreatedAt" width="180">
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
      selectedRows: [],
      columns: [],
      selectedColumns: ['diagnosisName'], // The user can select there own columns. The user selected columns are saved in the local storage.
    }
  },
  methods: {},
  mounted() {
    this.daTable()
  },
  computed: {
    daTable() {
      const dxEvalList = ormDx
        .api()
        .get(
          `http://localhost:8000/diagnosis/?patientId=bfe041fa-073b-4223-8c69-0540ee678ff8`
        )

      console.log('######', dxEvalList)

      const dxList = this.$store.state.diagnosis.diagnosisList
      // console.log(dxList);
      return {
        label: 'Yours',
        tableData: dxList,
        rowActions: ['C', 'D'],
        selectedColumn: ['diagnosisName'],
      }
    },
  },
}
</script>

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
      <el-table :data="daTable" style="width: 100%;">
        <el-table-column prop="description" label="Description" width="150">
        </el-table-column>
        <el-table-column prop="createdAt" label="Created At" width="150">
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
// import Scr from '@/models/Screening'
export default {
  data() {
    return {
      daTable: [
        {
          createdAt: '2016-05-03',
          description: 'PHQ9',
        },
      ],
    }
  },
  computed: {},
  beforeCreate() {},
  mounted() {},
  methods: {},
}
</script>

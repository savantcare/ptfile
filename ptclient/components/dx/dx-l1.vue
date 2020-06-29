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
export default {
  data() {
    return {
      daTable: [
        {
          createdAt: '2016-05-03',
          description: 'ADHD',
        },
        {
          createdAt: '2016-05-02',
          description: 'PTSD',
        },
      ],
    }
  },
}
</script>

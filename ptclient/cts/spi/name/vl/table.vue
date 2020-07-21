<template>
  <div>
    <el-button type="info" plain>Vikas</el-button>
    <el-button type="info" plain>Kedia</el-button>
    <el-button
      type="primary"
      size="mini"
      style="padding: 3px;"
      plain
      @click="mfOpenCCtInCl(props.row.$id)"
      >C</el-button
    >
  </div>
</template>

<script>
export default {}
</script>

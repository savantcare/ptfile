<template>
  <el-drawer
    title="I am the title"
    :visible.sync="drawer"
    :direction="ltr"
    :show-close="false"
    :with-header="false"
  >
    <span>Hi, there!</span>
  </el-drawer>
</template>

<script>
export default {
  data() {
    return {}
  },
}
</script>

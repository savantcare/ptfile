<template>
  <el-drawer
    title="Feed"
    :visible="drawer"
    :direction="direction"
    :before-close="handleClose"
    :modal="false"
  ></el-drawer>
</template>

<script>
export default {
  data() {
    return {
      drawer: true,
      direction: 'ltr',
    }
  },
  methods: {
    handleClose(done) {
      console.log('In the handle close function')
      this.drawer = false
    },
  },
  mounted() {
    console.log('Drawer ct mounted')
  },
}
</script>

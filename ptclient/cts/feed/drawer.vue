<template>
  <el-drawer
    title="Feed"
    :visible="cfDrawerVisibility"
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
      this.cfDrawerVisibility = false
    },
  },
  computed: {
    cfDrawerVisibility: {
      get() {
        return this.$store.state.vstObjDrawer.vblIsFeedDrawerVisible
      },
      set(value) {
        this.$store.commit('mtfSetFeedDrawerVisibility', value)
      },
    },
  },
  mounted() {
    console.log('Drawer ct mounted')
  },
}
</script>

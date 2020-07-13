<!-- Params
      Goal: Do not show the shadow so doctor can read the view layer.
            modal=false means -> Do now show shadowing layer
  -->
<template>
  <el-drawer
    title="Map"
    :visible="cfMapDrawerVisibility"
    direction="ttb"
    :before-close="handleClose"
    :modal="false"
    :close-on-press-escape="true"
    :show-close="false"
    size="90%"
  >
    <img
      src="https://github.com/DataV-Team/DataV/blob/master/demoImg/construction-data.jpg?raw=true"
    />
  </el-drawer>
</template>

<script>
export default {
  data() {
    return {}
  },
  methods: {
    handleClose(done) {
      // console.log('In the handle close function')
      this.cfMapDrawerVisibility = false
    },
  },
  computed: {
    cfMapDrawerVisibility: {
      get() {
        return this.$store.state.vstObjMapDrawer.vblIsMapDrawerVisible
      },
      set(value) {
        this.$store.commit('mtfSetMapDrawerVisibility', value)
      },
    },
  },
  mounted() {
    // console.log('Drawer ct mounted')
  },
}
</script>

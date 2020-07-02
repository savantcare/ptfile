/* Is Layer2MultiTab a component or a view? View is actually intended to be
accessed by navigation url Ref:
https://stackoverflow.com/questions/50865828/what-is-the-difference-between-the-views-and-components-folders-in-a-vue-project
Layer2MultiTabDialog is not expected to be accessed by a URL. */

<template>
  <el-dialog
    :visible.sync="vblTabVisibility"
    custom-class="multi-tab-dialog"
    width="90%"
    top="5vh"
  >
    <!-- By passing editable we tell element.io to give add and close option Red: https://element.eleme.io/#/en-US/component/tabs#tabs-attributes -->
    <el-tabs v-model="vsTabName" type="card" editable @edit="mfHandleTabsEdit">
      <el-tab-pane
        v-for="tab in arTabs"
        :key="tab.name"
        :label="tab.label"
        :name="tab.name"
      >
        <component :is="tab.value" />
      </el-tab-pane>
    </el-tabs>
  </el-dialog>
</template>

<script>
export default {
  data() {
    return {
      dnTabIndex: 0,
    }
  },
  computed: {
    arTabs: {
      // return this.$store.state.multiTabDialogLayer2.arTabs
      get() {
        return this.$store.state.multiTabDialogLayer2.arTabs
      },
      set(value) {
        this.$store.commit('mtfSetArTabs', value)
      },
    },
    vsTabName: {
      get() {
        return this.$store.state.multiTabDialogLayer2.vsTabName
      },
      set(value) {
        this.$store.commit('mtfSetVsTabName', value)
      },
    },
    vblTabVisibility: {
      get() {
        console.log(
          'get vblTabVisibility- ',
          this.$store.state.multiTabDialogLayer2.vblTabVisibility
        )
        return this.$store.state.multiTabDialogLayer2.vblTabVisibility
      },
      set(value) {
        console.log('set vblTabVisibility- ', value)
        this.$store.commit('mtfSetTabDialogVisibility', value)
      },
    },
  },
  mounted() {
    this.dnTabIndex = this.arTabs.length
    this.vblTabVisibility = false
    this.arTabs = [] // Template has a for loop running on this.
    this.vsTabName = ''
  },
  methods: {
    mfHandleTabsEdit(targetName, action) {
      if (action === 'add') {
        const dsNewTabName = `tab-${++this.dnTabIndex}`
        const doNewTab = {
          label: 'New tab',
          value: require('./AddNewTab').default,
          name: dsNewTabName,
        }
        this.$store.commit('mtfAddNewTab', doNewTab)
      }
      if (action === 'remove') {
        const daNewList = this.arTabs.filter((tab) => {
          return tab.name !== targetName
        })

        this.$store.commit('setcfTabList', daNewList)
        if (daNewList.length > 0) {
          // this.vsTabName = newList[0]['name']
          console.log('newList=> ', daNewList)
        }
      }
    },
  },
}
</script>

<style>
/* .multi-tab-dialog {
  .el-dialog__header {
    display: none;
  }
  .el-dialog__body 
    padding-top: 12px;
  }
} */
</style>

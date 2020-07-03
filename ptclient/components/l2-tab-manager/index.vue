/* Is Layer2MultiTab a component or a view? View is actually intended to be
accessed by navigation url Ref:
https://stackoverflow.com/questions/50865828/what-is-the-difference-between-the-views-and-components-folders-in-a-vue-project
Layer2MultiTabDialog is not expected to be accessed by a URL. */

<template>
  <el-dialog
    :visible.sync="vblMultiTabDialogInL2Visibility"
    custom-class="multi-tab-dialog"
    width="90%"
    top="5vh"
  >
    <!-- By passing editable we tell element.io to give add and close option Red: https://element.eleme.io/#/en-US/component/tabs#tabs-attributes -->
    <el-tabs
      v-model="vsSelectedTabId"
      type="card"
      editable
      @edit="mfHandleTabsEdit"
    >
      <el-tab-pane
        v-for="tab in cfArTabs"
        :key="tab.name"
        :label="tab.nameToShowUser"
        :name="tab.name"
      >
        <component :is="tab.ctToShowInsideTab" />
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
    cfArTabs: {
      // this object has get and set methods
      get() {
        return this.$store.state.multiTabDialogLayer2.arTabs
      },
      set(value) {
        this.$store.commit('mtfSetArTabs', value)
      },
    },
    vsSelectedTabId: {
      // TODO: this should have cf in its name
      get() {
        return this.$store.state.multiTabDialogLayer2.vsSelectedTabId
      },
      set(value) {
        this.$store.commit('mtfSetvsSelectedTabId', value)
      },
    },
    vblMultiTabDialogInL2Visibility: {
      // TODO: this should have cf in its name
      get() {
        return this.$store.state.multiTabDialogLayer2
          .vblMultiTabDialogInL2Visibility
      },
      set(value) {
        this.$store.commit('mtfSetTabDialogVisibility', value)
      },
    },
  },
  mounted() {
    this.dnTabIndex = this.cfArTabs.length
    this.vblMultiTabDialogInL2Visibility = false
    this.cfArTabs = [] // Template has a for loop running on this.
    this.vsSelectedTabId = ''
  },
  methods: {
    mfHandleTabsEdit(pTargetName, pAction) {
      if (pAction === 'add') {
        const doNewTab = {
          nameToShowUser: 'New tab',
          ctToShowInsideTab: require('./ctSearchToAddTabInL2').default,
          id: 0,
        }
        this.$store.commit('mtfAddAdditionalTab', doNewTab)
      }
      if (pAction === 'remove') {
        const arNewTabs = this.cfArTabs.filter((tab) => {
          return tab.name !== pTargetName
        })

        this.$store.commit('mtfSetArTabs', arNewTabs)

        // If there are no more tabs in the diaglog then hide the dialog
        if (arNewTabs.length === 0) {
          this.vblMultiTabDialogInL2Visibility = false
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

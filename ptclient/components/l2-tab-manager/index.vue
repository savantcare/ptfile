<!-- Is L2TabManager a component or a view? View is actually intended to be
accessed by navigation url Ref:
https://stackoverflow.com/questions/50865828/what-is-the-difference-between-the-views-and-components-folders-in-a-vue-project
Layer2MultiTabDialog is not expected to be accessed by a URL. */

/*
//#region goal
Create a tree strucrure that looks like:

dialog
 -- tabs
   --- tabpane
      ---- Component
//#endregion goal
*/

//#region template
-->
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
        :key="tab.id"
        :label="tab.label"
        :name="tab.id"
      >
        <!-- Using https://vuejs.org/v2/guide/components.html#Dynamic-Components -->
        <component v-bind:is="tab.ctToShowInsideTab"></component>
      </el-tab-pane>
    </el-tabs>
  </el-dialog>
</template>
//#endregion template

<script>
export default {
  data() {
    return {}
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
    this.vblMultiTabDialogInL2Visibility = false
    this.cfArTabs = [] // Template has a for loop running on this.
    this.vsSelectedTabId = ''
  },
  methods: {
    mfHandleTabsEdit(pTargetId, pAction) {
      console.log(pTargetId, pAction)
      if (pAction === 'add') {
        const objNewTab = {
          label: 'New tab',
          ctToShowInsideTab: require('./ctSearchToAddTabInL2').default,
          id: '0',
        }
        this.$store.commit('mtfAddAdditionalTab', objNewTab)
      }
      if (pAction === 'remove') {
        // console.log(pTargetId)
        const arNewTabs = this.cfArTabs.filter((tab) => {
          return tab.id !== pTargetId
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

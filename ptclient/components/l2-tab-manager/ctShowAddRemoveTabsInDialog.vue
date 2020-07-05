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
-->
//#region template

<template>
  <el-dialog
    :visible.sync="vblSeeDialogHoldingTabsInL2"
    custom-class="multi-tab-dialog"
    width="90%"
    top="5vh"
    :modal="true"
    :close-on-click-modal="true"
    :close-on-press-escape="true"
    :show-close="false"
  >
    <!-- By passing editable we tell element.io to give add and close option Red: https://element.eleme.io/#/en-US/component/tabs#tabs-attributes -->
    <el-tabs
      v-model="vsSelectedTabId"
      type="card"
      @tab-remove="mfHandleTabRemove"
    >
      <el-tab-pane
        v-for="tab in cfArTabs"
        :key="tab.id"
        :label="tab.label"
        :name="tab.id"
        :closable="tab.closable"
      >
        <!-- Using https://vuejs.org/v2/guide/components.html#Dynamic-Components -->
        <component v-bind:is="tab.ctToShowInsideTab"></component>
      </el-tab-pane>
    </el-tabs>
  </el-dialog>
</template>
//#endregion template

<script>
// Component items:
export default {
  name: 'L2-Dialog-Manager',
  data() {
    return {}
  },

  computed: {
    // @vuese
    // Get and set array of tabs from store
    // @type Array
    cfArTabs: {
      get() {
        return this.$store.state.multiTabDialogLayer2.arTabs
      },
      set(value) {
        this.$store.commit('mtfSetArTabs', value)
      },
    },
    // @vuese
    // Get and set selected tab id from store
    // @type String
    vsSelectedTabId: {
      get() {
        return this.$store.state.multiTabDialogLayer2.vsSelectedTabId
      },
      set(value) {
        this.$store.commit('mtfSetvsSelectedTabId', value)
      },
    },
    // @vuese
    // Get and set L2 dialog visibility from store
    // @type Boolean
    vblSeeDialogHoldingTabsInL2: {
      get() {
        return this.$store.state.multiTabDialogLayer2
          .vblSeeDialogHoldingTabsInL2
      },
      set(value) {
        this.$store.commit('mtfSetTabDialogVisibility', value)
      },
    },
  },
  mounted() {
    this.vblSeeDialogHoldingTabsInL2 = false
    this.cfArTabs = [] // Template has a for loop running on this.
    this.vsSelectedTabId = ''
  },
  methods: {
    mfHandleTabRemove(pTabBeingRemovedID) {
      let tabToRemoveFoundAt = false
      let loopCount = 0
      const arNewTabs = this.cfArTabs.filter((tab) => {
        if (tab.id !== pTabBeingRemovedID) {
          loopCount++
          return true
        } else {
          tabToRemoveFoundAt = loopCount
          return false
        }
      })

      // Fire when L2 dialog open first time
      // @arg The argument is a array list of tabs
      this.$store.commit('mtfSetArTabs', arNewTabs)

      // If there are no more tabs in the diaglog then hide the dialog
      if (arNewTabs.length === 0) {
        this.vblSeeDialogHoldingTabsInL2 = false
      } else {
        console.log(tabToRemoveFoundAt, arNewTabs)
        let idOfNewActiveTab = 0
        if (tabToRemoveFoundAt === 0) {
          idOfNewActiveTab = 0
        } else {
          idOfNewActiveTab = tabToRemoveFoundAt - 1
        }
        this.$store.commit(
          'mtfSetvsSelectedTabId',
          arNewTabs[idOfNewActiveTab].id
        )
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

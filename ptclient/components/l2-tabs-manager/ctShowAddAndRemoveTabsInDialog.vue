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
    :visible.sync="vblIsDialogHoldingTabsInL2Visible"
    custom-class="multi-tab-dialog"
    width="90%"
    top="5vh"
    :modal="true"
    :close-on-click-modal="true"
    :close-on-press-escape="true"
    :show-close="false"
  >
    <el-row type="flex">
      <!-- By passing editable we tell element.io to give add and close option Red: https://element.eleme.io/#/en-US/component/tabs#tabs-attributes -->
      <!-- 
        Active Tab is changed in following 3 cases:
          1. If a tab is removed, an adjacent tab is made active
          2. When left and right arrow are pressed the active tab changes.
          3. When a number on KB is pressed the active tab changes.

        How is active tab changed?
          The active tab depends on ct -> el-tabs -> v-model = cfVSSelectedTabId (line 72 of this file)
          When cfVSSelectedTabId (Line 117 of this file) changes the active tab will change. 
          Since cfVSSelectedTabId is a computed function it will change when anything it depends on changes
          cfVSSelectedTabId depends on this.$store.state.dialogHoldingTabsInL2.vsSelectedTabId (Line 119 of this file)
          So any Ct can change this.$store.state.dialogHoldingTabsInL2.vsSelectedTabId and that will change the active Tab
          The sequence of changes is:
                              
                           ┌──────────┐                           
                           │  Any ct  │                           ctShowAddAndRemoveTabsInDialog:171
                           └────┬─────┘                           
                                │                                 
                ┌───────────────▼─────────────────┐               
                │  Call state mutation function   │                 l2DialogAndTabsState:36            
                └────────────────┬────────────────┘               
                                 │                                
┌────────────────────────────────▼───────────────────────────────┐
│Changes this.$store.state.dialogHoldingTabsInL2.vsSelectedTabId │  l2DialogAndTabsState:37 
└────────────────────────────────┬───────────────────────────────┘
                                 │                                
                 ┌───────────────▼────────────────────────────┐               
                 │Changes computed function cfVSSelectedTabId │     ctShowAddAndRemoveTabsInDialog:117         
                 └────────────────┬───────────────────────────┘               
                                  │                               
                       ┌──────────▼─────────────┐                 
                       │changes el-tabs v-model │                   ctShowAddAndRemoveTabsInDialog:72
                       └──────────┬─────────────┘                 
                                  │                               
                       ┌──────────▼─────────────┐                 
                       │Active tab changed in UI│                 
                       └────────────────────────┘                          
      -->
      <el-col :span="24">
        <el-tabs
          v-model="cfVSSelectedTabId"
          type="card"
          @tab-remove="mfHandleTabRemove"
        >
          <el-tab-pane
            v-for="(tab, loopCount) in cfArTabs"
            :key="tab.id"
            :label="tab.label + '(' + (loopCount + 1) + ')'"
            :name="tab.id"
            :closable="tab.closable"
          >
            <!-- Using https://vuejs.org/v2/guide/components.html#Dynamic-Components -->
            <component v-bind:is="tab.ctToShowInsideTab"></component>
          </el-tab-pane>
        </el-tabs>
      </el-col>
      <el-col class="set-of-tabs">
        <ctSetOfTabs></ctSetOfTabs>
      </el-col>
    </el-row>
  </el-dialog>
</template>
//#endregion template

<script>
import ctSetOfTabs from './ctSetOfTabs'

export default {
  name: 'L2-Dialog-And-Tabs-Manager',
  components: {
    ctSetOfTabs,
  },
  data() {
    return {}
  },

  computed: {
    cfArTabs: {
      get() {
        return this.$store.state.dialogHoldingTabsInL2.arTabs
      },
      set(value) {
        this.$store.commit('mtfSetArTabs', value)
      },
    },
    cfVSSelectedTabId: {
      get() {
        return this.$store.state.dialogHoldingTabsInL2.vsSelectedTabId
      },
      set(value) {
        this.$store.commit('mtfSetvsSelectedTabId', value)
      },
    },
    vblIsDialogHoldingTabsInL2Visible: {
      get() {
        return this.$store.state.dialogHoldingTabsInL2
          .vblIsDialogHoldingTabsInL2Visible
      },
      set(value) {
        this.$store.commit('mtfSetTabDialogVisibility', value)
      },
    },
  },
  mounted() {
    this.vblIsDialogHoldingTabsInL2Visible = false
    this.cfArTabs = [] // Template has a for loop running on this.
    this.cfVSSelectedTabId = ''
    const self = this // this is not available inside addEventListener since execution context changes. Hence assining this to self Ref: https://stackoverflow.com/a/50818181
    window.addEventListener(
      'keyup',
      function (e) {
        console.log('the keyboard key up detected')
        self.selectActiveTabFromKeyboard(e)
      }.bind()
    )
  },
  methods: {
    // #region kbselect
    selectActiveTabFromKeyboard(pEvent) {
      if (this.vblIsDialogHoldingTabsInL2Visible === false) {
        console.log('Rejection reason 1: 2nd layer not active')
        return
      }
      if (pEvent.srcElement.type === 'text') {
        console.log(
          'Rejection reason 2: inside text input hence meant as form entry hence dont activate tab'
        )
        return
      }
      if (pEvent.keyCode === 37) {
        console.log('left arrow pressed let us find the position of the tab')
        const currentTabIdx = this.cfArTabs.findIndex(
          (tab) => tab.id === this.cfVSSelectedTabId
        )
        console.log('Current tab idx is: ', currentTabIdx)
        if (currentTabIdx === 0) {
          console.log('at first tab so ignore')
        } else {
          this.$store.commit(
            'mtfSetvsSelectedTabId',
            this.cfArTabs[currentTabIdx - 1].id
          )
        }
        return
      }
      if (pEvent.keyCode === 39) {
        console.log('right arrow pressed let us find the position of the tab')
        const currentTabIdx = this.cfArTabs.findIndex(
          (tab) => tab.id === this.cfVSSelectedTabId
        )
        if (currentTabIdx === this.cfArTabs.length - 1) {
          console.log('at last tab so ignore')
        } else {
          this.$store.commit(
            'mtfSetvsSelectedTabId',
            this.cfArTabs[currentTabIdx + 1].id
          )
        }
        return
      }
      const maxValidKeyCodeEnteredByUser = 48 + this.cfArTabs.length
      console.log(
        'max code:',
        maxValidKeyCodeEnteredByUser,
        'pressed code is',
        pEvent.keyCode
      )
      if (
        pEvent.keyCode >= '49' &&
        pEvent.keyCode <= maxValidKeyCodeEnteredByUser
      ) {
        console.log('Activating tab at position' + pEvent.key)
        this.$store.commit(
          'mtfSetvsSelectedTabId',
          this.cfArTabs[pEvent.key - 1].id
        )
      } else {
        console.log(
          'Rejection reason 3: User entered # is higher then max tabs'
        )
      }
    },
    // #endregion kbselect
    mfHandleTabRemove(pTabBeingRemovedID) {
      let tabToRemoveFoundAt = false // this is needed to find which tab to activate
      let loopCount = 0
      const arNewTabs = this.cfArTabs.filter((tab) => {
        if (tab.id !== pTabBeingRemovedID) {
          loopCount++
          return true
        } else {
          // this is the tab that is being removed
          tabToRemoveFoundAt = loopCount
          return false
        }
      })

      this.$store.commit('mtfSetArTabs', arNewTabs)

      // If there are no more tabs in the diaglog then hide the dialog
      if (arNewTabs.length === 0) {
        this.vblIsDialogHoldingTabsInL2Visible = false
      } else {
        // Once a tab is removed an existing tab needs to be made active
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
.set-of-tabs {
  position: absolute;
  top: 0;
  right: 0;
  z-index: 999;
  width: auto;
}
</style>

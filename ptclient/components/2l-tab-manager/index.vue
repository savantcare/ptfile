/* Is Layer2MultiTab a component or a view? View is actually intended to be
accessed by navigation url Ref:
https://stackoverflow.com/questions/50865828/what-is-the-difference-between-the-views-and-components-folders-in-a-vue-project
Layer2MultiTabDialog is not expected to be accessed by a URL. */

<template>
  <el-dialog
    :visible.sync="visibility"
    custom-class="multi-tab-dialog"
    width="90%"
    top="5vh"
  >
    <!-- By passing editable we tell element.io to give add and close option Red: https://element.eleme.io/#/en-US/component/tabs#tabs-attributes -->
    <el-tabs v-model="tabValue" type="card" editable @edit="handleTabsEdit">
      <el-tab-pane
        v-for="tab in cfTabList"
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
      tabIndex: 0,
    }
  },
  computed: {
    cfTabList: {
      // return this.$store.state.multiTabDialogLayer2.cfTabList
      get() {
        return this.$store.state.multiTabDialogLayer2.cfTabList
      },
      set(value) {
        this.$store.commit('setcfTabList', value)
      },
    },
    tabValue: {
      get() {
        return this.$store.state.multiTabDialogLayer2.tabValue
      },
      set(value) {
        this.$store.commit('setTabValue', value)
      },
    },
    visibility: {
      get() {
        console.log(
          'get visibility- ',
          this.$store.state.multiTabDialogLayer2.visibility
        )
        return this.$store.state.multiTabDialogLayer2.visibility
      },
      set(value) {
        console.log('set visibility- ', value)
        this.$store.commit('setTabDialogVisibility', value)
      },
    },
  },
  mounted() {
    this.tabIndex = this.cfTabList.length
    this.visibility = false
    this.cfTabList = [] // Template has a for loop running on this.
    this.tabValue = 0
  },
  methods: {
    handleTabsEdit(targetName, action) {
      if (action === 'add') {
        const newTabName = `tab-${++this.tabIndex}`
        const newTab = {
          label: 'New tab',
          value: require('./AddNewTab').default,
          name: newTabName,
        }
        this.$store.commit('addNewTab', newTab)
      }
      if (action === 'remove') {
        const newList = this.cfTabList.filter((tab) => {
          return tab.name !== targetName
        })

        this.$store.commit('setcfTabList', newList)
        if (newList.length > 0) {
          // this.tabValue = newList[0]['name']
          console.log('newList=> ', newList)
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

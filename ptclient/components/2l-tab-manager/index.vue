/* Is Layer2MultiTab a component or a view? View is actually intended to be
accessed by navigation url Ref:
https://stackoverflow.com/questions/50865828/what-is-the-difference-between-the-views-and-components-folders-in-a-vue-project
Layer2MultiTabDialog is not expected to be accessed by a URL. */

<template>
  <el-dialog
    :visible.sync="cfTabVisibility"
    custom-class="multi-tab-dialog"
    width="90%"
    top="5vh"
  >
    <!-- By passing editable we tell element.io to give add and close option Red: https://element.eleme.io/#/en-US/component/tabs#tabs-attributes -->
    <el-tabs v-model="cfTabValue" type="card" editable @edit="mfHandleTabsEdit">
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
      dnTabIndex: 0,
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
    cfTabValue: {
      get() {
        return this.$store.state.multiTabDialogLayer2.cfTabValue
      },
      set(value) {
        this.$store.commit('setcfTabValue', value)
      },
    },
    cfTabVisibility: {
      get() {
        console.log(
          'get cfTabVisibility- ',
          this.$store.state.multiTabDialogLayer2.cfTabVisibility
        )
        return this.$store.state.multiTabDialogLayer2.cfTabVisibility
      },
      set(value) {
        console.log('set cfTabVisibility- ', value)
        this.$store.commit('mtfSetTabDialogVisibility', value)
      },
    },
  },
  mounted() {
    this.dnTabIndex = this.cfTabList.length
    this.cfTabVisibility = false
    this.cfTabList = [] // Template has a for loop running on this.
    this.cfTabValue = 0
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
        const daNewList = this.cfTabList.filter((tab) => {
          return tab.name !== targetName
        })

        this.$store.commit('setcfTabList', daNewList)
        if (daNewList.length > 0) {
          // this.cfTabValue = newList[0]['name']
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

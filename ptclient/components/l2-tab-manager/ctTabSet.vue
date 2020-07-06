<template>
  <el-select v-model="value" placeholder="Select" @change="mfHandleChange">
    <el-option
      v-for="item in options"
      :key="item.value"
      :label="item.label"
      :value="item.value"
    >
    </el-option>
  </el-select>
</template>

<script>
export default {
  data() {
    return {
      options: [
        {
          value: 'assessment-tabset',
          label: 'Assessment tabset',
        },
        {
          value: 'plan-tabset',
          label: 'Plan tabset',
        },
      ],
      value: '',
    }
  },
  methods: {
    mfHandleChange(pValue) {
      console.log('value changed', pValue)
      if (pValue === 'assessment-tabset') {
        const objAddTab = {
          label: 'Goals',
          ctToShowInsideTab: require('@/components/goal/layer-2/ctAddGoal.vue')
            .default,
          id: '$uid1',
          closable: true,
        }
        this.$store.commit('mtfShowNewFirstTabInL2', objAddTab)
        this.$store.state.dialogHoldingTabsInL2.vsSelectedTabId = this.$store.state.dialogHoldingTabsInL2.arTabs[0].id
      } else if (pValue === 'plan-tabset') {
        const objAddTab = {
          label: 'Add diagnosis',
          ctToShowInsideTab: require('@/components/dx/l2/ctAddDx.vue').default,
          id: '$uid2',
          closable: true,
        }
        this.$store.commit('mtfShowNewFirstTabInL2', objAddTab)
        this.$store.state.dialogHoldingTabsInL2.vsSelectedTabId = this.$store.state.dialogHoldingTabsInL2.arTabs[0].id
      }
    },
  },
}
</script>

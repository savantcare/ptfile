export default {
  state: {
    vblTabVisibility: false, // TODO: This is realted to dialog and not tab. Need to refactor.
    arTabs: [], // Template has a for loop running on this. TODO: This should be called arTabs
    vsTabName: '',
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      // why is a tab setting the visibility of the dialog.
      state.vblTabVisibility = value
    },
    mtfAddNewTab(state, newTab) {
      const { name } = newTab
      const checkArray = state.arTabs.filter((tab) => {
        // AG: Why not use https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
        return tab.name === name
      })
      if (checkArray.length === 0) {
        state.arTabs.push(newTab)
      }
      state.vsTabName = name
    },
    mtfSetVsTabName(state, value) {
      state.vsTabName = value
    },
    mtfSetArTabs(state, value) {
      state.arTabs = value
    },
    mtfShowTabInL2(state, pTab) {
      state.arTabs = [pTab]
      state.vblTabVisibility = true
      state.vsTabName = pTab.name

      console.log('state-> ', state)
    },
    /* showMultiChangeGoalTabInLayer2(state) {
      const tab = {
        label: 'Multi rate goal',
        value: require('@/components/patient/goal/layer2/MultiChangeGoal.vue')
          .default,
        name: 'tab-multi-change-goal',
      }
      state.arTabs = [tab]
      state.goalTabType = MULTIPLE_RATE_GOAL
      state.vblTabVisibility = true
      state.vsTabName = tab.name
    },
    showChangeGoalsTabInLayer2(state, data) {
      const tab = {
        label: 'Rate goal',
        value: require('@/components/patient/goal/layer2/RateGoal.vue').default,
        name: 'tab-rate-goal',
      }
      state.arTabs = [tab]
      state.vblTabVisibility = true
      state.goalTabType = RATE_GOAL
      state.goalData = data
      state.vsTabName = tab.name
    }, */
  },
}

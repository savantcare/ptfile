import {
  ADD_GOAL /* , MULTIPLE_RATE_GOAL, RATE_GOAL */,
} from '../../static/others.js'
export default {
  state: {
    vblTabVisibility: false, // TODO: this is not cf. This should be vblTabVisibility
    arTabList: [], // Template has a for loop running on this. // TODO: this is not cf. This should be arTabList
    vsTabName: '', // TODO: This should be vsTabName
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      state.vblTabVisibility = value
    },
    mtfAddNewTab(state, newTab) {
      const { name } = newTab
      const checkArray = state.arTabList.filter((tab) => {
        return tab.name === name
      })
      if (checkArray.length === 0) {
        state.arTabList.push(newTab)
      }
      state.vsTabName = name
    },
    mtfSetVsTabName(state, value) {
      state.vsTabName = value
    },
    mtfSetArTabList(state, value) {
      state.arTabList = value
    },
    mtfShowAGTabInL2(state) {
      const tab = {
        label: 'Add goal',
        value: require('@/components/goal/layer-2/addGoal.vue').default,
        name: 'tab-add-goal',
      }
      state.arTabList = [tab]
      state.goalTabType = ADD_GOAL
      state.vblTabVisibility = true
      state.vsTabName = tab.name

      console.log('state-> ', state)
    },
    /* showMultiChangeGoalTabInLayer2(state) {
      const tab = {
        label: 'Multi rate goal',
        value: require('@/components/patient/goal/layer2/MultiChangeGoal.vue')
          .default,
        name: 'tab-multi-change-goal',
      }
      state.arTabList = [tab]
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
      state.arTabList = [tab]
      state.vblTabVisibility = true
      state.goalTabType = RATE_GOAL
      state.goalData = data
      state.vsTabName = tab.name
    }, */
  },
}

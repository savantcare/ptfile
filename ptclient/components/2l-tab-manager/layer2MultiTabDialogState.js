import {
  ADD_GOAL /* , MULTIPLE_RATE_GOAL, RATE_GOAL */,
} from '../../static/others.js'
export default {
  state: {
    cfTabVisibility: false,
    cfTabList: [], // Template has a for loop running on this.
    goalTabType: '',
    goalData: null,
    cfTabValue: 0,
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      state.cfTabVisibility = value
    },
    mtfAddNewTab(state, newTab) {
      const { name } = newTab
      const checkArray = state.cfTabList.filter((tab) => {
        return tab.name === name
      })
      if (checkArray.length === 0) {
        state.cfTabList.push(newTab)
      }
      state.cfTabValue = name
    },
    setcfTabValue(state, value) {
      state.cfTabValue = value
    },
    setcfTabList(state, value) {
      state.cfTabList = value
    },
    mtfShowAGTabInL2(state) {
      const tab = {
        label: 'Add goal',
        value: require('@/components/goal/layer-2/addGoal.vue').default,
        name: 'tab-add-goal',
      }
      state.cfTabList = [tab]
      state.goalTabType = ADD_GOAL
      state.cfTabVisibility = true
      state.cfTabValue = tab.name

      console.log('state-> ', state)
    },
    /* showMultiChangeGoalTabInLayer2(state) {
      const tab = {
        label: 'Multi rate goal',
        value: require('@/components/patient/goal/layer2/MultiChangeGoal.vue')
          .default,
        name: 'tab-multi-change-goal',
      }
      state.cfTabList = [tab]
      state.goalTabType = MULTIPLE_RATE_GOAL
      state.cfTabVisibility = true
      state.cfTabValue = tab.name
    },
    showChangeGoalsTabInLayer2(state, data) {
      const tab = {
        label: 'Rate goal',
        value: require('@/components/patient/goal/layer2/RateGoal.vue').default,
        name: 'tab-rate-goal',
      }
      state.cfTabList = [tab]
      state.cfTabVisibility = true
      state.goalTabType = RATE_GOAL
      state.goalData = data
      state.cfTabValue = tab.name
    }, */
  },
}

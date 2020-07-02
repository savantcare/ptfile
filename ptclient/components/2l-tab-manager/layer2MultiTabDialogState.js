import {
  ADD_GOAL /* , MULTIPLE_RATE_GOAL, RATE_GOAL */,
} from '../../static/others.js'
export default {
  state: {
    visibility: false,
    cfTabList: [], // Template has a for loop running on this.
    goalTabType: '',
    goalData: null,
    tabValue: 0,
  },
  mutations: {
    setTabDialogVisibility(state, value) {
      state.visibility = value
    },
    addNewTab(state, newTab) {
      const { name } = newTab
      const checkArray = state.cfTabList.filter((tab) => {
        return tab.name === name
      })
      if (checkArray.length === 0) {
        state.cfTabList.push(newTab)
      }
      state.tabValue = name
    },
    setTabValue(state, value) {
      state.tabValue = value
    },
    setcfTabList(state, value) {
      state.cfTabList = value
    },
    showAddGoalTabInLayer2(state) {
      const tab = {
        label: 'Add goal',
        value: require('@/components/goal/layer-2/addGoal.vue').default,
        name: 'tab-add-goal',
      }
      state.cfTabList = [tab]
      state.goalTabType = ADD_GOAL
      state.visibility = true
      state.tabValue = tab.name

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
      state.visibility = true
      state.tabValue = tab.name
    },
    showChangeGoalsTabInLayer2(state, data) {
      const tab = {
        label: 'Rate goal',
        value: require('@/components/patient/goal/layer2/RateGoal.vue').default,
        name: 'tab-rate-goal',
      }
      state.cfTabList = [tab]
      state.visibility = true
      state.goalTabType = RATE_GOAL
      state.goalData = data
      state.tabValue = tab.name
    }, */
  },
}

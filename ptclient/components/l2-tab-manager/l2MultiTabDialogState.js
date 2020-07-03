export default {
  state: {
    vblMultiTabDialogInL2Visibility: false,
    arTabs: [], // Template has a for loop running on this.
    vsSelectedTabId: '', // arTabs might have 10 tabs. Out of those which tab is active needs to be stored outside the array of 10 tabs
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      state.vblMultiTabDialogInL2Visibility = value
    },
    mtfAddAdditionalTab(state, newTab) {
      const { id } = newTab
      const checkArray = state.arTabs.filter((tab) => {
        // AG: Why not use https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
        return tab.id === id
      })
      if (checkArray.length === 0) {
        state.arTabs.push(newTab)
      }
      state.vsSelectedTabId = id
    },
    mtfSetvsSelectedTabId(state, value) {
      state.vsSelectedTabId = value
    },
    mtfSetArTabs(state, value) {
      state.arTabs = value
    },
    mtfShowNewFirstTabInL2(state, pTab) {
      state.arTabs = [pTab]
      state.vblMultiTabDialogInL2Visibility = true
      state.vsSelectedTabId = pTab.id

      console.log('state-> ', state)
    },
  },
}

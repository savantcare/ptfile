export default {
  state: {
    vblMultiTabDialogIn2LVisibility: false,
    arTabs: [], // Template has a for loop running on this. TODO: This should be called arTabs
    vsTabName: '', // TODO: Why is there a name outside. In the array each tab has a name
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      state.vblMultiTabDialogIn2LVisibility = value
    },
    mtfAddAdditionalTab(state, newTab) {
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
    mtfShowNewTabInL2(state, pTab) {
      state.arTabs = [pTab]
      state.vblMultiTabDialogIn2LVisibility = true
      state.vsTabName = pTab.name

      console.log('state-> ', state)
    },
  },
}

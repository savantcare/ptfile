export default {
  state: {
    vblTabVisibility: false, // TODO: This is realted to dialog and not tab. Need to refactor.
    arTabs: [], // Template has a for loop running on this. TODO: This should be called arTabs
    vsTabName: '', // TODO: Why is there a name outside. In the array each tab has a name
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      // why is a tab setting the visibility of the dialog.
      state.vblTabVisibility = value
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
      state.vblTabVisibility = true
      state.vsTabName = pTab.name

      console.log('state-> ', state)
    },
  },
}

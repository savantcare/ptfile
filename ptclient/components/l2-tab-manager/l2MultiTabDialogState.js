export default {
  state: {
    // #region state
    vblMultiTabDialogInL2Visibility: false,
    arTabs: [], // Template has a for loop running on this.
    vsSelectedTabId: '', // arTabs might have 10 tabs. Out of those which tab is active needs to be stored outside the array of 10 tabs
    // #endregion state
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      state.vblMultiTabDialogInL2Visibility = value
    },
    mtfAddAdditionalTab(state, newTab) {
      /* Two cases are possible:
      1. Tab already exisits: In this case make that tab active.
      2. Tab does not exist: In this case create a new tab
      */

      const { id } = newTab

      // Case 1 has happaned hence an existing tab needs to be activated
      const checkArray = state.arTabs.filter((tab) => {
        // AG: Why not use https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
        return tab.id === id
      })

      // Case 2 has happened hence a new tab needs to be added
      if (checkArray.length === 0) {
        state.arTabs.push(newTab)
      }

      // Deciding which tab to make active
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

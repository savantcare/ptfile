export default {
  state: {
    // #region state
    vblSeeDialogHoldingTabsInL2: false,
    arTabs: [], // Template has a for loop running on this.
    vsSelectedTabId: '', // arTabs might have 10 tabs. Out of those which tab is active needs to be stored outside the array of 10 tabs
    // #endregion state
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      state.vblSeeDialogHoldingTabsInL2 = value
    },
    mtfAdditionalTabAddOrActivate(state, pObjNewTab) {
      /* Two cases are possible:
      1. Tab already exisits: In this case make that tab active.
      2. Tab does not exist: In this case create a new tab
      */

      // Case 1 has happaned hence an existing tab needs to be activated
      const checkIfThisIsExistingTab = state.arTabs.filter((currentTab) => {
        // AG: Why not use https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
        return currentTab.id === pObjNewTab.id
      })

      // Case 2 has happened hence a new tab needs to be added
      if (checkIfThisIsExistingTab.length === 0) {
        state.arTabs.push(pObjNewTab)
      }

      // Deciding which tab to make active
      state.vsSelectedTabId = pObjNewTab.id
    },

    mtfSetvsSelectedTabId(state, value) {
      state.vsSelectedTabId = value
    },
    mtfSetArTabs(state, value) {
      state.arTabs = value
    },
    mtfShowNewFirstTabInL2(state, pTab) {
      state.arTabs = [pTab]
      state.vblSeeDialogHoldingTabsInL2 = true
      state.vsSelectedTabId = pTab.id

      const objNewTab = {
        label: '+',
        closable: false,
        ctToShowInsideTab: require('./ctSearchToAddTabInL2').default,
        id: '0',
      }

      state.arTabs.push(objNewTab)

      console.log('state-> ', state)
    },
  },
}

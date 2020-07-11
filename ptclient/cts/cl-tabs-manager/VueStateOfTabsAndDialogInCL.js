export default {
  state: {
    // #region state
    vblIsdialogHoldingTabsInCLVisible: false,
    arTabs: [], // Template has a for loop running on this.
    vsSelectedTabId: '', // arTabs might have 10 tabs. Out of those which tab is active needs to be stored outside the array of 10 tabs
    // #endregion state
  },
  mutations: {
    mtfSetTabDialogVisibility(state, value) {
      state.vblIsdialogHoldingTabsInCLVisible = value
    },
    mtfAdditionalTabAddOrActivate(state, pObjAdditionalTab) {
      /* Two cases are possible:
      1. Tab already exisits: In this case make that tab active.
      2. Tab does not exist: In this case create a new tab
      */

      // Case 1 has happened hence an existing tab needs to be activated
      const checkIfAdditionalTabIsExisting = state.arTabs.filter((currentTab) => {
        // AG: Why not use https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
        return currentTab.id === pObjAdditionalTab.id
      })

      // Case 2 has happened hence a new tab needs to be added
      if (checkIfAdditionalTabIsExisting.length === 0) {
        state.arTabs.splice(state.arTabs.length - 1, 0, pObjAdditionalTab)
      }

      // Deciding which tab to make active
      state.vsSelectedTabId = pObjAdditionalTab.id
    },

    mtfSetvsSelectedTabId(state, value) {
      state.vsSelectedTabId = value
    },
    mtfSetArTabs(state, value) {
      state.arTabs = value
    },
    mtfShowNewFirstTabInCl(state, pTab) {
      state.arTabs = [pTab]
      state.vblIsdialogHoldingTabsInCLVisible = true
      state.vsSelectedTabId = pTab.id

      const objNewTab = {
        label: '+',
        closable: false,
        ctToShow: require('./ctSearchToAddTabInCL').default,
        id: '0',
      }

      state.arTabs.push(objNewTab)

      console.log('state-> ', state.arTabs)
    },
  },
}

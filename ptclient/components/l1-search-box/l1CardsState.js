export default {
  state: {
    arCards: [], // Template has a for loop running on this.
    vsSelectedCardId: '', // arCards might have 10 Cards. Out of those which Card is active needs to be stored outside the array of 10 Cards
    // #endregion state
  },
  mutations: {
    mtfAdditionalCardAddOrActivate(state, pObjAdditionalCard) {
      /* Two cases are possible:
      1. Card already exisits: In this case make that Card active.
      2. Card does not exist: In this case create a new Card
      */

      // Case 1 has happened hence an existing Card needs to be activated
      const checkIfAdditionalCardIsExisting = state.arCards.filter(
        (currentCard) => {
          // AG: Why not use https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find
          return currentCard.id === pObjAdditionalCard.id
        }
      )

      // Case 2 has happened hence a new Card needs to be added
      if (checkIfAdditionalCardIsExisting.length === 0) {
        state.arCards.splice(state.arCards.length - 1, 0, pObjAdditionalCard)
      }

      // Deciding which Card to make active
      state.vsSelectedCardId = pObjAdditionalCard.id
    },

    mtfSetvsSelectedCardId(state, value) {
      state.vsSelectedCardId = value
    },
    mtfSetArCards(state, value) {
      state.arCards = value
    },
    mtfShowNewFirstCardInL2(state, pCard) {
      state.arCards = [pCard]
      state.vblIsDialogHoldingCardsInL2Visible = true
      state.vsSelectedCardId = pCard.id

      console.log('state-> ', state)
    },
  },
}

export default {
  state: {
    arCards: [], // Template has a for loop running on this.
    vsSelectedCardId: '', // arCards might have 10 Cards. Out of those which Card is active needs to be stored outside the array of 10 Cards
    // #endregion state
  },
  mutations: {
    mtfSetvsSelectedCardId(state, value) {
      state.vsSelectedCardId = value
    },
    mtfSetArCards(state, value) {
      state.arCards = value
    },
    mtfShowCardInCSVL(state, pCard) {
      state.arCards.push(pCard)
      state.vsSelectedCardId = pCard.id
      console.log('state-> ', state)
    },
  },
}

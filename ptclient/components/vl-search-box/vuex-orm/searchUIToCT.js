import { Model } from '@vuex-orm/core'

export default class ormSearchUiToCT extends Model {
  static entity = 'ormSearchUiToCT'

  /*
    The flowchart is:

    Step 1: All CTs when they start for first time they make an entry in this table.
            For e.g. rec/searchInterfaces.vue

    Step 2: In component/vl-search-box the dropdown for search uses this table.

    Step 3: User makes a selection based on autocomplete 
            components/vl-serach-box/index.vue:32/mfQuerySearchTerms

    Step 4: Once the user selection is finalized the state of cardsInCSOfVL (cards in current state of view layer) 
            is updated components/vl-search-box/index.vue:47/mfHandleSuggestionSelectedByUser 

    Step 5: This activates pages/pf/_id/index.vue:30
            <component v-bind:is="card.ctToShowInCSVL"></component>

    Step 6: User sees the desired HTML
  */

  static fields() {
    return {
      id: this.uid(), // vuex-orm generates a unique ID https://vuex-orm.org/guide/model/defining-models.html#uid-type
      value: this.string(''), // this is the tab name that is shown to the user. I call it value since autocomplete function expects the object property to be called value
      ctAbbr: this.string(''),
      ctToShowInCL: this.string(''),
      ctToShowInCSVL: this.string(''),
      ctToShowInMSVL: this.string(''),
      layer: this.string(''),
    }
  }
}

import { Model } from '@vuex-orm/core'

export default class ormSearchUiToCT extends Model {
  static entity = 'ormSearchUiToCT'

  /*
    The flowchart is:

    Step 1: All CTs when they start for first time they make an entry in this table.
            For e.g. rec/vl/table.vue

    Step 2: In vl-search-box user makes a selection based on autocomplete coming from this table
            components/vl-serach-box/index.vue:32/mfQuerySearchTerms

    Step 3: Once the user selection is finalized the state of cardsInCSOfVL is updated
            components/vl-serach-box/index.vue:47/mfHandleSuggestionSelectedByUser 

    Step 4: This activates pages/pf/_id/index.vue:30
            <component v-bind:is="card.ctToShowInsideCSVL"></component>

    Step 5: User sees the desired HTML
  */

  static fields() {
    return {
      id: this.uid(), // vuex-orm generates a unique ID https://vuex-orm.org/guide/model/defining-models.html#uid-type
      value: this.string(''), // this is the tab name that is shown to the user. I call it value since autocomplete function expects the object property to be called value
      ctAbbr: this.string(''),
      ctToShowInsideTab: this.string(''),
      ctToShowInsideCSVL: this.string(''),
      ctToShowInsideMSVL: this.string(''),
      layer: this.string(''),
    }
  }
}

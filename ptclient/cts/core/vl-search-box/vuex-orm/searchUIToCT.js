import { Model } from '@vuex-orm/core'

export default class ormSearchPhraseUiToCT extends Model {
  static entity = 'ormSearchPhraseUiToCT'

  /*
    The flowchart is:

    From search tern to card in CSVL
    --------------------------------

    Step 1: All CTs have a file for e.g. rec/searchInterfaces.vue

    Step 2: vl-search-box/index.vue inclues rec/searchInterfaces.vue
    
    Step 3: searchInterfaces.vue in mounted makes an entry in this table.

    Step 4: In component/vl-search-box the dropdown for search uses this table.

    Step 5: User makes a selection based on autocomplete 
            cts/vl-serach-box/index.vue:32/mfQuerySearchTerms

    Step 6: Once the user selection is finalized the state of vstObjCardsInCSOfVL (Full form: vue state Object of cards in current state of view layer) 
            is updated cts/vl-search-box/index.vue:47/mfHandleSuggestionSelectedByUser 

    Step 7: This activates pages/pf/_id/index.vue:30
            <component v-bind:is="card.ctToShowInCSVL"></component>

    Step 8: User sees the desired HTML

    From search tern in CL to tab in CL
    -----------------------------------
    The state of tabs is in CL (Change layer) is maintained in cts/cl-tabs-manager/VueStateOfTabsAndDialogInCL.js

    When autocomplete is done by user in cts/vl-search-box/vuex-orm/searchUIToCT.js:mfHandleSuggestionSelectedByUser

    A new object is added to VueStateOfTabsAndDialogInCL.js

    From click in VL to tab in CL
    -----------------------------
    A new object is added to VueStateOfTabsAndDialogInCL.js


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
      usageCountKeptInLS: this.number(0),
      ctWidth: this.string(''),
    }
  }
}

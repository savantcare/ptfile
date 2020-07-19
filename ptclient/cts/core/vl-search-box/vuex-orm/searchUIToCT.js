import { Model } from '@vuex-orm/core'

export default class ormSearchPhraseUiToCT extends Model {
  static entity = 'ormSearchPhraseUiToCT'

  static fields() {
    return {
      id: this.uid(), // vuex-orm generates a unique ID https://vuex-orm.org/guide/model/defining-models.html#uid-type
      value: this.string(''), // this is the tab name that is shown to the user. I call it value since autocomplete function expects the object property to be called value
      ctAbbr: this.string(''),
      ctToShowInCL: this.string(''),
      ctToShowInCSVL: this.string(''),
      layer: this.string(''),
      usageCountKeptInLS: this.number(0),
      ctWidth: this.string(''),
    }
  }
}

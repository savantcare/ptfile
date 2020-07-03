import { Model } from '@vuex-orm/core'

export default class CtSearchInL2 extends Model {
  static entity = 'ctSearchInL2'

  static fields() {
    return {
      id: this.uid(), // vuex-orm generates a unique ID https://vuex-orm.org/guide/model/defining-models.html#uid-type
      value: this.string(''), // nameToShowUser
      ctAbbr: this.string(''),
      ctToShowInsideTab: this.string(''),
    }
  }
}

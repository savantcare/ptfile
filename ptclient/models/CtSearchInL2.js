import { Model } from '@vuex-orm/core'

export default class CtSearchInL2 extends Model {
  static entity = 'ctSearchInL2'

  static fields() {
    return {
      id: this.uid(),
      ctName: this.string(''),
      ctAbbr: this.string(''),
      key: this.number(),
      value: this.string(''),
      ctInsideTab: this.string(''),
    }
  }
}

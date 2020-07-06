import { Model } from '@vuex-orm/core'

export default class ormSearchUiToCT extends Model {
  static entity = 'ormCtLifeCycle'

  static fields() {
    return {
      id: this.uid(), // vuex-orm generates a unique ID https://vuex-orm.org/guide/model/defining-models.html#uid-type
      name: this.string(''), // this is the tab name that is shown to the user. I call it value since autocomplete function expects the object property to be called value
      status: this.number(), // 1 is before create 2 is created 3 is mounted
    }
  }
}

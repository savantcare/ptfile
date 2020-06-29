import { Model } from '@vuex-orm/core'
import Rex from './rex'

export default class Patient extends Model {
  static entity = 'patients'

  static fields() {
    return {
      id: this.uid(),
      name: this.string(''),
      rex: this.hasMany(Rex, 'user_id'),
    }
  }
}

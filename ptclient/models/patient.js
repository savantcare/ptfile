import { Model } from '@vuex-orm/core'
import Recommendation from './Recommendation'

export default class Patient extends Model {
  static entity = 'patients'

  static fields() {
    return {
      id: this.uid(),
      name: this.string(''),
      recommendation: this.hasMany(Recommendation, 'user_id'),
    }
  }
}

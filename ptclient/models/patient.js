import { Model } from '@vuex-orm/core'
import Recommendation from './Recommendation'
import Diagnosis from './Diagnosis'

export default class Patient extends Model {
  static entity = 'patients'

  static fields() {
    return {
      id: this.uid(),
      name: this.string(''),
      recommendation: this.hasMany(Recommendation, 'user_id'),
      diagnoses: this.hasMany(Diagnosis, 'uid'),
    }
  }
}

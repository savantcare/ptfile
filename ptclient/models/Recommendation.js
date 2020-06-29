import { Model } from '@vuex-orm/core'
import Patient from './Patient'

export default class Recommendation extends Model {
  static entity = 'recommendations'

  static fields() {
    return {
      id: this.uid(),
      user_id: this.string(null).nullable(),
      title: this.string(''),
      assignee: this.belongsTo(Patient, 'user_id'),
    }
  }
}

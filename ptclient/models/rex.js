import { Model } from '@vuex-orm/core'
import Patient from './patient'

export default class Todo extends Model {
  static entity = 'rex'

  static fields() {
    return {
      id: this.uid(),
      user_id: this.string(null).nullable(),
      title: this.string(''),
      done: this.boolean(false),
      assignee: this.belongsTo(Patient, 'user_id'),
    }
  }
}

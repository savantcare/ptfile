import { Model } from '@vuex-orm/core'
import Todo from './Todo'

export default class Patient extends Model {
  static entity = 'patients'

  static fields() {
    return {
      id: this.uid(),
      name: this.string(''),
      todos: this.hasMany(Todo, 'user_id'),
    }
  }
}

// For docs read ptclient/docs/models.md
import { Model } from '@vuex-orm/core'
const { v1: uuidv1 } = require('uuid')

let count = 0
const intUniqueID = () => ++count

export default class reminders extends Model {
  static entity = 'rem'

  static fields() {
    return {
      id: this.uid(() => intUniqueID()), // if this is not set then update based on primary key will not work
      uuid: this.uid(() => uuidv1()),
      uuidOfRemMadeFor: this.string(null),
      remDesc: this.string(''),
      notes: this.string(null),
      priority: this.number(0),
      isAutoRem: this.number(0),
      recordChangedByUUID: this.string(null),
      recordChangedFromIPAddress: this.string(null),
      recordChangedFromSection: this.string(null),

      ROW_START: this.number(0),
      ROW_END: this.number(2147483647.999999), // this is unix_timestamp value from mariaDB for ROW_END when a record is created new in MariaDB system versioned table.

      // the following fields only exist on client
      validationClass: this.string(''),
      isValidationError: this.boolean(false),
      rowStateOfClientSession: this.number(1), // Details read: /ptclient/docs/forms.md
    }
  }
}

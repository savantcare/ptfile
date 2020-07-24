// For docs read ptclient/docs/models.md
import rowStatus from '@/cts/core/crud/rowstatus.js'

const { v1: uuidv1 } = require('uuid')

let count = 0
const intUniqueID = () => ++count

export default class screening extends rowStatus {
  static entity = 'scrMaster'

  static apiUrl = 'http://localhost:8000/screening'

  static fields() {
    return {
      ...super.fields(),

      id: this.uid(() => intUniqueID()), // if this is not set then update based on primary key will not work
      uuid: this.uid(() => uuidv1()),
      screenName: this.string(null),
      scientificName: this.string(null),
      clinicalStudies: this.string(null),

      ROW_START: this.number(0),
      ROW_END: this.number(2147483647.999999),
    }
  }
}

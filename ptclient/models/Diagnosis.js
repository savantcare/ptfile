import { Model } from '@vuex-orm/core'
import Patient from './Patient'

export default class Diagnosis extends Model {
  static entity = 'diagnoses'

  static fields() {
    return {
      uuid: this.uid(),
      uid: this.belongsTo(Patient, 'uid'),
      name: this.string(''),
      icd10Code: this.string(null).nullable(),
      notes: this.string(null).nullable(),
      agree: this.string(null).nullable(),
      startDate: this.string(null).nullable(),
      recordChangedByUUID: this.attr(null),
      recordChangedFromIPAddress: this.attr(null),
      // Why store time as a number? Since vuex-orm does not understand dates.
      // The data types that vuex-orm understands are given at: https://vuex-orm.org/guide/model/defining-models.html#generic-type
      ROW_START: this.number(0),
      ROW_END: this.number(0),
    }
  }
}

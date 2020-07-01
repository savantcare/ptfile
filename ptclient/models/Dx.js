import { Model } from '@vuex-orm/core'
import Patient from './patient'

export default class Dx extends Model {
  static entity = 'diagnoses'

  static fields() {
    return {
      uuid: this.uid(),
      dxName: this.string(''),
      icd10Code: this.string(null).nullable(),
      dxDiscontinueNotes: this.string(null).nullable(),
      dxOnDate: this.string(null).nullable(),
      patientUUId: this.belongsTo(Patient, 'uid'),
      recordChangedByUUID: this.attr(null),
      recordChangedFromIPAddress: this.attr(null),
      // Why store time as a number? Since vuex-orm does not understand dates.
      // The data types that vuex-orm understands are given at: https://vuex-orm.org/guide/model/defining-models.html#generic-type
      ROW_START: this.number(0),
      ROW_END: this.number(0),
    }
  }
}

// simiolar to person.js in example

import { Model } from '@vuex-orm/core'

class rowStatus extends Model {
  static entity = 'rowstatus'

  static arOrmRowsCached = []

  static getOrmEditStateRows() {
    const arFromORM = this.query()
      .where('rowStateInThisSession', 2) // New
      .orWhere('rowStateInThisSession', 24) // New -> Changed
      .orWhere('rowStateInThisSession', 2456) // New -> Changed -> Requested save -> form error
      .get()
    return arFromORM
  }

  static getOrmApiSuccessStateRows() {
    // New -> Changed -> Requested save -> Sent to server -> Success
    const arFromORM = this.query().where('rowStateInThisSession', 24571).get()
    return arFromORM
  }

  static getOrmApiErrorStateRows() {
    // C3/3
    // New -> Changed -> Requested save -> Sent to server -> Failure
    const arFromORM = this.query().where('rowStateInThisSession', 24578).get()
    return arFromORM
  }

  static deleteEditStateRows() {
    const arFromORM = this.getOrmEditStateRows()
    if (arFromORM.length) {
      console.log('unsaved data found', arFromORM)
      for (let i = 0; i < arFromORM.length; i++) {
        this.delete(arFromORM[i].$id)
      }
    }
  }

  static getField(pOrmRowId, pFieldName) {
    console.log(this.arOrmRowsCached)
    if (typeof this.arOrmRowsCached[pOrmRowId] === 'undefined') {
      console.log('finding in model')
      const arFromORM = this.find(pOrmRowId)
      if (arFromORM) {
        return arFromORM[pFieldName]
      }
    } else {
      console.log('returning from cache')
      return this.arOrmRowsCached[pOrmRowId][pFieldName]
    }
  }
}

export default rowStatus

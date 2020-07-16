// simiolar to person.js in example

import { Model } from '@vuex-orm/core'

class rowStatus extends Model {
  static entity = 'rowstatus'

  static arOrmRowsCached = []
  static vOrmSaveScheduled = ''

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

  static setFieldInOrmOnTimeout(pEvent, pOrmRowId, pFieldName) {
    // Ref: https://stackoverflow.com/questions/45644781/update-value-in-multidimensional-array-in-vue
    let newRow = []
    if (typeof this.arOrmRowsCached[pOrmRowId] === 'undefined') {
      console.log('Creating a new blank row')
    } else {
      newRow = this.arOrmRowsCached[pOrmRowId].slice(0)
      console.log('Pulling out existing row')
    }
    newRow[pFieldName] = pEvent

    this.arOrmRowsCached[pOrmRowId] = newRow

    // The goal is to avpid forceUpdate the following line was tried as per vue manual. But in the base class $set is not available
    // this.$set(this.arOrmRowsCached, pOrmRowId, newRow)
    if (this.vOrmSaveScheduled) {
      clearTimeout(this.vOrmSaveScheduled)
    }
    /* Ref: https://stackoverflow.com/questions/38399050/vue-equivalent-of-settimeout */
    this.vOrmSaveScheduled = setTimeout(
      function (scope) {
        scope.setFieldInOrm(pEvent, pOrmRowId, pFieldName)
      },
      1000,
      this
    )
  }

  static setFieldInOrm(pEvent, pOrmRowId, pFieldName) {
    const row = {
      [pFieldName]: pEvent,
      rowStateInThisSession: 24,
      validationClass: '',
      isValidationError: false,
    }
    const arFromORM = this.update({
      where: pOrmRowId,
      data: row,
    })
    if (!arFromORM) {
      console.log('FATAL ERROR')
    }
  }
}

export default rowStatus

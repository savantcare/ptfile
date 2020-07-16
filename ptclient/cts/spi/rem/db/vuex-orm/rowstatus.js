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

  static getApiSuccessStateRows() {
    // New -> Changed -> Requested save -> Sent to server -> Success
    const arFromORM = this.query().where('rowStateInThisSession', 24571).get()
    return arFromORM
  }

  static getApiErrorStateRows() {
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

  static setFieldOnTimeout(pEvent, pOrmRowId, pFieldName) {
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
        scope.setFieldInVuex(pEvent, pOrmRowId, pFieldName)
      },
      1000,
      this
    )
  }

  static setFieldInVuex(pEvent, pOrmRowId, pFieldName) {
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

  static async sendToServer() {
    // API will return 1 (Success) or 0 (Failure)
    const arFromORM = this.query().where('rowStateInThisSession', 2457).get()

    console.log(arFromORM)

    for (let i = 0; i < arFromORM.length; i++) {
      const status = await this.sendDataToServer(arFromORM[i])
      if (status === 0) {
        // Handle api returned success
        this.update({
          where: (record) => record.id === arFromORM[i].id,
          data: {
            rowStateInThisSession: '24578', // New -> Changed -> Requested save -> Send to server -> API fail
          },
        })
      } else {
        // Handle api returned failure
        this.update({
          where: (record) => record.id === arFromORM[i].id,
          data: {
            rowStateInThisSession: '24571', // New -> Changed -> Requested save -> Send to server -> API Success
          },
        })
      }
    }
  }

  static async sendDataToServer(pORMRowArray) {
    pORMRowArray.uuidOfRemMadeFor = 'bfe041fa-073b-4223-8c69-0540ee678ff8'
    pORMRowArray.recordChangedByUUID = 'bua674fa-073b-4223-8c69-0540ee786kj8'
    try {
      const response = await fetch(this.apiUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          // Authorization: 'Bearer ' + TOKEN,
        },
        body: JSON.stringify({
          data: pORMRowArray,
        }),
      })
      if (!response.ok) {
        return 0 // Returns error code when api fails to update record in DB
      } else {
        return 1 // Returns success code when api successfully updates record in DB
      }
    } catch (ex) {
      return 0 // Returns error code when try block gets an exception and fails
    }
  }
}

export default rowStatus

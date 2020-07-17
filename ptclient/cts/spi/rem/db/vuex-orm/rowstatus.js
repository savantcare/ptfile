// simiolar to person.js in example

import { Model } from '@vuex-orm/core'

class rowStatus extends Model {
  static entity = 'rowstatus'

  static arOrmRowsCached = []
  static vOrmSaveScheduled = ''

  static fields() {
    return {
      // the following fields only exist on client
      rowStateInThisSession: this.number(1), // Details read: /ptclient/docs/forms.md
      validationClass: this.string(''),
      isValidationError: this.boolean(false),
    }
  }

  static getValidUniqueUuidRows() {
    // Following query makes sure I get valid data and not discontimued data fromm temporal table. Ref: https://mariadb.com/kb/en/temporal-data-tables/
    const arFromORM = this.query().where('ROW_END', 2147483647.999999).get()

    const uniqueUuidRows = []

    // Goal: From the set of valid data, find unique UUIDs since it is possible that some UUID is being changed and now there are 2 records with same UUID
    let breakCheck1 = false
    for (let i = 0; i < arFromORM.length; i++) {
      for (let j = 0; j < uniqueUuidRows.length; j++) {
        if (arFromORM[i].uuid === uniqueUuidRows[j].uuid) {
          breakCheck1 = true
          break
        }
      }
      if (breakCheck1) break
      uniqueUuidRows.push(arFromORM[i])
    }

    return uniqueUuidRows
  }

  static getEditStateRows() {
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

  static getApiSendingStateRows() {
    // New -> Changed -> Requested save -> Sending to server
    const arFromORM = this.query().where('rowStateInThisSession', 2457).get()
    return arFromORM
  }

  static deleteEditStateRows() {
    const arFromORM = this.getEditStateRows()
    if (arFromORM.length) {
      console.log('unsaved data found', arFromORM)
      for (let i = 0; i < arFromORM.length; i++) {
        this.delete(arFromORM[i].$id)
      }
    }
  }

  static getField(pOrmRowId, pFieldName) {
    // first time it will have to find in model. This is needed to show the initial content in the field.
    if (typeof this.arOrmRowsCached[pOrmRowId] === 'undefined') {
      console.log('finding in model')
      const arFromORM = this.find(pOrmRowId)
      if (arFromORM) {
        return arFromORM[pFieldName]
      }
    } else {
      // if caching is removed then typing will update every 1 second when the vuex store gets updated.
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

    this.arOrmRowsCached[pOrmRowId] = newRow // vue does not react. This needs fixing TODO

    // The goal is to avpid forceUpdate the following line was tried as per vue manual. But in the base class $set is not available
    // this.$set(this.arOrmRowsCached, pOrmRowId, newRow)

    // debouncing. If A and B are pressed quickly. Timeout for "A" keypress will get cancelled and timeout for "B" keypress will get scheduled.
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
      const status = await this.fnMakeApiCAll(arFromORM[i])
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

  static async fnMakeApiCAll(pORMRowArray) {
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

  static async sendDiscontinueDataToServer(pORMDataRowID, remUUID, descontinuedNotes) {
    try {
      const response = await fetch(`${this.apiUrl}/${remUUID}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
          // "Authorization": "Bearer " + TOKEN
        },
        body: JSON.stringify({
          dNotes: descontinuedNotes,
          patientId: 'bfe041fa-073b-4223-8c69-0540ee678ff8',
        }),
      })
      if (!response.ok) {
        return 0
      } else {
        this.update({
          where: pORMDataRowID,
          data: {
            ROW_END: Math.floor(Date.now() / 1000),
          },
        })
        return 1
      }
    } catch (ex) {
      return 0
    }
  }
}

export default rowStatus

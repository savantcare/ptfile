// simiolar to person.js in example

import { Model } from '@vuex-orm/core'

class rowStatus extends Model {
  // For Class syntax https://javascript.info/class
  static entity = 'rowstatus'
  static arOrmRowsCached = []
  static vOrmSaveScheduled = ''
  static arOrmRowIdSendToServer = []

  /*
  constructor() {
    super()
    this.arOrmRowsCached = []       // If I do this each row of the orm model will have arOrmRowsCached = []
  }
  */

  static fields() {
    return {
      // the following fields only exist on client
      rowStateInThisSession: this.number(1), // Details read: /ptclient/docs/forms.md
      validationClass: this.string(''),
      isValidationError: this.boolean(false),
    }
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

  static getApiSuccessStateRows() {
    // New -> Changed -> Requested save -> Sent to server -> Success
    const arFromORM = this.query().where('rowStateInThisSession', 24571).get()
    return arFromORM
  }

  static getChangeRowsInEditState() {
    const arFromORM = this.query()
      .where('rowStateInThisSession', 3) // Copy
      .orWhere('rowStateInThisSession', 34) // Copy -> Changed
      .orWhere('rowStateInThisSession', 3456) // Copy -> Changed -> Requested save -> form error
      .get()
    return arFromORM
  }

  static getChangeRowInEditState(pUuid) {
    const arFromORM = this.query()
      .where('uuid', pUuid)
      .where('rowStateInThisSession', 3) // Copy
      .orWhere('rowStateInThisSession', 34) // Copy -> Changed
      .orWhere('rowStateInThisSession', 3456) // Copy -> Changed -> Requested save -> form error
      .get()
    if (arFromORM.length) {
      const idx = arFromORM.length - 1
      return arFromORM[idx].id
    } else {
      return false
    }
  }

  static getField(pOrmRowId, pFieldName) {
    // first time it will have to find in model. This is needed to show the initial content in the field.
    if (typeof this.arOrmRowsCached[pOrmRowId] === 'undefined') {
      // finding in model
      const arFromORM = this.find(pOrmRowId)
      if (arFromORM) {
        return arFromORM[pFieldName]
      }
    } else {
      // if caching is removed then typing will update every 1 second when the vuex store gets updated.
      // returning from cache
      return this.arOrmRowsCached[pOrmRowId][pFieldName]
    }
  }

  static getNewRowsInEditState() {
    const arFromORM = this.query()
      .where('rowStateInThisSession', 2) // New
      .orWhere('rowStateInThisSession', 24) // New -> Changed
      .orWhere('rowStateInThisSession', 2456) // New -> Changed -> Requested save -> form error
      .get()
    return arFromORM
  }

  static getValidUniqueUuidNotEmptyRows(pFieldForNonEmptyCheck) {
    // Following query makes sure I get valid data and not discontimued data fromm temporal table. Ref: https://mariadb.com/kb/en/temporal-data-tables/
    const arFromORM = this.query()
      .where('ROW_END', 2147483647.999999)
      .where(pFieldForNonEmptyCheck, (value) => value.length > 0)
      .get()
    const uniqueUuidRows = []

    // Goal: From the set of valid data, find unique UUIDs since it is possible that some UUID is being changed and now there are 2 records with same UUID
    let foundInArToReturn = false
    for (let i = 0; i < arFromORM.length; i++) {
      for (let j = 0; j < uniqueUuidRows.length; j++) {
        if (arFromORM[i].uuid === uniqueUuidRows[j].uuid) {
          /* Suppose a row is being changed. Now 2 rows have the same uuid. The old row and the new changed row.
          In the array that is returned from this Fn I am returning the array with the new data.       
          Hence in the following line I over write the old row
          */
          uniqueUuidRows[j] = arFromORM[i]
          foundInArToReturn = true
        }
      }
      if (foundInArToReturn) {
      } else {
        uniqueUuidRows.push(arFromORM[i])
      }
    }

    return uniqueUuidRows
  }

  static getValidUniqueUuidRows() {
    // Following query makes sure I get valid data and not discontimued data fromm temporal table. Ref: https://mariadb.com/kb/en/temporal-data-tables/
    const arFromORM = this.query().where('ROW_END', 2147483647.999999).get()
    const uniqueUuidRows = []

    // Goal: From the set of valid data, find unique UUIDs since it is possible that some UUID is being changed and now there are 2 records with same UUID
    for (let i = 0; i < arFromORM.length; i++) {
      let foundInArToReturn = false
      for (let j = 0; j < uniqueUuidRows.length; j++) {
        if (arFromORM[i].uuid === uniqueUuidRows[j].uuid) {
          /* Suppose a row is being changed. Now 2 rows have the same uuid. The old row and the new changed row.
          In the array that is returned from this Fn I am returning the array with the new data.       
          Hence in the following line I over write the old row
          */
          if (arFromORM[i].id > uniqueUuidRows[j].id) {
            uniqueUuidRows[j] = arFromORM[i]
          } else {
            // The existing data is newer hence not replacing
          }
          foundInArToReturn = true
        }
      }
      if (foundInArToReturn) {
        // Already found in array to be returned hence no need to add to arary
      } else {
        uniqueUuidRows.push(arFromORM[i])
      }
    }

    // console.log(uniqueUuidRows)
    return uniqueUuidRows
  }

  static findIfDuplicateExists(pUuid) {
    const num = this.query().where('uuid', pUuid).count()
    if (num > 1) {
      return true
    } else {
      return false
    }
  }

  static deleteEditStateRows() {
    const arFromORM = this.getNewRowsInEditState()
    if (arFromORM.length) {
      for (let i = 0; i < arFromORM.length; i++) {
        this.delete(arFromORM[i].$id)
      }
    }
  }

  static setField(pEvent, pOrmRowId, pFieldName, pRowStatus) {
    this.putFieldValueInCache(pEvent, pOrmRowId, pFieldName)
    this.createTimeoutToSave(pEvent, pOrmRowId, pFieldName, pRowStatus)
  }

  /*  
    Why? 
    Put the value of what the user is typing in cache so that the user can see form field has the charecters that he has typed.
  
    How? 
    Step 1: This is called in the form on each key press (@input is invoked on each key press)
            Ref: The chain is started at cts/spi/rem/cl/add.vue:16 
            The sequence is: add.vue:16:mfSetFieldUsingCache 
                              => add.vue:116:ormRem.setField 
                                => rowStatus.js:118:this.putFieldValueInCache

    Step : The work done by this function is used on each key press at:
                            add.vue:15:value="mfGetField"
                              => add.vue:113:ormRem.getField
                                => rowStatus.js:97

    Problem?                              
      When the cache array is update we want vue to react to the change and update add.vue:15:value="mfGetField"

      forceUpdates are not good quality code. With 2 dimensional array if we do not follow right approach then force update will be needed
  */
  static putFieldValueInCache(pEvent, pOrmRowId, pFieldName) {
    // Method 1: of updating cache array. Checked by VK and RJ in July 2020 the force update is needed inside add.vue:115:setFieldInOrmOnTimeOut
    if (typeof this.arOrmRowsCached[pOrmRowId] === 'undefined') {
      this.arOrmRowsCached[pOrmRowId] = [] // setting this to a blank row since later I do splice. For splice that row needs to exist.
    }
    this.arOrmRowsCached[pOrmRowId][pFieldName] = pEvent

    /*
    // Method 2: https://vuejs.org/2016/02/06/common-gotchas/#Why-isn%E2%80%99t-the-DOM-updating
    // of updating cache array Ref: https://stackoverflow.com/questions/45644781/update-value-in-multidimensional-array-in-vue
    let newRow = []
    if (typeof this.arOrmRowsCached[pOrmRowId] === 'undefined') {
      this.arOrmRowsCached[pOrmRowId] = [] // setting this to a blank row since later I do splice. For splice that row needs to exist.
      console.log('Creating a new blank row')
    } else {
      newRow = this.arOrmRowsCached.slice(pOrmRowId, pOrmRowId + 1) // Existing row may have 5 fields so I need to pull it out before updating 1 field
      console.log('Existing row pulled out is', newRow)
    }
    newRow[pFieldName] = pEvent // Upadted the field value in the new row
    this.arOrmRowsCached.splice(pOrmRowId, 1, newRow) // Put the single row back inside the array of a lot of rows.
    // Problem: A tree structure of elements is getting made and can be verified by doing console.log
    console.log(this.arOrmRowsCached)
*/

    /*
      Method 3 of updating cache:
      this.arOrmRowsCached[pOrmRowId] = newRow // vue does not react. Now add.vue:115:setFieldInOrmOnTimeOut needs this.$forceUpdate
      */
    /* 
      Method 4 of updating cache:
      This will not work since $set is not available outside vue conetxt this is not vue context
      this.$set(this.arOrmRowsCached, pOrmRowId, newRow)
      */

    /* Method 5: Delete old rows and create new row Checked by RJ and VK on 15th July
    if (typeof this.arOrmRowsCached[pOrmRowId] === 'undefined') {
      this.arOrmRowsCached[pOrmRowId] = [] // setting this to a blank row since later I do splice. For splice that row needs to exist.
    }
    this.arOrmRowsCached[pOrmRowId][pFieldName] = pEvent

    const copyOfOldRow = this.arOrmRowsCached
    // this.arOrmRowsCached = []
    this.arOrmRowsCached.length = 0
    console.log(this.arOrmRowsCached)
    this.arOrmRowsCached = copyOfOldRow
    */
  }

  static createTimeoutToSave(pEvent, pOrmRowId, pFieldName, pRowStatus) {
    // Goal: debouncing. If A and B are pressed quickly. Timeout for "A" keypress will get cancelled and timeout for "B" keypress will get scheduled.
    if (this.vOrmSaveScheduled) {
      clearTimeout(this.vOrmSaveScheduled)
    }
    /* Ref: https://stackoverflow.com/questions/38399050/vue-equivalent-of-settimeout */
    this.vOrmSaveScheduled = setTimeout(
      function (scope) {
        scope.setFieldInVuex(pEvent, pOrmRowId, pFieldName, pRowStatus)
      },
      1000,
      this
    )
  }

  static setFieldInVuex(pEvent, pOrmRowId, pFieldName, pRowStatus) {
    const row = {
      [pFieldName]: pEvent,
      rowStateInThisSession: pRowStatus,
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

    /*
      Q) Why we use promise in following code?
      A)
        In real time, user may add data and hit save button of add form and again tries to save data before the previous data gets saved in DB. The system got confused in such case.
        We are using asynchronous promises to deal with the case.
    */
    const promises = arFromORM.map(async (row) => {
      try {
        /*
          Q) Why we put the api call code in if/else statement?
          A)
            We are dealing cases like:
              1. User adds data, hits save button twice or double click
              2. user adds data, hits save button and again tries to add another data and click save button before previous api call finished. 

            Here is the problem and how we are resolving this:
              Save process starts with searching from orm for the records having 'rowStateInThisSession' = 2457.
              Now, 'rowStateInThisSession' of orm record gets updated only after api call finishes and in above mentioned cases, system initiates this save process again before 'rowStateInThisSession' update. 
              That means the second time searching for 'rowStateInThisSession' = 2457 will point to the same record multiple times which should not be the actual case.

              To solve this, we are maintaining an array 'arOrmRowIdSendToServer' during the process, which contains orm row id that are going to be saved.
              In if statement we are searching if orm row id exist in that array. if yes then api sending process already happened for the row, hence not to do anything. if not found then in else statement we are initiating the api calling process after pushing orm row id in 'arOrmRowIdSendToServer'.
        */
        if (this.arOrmRowIdSendToServer.includes(row.id)) {
          console.log('Already sent to server')
        } else {
          this.arOrmRowIdSendToServer.push(row.id)
          const status = await this.fnMakeApiCAll(row)
          if (status === 0) {
            // Handle api returned success
            this.update({
              where: (record) => record.id === row.id,
              data: {
                rowStateInThisSession: '24578', // New -> Changed -> Requested save -> Send to server -> API fail
              },
            })
          } else {
            // Handle api returned failure
            this.update({
              where: (record) => record.id === row.id,
              data: {
                rowStateInThisSession: '24571', // New -> Changed -> Requested save -> Send to server -> API Success
              },
            })
          }
        }
      } catch (err) {
        return err.message || 'Some error occured while get user info'
      }
    })

    await Promise.all(promises)

    /* Remove all the orm row ids from 'arOrmRowIdSendToServer' after all the promise finished. */
    this.arOrmRowIdSendToServer.splice(0, this.arOrmRowIdSendToServer.length)
  }

  static async fnMakeApiCAll(pORMRowArray) {
    pORMRowArray.ptUUID = 'bfe041fa-073b-4223-8c69-0540ee678ff8'
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

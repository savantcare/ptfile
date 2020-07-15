<template>
  <div>
    <el-form>
      <el-form-item>
        <el-input
          type="textarea"
          :autosize="{ minRows: 2, maxRows: 4 }"
          :value="getRemDescUsingCache()"
          @input="setRemDescInVstOnDelay($event)"
        ></el-input>
        <!-- setRemDescInVstOnDelay -> Full form: Set reminder description in view state on delay -->
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="mini" plain @click="sendDataToServer"
          >Submit<!-- Uncomment to see reminder ID {{ this.firstParam }}--></el-button
        >
      </el-form-item>
    </el-form>

    <!-- Goal show history of this reminder -->
    <el-timeline style="padding-inline-start: 20px;">
      <el-timeline-item
        v-for="row in cfTimeLineDataAr"
        :key="row.ROW_START"
        :timestamp="row.createdAt"
        :type="row.type"
      >
        {{ row.remDesc }}
      </el-timeline-item>
    </el-timeline>
  </div>
</template>
<script>
import { REMINDER_API_URL } from '../const.js'
import ormRem from '@/cts/spi/rem/db/vuex-orm/rem.js'
export default {
  /* Why is this called firstParam
        This Ct is called in a for loop. In the same for loop other Ct are also called.
        So the param name has to be generic and cannot be unique to each Ct
    */
  props: ['firstParam'], // this is the unique row id created by vuex-orm
  data() {
    return {
      reminderDescCached: '',
      uuid: '',
      ORMRowIDForPreviousInvocation: 0,
      vSaveToStateScheduledUsedForSmartUpdatesToState: '',
    }
  },
  computed: {
    cfRowInEditStateOnClient() {
      const arResultsFromORM = ormRem
        .query()
        .where('rowStateOfClientSession', 23) // New -> Changed
        .orWhere('rowStateOfClientSession', 2345) // New -> Changed -> Requested save -> form error
        .where((_record, query) => {
          query.where('uuid', this.uuid)
        })
        .get()
      return arResultsFromORM
    },
    cfTimeLineDataAr() {
      //      console.log('inside computed function the UUID is', this.uuid)
      const dataTable = []

      // to create timeline the uuid will be same but id will be different.

      /* Goal: The current description was not taking the description of latest one if sorted by id 
          To fix this we changed it to sort by ROW_END */
      const arResultsFromORM = ormRem
        .query()
        .where('uuid', this.uuid)
        .orderBy('ROW_END', 'desc')
        .get()
      console.log('Time line if for uuid', this.uuid)
      if (arResultsFromORM.length) {
        let obj = []
        let date = ''
        // console.log('sending this to timeline', arResultsFromORM, arResultsFromORM[0].uuid)
        for (let i = 0; i < arResultsFromORM.length; i++) {
          obj = {}
          obj.remDesc = arResultsFromORM[i].remDesc
          /*
          To get the number of the month:
          obj.createdAt = date.getMonth() + 1 + "-" + date.getDate()

          To get the name of the month:
          Ref: https://stackoverflow.com/questions/1643320/get-month-name-from-date
          */
          date = new Date(arResultsFromORM[i].ROW_START)
          obj.createdAt = date.toLocaleString('default', { month: 'long' }) + '-' + date.getDate()
          if (
            arResultsFromORM[i].rowStateOfClientSession === 23 ||
            arResultsFromORM[i].rowStateOfClientSession === 2345
          ) {
            obj.type = 'warning'
          } else {
            obj.type = ''
          }
          obj.ROW_START = arResultsFromORM[i].ROW_START
          dataTable.push(obj)
        }
      }
      // console.log(dataTable)
      return dataTable
    },
  },
  mounted() {
    // Goal: If there is no unsaved data then give user a empty form
  },
  methods: {
    /* Goal: this.uuid was not getting updated if we press ESC to close popup and open different reminder 
    Removed the code from mounted() and called this function initializeRemData() 
    from the method getRemDescUsingCache() in line 172
    so that uuid gets correct value whenever the CL opens
    */
    initializeRemData() {
      console.log('in mounted state')
      let arResultsFromORM = ormRem.find(this.firstParam)
      this.uuid = arResultsFromORM.uuid
      arResultsFromORM = this.cfRowInEditStateOnClient
      console.log(arResultsFromORM)
      if (!arResultsFromORM.length) {
        console.log('adding a new blank record. Since this is temporal DB')
        this.addEmptyRemToUI()
      }
    },
    addEmptyRemToUI() {
      console.log('Add rem called')
      const arCheckEmptyStateAlreadyExistsInORM = ormRem
        .query()
        .where('uuid', this.uuid)
        .where((_record, query) => {
          query
            .where('rowStateOfClientSession', 2) // Data is New and unchanged
            .orWhere('rowStateOfClientSession', 23) // Data is New -> Changed on client
            .orWhere('rowStateOfClientSession', 2345) // Data is New -> Changed on client -> Validation error
            .orWhere('rowStateOfClientSession', 2347) // Data is New -> Changed on client -> Failed to save
        })
        .where('rowStateOfClientSession', 2)
        .get()
      /* Goal: When change rem is re-opened after closing the tab in CL, the empty record should not be duplicated 
          To do this we are fetching the unsaved states with same UUID and if found restricting new entry
      */
      if (arCheckEmptyStateAlreadyExistsInORM.length === 0) {
        /* Goal : At the time of opening change popup the input box was not showing current description */
        const arResultsFromORM = ormRem.insert({
          data: {
            uuid: this.uuid,
            remDesc: this.getRemDescFromVst(), // Called this function to get the latest version of description
            rowStateOfClientSession: 2, // For meaning of diff values read rem/db/vuex-orm/rems.js:71
            ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
          },
        })
        console.log(arResultsFromORM)
      }
    },
    getRemDescUsingCache() {
      /* Performance analysis
         When C is first clicked and the control comes here. This fn is called twice
         Since following console.log is written twice.
         If I remove :value="getRemDescUsingCache()" then this fn is called 0 times

         Why?
         It is a default browser behavior. Clicking on the <label> will trigger 2 clicks, one for <label> and one for <input>.
         Ref: https://stackoverflow.com/a/58724163

         This fn is fired once when the property is first defined with undefined value and then is fired twice when a value is assigned to it.

        */

      /* When to get from ORM and when from cache?
         Inside get desc. 1st time it comes from ORM from then on it always come from cache. The cache value is set by setRemDesc
        */

      this.initializeRemData()
      console.log(this.firstParam)
      if (this.ORMRowIDForPreviousInvocation !== this.firstParam) this.reminderDescCached = ''
      if (!this.reminderDescCached) {
        // console.log('Going to run query on vuexORM since for this parameter data has never been fetched from vuex-orm')
        return this.getRemDescFromVst()
      } else {
        console.log('Better perf: Returning without running query on vuexORM')
        return this.reminderDescCached
      }
    },

    getRemDescFromVst() {
      // Full form: Get reminder description from view state.
      // console.log('Inside get desc')
      this.ORMRowIDForPreviousInvocation = this.firstParam
      // When I come here there are 2 possibilities: 1. It is a new row 2. It is a previously edited row
      // Goal: Get the latest data with this UUID. This will take care of both the above cases
      /* Goal: The current description was not taking the description of latest one if sorted by id 
          To fix this we changed it to sort by ROW_END */
      const arResultsFromORM = ormRem
        .query()
        .where('uuid', this.uuid)
        .orderBy('ROW_END', 'desc')
        .get()
      console.log(arResultsFromORM, this.uuid)
      if (arResultsFromORM.length > 0) {
        // console.log(arResultsFromORM)
        this.newRowIDfromORM = arResultsFromORM[0].id
        return arResultsFromORM[0].remDesc
      } else {
        return 'ERROR: This is not possible'
      }
    },

    // state updates are smarter.
    setRemDescInVstOnDelay(pEvent) {
      // Full form: Set reminder in vue state on delay
      if (this.vSaveToStateScheduledUsedForSmartUpdatesToState) {
        console.log('clearing timeout')
        clearTimeout(this.vSaveToStateScheduledUsedForSmartUpdatesToState)
      }

      /* Ref: https://stackoverflow.com/questions/38399050/vue-equivalent-of-settimeout */
      this.vSaveToStateScheduledUsedForSmartUpdatesToState = setTimeout(
        function (scope) {
          scope.setRemDescInVst(pEvent)
        },
        500,
        this
      )

      this.reminderDescCached = pEvent
    },

    setRemDescInVst(pEvent) {
      console.log('Inside setRemDesc')
      ormRem.update({
        where: this.newRowIDfromORM,
        data: {
          remDesc: pEvent,
          rowStateOfClientSession: 23,
        },
      })
    },

    async sendDataToServer() {
      try {
        const response = await fetch(`${REMINDER_API_URL}/${this.uuid}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            // "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify({
            remDesc: this.getRemDescUsingCache(),
          }),
        })
        if (!response.ok) {
          /* Goal: Update the value of 'rowStateOfClientSession' to success or failure depending on the api response */
          ormRem.update({
            where: this.newRowIDfromORM,
            data: {
              rowStateOfClientSession: 2345,
            },
          })
          console.log('Failed to update')
        } else {
          /* We are sorting this records by id because all the records have same ROW_END and 
          as the latest version of the data has newer id we can sort by id */
          const arResultsFromORM = ormRem
            .query()
            .where('uuid', this.uuid)
            .where('ROW_END', 2147483647.999999)
            .orderBy('id', 'desc')
            .get()
          /* Goal: Update old version of the reminder's ROW_END to current timestamp if change is successful */
          ormRem.update({
            where: arResultsFromORM[1].$id,
            data: {
              ROW_END: Math.floor(Date.now() / 1000),
            },
          })

          /* Goal: Update the value of 'rowStateOfClientSession' to success or failure depending on the api response */
          ormRem.update({
            where: this.newRowIDfromORM,
            data: {
              rowStateOfClientSession: 2346,
            },
          })
          console.log('update success')
        }
      } catch (ex) {}

      console.log('sendDataToServer-> ', this.uuid, this.getRemDescUsingCache())
    },
  },
}
</script>

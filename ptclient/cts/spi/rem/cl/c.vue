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
          >Submit firstpapram is {{ this.firstParam }}</el-button
        >
      </el-form-item>
    </el-form>

    <!-- Goal: show history of this row -->
    <el-timeline style="padding-inline-start: 20px;">
      <el-timeline-item
        v-for="row in cfTimeLineDataAr"
        :key="row.ROW_START"
        :timestamp="row.createdAt"
        :type="row.type"
      >
        {{ row.remDesc }}
        <span
          v-if="row.rowStateInThisSession == 345"
          class="api-response-message el-button--warning"
          >sending to server</span
        >
        <span
          v-if="row.rowStateInThisSession == 34571"
          class="api-response-message el-button--success"
          >saved this session</span
        >
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
      uuid: '',
      OrmRowIDForPreviousInvocation: 0,
      newRowBeingEditedIdfromOrm: 0,
    }
  },
  computed: {
    cfRowInEditStateOnClient() {
      return ormRem.getChangeRowsInEditState()
    },
    cfTimeLineDataAr() {
      const timelineDataArray = []

      // Insight: to create timeline the uuid will be same but id will be different.
      const arFromORM = ormRem.query().where('uuid', this.uuid).orderBy('ROW_START', 'desc').get()
      console.log('Time line for uuid', this.uuid)
      if (arFromORM.length) {
        let rowInTimeLine = []
        let date = ''
        for (let i = 0; i < arFromORM.length; i++) {
          rowInTimeLine = {}
          rowInTimeLine.remDesc = arFromORM[i].remDesc
          date = new Date(arFromORM[i].ROW_START)
          rowInTimeLine.createdAt =
            date.toLocaleString('default', { month: 'long' }) + '-' + date.getDate()
          if (
            arFromORM[i].rowStateInThisSession === 3 ||
            arFromORM[i].rowStateInThisSession === 34 ||
            arFromORM[i].rowStateInThisSession === 3456
          ) {
            rowInTimeLine.type = 'warning' // row is being edited and is not on server
          } else {
            rowInTimeLine.type = ''
          }
          rowInTimeLine.ROW_START = arFromORM[i].ROW_START
          rowInTimeLine.rowStateInThisSession = arFromORM[i].rowStateInThisSession
          timelineDataArray.push(rowInTimeLine)
        }
      }
      return timelineDataArray
    },
  },
  mounted() {},
  methods: {
    async addEmptyRemToUI(pDesc) {
      console.log('Add rem called')
      const arFromORM = await ormRem.insert({
        data: {
          remDesc: pDesc,
          uuid: this.uuid,
          rowStateInThisSession: 3, // For meaning of diff values read rem/db/vuex-orm/rems.js:71
          ROW_START: Math.floor(Date.now() / 1000), // Ref: https://stackoverflow.com/questions/221294/how-do-you-get-a-timestamp-in-javascript
        },
      })
      this.newRowBeingEditedIdfromOrm = arFromORM.rem[0].id
    },
    getRemDescUsingCache() {
      /*
        Q) Why is this called twice when this page is loaded?
         When C is first clicked and the control comes here. This fn is called twice
         Since following console.log is written twice.
         If I remove :value="getRemDescUsingCache()" then this fn is called 0 times

         Why?
         It is a default browser behavior. Clicking on the <label> will trigger 2 clicks, one for <label> and one for <input>.
         Ref: https://stackoverflow.com/a/58724163

         This fn is fired once when the property is first defined with undefined value and then is fired twice when a value is assigned to it.

        Q) When to get from ORM and when from cache?
         Inside get desc. 1st time it comes from ORM from then on it always come from cache. The cache value is set by setRemDesc

        Q) WHat are the states for the paramters supplied to this Ct?
                 1. Repeat invocatoion => 1.1 no unsaved data 1.2 there is unsaved data
                 2. First time invocation => 2.1 no unsaved data 2.2 there is unsaved data

        Q) What are the different times this function is called?
          1. User types multiple keystrokes. This fn is called for each keystroke
          2. User click C from the table. Uses esc key to closes the tab and then again clicks C
          3. User click C from table clicks cross to exit the tab and then again click C

          1st click on C -> 1 fti / 1 ri
                      each keystroke -> ri 2 times
                                                    close tab by clicking outside modal ->
                                                                                then click same C -> NO  fti / ri
                                                                                then click different C -> 1 fti / 1 ri
                                                    close tab by clicking cross -> then click same C -> -> 1 fti / 1 ri
        */

      // Goal: decide if it is repeat or first invocation
      let arFromORM = []
      if (this.OrmRowIDForPreviousInvocation === this.firstParam) {
        console.log('this is repeat invocation')
        // Inferences: 1. this.uuid is already existing 2. New empty row where the user can type is already existing
      } else {
        // Inference: This is first time in this Ct lifetimes that it has been called with this parameter
        console.log('this is first time invocation')
        this.OrmRowIDForPreviousInvocation = this.firstParam
        arFromORM = ormRem.find(this.firstParam)
        this.uuid = arFromORM.uuid
        console.log('Find if there is unsaved data', this.uuid)
        if (!ormRem.findIfDuplicateExists(this.uuid)) {
          console.log('adding a new blank record. Since this is temporal DB')
          this.addEmptyRemToUI(arFromORM.remDesc)
        } else {
          const arFromORM = ormRem.query().where('uuid', this.uuid).orderBy('id', 'desc').get()
          this.newRowBeingEditedIdfromOrm = arFromORM[0].id
          if (arFromORM.length > 0) {
            this.newRowBeingEditedIdfromOrm = arFromORM[0].id
          } else {
            return 'ERROR: This is not possible'
          }
        }
      }
      // From this point on the state is the same.
      return ormRem.getField(this.newRowBeingEditedIdfromOrm, 'remDesc')
    },

    setRemDescInVstOnDelay(pEvent) {
      const rowStatus = 34
      ormRem.setField(pEvent, this.newRowBeingEditedIdfromOrm, 'remDesc', rowStatus)
      this.$forceUpdate() // Not able to remove it. For the different methods tried read: cts/core/rowstatus.js:133/putFieldValueInCache
    },

    async sendDataToServer() {
      try {
        await ormRem.update({
          where: this.newRowBeingEditedIdfromOrm,
          data: {
            rowStateInThisSession: '345',
          },
        })

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
          /* Goal: Update the value of 'rowStateInThisSession' to success or failure depending on the api response */
          ormRem.update({
            where: this.newRowBeingEditedIdfromOrm,
            data: {
              rowStateInThisSession: 3458,
            },
          })
          console.log('Failed to update')
        } else {
          /* Goal: Update old version of the reminder's ROW_END to current timestamp if change is successful */
          ormRem.update({
            where: this.OrmRowIDForPreviousInvocation,
            data: {
              ROW_END: Math.floor(Date.now() / 1000),
            },
          })
          /* Goal: Update the value of 'rowStateInThisSession' to success or failure depending on the api response */
          ormRem.update({
            where: this.newRowBeingEditedIdfromOrm,
            data: {
              rowStateInThisSession: 34571,
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

<style>
span.api-response-message {
  padding: 0px 8px 3px 8px;
  border-radius: 20px;
  font-size: 12px;
}
</style>

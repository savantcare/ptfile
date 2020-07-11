<template>
  <div>
    <el-form>
      <el-form-item label="Description">
        <el-input
          :value="getRemDescUsingCache()"
          @input="setRemDescInStateOn2Sec($event)"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" plain @click="sendDataToServer"
          >Submit</el-button
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
        {{ row.remDescription }}
      </el-timeline-item>
    </el-timeline>
  </div>
</template>
<script>
import { REMINDER_API_URL } from '../const.js'
import ormRem from '@/cts/rem/vuex-orm/model.js'
export default {
  props: ['firstParam'], // this is the unique row id crated by vuex-orm
  data() {
    return {
      keystrokeCount: 0,
      reminderDescCached: '',
      uuid: '',
      stateForRowID: 0,
      vSaveToStateScheduled: '',
    }
  },
  computed: {
    cfTimeLineDataAr() {
      //      console.log('inside computed function the UUID is', this.uuid)
      const dataTable = []

      // to create timeline the uuid will be same but id will be different.
      const resultSetFromORM = ormRem.query().where('uuid', this.uuid).get()
      if (resultSetFromORM.length) {
        let obj = []
        let date = ''
        // console.log('sending this to timeline', resultSetFromORM, resultSetFromORM[0].uuid)
        for (let i = 0; i < resultSetFromORM.length; i++) {
          obj = {}
          obj.remDescription = resultSetFromORM[i].remDescription
          /*
          To get the number of the month:
          obj.createdAt = date.getMonth() + 1 + "-" + date.getDate()

          To get the name of the month:
          Ref: https://stackoverflow.com/questions/1643320/get-month-name-from-date
          */
          date = new Date(resultSetFromORM[i].ROW_START)
          obj.createdAt =
            date.toLocaleString('default', { month: 'long' }) +
            '-' +
            date.getDate()
          if (resultSetFromORM[i].$isDirty) {
            obj.type = 'warning'
          } else {
            obj.type = ''
          }
          obj.ROW_START = resultSetFromORM[i].ROW_START
          dataTable.push(obj)
        }
      }
      // console.log(dataTable)
      return dataTable
    },
  },
  methods: {
    getRemDescUsingCache() {
      // console.log('Inside get desc. Only first time it needs to come from ORM and subsequently it can always come from cache, the value set by setRemDescOn5KeyPress')
      if (this.stateForRowID != this.firstParam) this.reminderDescCached = ''
      if (!this.reminderDescCached) {
        // console.log('Going to run query on vuexORM since for this parameter data has never been fetched from vuex-orm')
        return this.getRemDescFromState()
      } else {
        console.log('Better perf: Returning without running query on vuexORM')
        return this.reminderDescCached
      }
    },

    getRemDescFromState() {
      // console.log('Inside get desc')
      this.stateForRowID = this.firstParam
      const resultSetFromORM = ormRem.find(this.firstParam)
      if (resultSetFromORM) {
        // console.log(resultSetFromORM)
        this.uuid = resultSetFromORM.uuid
        return resultSetFromORM.remDescription
      } else {
        return ''
      }
    },

    /* Goal: Save to state smartly instead of every keystroke
        Why?
        So that the system remains responsive.
        There are a lot of listeners on this state and they will update themselves everytime there is a write to the vuexORM/rem

        Strategy 1: Save to state once every 5 key strokes,
        Disadvnatage?
        If the user types "jai kali" the state will only have "jai k" even if user exits the form after one hour

        Strategy 2: Each time you save to state you store the time
        Ignore next save if 1 second has not passed.
        Disadvnatage?
        If the user types "ja" within 1 sec and then exits the state will only have j
      */

    setRemDescInStateOn2Sec(pEvent) {
      if (this.vSaveToStateScheduled) {
        console.log('clearing timeout')
        clearTimeout(this.vSaveToStateScheduled)
      }

      /* Method 1 of calling the setRemDescInState function
        this.vSaveToStateScheduled = setTimeout(function () {
          console.log(this)
          this.setRemDescInState(pEvent) // here this is not vue but window so this will say setRemDescInState not found
        }, 2000)
        */

      /* Problem of method 1 is solved since this of arrow functions is bound to the this of its enclosing scope in Vue,
        Inside a traditional function called by setTimeout, however, this refers to the window object
        Ref: https://stackoverflow.com/questions/38399050/vue-equivalent-of-settimeout */

      setTimeout(
        function (scope) {
          scope.setRemDescInState(pEvent)
        },
        2000,
        this
      )

      this.reminderDescCached = pEvent
    },

    setRemDescInStateOn5KeyPress(pEvent) {
      if (this.keystrokeCount === 0) {
        // console.log('saving to state')
        this.setRemDescInState(pEvent)
        this.keystrokeCount++
      } else {
        // console.log('Better perf: Not saving to state')
        this.keystrokeCount++
        if (this.keystrokeCount === 5) {
          this.keystrokeCount = 0
        }
      }
      this.reminderDescCached = pEvent
    },

    setRemDescInStateOnKeyPress(pEvent) {
      this.setRemDescInState(pEvent)
      this.reminderDescCached = pEvent
    },

    setRemDescInState(pEvent) {
      console.log('Inside setRemDesc')
      ormRem.update({
        where: this.firstParam,
        data: {
          remDescription: pEvent,
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
            description: this.getRemDescUsingCache(),
          }),
        })
        if (!response.ok) {
          console.log('Failed to update')
        } else {
          console.log('update success')
        }
      } catch (ex) {}

      console.log('sendDataToServer-> ', this.uuid, this.getRemDescUsingCache())
    },
  },
}
</script>

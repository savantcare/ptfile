<template>
  <div>
    <el-form>
      <el-form-item label="Description">
        <el-input
          :value="getRemDescription()"
          @input="setRemDescription($event)"
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
    getRemDescriptionUsingCache() {
      // console.log('Inside get desc')
      if (this.stateForRowID != this.firstParam) this.reminderDescCached = ''
      if (!this.reminderDescCached) {
        // console.log('Going to run query on vuexORM since for this parameter data has never been fetched from vuex-orm')
        this.stateForRowID = this.firstParam
        const resultSetFromORM = ormRem.find(this.firstParam)
        if (resultSetFromORM) {
          // console.log(resultSetFromORM)
          this.uuid = resultSetFromORM.uuid
          return resultSetFromORM.remDescription
        } else {
          return ''
        }
      } else {
        console.log('Better perf: Returning without running query on vuexORM')
        return this.reminderDescCached
      }
    },
    setRemDescriptionUsingCache(pEvent) {
      /* Goal: Save to state once every 5 key strokes,
       Why?
       So that the system remains responsive.
       There are a lot of listeners on this state and they will update themselves everytime there is a write to the vuexORM/rem
       Disadvnatage?
       If the user types "jai kali" the state will only have "jai k"
      */

      if (this.keystrokeCount === 0) {
        // console.log('saving to state')
        ormRem.update({
          where: this.firstParam,
          data: {
            remDescription: pEvent,
          },
        })
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

    getRemDescription() {
      // console.log('Inside get desc')
      this.stateForRowID = this.firstParam
      const resultSetFromORM = ormRem.find(this.firstParam)
      if (resultSetFromORM) {
        // console.log(resultSetFromORM)
        this.uuid = resultSetFromORM.uuid
        return resultSetFromORM.remDescription
      }
    },
    setRemDescription(pEvent) {
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
            description: this.getRemDescriptionUsingCache(),
          }),
        })
        if (!response.ok) {
          console.log('Failed to update')
        } else {
          console.log('update success')
        }
      } catch (ex) {}

      console.log(
        'sendDataToServer-> ',
        this.uuid,
        this.getRemDescriptionUsingCache()
      )
    },
  },
}
</script>

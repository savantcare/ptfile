<template>
  <div>
    <el-form>
      <el-form-item label="Description">
        <el-input
          :value="getDescription()"
          @input="setDescription($event)"
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
      reminderDesc: '',
      uuid: '',
    }
  },
  computed: {
    cfTimeLineDataAr() {
      //      console.log('inside computed function the UUID is', this.uuid)
      const dataTable = []
      const resultSet = ormRem.query().where('uuid', this.uuid).get()
      if (resultSet.length) {
        let obj = []
        let date = ''
        // console.log('sending this to timeline', resultSet, resultSet[0].uuid)
        for (let i = 0; i < resultSet.length; i++) {
          obj = {}
          obj.remDescription = resultSet[i].remDescription
          /*
          To get the number of the month:
          obj.createdAt = date.getMonth() + 1 + "-" + date.getDate()

          To get the name of the month:
          Ref: https://stackoverflow.com/questions/1643320/get-month-name-from-date
          */
          date = new Date(resultSet[i].ROW_START)
          obj.createdAt =
            date.toLocaleString('default', { month: 'long' }) +
            '-' +
            date.getDate()
          if (resultSet[i].$isDirty) {
            obj.type = 'warning'
          } else {
            obj.type = ''
          }
          obj.ROW_START = resultSet[i].ROW_START
          dataTable.push(obj)
        }
      }
      // console.log(dataTable)
      return dataTable
    },
  },
  methods: {
    getDescription() {
      // console.log('Inside get desc')
      if (!this.reminderDesc) {
        // console.log('Going to run query on vuexORM since this came here for first time')
        const resultSet = ormRem.find(this.firstParam)
        if (resultSet) {
          // console.log(resultSet)
          this.uuid = resultSet.uuid
          return resultSet.remDescription
        } else {
          return ''
        }
      } else {
        console.log('Returning withiout running query on vuexORM')
        return this.reminderDesc
      }
    },
    setDescription(pEvent) {
      // Goal: Save to state once every 5 key strokes, This is done so that the system remains responsive.

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
        // console.log('Not saving to state')
        this.keystrokeCount++
        if (this.keystrokeCount === 5) {
          this.keystrokeCount = 0
        }
      }
      this.reminderDesc = pEvent
    },

    async sendDataToServer() {
      try {
        const response = await fetch(`${REMINDER_API_URL}/${this.uuid}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            // "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify({ description: this.getDescription() }),
        })
        if (!response.ok) {
          console.log('Failed to update')
        } else {
          console.log('update success')
        }
      } catch (ex) {}

      console.log('sendDataToServer-> ', this.uuid, this.getDescription())
    },
  },
}
</script>

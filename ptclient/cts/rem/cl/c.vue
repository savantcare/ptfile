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
        v-for="row in dataTable"
        :key="row.createdAt"
        :timestamp="row.createdAt"
        :type="row.type"
      >
        {{ row.remDescription }}
      </el-timeline-item>
    </el-timeline>
  </div>
</template>
<script>
import ormRem from '@/cts/rem/vuex-orm/model.js'
export default {
  props: ['firstParam'],
  data() {
    return {
      keystrokeCount: 0,
      reminderDesc: '',
    }
  },
  computed: {
    dataTable() {
      const dataTable = []
      const resultSet = ormRem.query().where('uuid', this.firstParam).get()
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

          dataTable.push(obj)
        }
      }
      // console.log(dataTable)
      return dataTable
    },
  },
  methods: {
    getDescription() {
      const rowID = this.firstParam
      // console.log('Inside get des rowID')
      if (!this.reminderDesc) {
        // console.log('Going to run query on vuexORM')
        const resultSet = ormRem.find(rowID)
        // console.log('Just finisghed running query on vuexORM')
        this.reminderRowStart = resultSet.ROW_START
        if (resultSet) {
          // console.log(resultSet)
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
      // Goal: Save to state once every 5 key strokes, This is done so that the system remains resonsive.

      if (this.keystrokeCount === 0) {
        //    console.log('saving to state')
        const rowID = this.firstParam
        ormRem.update({
          where: rowID,
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

    sendDataToServer() {},
  },
}
</script>

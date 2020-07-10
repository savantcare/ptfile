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
      doRem: {},
    }
  },
  computed: {
    dataTable() {
      const dataTable = []
      const resultSet = ormRem.query().where('uuid', this.firstParam).get()
      if (resultSet.length) {
        let obj = []
        let date = ''
        console.log('sending this to timeline', resultSet, resultSet[0].uuid)
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
      console.log(dataTable)
      return dataTable
    },
  },
  methods: {
    getDescription() {
      const remUUID = this.firstParam
      console.log(remUUID)
      const resultSet = ormRem.find(remUUID)
      if (resultSet) {
        console.log(resultSet)
        // ['remDescription']
        console.log(resultSet.uuid)
        return resultSet.remDescription
      } else {
        return ''
      }
    },
    setDescription(pEvent) {
      console.log('set called for', this.firstParam, pEvent)
      const remUUID = this.firstParam
      const resultSet = ormRem.update({
        where: remUUID,
        data: {
          remDescription: pEvent,
        },
      })
      console.log(resultSet)
    },
    sendDataToServer() {},
  },
}
</script>

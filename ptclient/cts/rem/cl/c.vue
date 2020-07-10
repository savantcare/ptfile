<template>
  <div>
    <el-form label-width="120px">
      <el-form-item label="Description">
        <el-input
          :value="getDescription()"
          @input="setDescription($event)"
        ></el-input>
      </el-form-item>
    </el-form>
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
  },
}
</script>

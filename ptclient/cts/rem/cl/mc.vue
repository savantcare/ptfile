<template>
  <el-form label-width="120px">
    <el-form-item v-for="id in arRemID" label="desc" :key="id">
      <el-input
        :value="getDescription(id)"
        @input="setDescription($event, id)"
      ></el-input>
    </el-form-item>
  </el-form>
</template>
<script>
import ormRem from '@/cts/rem/vuex-orm/model.js'
export default {
  data() {
    return {
      arRemID: [],
    }
  },
  mounted() {
    const resultSet = ormRem.query().where('$isNew', true).get()
    if (resultSet.length) {
      console.log('unsaved data found', resultSet, resultSet[0].uuid)
      for (let i = 0; i < resultSet.length; i++) {
        this.arRemID.push(resultSet[i].uuid)
      }
    } else {
      // When there is no unsaved data then we add an empty data to the state inside vuex
      console.log('No Unsaved data')
    }
  },
  methods: {
    getDescription(pRemID) {
      console.log(pRemID)
      const resultSet = ormRem.find(pRemID)
      if (resultSet) {
        console.log(resultSet)
        // ['remDescription']
        console.log(resultSet.uuid)
        return resultSet.remDescription
      } else {
        return ''
      }
    },
    setDescription(pEvent, pRemID) {
      console.log('set called for', pRemID, pEvent)
      const resultSet = ormRem.update({
        where: pRemID,
        data: {
          remDescription: pEvent,
        },
      })
      console.log(resultSet)
    },
  },
}
</script>

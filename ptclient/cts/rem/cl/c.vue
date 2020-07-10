<template>
  <el-form label-width="120px">
    <el-form-item label="Description">
      <el-input
        :value="getDescription()"
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
      doRem: {},
    }
  },
  methods: {
    getDescription() {
      const obRemToShowInCl = this.$store.state.vstObjTabsInCL.arTabs.filter(
        (item) => {
          return item.ctAbbr == 'crem'
        }
      )
      console.log(
        'selected rem object after filter',
        obRemToShowInCl[0].ctDataToPass
      )
      if (obRemToShowInCl.length) {
        return obRemToShowInCl[0].ctDataToPass.remDescription
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

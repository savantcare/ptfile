<template>
  <div class="block">
    <el-carousel arrow="always" trigger="click">
      <el-carousel-item v-for="slide in getNumOfCarouselItems">
        <el-row type="flex">
          <el-card v-for="set in getArrayOfReminderIDs">
            <c :firstParam="set"></c>
          </el-card>
        </el-row>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>
<script>
import ormRem from '@/cts/rem/vuex-orm/model.js'
import c from '@/cts/rem/cl/c.vue'
export default {
  components: { c },
  data() {
    return {
      daUniqueIDOfEachRowFromORM: [],
    }
  },
  computed: {
    getArrayOfReminderIDs() {
      const arr = this.daUniqueIDOfEachRowFromORM.slice(1, 3)
      return arr
    },
    getNumOfCarouselItems() {
      const count = this.daUniqueIDOfEachRowFromORM.length / 3
      const intValue = Math.floor(count)
      console.log('number of items in carousel are', count, intValue)
      if (count === 0) {
        return 1
      } else {
        return intValue
      }
    },
  },
  mounted() {
    console.log('In mounted function')
    const resultSet = ormRem.query().get()
    if (resultSet.length) {
      for (let i = 0; i < resultSet.length; i++) {
        this.daUniqueIDOfEachRowFromORM.push(resultSet[i].$id)
      }
    }
    console.log(this.daUniqueIDOfEachRowFromORM)
  },
}
</script>

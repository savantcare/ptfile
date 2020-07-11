<template>
  <div class="block">
    <el-carousel arrow="always" trigger="click">
      <el-carousel-item v-for="rem in daUniqueIDOfEachRowFromORM">
        <el-row type="flex">
          <el-card> <c :firstParam="rem"></c></el-card>
          <el-card> <c :firstParam="rem + 1"></c></el-card>
          <el-card> <c :firstParam="rem + 2"></c></el-card>
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

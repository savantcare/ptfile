<template>
  <div class="block">
    <el-carousel arrow="always" trigger="click">
      <el-carousel-item v-for="item in 4" :key="id">
        <el-row type="flex" id="item">
          <el-card>
            <c :firstParam="1"></c>
          </el-card>
          <el-card>
            <c :firstParam="2"></c>
          </el-card>
          <el-card>
            <c :firstParam="3"></c>
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
  mounted() {
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

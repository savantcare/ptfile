<template>
  <el-row type="flex">
    <div v-for="id in daRemUUID" :key="id">
      <c :firstParam="id"></c>
    </div>

    <c></c>
  </el-row>
</template>
<script>
import ormRem from '@/cts/rem/vuex-orm/model.js'
import c from '@/cts/rem/cl/c.vue'
export default {
  components: { c },
  data() {
    return {
      daRemUUID: [],
    }
  },
  mounted() {
    const resultSet = ormRem.query().get()
    if (resultSet.length) {
      for (let i = 0; i < resultSet.length; i++) {
        this.daRemUUID.push(resultSet[i].$id)
      }
    }
    console.log(this.daRemUUID)
  },
}
</script>

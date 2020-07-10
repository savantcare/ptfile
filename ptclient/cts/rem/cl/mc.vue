<template>
  <el-row type="flex">
    <div v-for="uuid in daRemUUID" :key="uuid">
      <c :firstParam="uuid"></c>
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
        this.daRemUUID.push(resultSet[i].uuid)
      }
    }
    console.log(this.daRemUUID)
  },
}
</script>

<template>
  <div></div>
</template>
<script>
import { DIAGNOSIS_API_URL } from './const.js'
import ormDx from '@/cts/spi/dx/db/vuex-orm/dx.js'
export default {
  data() {
    return {}
  },

  async mounted() {
    console.log('mounted function called')
    // check length and only load if its empty
    // Also need to restrict the load to current patient
    const proDxsFromDB = await ormDx.api().get(`${DIAGNOSIS_API_URL}`)
    if (proDxsFromDB.ok) {
    }
  },
}
</script>

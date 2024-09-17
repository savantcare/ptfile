<template>
  <div></div>
</template>
<script>
import { SCREENING_API_URL } from './const.js'
import ormScr from '@/cts/spi/scr/db/vuex-orm/scr.js'
export default {
  data() {
    return {}
  },

  async mounted() {
    console.log('scr mounted function called')
    // check length and only load if its empty
    // Also need to restrict the load to current patient
    const proScrFromDB = await ormScr.api().get(`${SCREENING_API_URL}/getAll`)
    if (proScrFromDB.ok) {
    }
  },
}
</script>

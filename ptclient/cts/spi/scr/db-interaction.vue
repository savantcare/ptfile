<template>
  <div></div>
</template>
<script>
import { SCREENING_API_URL } from './const.js'
import ormScr from '@/cts/spi/scr/db/vuex-orm/scr.js'
import ormScrMaster from '@/cts/spi/scr/db/vuex-orm/scrMaster.js'
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

    const proScrMasterFromDB = await ormScrMaster.api().get(`${SCREENING_API_URL}/getScrMasterList`)
    if (proScrMasterFromDB.ok) {
      console.log('scr mounted function called', proScrMasterFromDB)
    }
  },
}
</script>

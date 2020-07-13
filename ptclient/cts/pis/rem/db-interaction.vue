<template>
  <div></div>
</template>
<script>
import { REMINDER_API_URL } from './const.js'
import ormRem from '@/cts/pis/rem/vuex-orm/model.js'
export default {
  data() {
    return {}
  },

  async mounted() {
    console.log('mounted function called')
    const proRemsFromDB = await ormRem.api().get(`${REMINDER_API_URL}/getAll`)

    if (proRemsFromDB.ok) {
    }
  },
}
</script>

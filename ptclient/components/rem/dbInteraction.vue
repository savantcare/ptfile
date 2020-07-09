<template>
  <div>
    jai kali ma
  </div>
</template>

<script>
// import ormRem from '@/components/rem/vuex-orm/model.js'
import ormCTLifeCycle from '@/models/ormCTLifeCycle'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },

  mounted() {
    console.log('mounted function called')
    // Why do I check for lifecycle before calling DB functions. I dont want to get data from DB twice
    const resultSet = ormCTLifeCycle.query().where('name', 'Reminder').get()
    const resultData = resultSet[0]
    if (typeof resultData !== 'undefined') {
      console.log('already mounted')
    } else {
      ormCTLifeCycle.insert({
        data: {
          name: 'Reminder',
          status: 3, // For diff values see @/models/ormCTLifeCycle
        },
      })
    }
  },
}
</script>

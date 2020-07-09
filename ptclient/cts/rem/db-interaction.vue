<script>
import { REMINDER_API_URL } from './const.js'
import ormCTLifeCycle from '@/models/ormCtLifeCycle'
import ormRem from '@/cts/rem/vuex-orm/model.js'
export default {
  data() {
    return {}
  },

  async mounted() {
    console.log('mounted function called')
    const proRemsFromDB = await ormRem
      .api()
      .get(`${REMINDER_API_URL}?patientId=bfe041fa-073b-4223-8c69-0540ee678ff8`)

    if (proRemsFromDB.ok) {
    }
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

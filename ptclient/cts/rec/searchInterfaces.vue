<script>
import ormSearchUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'
import ormCTLifeCycle from '@/models/ormCtLifeCycle'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },
  mounted() {
    ormCTLifeCycle.insert({
      data: {
        name: 'Recommendations',
        status: 3,
      },
    })

    // Step 2/3: Inserting Search interfaces to this component
    ormSearchUiToCT.insert({
      data: {
        value: 'Recommendations',
        ctAbbr: 'rex',
        ctToShowInCL: '',
        ctToShowInMSVL: 'rec/vl/table.vue',
        ctToShowInCSVL: 'rec/vl/timeline.vue',
        layer: 'view',
      },
    })

    ormSearchUiToCT.insert({
      data: {
        value: 'Add Recommendations',
        ctAbbr: 'arex',
        ctToShowInCL: 'rec/vl/table.vue',
        layer: 'change',
      },
    })
  },
}
</script>

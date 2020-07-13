<script>
import ormSearchPhraseUiToCT from '@/cts/core/vl-search-box/vuex-orm/searchUIToCT'
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
        name: 'recommendations',
        status: 3,
      },
    })

    // Step 2/3: Inserting Search interfaces to this component
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'recommendations',
        ctAbbr: 'rex',
        ctToShowInCL: 'pis/',
        ctToShowInMSVL: 'pis/rec/vl/table.vue', // expands to Ct to show in Musti state of view layer
        ctToShowInCSVL: 'pis/rec/vl/timeline.vue',
        layer: 'view',
      },
    })

    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'add recommendations',
        ctAbbr: 'arex',
        ctToShowInCL: 'pis/rec/vl/table.vue',
        layer: 'change',
      },
    })
  },
}
</script>

<script>
import ormSearchPhraseUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'
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
        ctToShowInCL: '',
        ctToShowInMSVL: 'rec/vl/table.vue',
        ctToShowInCSVL: 'rec/vl/timeline.vue',
        layer: 'view',
      },
    })

    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'add recommendations',
        ctAbbr: 'arex',
        ctToShowInCL: 'rec/vl/table.vue',
        layer: 'change',
      },
    })
  },
}
</script>

<template>
  <div></div>
</template>

<script>
import ormSearchPhraseUiToCT from '@/cts/core/vl-search-box/vuex-orm/searchUIToCT'

export default {
  data() {
    return {}
  },
  mounted() {
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'map',
        ctAbbr: 'mp',
        ctToShowInCsOfVl: 'core/map/invoke.vue',
        layer: 'view',
      },
    })
  },
}
</script>

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
        value: 'feed',
        ctAbbr: 'fd',
        ctToShowInCsOfVl: 'core/feed/invoke.vue',
        layer: 'view',
      },
    })
  },
}
</script>

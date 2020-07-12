<template>
  <div></div>
</template>

<script>
import ormSearchPhraseUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'

export default {
  data() {
    return {}
  },
  mounted() {
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'feed',
        ctAbbr: 'fd',
        ctToShowInCSVL: 'feed/drawer.vue',
        layer: 'view',
      },
    })
  },
}
</script>

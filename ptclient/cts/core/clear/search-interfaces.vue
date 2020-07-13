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
        value: 'clear',
        ctAbbr: 'clr',
        ctToShowInCSVL: 'core/clear/index.vue',
        layer: 'view',
      },
    })
  },
}
</script>

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
        value: 'clear',
        ctAbbr: 'clr',
        ctToShowInCSVL: 'clear/index.vue',
        layer: 'view',
      },
    })
  },
}
</script>

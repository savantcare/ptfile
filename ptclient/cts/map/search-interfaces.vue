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
        value: 'map',
        ctAbbr: 'mp',
        ctToShowInCSVL: 'map/invoke.vue',
        layer: 'view',
      },
    })
  },
}
</script>

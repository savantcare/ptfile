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
        value: 'name',
        ctAbbr: 'name',
        ctToShowInCSVL: 'spi/name/vl/table.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })
  },
}
</script>

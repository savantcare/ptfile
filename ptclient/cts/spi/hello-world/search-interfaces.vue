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
        value: 'boilper plate',
        ctAbbr: 'bp',
        ctToShowInMSVL: 'spi/rem/boilerplate/table.vue', // MSVL -> Multi state view layer
        ctToShowInCSVL: 'spi/rem/boilerplate/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })
  },
}
</script>

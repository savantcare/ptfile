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
        value: 'Hello world',
        ctAbbr: 'bp',
        ctToShowInCsOfVl: 'spi/hello-world/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })
  },
}
</script>

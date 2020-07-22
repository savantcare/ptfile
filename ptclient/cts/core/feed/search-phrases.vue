<template>
  <div></div>
</template>

<script>
import ormSearchPhrasesOfCt from '@/cts/core/vl-search-box/ormSearchPhrasesOfCt'

export default {
  data() {
    return {}
  },
  mounted() {
    ormSearchPhrasesOfCt.insert({
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

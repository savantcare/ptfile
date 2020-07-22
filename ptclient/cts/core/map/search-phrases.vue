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
        value: 'map',
        ctAbbr: 'mp',
        ctToShowInCsOfVl: 'core/map/invoke.vue',
        layer: 'view',
      },
    })
  },
}
</script>

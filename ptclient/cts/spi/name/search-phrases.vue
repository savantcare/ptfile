<template>
  <div></div>
</template>

<script>
import ormSearchPhrasesOfCt from '@/cts/core/vl-search-box/orm-search-phrases-of-ct'

export default {
  data() {
    return {}
  },
  mounted() {
    ormSearchPhrasesOfCt.insert({
      data: {
        value: 'name',
        ctAbbr: 'name',
        ctToShowInCsOfVl: 'spi/name/vl/table.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })
  },
}
</script>

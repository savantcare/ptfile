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
        value: 'screening',
        ctAbbr: 'scr',
        ctToShowInCsOfVl: 'spi/scr/vl/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })
    ormSearchPhrasesOfCt.insert({
      data: {
        value: 'add screen',
        ctAbbr: 'arem',
        ctToShowInCL: 'spi/scr/cl/add.vue',
        layer: 'change',
        ctWidth: 'small',
      },
    })
  },
}
</script>

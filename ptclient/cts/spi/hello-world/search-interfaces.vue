<template>
  <div></div>
</template>

<script>
import ormSearchPhrasesOfCt from '@/cts/core/vl-search-box/vuex-orm/searchPhrasesOfCt'

export default {
  data() {
    return {}
  },
  mounted() {
    ormSearchPhrasesOfCt.insert({
      data: {
        value: 'Hello world',
        ctAbbr: 'bp',
        ctToShowInCsOfVl: 'spi/hello-world/vl/table.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })
  },
}
</script>

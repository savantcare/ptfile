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
        value: 'reminders',
        ctAbbr: 'rem',
        ctToShowInCsOfVl: 'spi/rem/vl/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })

    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'add reminder',
        ctAbbr: 'arem',
        ctToShowInCL: 'spi/rem/cl/add.vue',
        layer: 'change',
        ctWidth: 'small',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'change reminder',
        ctAbbr: 'crem',
        ctToShowInCL: 'spi/rem/cl/c.vue',
        layer: 'change',
        ctWidth: 'small',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'multi change reminders',
        ctAbbr: 'mcrem',
        ctToShowInCL: 'spi/rem/cl/mc.vue',
        layer: 'change',
        ctWidth: 'large',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'discontinued reminders',
        ctAbbr: 'drem',
        ctToShowInCL: 'spi/rem/vl/discontinued.vue',
        layer: 'change',
        ctWidth: 'large',
      },
    })
  },
}
</script>

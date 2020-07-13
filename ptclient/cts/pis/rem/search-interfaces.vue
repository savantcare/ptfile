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
        ctToShowInMSVL: 'pis/rem/vl/table.vue', // MSVL -> Multi state view layer
        ctToShowInCSVL: 'pis/rem/vl/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })

    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'add reminder',
        ctAbbr: 'arem',
        ctToShowInCL: 'pis/rem/cl/add.vue',
        layer: 'change',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'change reminder',
        ctAbbr: 'crem',
        ctToShowInCL: 'pis/rem/cl/c.vue',
        layer: 'change',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'multi change reminders',
        ctAbbr: 'mcrem',
        ctToShowInCL: 'pis/rem/cl/mc.vue',
        layer: 'change',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'discontinued reminders',
        ctAbbr: 'drem',
        ctToShowInCL: 'pis/rem/vl/discontinued.vue',
        layer: 'change',
      },
    })
  },
}
</script>

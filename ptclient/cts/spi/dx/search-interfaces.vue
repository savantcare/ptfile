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
        value: 'diagnosis',
        ctAbbr: 'dx',
        ctToShowInMSVL: 'spi/dx/vl/table.vue', // MSVL -> Multi state view layer
        ctToShowInCSVL: 'spi/dx/vl/timeline.vue', // CSVL -> Current state view layer
        layer: 'view',
      },
    })

    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'add diagnosis',
        ctAbbr: 'adddx',
        ctToShowInCL: 'spi/dx/cl/add.vue',
        layer: 'change',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'change dx assessment',
        ctAbbr: 'cdx',
        ctToShowInCL: 'spi/dx/cl/c.vue',
        layer: 'change',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'multi change dx assessment',
        ctAbbr: 'mcdx',
        ctToShowInCL: 'spi/dx/cl/mc.vue',
        layer: 'change',
      },
    })
    ormSearchPhraseUiToCT.insert({
      data: {
        value: 'discontinued diagnoses',
        ctAbbr: 'ddx',
        ctToShowInCL: 'spi/dx/vl/discontinued.vue',
        layer: 'change',
      },
    })
  },
}
</script>

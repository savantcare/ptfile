<template>
  <div></div>
</template>

<script>
import ormSearchUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },
  mounted() {
    // Search interfaces to this component
    ormSearchUiToCT.insert({
      data: {
        value: 'Add diagnosis',
        ctAbbr: 'adddx',
        ctToShowInCL: 'dx/cl/ctAddDx.vue',
        layer: 'change',
      },
    })
    ormSearchUiToCT.insert({
      data: {
        value: 'Diagnosis',
        ctAbbr: 'dx',
        ctToShowInCL: 'dx/dx-vl.vue',
        layer: 'view',
      },
    })
    ormSearchUiToCT.insert({
      data: {
        value: 'Multichange dx assessment',
        ctAbbr: 'mcdxa',
        ctToShowInCL: 'dx/cl/ctMultiChangeDxa.vue',
        layer: 'change',
      },
    })
  },
}
</script>

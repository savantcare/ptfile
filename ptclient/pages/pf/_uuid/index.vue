<template>
  <div>
    <Split style="height: 900px; width: 1400px;" :gutterSize="5">
      <SplitArea :size="75">
        <ctRexL1> </ctRexL1>
        <ctRemL1> </ctRemL1>
        <ctBML1> </ctBML1>
        <ctDXL1> </ctDXL1>
        <ctGL1> </ctGL1>
      </SplitArea>
      <SplitArea :size="25">
        <ctRexL1> </ctRexL1>
        <ctScrL1> </ctScrL1>
        <ctSearchBox></ctSearchBox>
      </SplitArea>
    </Split>
    <!-- tab-dialog is present in patientFile.vue but in hidden state -->
    <layer-2-multi-tab-dialog></layer-2-multi-tab-dialog>
  </div>
</template>

<script>
import Vue from 'vue'
import VueSplit from 'vue-split-panel'
import ctSearchBox from '@/components/l1-search-box'
import ctRexL1 from '@/components/rex/rex-l1'
import ctRemL1 from '@/components/rem/rem-l1'
import ctBML1 from '@/components/bm/bm-l1'
import ctDXL1 from '@/components/dx/dx-l1'
import ctGL1 from '@/components/goal/g-l1'
import ctScrL1 from '@/components/scr/scr-l1.vue'
const Layer2MultiTabDialog = () => import('@/components/l2-tab-manager/')

Vue.use(VueSplit)
export default {
  components: {
    Layer2MultiTabDialog,
    ctSearchBox,
    ctRexL1,
    ctRemL1,
    ctBML1,
    ctDXL1,
    ctGL1,
    ctScrL1,
  },
  mounted() {
    this.$store.commit('mtfSetTabDialogVisibility', false)
  },
}
</script>

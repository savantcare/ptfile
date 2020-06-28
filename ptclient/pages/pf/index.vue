<template>
  <div>
    <Split style="height: 900px; width: 1400px;" :gutterSize="5">
      <SplitArea :size="75">
        <ctRexL1> </ctRexL1>
        <ctRemL1> </ctRemL1>
      </SplitArea>
      <SplitArea :size="25">
        <ctRexL1> </ctRexL1>
        <ctSearchBox></ctSearchBox>
      </SplitArea>
    </Split>
  </div>
</template>

<script>
import Vue from 'vue'
import VueSplit from 'vue-split-panel'
import ctSearchBox from '@/components/search-box'
import ctRexL1 from '@/components/rex/rex-l1'
import ctRemL1 from '@/components/rem/rem-l1'

Vue.use(VueSplit)
export default {
  components: {
    ctSearchBox,
    ctRexL1,
    ctRemL1,
  },
}
</script>

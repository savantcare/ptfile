<template>
  <div>
    <Split style="height: 900px; width: 1400px;" :gutterSize="5">
      <SplitArea :size="75">
        panel left
      </SplitArea>
      <SplitArea :size="25">
        panel right
        <ctSearchBox></ctSearchBox>
      </SplitArea>
    </Split>
  </div>
</template>

<script>
import Vue from 'vue'
import VueSplit from 'vue-split-panel'
import ctSearchBox from '@/components/search-box'

Vue.use(VueSplit)
export default {
  components: {
    ctSearchBox,
  },
}
</script>

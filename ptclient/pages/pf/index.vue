<template>
  <div>
    Jai kali ma
    <Split style="height: 500px;">
      <SplitArea :size="25">
        panel left
      </SplitArea>
      <SplitArea :size="75">
        panel right
      </SplitArea>
    </Split>
  </div>
</template>

<script>
import VueSplit from 'vue-split-panel'
Vue.use(VueSplit)
export default {
    
}
</script>
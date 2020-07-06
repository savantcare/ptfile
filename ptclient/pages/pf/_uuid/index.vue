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
        <el-card
          v-for="(card, loopCount) in cfArCards"
          :key="card.id"
          :label="card.label + '(' + (loopCount + 1) + ')'"
          :name="card.id"
          :closable="card.closable"
        >
          <!-- Using https://vuejs.org/v2/guide/components.html#Dynamic-Components -->
          <keep-alive>
            <component :is="card.ctToShowInsideTab"></component>
          </keep-alive>
        </el-card>
        <ctSearchBox></ctSearchBox>
      </SplitArea>
    </Split>
    <!-- tab-dialog is present in patientFile.vue but in hidden state -->
    <L2TabsInDialog></L2TabsInDialog>
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
const L2TabsInDialog = () =>
  import('@/components/l2-tabs-manager/ctShowAddAndRemoveTabsInDialog')

Vue.use(VueSplit)
export default {
  components: {
    L2TabsInDialog,
    ctSearchBox,
    ctRexL1,
    ctRemL1,
    ctBML1,
    ctDXL1,
    ctGL1,
    ctScrL1,
  },
  data() {
    return {
      a: '1',
    }
  },
  mounted() {
    // when page first loads the L2 tabs are set to not show
    this.$store.commit('mtfSetTabDialogVisibility', false)
  },
  computed: {
    cfArCards: {
      get() {
        return this.$store.state.cardsInL2.arCards
      },
      set(value) {
        this.$store.commit('mtfSetArCards', value)
      },
    },
  },
}
</script>

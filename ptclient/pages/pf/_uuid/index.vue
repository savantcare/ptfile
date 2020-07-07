<template>
  <div>
    <Split style="height: 900px; width: 1400px;" :gutterSize="5">
      <SplitArea :size="75">
        <keep-alive>
          <ctRexL1> </ctRexL1>
        </keep-alive>
        <ctRemL1> </ctRemL1>
        <ctBML1> </ctBML1>
        <ctDXL1> </ctDXL1>
        <ctGL1> </ctGL1>
      </SplitArea>
      <SplitArea :size="25">
        <!-- <keep-alive> before the card creates problem since multiple cards then get inside keep alive 
          
          
          <keep-alive> is designed for the case where it has one direct child component that is being toggled. 
            It does not work if you have v-for inside it. 
            When there are multiple conditional children, as above, <keep-alive> requires that only 
              one child is rendered at a time.
          Ref: https://vuejs.org/v2/api/#keep-alive

         Similar working code:
         https://codesandbox.io/s/github/vuejs/vuejs.org/tree/master/src/v2/examples/vue-20-keep-alive-with-dynamic-components?file=/index.html:296-321
          -->
        <el-card v-for="card in cfArCards" v-bind:key="card.id">
          <!-- Using https://vuejs.org/v2/guide/components.html#Dynamic-Components -->
          <!-- Sorrounding component with keepAlive does not help. Since previous rendering of rex
          is not hidden. When user types rex 2 times, rex is being displayed 2 times
          -->
          <component v-bind:is="card.ctToShowInsideTab"></component>
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
import ctSearchBox from '@/components/vl-search-box'
import ctRexL1 from '@/components/rex/rex-vl'
import ctRemL1 from '@/components/rem/rem-l1'
import ctBML1 from '@/components/bm/bm-l1'
import ctDXL1 from '@/components/dx/dx-l1'
import ctGL1 from '@/components/goal/g-l1'
import ctScrL1 from '@/components/scr/scr-l1.vue'
const L2TabsInDialog = () =>
  import('@/components/cl-tabs-manager/ctShowAddAndRemoveTabsInDialog')

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
  methods: {
    log(message) {
      console.log(message)
    },
  },
  data() {
    return {}
  },
  mounted() {
    // when page first loads the L2 tabs are set to not show
    this.$store.commit('mtfSetTabDialogVisibility', false)
  },
  computed: {
    cfArCards: {
      get() {
        return this.$store.state.cardsInL1CSVA.arCards
      },
      set(value) {
        this.$store.commit('mtfSetArCards', value)
      },
    },
  },
}
</script>

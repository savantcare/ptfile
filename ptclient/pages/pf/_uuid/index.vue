<template>
  <div>
    <Split style="height: 900px; width: 1400px;" :gutterSize="5">
      <SplitArea :size="75">
        <ctRexVl> </ctRexVl>
        <ctRemVL> </ctRemVL>
        <ctBMVl> </ctBMVl>
        <ctDXVl> </ctDXVl>
        <ctGVl> </ctGVl>
        <ctScrVl> </ctScrVl>
      </SplitArea>
      <SplitArea :size="25" id="csvl">
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
        <ctVLSearchBox></ctVLSearchBox>
      </SplitArea>
    </Split>
    <!-- tab-dialog is present in patientFile.vue but in hidden state -->
    <CLTabsInDialog></CLTabsInDialog>
  </div>
</template>

<script>
import Vue from 'vue'
import VueSplit from 'vue-split-panel'
import ctVLSearchBox from '@/components/vl-search-box'
import ctRexVl from '@/components/rex/rex-vl'
import ctRemVL from '@/components/rem/rem-vl'
import ctBMVl from '@/components/bm/bm-vl'
import ctDXVl from '@/components/dx/dx-vl'
import ctGVl from '@/components/goal/g-vl'
import ctScrVl from '@/components/scr/scr-vl.vue'
const CLTabsInDialog = () =>
  import('@/components/cl-tabs-manager/ctShowAddAndRemoveTabsInDialog')

// say the user enter the rex command 10 times. I need to scroll to the bottom of the cards
// so search box is given a ID and then #vl-search-box is used to scroll down.
const VueScrollTo = require('vue-scrollto') // Ref: https://github.com/rigor789/vue-scrollto#as-a-vue-directive

Vue.use(VueSplit)
Vue.use(VueScrollTo)

export default {
  components: {
    CLTabsInDialog,
    ctVLSearchBox,
    ctRexVl,
    ctRemVL,
    ctBMVl,
    ctDXVl,
    ctGVl,
    ctScrVl,
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
        return this.$store.state.cardsInCSOfVL.arCards
      },
      set(value) {
        this.$store.commit('mtfSetArCards', value)
      },
    },
  },
}
</script>

<template>
  <!--  Prop explanation:
          v-on:mouseleave="mouseleave"
          Goal: Make it very easy to get the feed
          When the user takes the mouse to the left edge of the browser then bring the feed up
          Why not put it inside <SplitArea> the event does not get fired.
          Why not put a div inside and then put mouseleave event over there?
            when go from msvl to csvl the event gets fired.
        Ref: https://codepen.io/intotheprogram/pen/ZjxZdg 
    -->
  <div v-on:mouseleave="mouseleave">
    <!-- Prop explanation:
        :gutterSize="0"
          This is thickness of the line between left and right panels. This line is used to adjust size of left and right
      -->
    <Split style="height: 900px; width: 1400px;" :gutterSize="4">
      <SplitArea :size="75">
        <!--  Q) Who determines the set of cards to show here and also the sequence?
                The doctor team leader decides it.
                When they want a change we come into the source code and make the change.
              Q) Why not make this dynamic and have this come from vuex-orm or Maria DB?
                This will change on average once in 1 year. Hence there is no advantage of doing this.
          -->
        <ctRexVl> </ctRexVl><br />
        <ctRemVL> </ctRemVL><br />
        <ctBMVl> </ctBMVl><br />
        <ctDXVl> </ctDXVl><br />
        <ctGVl> </ctGVl><br />
        <ctScrVl> </ctScrVl><br />
      </SplitArea>
      <SplitArea :size="25" id="csvl">
        <!-- Why not use <keep-alive> before el-card ?
            <keep-alive> before the card creates problem since multiple cards then get inside keep alive   
            <keep-alive> is designed for the case where it has one direct child component that is being toggled. 
            It does not work if you have v-for inside it. 
            When there are multiple conditional children, as above, <keep-alive> requires that only one child is rendered at a time.
            Ref: https://vuejs.org/v2/api/#keep-alive

            Similar working code:
            https://codesandbox.io/s/github/vuejs/vuejs.org/tree/master/src/v2/examples/vue-20-keep-alive-with-dynamic-components?file=/index.html:296-321
          -->
        <el-card v-for="card in cfArCards" v-bind:key="card.id">
          <!-- Using https://vuejs.org/v2/guide/components.html#Dynamic-Components -->
          <!--  Why not use keep-alive before <component v-bind:is="card.ctToShow"></component> 
                Sorrounding component with keepAlive does not help. Since previous rendering of rex
                is not hidden. When user types rex 2 times, rex is being displayed 2 times
            -->
          <component v-bind:is="card.ctToShow"></component>
        </el-card>
        <ctVLSearchBox></ctVLSearchBox>
        <!-- ctVLSearchBox as per glossary is Component View layer search box 
             This is at bottom of the for loop since we want the search box to come at the bottom
        -->
      </SplitArea>
    </Split>
    <!-- tab-dialog is present in patientFile.vue but in hidden state -->
    <ctTabsInDialogInCL></ctTabsInDialogInCL>
    <ctFeedDrawer></ctFeedDrawer>
    <ctMapDrawer></ctMapDrawer>
  </div>
</template>

<script>
import Vue from 'vue'
import VueSplit from 'vue-split-panel'
import ctVLSearchBox from '@/cts/vl-search-box'
import ctRexVl from '@/cts/rec/vl/table'
import ctRemVL from '@/cts/rem/vl/table'
import ctBMVl from '@/cts/bm/bm-vl'
import ctDXVl from '@/cts/dx/dx-vl'
import ctGVl from '@/cts/goal/g-vl'
import ctScrVl from '@/cts/scr/scr-vl.vue'
import ctTabsInDialogInCL from '@/cts/cl-tabs-manager/ctShowAddAndRemoveTabsInDialog'
import ctFeedDrawer from '@/cts/feed/drawer.vue'
import ctMapDrawer from '@/cts/map/drawer.vue'

// The name above expands to Component tabs in dialog in change layer

// say the user enter the rex command 10 times. I need to scroll to the bottom of the cards
// so search box is given a ID and then #vl-search-box is used to scroll down.
const VueScrollTo = require('vue-scrollto') // Ref: https://github.com/rigor789/vue-scrollto#as-a-vue-directive

Vue.use(VueSplit)
Vue.use(VueScrollTo)

export default {
  components: {
    ctFeedDrawer,
    ctMapDrawer,
    ctTabsInDialogInCL,
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
    mouseleave(event) {
      // console.log('mouse leave', event)

      // How to identify which side the mouse left https://stackoverflow.com/a/48281888
      if (event.clientX <= 0) {
        // This is when the mouse leave from the left
        if (event.clientY <= 200) {
          // This is the top corner
          this.$store.commit('mtfSetFeedDrawerVisibility', true)
        }
      }
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
        return this.$store.state.vstObjCardsInCSOfVL.arCards
      },
      set(value) {
        this.$store.commit('mtfSetArCards', value)
      },
    },
  },
}
</script>

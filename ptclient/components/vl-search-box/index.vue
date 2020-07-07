<template>
  <div id="vl-search-box">
    <el-autocomplete
      v-model="searchKeyword"
      class="inline-input"
      :fetch-suggestions="mfQuerySearchTerms"
      placeholder="Please Input"
      style="width: 100%;"
      @select="mfHandleSuggestionSelectedByUser"
    ></el-autocomplete>
  </div>
</template>

<script>
import ormSearchUiToCT from '../../models/ormSearchUiToCT'
const VueScrollTo = require('vue-scrollto')
export default {
  data() {
    return { searchKeyword: '' }
  },
  mounted() {
    // Search interfaces to this component
    ormSearchUiToCT.insert({
      data: {
        value: 'Clear',
        ctAbbr: 'clr',
        ctToShowInsideTab: 'clear/index.vue',
        layer: 'view',
      },
    })
  },
  methods: {
    mfQuerySearchTerms(pQueryString, pCallBack) {
      // pQueryString empty means user did not enter anything
      // to show values in dropdown returning all results
      if (!pQueryString) {
        const resultSet = ormSearchUiToCT.all()
        pCallBack(resultSet)
      } else {
        const resultSet = ormSearchUiToCT
          .query()
          .search(pQueryString.trim())
          .get() // trim needs for "goal " to match "goal"
        console.log('search result from orm model', pQueryString, resultSet)
        pCallBack(resultSet)
      }
    },
    mfHandleSuggestionSelectedByUser(pSelectedSuggestion) {
      console.log('Selected suggestion is', pSelectedSuggestion)
      const objCtToAdd = {
        label: pSelectedSuggestion.value,
        // Here I have to use a variable otherwise webpack gives error. https://stackoverflow.com/questions/57349167/vue-js-dynamic-image-src-with-webpack-require-not-working
        ctToShowInsideTab: require('@/components/' +
          pSelectedSuggestion.ctToShowInsideTab).default,
        id: pSelectedSuggestion.id,
        closable: true,
      }
      if (pSelectedSuggestion.layer === 'view') {
        this.$store.commit('mtfShowCardInCSVL', objCtToAdd)
      } else if (pSelectedSuggestion.layer === 'change') {
        this.$store.commit('mtfShowNewFirstTabInL2', objCtToAdd)
      }
      this.searchKeyword = '' // Once search work is done then the searchKeyword needs to be empty
      VueScrollTo.scrollTo('vl-search-box')
    },
  },
}
</script>

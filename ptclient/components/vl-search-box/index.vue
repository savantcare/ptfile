<template>
  <div id="vl-search-box">
    <remSUI></remSUI>
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
import ormSearchUiToCT from '@/components/vl-search-box/vuex-orm/searchUiToCT'
import remSUI from '@/components/rem/searchInterface'
export default {
  data() {
    return { searchKeyword: '' }
  },
  components: { remSUI },
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

      let vsCtToShow = ''

      if (pSelectedSuggestion.layer === 'view') {
        vsCtToShow = pSelectedSuggestion.ctToShowInsideCSVL
      } else {
        vsCtToShow = pSelectedSuggestion.ctToShowInsideTab
      }

      const objCtToAdd = {
        label: pSelectedSuggestion.value,
        // Here I have to use a variable otherwise webpack gives error. https://stackoverflow.com/questions/57349167/vue-js-dynamic-image-src-with-webpack-require-not-working
        ctToShow: require('@/components/' + vsCtToShow).default,
        id: pSelectedSuggestion.id,
        closable: true,
      }
      if (pSelectedSuggestion.layer === 'view') {
        this.$store.commit('mtfShowCardInCSVL', objCtToAdd)
      } else if (pSelectedSuggestion.layer === 'change') {
        this.$store.commit('mtfShowNewFirstTabInCl', objCtToAdd)
      }
      this.searchKeyword = '' // Once search work is done then the input area needs to be empty
      // scrolling to top of the search input box
      const options = {
        container: '#csvl',
        easing: 'ease-in',
        offset: 6000, // if offset is negative I do not come on top of search box. Not sure what this means
        force: true,
        cancelable: true,
      }
      this.$scrollTo('#vl-search-box', 500, options)
    },
  },
}
</script>

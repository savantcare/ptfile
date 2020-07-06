<template>
  <div id="search_component">
    <el-autocomplete
      v-model="keyword"
      class="inline-input"
      :fetch-suggestions="mfQuerySearchTerms"
      placeholder="Please Input"
      style="width: 100%;"
      @select="mfHandleSuggestionSelectedByUser"
    ></el-autocomplete>
  </div>
</template>

<script>
import ormSearch from '../../models/ormSearchInL2'
export default {
  data() {
    return { keyword: '' }
  },

  methods: {
    mfQuerySearchTerms(pQueryString, pCallBack) {
      const resultSet = ormSearch.query().search(pQueryString.trim()).get() // trim needs for "goal " to match "goal"
      console.log('search result from orm model', pQueryString, resultSet)
      pCallBack(resultSet)
    },
    mfHandleSuggestionSelectedByUser(pSelectedSuggestion) {
      console.log('Selected suggestion is', pSelectedSuggestion)
      const objAddTab = {
        label: pSelectedSuggestion.value,
        // Here I have to use a variable otherwise webpack gives error. https://stackoverflow.com/questions/57349167/vue-js-dynamic-image-src-with-webpack-require-not-working
        ctToShowInsideTab: require('@/components/' +
          pSelectedSuggestion.ctToShowInsideTab).default,
        id: pSelectedSuggestion.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInL2', objAddTab)
    },
  },
}
</script>

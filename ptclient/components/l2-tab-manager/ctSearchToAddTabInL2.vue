<!--
Features needed in search 
1. Highlight search term in results 
2. Search for "rex add" when the search list has "add rex" 
3. Deal with wrong spellings
-->

<template>
  <div style="text-align: center;">
    <el-autocomplete
      class="inline-input"
      v-model="keyword"
      :fetch-suggestions="mfQuerySearchTerms"
      :trigger-on-focus="true"
      :highlight-first-item="true"
      placeholder="Please Input"
      prefix-icon="el-icon-search"
      @select="mfHandleSuggestionSelectedByUser"
      clearable
    ></el-autocomplete>
  </div>
</template>

<script>
import ormSearch from '../../models/CtSearchInL2'

export default {
  data() {
    return { keyword: '' }
  },
  mounted() {},
  methods: {
    mfQuerySearchTerms(pQueryString, pCallBack) {
      const resultSet = ormSearch.query().search(pQueryString).get()
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
      this.$store.commit('mtfAdditionalTabAddOrActivate', objAddTab)
    },
  },
}
</script>

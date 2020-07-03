<template>
  <div style="text-align: center;">
    <el-autocomplete
      class="inline-input"
      :fetch-suggestions="mfQuerySearchTerms"
      :trigger-on-focus="true"
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
    return {}
  },
  mounted() {},
  methods: {
    mfQuerySearchTerms(pQueryString, pCallBack) {
      const resultSet = ormSearch.query().search(pQueryString).get()
      console.log('search result from orm model', resultSet)
      pCallBack(resultSet)
    },
    mfHandleSuggestionSelectedByUser(pSelectedSuggestion) {
      console.log('Selected suggestion is', pSelectedSuggestion)
      const objAddTab = {
        nameToShowUser: pSelectedSuggestion.nameToShowUser,
        ctToShowInsideTab: require('../goal/' +
          pSelectedSuggestion.ctToShowInsideTab).default,
        name: 'tab-add-goal',
      }
      this.$store.commit('mtfAddAdditionalTab', objAddTab)
    },
  },
}
</script>

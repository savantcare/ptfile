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
        nameToShowUser: pSelectedSuggestion.value,
        // Here I have to use a variable otherwise webpack gives error. https://stackoverflow.com/questions/57349167/vue-js-dynamic-image-src-with-webpack-require-not-working
        // I have given ../goal/ since if I give @components/ it gives error since other components have non compilable code
        ctToShowInsideTab: require('../goal/' +
          pSelectedSuggestion.ctToShowInsideTab).default,
        id: pSelectedSuggestion.id,
      }
      this.$store.commit('mtfAddAdditionalTab', objAddTab)
    },
  },
}
</script>

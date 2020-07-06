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
import ormSearch from '../../models/ormSearch'
export default {
  data() {
    return { keyword: '' }
  },
  mounted() {
    // Search interfaces to this component
    ormSearch.insert({
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
      const resultSet = ormSearch.query().search(pQueryString.trim()).get() // trim needs for "goal " to match "goal"
      console.log('search result from orm model', pQueryString, resultSet)
      pCallBack(resultSet)
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
        this.$store.commit('mtfShowNewFirstCardInL2', objCtToAdd)
      } else if (pSelectedSuggestion.layer === 'change') {
        this.$store.commit('mtfShowNewFirstTabInL2', objCtToAdd)
      }
      this.keyword = ''
    },
  },
}
</script>

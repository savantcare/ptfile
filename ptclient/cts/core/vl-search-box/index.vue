<template>
  <div id="vl-search-box">
    <remSUI></remSUI>
    <feedSUI></feedSUI>
    <mapSUI></mapSUI>
    <clearSUI></clearSUI>
    <el-autocomplete
      v-model="searchKeyword"
      class="inline-input"
      :fetch-suggestions="mfQuerySearchTerms"
      :placeholder="placeholder"
      style="width: 100%;"
      @select="mfHandleSuggestionSelectedByUser"
    ></el-autocomplete>
  </div>
</template>

<script>
import ormSearchPhraseUiToCT from '@/cts/core/vl-search-box/vuex-orm/searchUIToCT'
// Goal: Get the search terms from each component
import remSUI from '@/cts/spi/rem/search-interfaces' // TODO: this is used by search box both in vl and cl. So this should not be in vl
import feedSUI from '@/cts/core/feed/search-interfaces'
import mapSUI from '@/cts/core/map/search-interfaces'
import clearSUI from '@/cts/core/clear/search-interfaces'
export default {
  components: { remSUI, feedSUI, clearSUI, mapSUI },
  data() {
    return { searchKeyword: '' }
  },

  computed: {
    placeholder() {
      let arResultsFromORM = {}
      arResultsFromORM = ormSearchPhraseUiToCT.query().orderBy('usageCountKeptInLS', 'desc').get()
      const objRowFromORM = arResultsFromORM[0]
      if (objRowFromORM) {
        console.log(objRowFromORM)
        return 'e.g. ' + objRowFromORM.value
      } else {
        return 'e.g. screening'
      }
    },
  },
  mounted() {},
  methods: {
    mfQuerySearchTerms(pQueryString, pCallBack) {
      // pQueryString empty means user did not enter anything
      // to show values in dropdown returning all results
      if (!pQueryString) {
        const arResultsFromORM = ormSearchPhraseUiToCT
          .query()
          .orderBy('usageCountKeptInLS', 'desc')
          .get()
        console.log('No user input ', pQueryString, arResultsFromORM)
        pCallBack(arResultsFromORM)
      } else {
        const arResultsFromORM = ormSearchPhraseUiToCT
          .query()
          .search(pQueryString.trim(), {
            // Search comes from vuex-orm plugn https://github.com/vuex-orm/plugin-search#during-query-chain
            keys: ['value'], // If key is not specified it will search all fields https://github.com/vuex-orm/plugin-search#during-query-chain
          })
          .orderBy('usageCountKeptInLS', 'desc')
          .get() // trim is needed for "goal " to match "goal"
        console.log('search result from orm model', pQueryString, arResultsFromORM)
        pCallBack(arResultsFromORM)
      }
    },

    mfHandleSuggestionSelectedByUser(pSelectedSuggestion) {
      console.log('Selected suggestion is', pSelectedSuggestion)

      // Goal: Add the card in CSVL (Current state in View layer) or tab in CL (Change layer)

      let vsCtToShow = ''

      if (pSelectedSuggestion.layer === 'view') {
        vsCtToShow = pSelectedSuggestion.ctToShowInCSVL
      } else {
        vsCtToShow = pSelectedSuggestion.ctToShowInCL
      }

      const objCtToAdd = {
        label: pSelectedSuggestion.value,
        // Here I have to use a variable otherwise webpack gives error. https://stackoverflow.com/questions/57349167/vue-js-dynamic-image-src-with-webpack-require-not-working
        ctToShow: require('@/cts/' + vsCtToShow).default,
        id: pSelectedSuggestion.id,
        closable: true,
      }
      if (pSelectedSuggestion.layer === 'view') {
        this.$store.commit('mtfShowCardInCSVL', objCtToAdd)
      } else if (pSelectedSuggestion.layer === 'change') {
        this.$store.commit('mtfShowNewFirstTabInCl', objCtToAdd)
      }

      /* Goal: Increase the usageCount of the search term so I can order them better
        Update query ref: https://vuex-orm.org/guide/data/inserting-and-updating.html#updates */
      ormSearchPhraseUiToCT.update({
        where: pSelectedSuggestion.id,
        data: {
          usageCountKeptInLS: pSelectedSuggestion.usageCountKeptInLS + 1,
        },
      })

      /* Goal: Once search work is done then the input area needs to be empty */
      this.searchKeyword = ''

      /* Goal: scrolling to top of the search input box */
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

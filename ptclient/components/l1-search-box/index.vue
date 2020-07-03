<template>
  <div id="search_component">
    <el-autocomplete
      v-model="state1"
      class="inline-input"
      :fetch-suggestions="querySearch"
      placeholder="Please Input"
      style="width: 100%;"
      @select="handleSelect"
    ></el-autocomplete>
  </div>
</template>

<script>
export default {
  data() {
    return {
      links: [],
      state1: '',
    }
  },
  mounted() {
    this.links = this.loadAll()
  },
  methods: {
    querySearch(queryString, cb) {
      const links = this.links
      const results = queryString
        ? links.filter(this.createFilter(queryString))
        : links
      // call callback function to return suggestions
      cb(results)
    },
    createFilter(queryString) {
      return (link) => {
        return link.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0
      }
    },
    loadAll() {
      return [
        {
          value: 'recommendations (rex) ',
          link: 'https://github.com/vuejs/vue',
        },
        {
          value: 'reminder (rem)',
          link: 'https://github.com/vuejs/vue',
        },
        {
          value: 'body measurement (bm)',
          link: 'https://github.com/vuejs/vue',
        },
      ]
    },
    handleSelect(item) {
      console.log(item)
    },
  },
}
</script>

<style lang="css">
#search_component {
  position: absolute;
  bottom: 0;
  z-index: 100;
}
</style>

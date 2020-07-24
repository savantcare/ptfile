<template>
  <div>
    <!-- For paddingLeft info ref: /cts/spi/rem/vl/timeline.vue:3 -->
    <el-card class="box-card" :body-style="{ paddingLeft: '3px' }">
      <div slot="header" class="clearfix">
        <span>Screening</span>
        <el-button-group style="float: right;">
          <el-button style="padding: 3px;" type="success" plain @click="mfOpenACtInCl">A</el-button>
          <el-button style="padding: 3px;" type="primary" plain @click="mfOpenGCtInCl">G</el-button>
        </el-button-group>
      </div>
      <!-- For padding-inline-start info ref: /cts/spi/rem/vl/timeline.vue:24 -->
      <el-timeline style="padding-inline-start: 20px;">
        <el-timeline-item
          v-for="row in cfArOfScrForDisplayInTable"
          :key="row.$id"
          :timestamp="row.createdAt"
          :type="row.type"
        >
          {{ row.scientificName }}
          <el-button-group style="float: right;">
            <el-button type="primary" size="mini" style="padding: 3px;" plain>T</el-button>
            <el-button type="warning" size="mini" style="padding: 3px;" plain>G</el-button>
          </el-button-group>
        </el-timeline-item>
      </el-timeline>
    </el-card>
  </div>
</template>

<script>
import ormScr from '@/cts/spi/scr/db/vuex-orm/scr.js'

export default {
  data() {
    return {}
  },
  computed: {
    cfArOfScrForDisplayInTable() {
      const arFromORM = ormScr.getValidUniqueUuidNotEmptyRows('scientificName')
      // For arFromORM info ref: /cts/spi/rem/vl/table.vue:125

      const arScrForDisplay = []
      let obj = {}
      if (arFromORM.length) {
        let date = ''
        for (let i = 0; i < arFromORM.length; i++) {
          obj = {}
          obj.scientificName = arFromORM[i].scientificName
          // For date format ref: /cts/spi/Scr/vl/timeline.vue:53
          date = new Date(arFromORM[i].ROW_START)
          obj.createdAt = date.toLocaleString('default', { month: 'long' }) + '-' + date.getDate()
          obj.rowStateInThisSession = arFromORM[i].rowStateInThisSession
          obj.uuid = arFromORM[i].uuid
          obj.$id = arFromORM[i].$id
          obj.id = arFromORM[i].id
          arScrForDisplay.push(obj)
        }
      }
      return arScrForDisplay
    },
  },
  mounted() {},
  methods: {
    mfOpenACtInCl() {
      console.log('Clicked header A Icon')
      this.$store.commit('mtfShowNewFirstTabInClFromSearchPhrase', {
        searchTerm: 'add screening',
      })
    },
    mfOpenGCtInCl() {
      console.log('Clicked header T Icon')
    },
  },
}
</script>

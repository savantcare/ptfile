<template>
  <div>
    <!-- 
      By default this is 20px. We want to make the timeline come close to the edge to save space
    hence made it 3px
    This controls the space between edge of the card and the line that shows the dots
    -->
    <el-card class="box-card" :body-style="{ paddingLeft: '3px' }">
      <div slot="header" class="clearfix">
        <span>Reminders</span>
        <el-button-group style="float: right;">
          <el-button
            @click="mfOpenADialog"
            style="padding: 3px;"
            type="success"
            plain
            >A</el-button
          >
          <el-button
            @click="mfOpenMDialog"
            style="padding: 3px;"
            type="primary"
            plain
            >M</el-button
          >
          <el-button style="padding: 3px;" type="warning" plain>D</el-button>
          <el-button
            @click="mfOpenXDialog"
            style="padding: 3px;"
            type="info"
            plain
            >X</el-button
          >
        </el-button-group>
      </div>
      <!-- This is the space between edge of the card and the line that shows the dots
      By default this is 40px -->
      <el-timeline style="padding-inline-start: 20px;">
        <el-timeline-item
          v-for="row in dataTable"
          :key="row.createdAt"
          :timestamp="row.createdAt"
          :type="row.type"
        >
          {{ row.remDescription }}
          <el-button-group style="float: right;">
            <el-button type="primary" size="mini" style="padding: 3px;" plain
              >C</el-button
            >
            <el-button type="warning" size="mini" style="padding: 3px;" plain
              >D</el-button
            >
          </el-button-group>
        </el-timeline-item>
      </el-timeline>
    </el-card>
  </div>
</template>

<script>
import ormSearchPhraseUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'
import ormRem from '@/cts/rem/vuex-orm/model.js'

export default {
  data() {
    return {
      // dataTable: [],
    }
  },
  computed: {
    dataTable() {
      const dataTable = []
      const resultSet = ormRem.query().get()
      if (resultSet.length) {
        let obj = []
        let date = ''
        console.log('unsaved data found', resultSet, resultSet[0].uuid)
        for (let i = 0; i < resultSet.length; i++) {
          obj = {}
          obj.remDescription = resultSet[i].remDescription
          /*
          To get the number of the month:
          obj.createdAt = date.getMonth() + 1 + "-" + date.getDate()

          To get the name of the month:
          Ref: https://stackoverflow.com/questions/1643320/get-month-name-from-date
          */
          date = new Date(resultSet[i].ROW_START)
          obj.createdAt =
            date.toLocaleString('default', { month: 'long' }) +
            '-' +
            date.getDate()
          if (resultSet[i].$isDirty) {
            obj.type = 'warning'
          } else {
            obj.type = ''
          }

          dataTable.push(obj)
        }
      }
      console.log(dataTable)
      return dataTable
    },
  },
  mounted() {},
  methods: {
    mfOpenADialog() {
      console.log('show add dialog')
      const resultSet = ormSearchPhraseUiToCT
        .query()
        .search('add reminder')
        .get()
      const resultData = resultSet[0]
      console.log(resultData)
      const tab = {
        label: resultData.value,
        ctToShow: require('@/cts/' + resultData.ctToShowInCL).default,
        ctAbbr: resultData.ctAbbr,
        id: resultData.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
    mfOpenMDialog() {
      console.log('show add dialog')
      const resultSet = ormSearchPhraseUiToCT
        .query()
        .search('multi change reminder')
        .get()
      const resultData = resultSet[0]
      console.log(resultData)
      const tab = {
        label: resultData.value,
        ctToShow: require('@/cts/' + resultData.ctToShowInCL).default,
        ctAbbr: resultData.ctAbbr,
        id: resultData.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
    mfOpenXDialog() {
      console.log('show add dialog')
      const resultSet = ormSearchPhraseUiToCT
        .query()
        .search('discontinued reminders')
        .get()
      const resultData = resultSet[0]
      console.log(resultData)
      const tab = {
        label: resultData.value,
        ctToShow: require('@/cts/' + resultData.ctToShowInCL).default,
        ctAbbr: resultData.ctAbbr,
        id: resultData.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
  },
}
</script>

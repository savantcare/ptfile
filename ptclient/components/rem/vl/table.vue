<template>
  <div>
    <dbInteraction></dbInteraction>
    <el-card class="box-card">
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
          <el-button style="padding: 3px;" type="info" plain>X</el-button>
        </el-button-group>
      </div>
      <el-table
        :data="dataTable"
        :showHeader="false"
        size="mini"
        style="width: 100%;"
        stripe="true"
      >
        <el-table-column type="expand">
          <template slot-scope="props">
            <p>Created: {{ props.row.createdAt }}</p>
          </template>
        </el-table-column>

        <el-table-column prop="remDescription" label="Description">
        </el-table-column>
        <!-- Why is width = "60" for the action column
        Setting this makes the middle column of desc flexible.
        After this is set if desc has 200 words they will use the maximum available space.
          -->
        <el-table-column label="Actions" width="60">
          <template>
            <el-button-group>
              <el-button type="primary" size="mini" style="padding: 3px;" plain
                >C</el-button
              >
              <el-button type="warning" size="mini" style="padding: 3px;" plain
                >D</el-button
              >
            </el-button-group>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import dbInteraction from '../dbInteraction'
import ormSearchUiToCT from '@/components/vl-search-box/vuex-orm/searchUIToCT'
import ormRem from '@/components/rem/vuex-orm/model.js'

export default {
  components: { dbInteraction },
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
          // For date format ref: /components/rem/vl/timeline.vue:53
          date = new Date(resultSet[i].ROW_START)
          obj.createdAt =
            date.toLocaleString('default', { month: 'long' }) +
            '-' +
            date.getDate()
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
      const resultSet = ormSearchUiToCT.query().search('Add Reminder').get()
      const resultData = resultSet[0]
      console.log(resultData)
      const tab = {
        label: resultData.value,
        ctToShow: require('@/components/' + resultData.ctToShowInsideTab)
          .default,
        ctAbbr: resultData.ctAbbr,
        id: resultData.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
    mfOpenMDialog() {
      console.log('show add dialog')
      const resultSet = ormSearchUiToCT
        .query()
        .search('Multi change Reminder')
        .get()
      const resultData = resultSet[0]
      console.log(resultData)
      const tab = {
        label: resultData.value,
        ctToShow: require('@/components/' + resultData.ctToShowInsideTab)
          .default,
        ctAbbr: resultData.ctAbbr,
        id: resultData.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
  },
}
</script>

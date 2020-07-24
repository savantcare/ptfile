<!-- When  i went from 80 to 100 the line count went rom 276 to 230 -->
<template>
  <div>
    <dbInteraction></dbInteraction>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Screening</span>
        <el-button-group style="float: right;">
          <el-button style="padding: 3px;" type="success" plain @click="mfOpenACtInCl">A</el-button>
          <el-button style="padding: 3px;" type="primary" plain @click="mfOpenGCtInCl">G</el-button>
        </el-button-group>
      </div>
      <el-table
        :data="cfArOfScrForDisplayInTable"
        :show-header="false"
        size="mini"
        style="width: 100%;"
        :stripe="true"
        :row-class-name="mfGetCssClassName"
        @selection-change="mfHandleSelectionForDiscontinue"
      >
        <el-table-column type="selection" width="42"> </el-table-column>
        <el-table-column type="expand">
          <template slot-scope="props">
            <p>Created: {{ props.row.createdAt }}</p>
            <p>Row start: {{ props.row.ROW_START }}</p>
            <p>Row end: {{ props.row.ROW_END }}</p>
            <p>uuid: {{ props.row.uuid }}</p>
            <p>id: {{ props.row.id }}</p>
          </template>
        </el-table-column>

        <el-table-column prop="scientificName" label="scientificName"> </el-table-column>

        <!-- For width = "60" info ref: /cts/spi/rem/vl/table.vue:49 -->
        <el-table-column label="Actions" width="60">
          <template slot-scope="props">
            <!-- For rowStateInThisSession info ref: /cts/spi/rem/vl/table.vue:55 -->
            <el-button-group
              v-if="!daRowStatesNotHavingCD.includes(props.row.rowStateInThisSession)"
            >
              <el-button
                type="primary"
                size="mini"
                style="padding: 3px;"
                plain
                @click="mfOpenTCtInCl(props.row.$id)"
                >T</el-button
              >
              <el-button
                type="warning"
                size="mini"
                style="padding: 3px;"
                plain
                @click="mfOpenGPrompt(props.row.$id)"
                >G</el-button
              >
            </el-button-group>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        :hide-on-single-page="true"
        background
        layout="pager"
        :total="cfLengthOfDataArray"
        @current-change="mfTablePageChanged"
      >
      </el-pagination>
    </el-card>
  </div>
</template>

<script>
import dbInteraction from '../db-interaction'
import ormScr from '@/cts/spi/scr/db/vuex-orm/scr.js'

export default {
  components: { dbInteraction },
  data() {
    return {
      tablePageNumber: 1,
      daRowStatesNotHavingCD: [2, 24, 2456, 2457, 24578], //  info ref: /cts/spi/rem/vl/table.vue:110
      daSelectedScrForDiscontinue: [],
    }
  },
  computed: {
    cfLengthOfDataArray() {
      const arFromORM = ormScr.getValidUniqueUuidRows()
      return arFromORM.length
    },

    cfArOfScrForDisplayInTable() {
      console.log(
        'cfArOfScrForDisplayInTable called. Whenever ormScr will change this will get called. Even when there are 100 rows in the table when ormScr changes this gets called once'
      )
      const arFromORM = ormScr.getValidUniqueUuidNotEmptyRows('scientificName')
      // For arFromORM info ref: /cts/spi/rem/vl/table.vue:125

      console.log(arFromORM)
      const arScrsForDisplay = []
      let obj = {}
      if (arFromORM.length) {
        let date = ''
        const startDataRowInidex = (this.tablePageNumber - 1) * 10
        const endDataRowIndex = startDataRowInidex + 10
        for (let i = startDataRowInidex; i < arFromORM.length && i < endDataRowIndex; i++) {
          obj = {}
          obj.scientificName = arFromORM[i].scientificName
          date = new Date(arFromORM[i].ROW_START)
          obj.createdAt = date.toLocaleString('default', { month: 'long' }) + '-' + date.getDate()
          obj.rowStateInThisSession = arFromORM[i].rowStateInThisSession
          obj.uuid = arFromORM[i].uuid
          obj.$id = arFromORM[i].$id
          obj.id = arFromORM[i].id
          arScrsForDisplay.push(obj)
        }
      }
      return arScrsForDisplay
    },
  },
  mounted() {},
  methods: {
    mfTablePageChanged(pNewPageNumber) {
      console.log('Page changed', pNewPageNumber)
      this.tablePageNumber = pNewPageNumber
    },
    mfOpenACtInCl() {
      console.log('Clicked header A Icon')
      this.$store.commit('mtfShowNewFirstTabInClFromSearchPhrase', {
        searchTerm: 'add screening',
      })
    },
    mfOpenGCtInCl() {
      console.log('Clicked header G Icon')
    },
    mfOpenTCtInCl(pORMDataRowID) {
      console.log('clicked  row T icon ', pORMDataRowID)
    },
    mfOpenGPrompt(pORMDataRowID) {
      console.log('clicked  row G icon ', pORMDataRowID)
    },
    mfHandleSelectionForDiscontinue(val) {
      this.daSelectedScrForDiscontinue = val
    },
    mfGetCssClassName(pRow, pIndex) {
      const strOfNumber = pRow.row.rowStateInThisSession.toString()
      const lastCharecter = strOfNumber.slice(-1)
      console.log('pRow', pRow, 'pIndex', pIndex, 'Last charecter', lastCharecter)
      if (lastCharecter === '4' || lastCharecter === '6') {
        return 'unsaved-data'
      } else {
        return ''
      }
    },
  },
}
</script>

<style>
tr.el-table__row.unsaved-data {
  background: #fde2b9;
}
.el-table--striped .el-table__body tr.el-table__row--striped.unsaved-data td {
  background: #f9d399;
}
</style>

<!-- When  i went from 80 to 100 the line count went rom 276 to 230 -->
<template>
  <div>
    <dbInteraction></dbInteraction>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Reminders</span>
        <el-button-group style="float: right;">
          <el-button @click="mfOpenADialog" style="padding: 3px;" type="success" plain>A</el-button>
          <el-button @click="mfOpenMDialog" style="padding: 3px;" type="primary" plain>M</el-button>
          <el-button @click="mfOpenDDialog" style="padding: 3px;" type="warning" plain>D</el-button>
          <el-button @click="mfOpenXDialog" style="padding: 3px;" type="info" plain>X</el-button>
        </el-button-group>
      </div>
      <el-table
        :data="cfArRemForDisplayInTable"
        :showHeader="false"
        size="mini"
        style="width: 100%;"
        v-bind:stripe="true"
        :row-class-name="mfGetDirtyClassName"
      >
        <el-table-column type="expand">
          <template slot-scope="props">
            <p>Created: {{ props.row.createdAt }}</p>
          </template>
        </el-table-column>

        <el-table-column prop="remDescription" label="Description"> </el-table-column>
        <!-- Why is width = "60" for the action column
        Setting this makes the middle column of desc flexible.
        After this is set if desc has 200 words they will use the maximum available space.
          -->
        <el-table-column label="Actions" width="60">
          <template slot-scope="props">
            <el-button-group>
              <el-button
                @click="mfOpenCDialog(props.row.$id)"
                type="primary"
                size="mini"
                style="padding: 3px;"
                plain
                >C</el-button
              >
              <el-button type="warning" size="mini" style="padding: 3px;" plain>D</el-button>
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
import ormSearchPhraseUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'
import ormRem from '@/cts/rem/vuex-orm/model.js'

export default {
  components: { dbInteraction },
  data() {
    return {
      tablePageNumber: 1,
    }
  },
  computed: {
    cfLengthOfDataArray() {
      const arResultsFromORM = ormRem.query().get()
      return arResultsFromORM.length
    },
    cfArRemForDisplayInTable() {
      console.log(
        'cfArRemForDisplayInTable called. Whenever ormRem will change this will get called. Even when there are 100 rows in the table when orm rem changes this gets called once'
      )
      const arResultsFromORM = ormRem.query().get()

      /* Option1 of returning data from this cf:
          return arResultsFromORM
          Disadvantage
            Created at needs to be made inside the template
            vue will get more data since when I loop here I can send less data to vue
          Advantage:
            No need to run the for loop
      */

      /* Option2 of returning data from this cf:
       */
      const arRemsForDisplay = []
      let obj = {}
      if (arResultsFromORM.length) {
        let date = ''
        const startDataRowInidex = (this.tablePageNumber - 1) * 10
        const endDataRowIndex = startDataRowInidex + 10
        for (let i = startDataRowInidex; i < arResultsFromORM.length && i < endDataRowIndex; i++) {
          obj = {}
          obj.remDescription = arResultsFromORM[i].remDescription
          // For date format ref: /cts/rem/vl/timeline.vue:53
          date = new Date(arResultsFromORM[i].ROW_START)
          obj.createdAt = date.toLocaleString('default', { month: 'long' }) + '-' + date.getDate()
          obj.$isDirty = arResultsFromORM[i].$isDirty
          obj.uuid = arResultsFromORM[i].uuid
          obj.$id = arResultsFromORM[i].$id
          arRemsForDisplay.push(obj)
        }
      }
      return arRemsForDisplay
    }, // end of cfArRemForDisplayInTable
  },
  mounted() {},
  methods: {
    mfTablePageChanged(pNewPageNumber) {
      console.log('Page changed', pNewPageNumber)
      this.tablePageNumber = pNewPageNumber
    },
    mfOpenADialog() {
      // console.log('show add dialog')
      const arResultsFromORM = ormSearchPhraseUiToCT.query().search('add reminder').get()
      const objRowFromORM = arResultsFromORM[0]
      // console.log(objRowFromORM)
      const tab = {
        label: objRowFromORM.value,
        ctToShow: require('@/cts/' + objRowFromORM.ctToShowInCL).default,
        ctAbbr: objRowFromORM.ctAbbr,
        id: objRowFromORM.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
    mfOpenMDialog() {
      // console.log('show add dialog')
      const arResultsFromORM = ormSearchPhraseUiToCT.query().search('multi change reminder').get()
      const objRowFromORM = arResultsFromORM[0]
      // console.log(objRowFromORM)
      const tab = {
        label: objRowFromORM.value,
        ctToShow: require('@/cts/' + objRowFromORM.ctToShowInCL).default,
        ctAbbr: objRowFromORM.ctAbbr,
        id: objRowFromORM.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
    mfOpenDDialog() {
      // console.log('show add dialog')
    },
    mfOpenXDialog() {
      // console.log('show add dialog')
      const arResultsFromORM = ormSearchPhraseUiToCT.query().search('discontinued reminders').get()
      const objRowFromORM = arResultsFromORM[0]
      // console.log(objRowFromORM)
      const tab = {
        label: objRowFromORM.value,
        ctToShow: require('@/cts/' + objRowFromORM.ctToShowInCL).default,
        ctAbbr: objRowFromORM.ctAbbr,
        id: objRowFromORM.id,
        closable: true,
      }
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
    mfOpenCDialog(pORMDataRowID) {
      console.log('Open change rem dialog -> ', pORMDataRowID)

      // Goal: Find out which CT will handle this work
      const arResultsFromORM = ormSearchPhraseUiToCT.query().search('change reminder').get()
      const objRowFromORM = arResultsFromORM[0]
      // console.log(objRowFromORM)

      // Goal: Create the obj Tab that will be worked upon by for loop in
      // /cts/cl-tabs-manager/ctShowAddAndRemoveTabsInDialog.vue: 76

      /*
       We need rowID of vuexORM inside the change ct. Since change ct needs the exiting description of the reminbder to change
       Option 1: Send the whole data row
       Option 2: Send just the ID in a prop.
        +ves:
          1. At some places I may need to call change where I have the reminder ID but
          i do not have the remainder of the data row. Hence this makes the Change Ct possible
          to use at other places
          2. When I send a paramter it is like calling a function. Sending the whole data row
          is like working on a gloal variable. So other Cts can also modify this global variable.
      */

      const tab = {
        label: objRowFromORM.value, // TODO: Should be called vsLabel
        /*
        import and require are similar
        require can use a variable.
        import cannot use a variable. Benefits: webpack optimization
        How optimize? Webpack can remove that module completely if module is not used

        What does .default do?
        Related to webpack and HMR (Hot module reload)
        Ref: https://stackoverflow.com/questions/46215705/why-need-default-after-require-method-in-vue

        */
        ctToShow: require('@/cts/' + objRowFromORM.ctToShowInCL).default,
        ctAbbr: objRowFromORM.ctAbbr, // TODO: Should be called vsCtAbbr
        id: objRowFromORM.id, // TODO: should be called vnID
        vstPropsToGiveToCt: pORMDataRowID, // This holds all the data for the record we want to change in cl
        closable: true, // TODO: Should be called blClosable
      }
      // console.log(tab)
      this.$store.commit('mtfShowNewFirstTabInCl', tab)
    },
    mfGetDirtyClassName(pRow, pIndex) {
      if (pRow.row.$isDirty) {
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

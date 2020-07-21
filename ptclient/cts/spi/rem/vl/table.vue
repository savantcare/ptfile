<!-- When  i went from 80 to 100 the line count went rom 276 to 230 -->
<template>
  <div>
    <dbInteraction></dbInteraction>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Reminders</span>
        <el-button-group style="float: right;">
          <el-button style="padding: 3px;" type="success" plain @click="mfOpenACtInCl">A</el-button>
          <el-button style="padding: 3px;" type="primary" plain @click="mfOpenMCtInCl">M</el-button>
          <el-button style="padding: 3px;" type="warning" plain @click="mfOpenDDialog">D</el-button>
          <el-button style="padding: 3px;" type="info" plain @click="mfOpenXCtInCl">X</el-button>
        </el-button-group>
      </div>
      <el-table
        :data="cfArOfRemForDisplayInTable"
        :show-header="false"
        size="mini"
        style="width: 100%; padding-bottom: 1px;"
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

        <el-table-column prop="remDesc" label="Desc"> </el-table-column>
        <!-- Why is width = "60" for the action column
        Setting this makes the middle column of desc flexible.
        After this is set if desc has 200 words they will use the maximum available space.
          -->
        <el-table-column label="Actions" width="60">
          <template slot-scope="props">
            <!-- 
              Goal: 
              I open "add form" and enter "jai kali ma" and then i close the add form by pressign escape. In the table that row should not have change and discontinue

              How: 
              v-if to check is the 'rowStateInThisSession' not exists in array 'daRowStatesNotHavingCD'

              Ref: https://stackoverflow.com/questions/43881723/can-i-use-vue-js-v-if-to-check-is-the-value-exists-in-array
            -->
            <el-button-group
              v-if="!daRowStatesNotHavingCD.includes(props.row.rowStateInThisSession)"
            >
              <el-button
                type="primary"
                size="mini"
                style="padding: 3px;"
                plain
                @click="mfOpenCCtInCl(props.row.$id)"
                >C</el-button
              >
              <el-button
                type="warning"
                size="mini"
                style="padding: 3px;"
                plain
                @click="mfOpenDPrompt(props.row.$id)"
                >D</el-button
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
import ormRem from '@/cts/spi/rem/db/vuex-orm/rem.js'

export default {
  components: { dbInteraction },
  data() {
    return {
      tablePageNumber: 1,
      daRowStatesNotHavingCD: [2, 24, 2456, 2457, 24578], // Set of array of 'rowStateInThisSession' should not have change and discontinue button. As per GLOSSARY.md C stands for 'change' and D stands for 'discontinue'.
      daSelectedRemForDiscontinue: [],
    }
  },
  computed: {
    cfLengthOfDataArray() {
      const arFromORM = ormRem.getValidUniqueUuidRows()
      return arFromORM.length
    },

    cfArOfRemForDisplayInTable() {
      console.log(
        'cfArOfRemForDisplayInTable called. Whenever ormRem will change this will get called. Even when there are 100 rows in the table when orm rem changes this gets called once'
      )
      const arFromORM = ormRem.getValidUniqueUuidNotEmptyRows('remDesc')
      /*  Q) Should this function return the array it gets from ORM or modify the array?
              Option1: Return ORM array
                  -ves:
                    1. Created at needs to be made inside the template
                    2. Making pager would be harder
                  +ves:
                    No need to run the for loop
      */

      console.log(arFromORM)
      const arRemsForDisplay = []
      let obj = {}
      if (arFromORM.length) {
        let date = ''
        const startDataRowInidex = (this.tablePageNumber - 1) * 10
        const endDataRowIndex = startDataRowInidex + 10
        for (let i = startDataRowInidex; i < arFromORM.length && i < endDataRowIndex; i++) {
          obj = {}
          obj.remDesc = arFromORM[i].remDesc
          // For date format ref: /cts/spi/rem/vl/timeline.vue:53
          date = new Date(arFromORM[i].ROW_START)
          obj.createdAt = date.toLocaleString('default', { month: 'long' }) + '-' + date.getDate()
          obj.rowStateInThisSession = arFromORM[i].rowStateInThisSession
          obj.uuid = arFromORM[i].uuid
          obj.$id = arFromORM[i].$id
          obj.id = arFromORM[i].id
          arRemsForDisplay.push(obj)
        }
      }
      return arRemsForDisplay
    },
  },
  mounted() {},
  methods: {
    mfTablePageChanged(pNewPageNumber) {
      console.log('Page changed', pNewPageNumber)
      this.tablePageNumber = pNewPageNumber
    },
    mfOpenACtInCl() {
      this.$store.commit('mtfShowNewFirstTabInClFromSearchPhrase', {
        searchTerm: 'add reminder',
      })
    },
    mfOpenMCtInCl() {
      this.$store.commit('mtfShowNewFirstTabInClFromSearchPhrase', {
        searchTerm: 'multi change reminder',
      })
    },
    mfOpenDDialog() {
      let confirmMessage = 'Are you sure you want to discontinue all the selected reminders?'
      if (this.daSelectedRemForDiscontinue.length === 0) {
        confirmMessage = 'No reminder selected. Please select at least one reminder.'
      }

      this.$confirm(confirmMessage, 'Multi discontinue', {
        confirmButtonText: 'Discontinue',
        cancelButtonText: 'Cancel',
        type: 'warning',
      })
        .then(() => {
          if (this.daSelectedRemForDiscontinue.length > 0) {
            this.daSelectedRemForDiscontinue.forEach((row) => {
              ormRem.sendDiscontinueDataToServer(row.id, row.uuid, null)
            })
          }
          console.log('daSelectedRemForDiscontinue=====>', this.daSelectedRemForDiscontinue)
        })
        .catch(() => {
          console.log('multi discontinue cancelled')
        })
    },
    mfOpenXCtInCl() {
      this.$store.commit('mtfShowNewFirstTabInClFromSearchPhrase', {
        searchTerm: 'discontinued reminders',
      })
    },
    mfOpenCCtInCl(pORMDataRowID) {
      /*
       We need rowID of vuexORM inside the change ct. Since change ct needs the exiting Desc of the reminber to change
       Option 1: Send the whole data row
       Option 2: Send just the ID in a prop.
        +ves:
          1. At some places I may need to call change where I have the reminder ID but
          i do not have the remainder of the data row. Hence this makes the Change Ct possible
          to use at other places
          2. When I send a paramter it is like calling a function. Sending the whole data row
          is like working on a gloal variable. So other Cts can also modify this global variable.
      */
      const payload = { searchTerm: 'change reminder', pPropsToGiveToCt: pORMDataRowID }
      this.$store.commit('mtfShowNewFirstTabInClFromSearchPhrase', payload)
    },
    mfOpenDPrompt(pORMDataRowID) {
      const arResultsFromORM = ormRem.find(pORMDataRowID)

      this.$prompt(arResultsFromORM.remDesc, 'Discontinue reminder', {
        confirmButtonText: 'Discontinue',
        cancelButtonText: 'Cancel',
        inputPlaceholder: 'Enter discontinue note',
      })
        .then(({ value }) => {
          const status = ormRem.sendDiscontinueDataToServer(
            pORMDataRowID,
            arResultsFromORM.uuid,
            value
          )
          console.log('discontinue status ======> ', status)
        })
        .catch(() => {
          console.log('Discontinue cancelled')
        })
    },
    mfHandleSelectionForDiscontinue(val) {
      this.daSelectedRemForDiscontinue = val
    },
    mfGetCssClassName(pRow, pIndex) {
      const strOfNumber = pRow.row.rowStateInThisSession.toString()
      const lastCharecter = strOfNumber.slice(-1)
      console.log('pRow', pRow, 'pIndex', pIndex, 'Last charecter', lastCharecter)
      if (lastCharecter === '4' || lastCharecter === '6') {
        return 'unsaved-data'
      } else if (lastCharecter === '8') {
        return 'unsaved-data-failed-to-save'
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
tr.el-table__row.unsaved-data-failed-to-save > td {
  border-top: 2px solid #ff0000;
  border-bottom: 2px solid #ff0000;
}
tr.el-table__row.unsaved-data-failed-to-save > td:first-child {
  border-left: 2px solid #ff0000;
}
tr.el-table__row.unsaved-data-failed-to-save > td:last-child {
  border-right: 2px solid #ff0000;
}
</style>

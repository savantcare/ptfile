<template>
  <div>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span>Screening</span>
        <el-button-group style="float: right;">
          <el-button
            style="padding: 3px;"
            @click="mfOpenAllScrGDialog()"
            type="success"
            plain
            >G</el-button
          >
          <el-button
            style="padding: 3px;"
            @click="mfOpenADialog()"
            type="primary"
            plain
            >A</el-button
          >
        </el-button-group>
      </div>
      <el-table :data="daScrTable" style="width: 100%;">
        <el-table-column
          prop="scientificName"
          label="Scientific name"
          width="150"
        >
        </el-table-column>
        <el-table-column>
          <template slot-scope="scope">
            <el-button type="text" size="mini" @click="mfOpenTDialog(scope.row)"
              >T</el-button
            ><el-button
              type="text"
              size="mini"
              @click="mfOpenGDialog(scope.row)"
              >G</el-button
            >
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script>
import ormSearchUiToCT from '@/cts/vl-search-box/vuex-orm/searchUIToCT'
import ormCTLifeCycle from '@/models/ormCtLifeCycle'
import ormScr from '@/models/Screening'
export default {
  data() {
    return {
      daTable: [
        {
          scientificName: 'PHQ9',
        },
      ],
      daScrTable: ormScr.query().get(),
      dblOneQueryIsRunningGate: false,
    }
  },
  computed: {},
  beforeCreate() {},
  mounted() {
    this.mfAddOrmSearch()
    this.mfdaGetscr()
  },
  methods: {
    async mfdaGetscr() {
      try {
        if (!this.dblOneQueryIsRunningGate) {
          this.dblOneQueryIsRunningGate = true
          const countScr = await ormScr.query().count()
          console.log('Number of recs before query =>', countScr)
          if (countScr === 0) {
            const scrEvalList = await ormScr
              .api()
              .get(
                'http://localhost:8000/screening?patientUUID=bfe041fa-073b-4223-8c69-0540ee678ff8'
              )

            if (scrEvalList.ok) {
              // console.log('screen==== ' + JSON.stringify(arScrEvalList, null, 4))
            }
            console.log('Number of screen in model =>', ormScr.query().count())
            const arScrEvalList = ormScr.query().get()
            this.daScrTable = arScrEvalList
          }
          this.dblOneQueryIsRunningGate = false
        }
      } catch (ex) {
        console.log('failed')
      }
    },
    mfAddOrmSearch() {
      // Inserting Search interfaces to this component
      const resultSet = ormCTLifeCycle.query().where('name', 'Screening').get()
      const resultData = resultSet[0]
      if (typeof resultData !== 'undefined') {
        console.log('already mounted')
      } else {
        // Step 1/3: Store information that this Ct has already been mounted
        // I run this before API to server since API to server takes time and during the wait time 2 Ct may end up running
        ormCTLifeCycle.insert({
          data: {
            name: 'Screening',
            status: 3,
          },
        })

        // Step 2/3: Inserting Search interfaces to this component
        ormSearchUiToCT.insert({
          data: {
            value: 'Screening',
            ctAbbr: 'scr',
            ctToShowInCL: 'scr/scr-l1.vue',
            layer: 'view',
          },
        })
        // Step 3/3: Run API to get data from server

        console.log('Done Screening mounting')
      }
    },
    mfOpenAllScrGDialog() {
      console.log('show all screen graph popup')
    },
    mfOpenADialog() {
      console.log('show add screen  in popup')
    },
    mfOpenTDialog(data) {
      console.log('show take a screen dialog', data)
      // this.$store.commit("showTakeAScreenTabInLayer2", data);
    },
    mfOpenGDialog(data) {
      console.log('show screen graph dialog', data)
    },
  },
}
</script>

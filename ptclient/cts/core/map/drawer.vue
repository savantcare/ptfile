<!-- Params
      Goal: Do not show the shadow so doctor can read the view layer.
            modal=false means -> Do now show shadowing layer

     How to see table in drawer?
        https://element.eleme.io/#/en-US/component/drawer       
  -->
<template>
  <el-drawer
    title="Map"
    :visible="cfMapDrawerVisibility"
    direction="ttb"
    :before-close="handleClose"
    :modal="false"
    :close-on-press-escape="true"
    :show-close="false"
    size="90%"
  >
    <!-- <img
      src="https://github.com/DataV-Team/DataV/blob/master/demoImg/construction-data.jpg?raw=true"
    />-->
    <el-row :gutter="10">
      <el-col :md="4">
        <div class="small-grid-content">
          <el-row>
            <el-col>
              <div class="map-grid-content">
                <el-card class="box-card">
                  <div class="clearfix header">
                    <span>Reccomendation</span>
                  </div>
                  <div
                    v-for="(rec, index) in arRecData"
                    :key="rec.id"
                    class="map-item-row"
                    :class="{ 'odd-row': index % 2 === 1, 'even-row': index % 2 === 0 }"
                    v-bind:title="rec.label"
                  >
                    {{ rec.label }}
                  </div>
                </el-card>
              </div>
            </el-col>
          </el-row>
          <el-row>
            <el-col>
              <div class="map-grid-content">
                <el-card class="box-card">
                  <div class="clearfix header">
                    <span>Goal</span>
                  </div>
                  <div
                    v-for="(g, index) in arGData"
                    :key="g.id"
                    class="map-item-row"
                    :class="{ 'odd-row': index % 2 === 1, 'even-row': index % 2 === 0 }"
                    :title="g.label + ' [Rating: ' + g.rating + ']'"
                  >
                    {{ g.label }}
                  </div>
                </el-card>
              </div>
            </el-col>
          </el-row>
          <el-row>
            <el-col>
              <div class="map-grid-content">
                <el-card class="box-card">
                  <div class="clearfix header">
                    <span>Body measurement</span>
                  </div>
                  <div
                    v-for="(bm, index) in arBmData"
                    :key="bm.id"
                    class="map-item-row"
                    :class="{ 'odd-row': index % 2 === 1, 'even-row': index % 2 === 0 }"
                  >
                    <el-row>
                      <el-col :span="12">
                        <div class="">{{ bm.label }}</div>
                      </el-col>
                      <el-col :span="12">
                        <div class="">{{ bm.value }}</div>
                      </el-col>
                    </el-row>
                  </div>
                </el-card>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
      <el-col :md="4">
        <div class="small-grid-content">
          <el-row>
            <el-col>
              <div class="map-grid-content">
                <el-card class="box-card">
                  <div class="clearfix header">
                    <span>Reminders</span>
                  </div>
                  <div
                    v-for="(rem, index) in arRemData"
                    :key="rem.id"
                    class="map-item-row"
                    :class="{ 'odd-row': index % 2 === 1, 'even-row': index % 2 === 0 }"
                    v-bind:title="rem.label"
                  >
                    {{ rem.label }}
                  </div>
                </el-card>
              </div>
            </el-col>
          </el-row>
          <el-row>
            <el-col>
              <div class="map-grid-content">
                <el-card class="box-card">
                  <div class="clearfix header">
                    <span>Diagnosis</span>
                  </div>
                  <el-tree
                    class="map-tree-item"
                    :data="arDxData"
                    :props="obDxDataTreeProps"
                    default-expand-all
                  ></el-tree>
                </el-card>
              </div>
            </el-col>
          </el-row>
          <el-row>
            <el-col>
              <div class="map-grid-content">
                <el-card class="box-card">
                  <div class="clearfix header">
                    <span>Dummy card</span>
                  </div>
                  <div
                    v-for="(o, index) in 5"
                    :key="o"
                    class="map-item-row"
                    :class="{ 'odd-row': index % 2 === 1, 'even-row': index % 2 === 0 }"
                  >
                    {{ 'List item ' + o }}
                  </div>
                </el-card>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
      <el-col :md="8">
        <div class="large-grid-content">
          <el-row>
            <el-col>
              <div class="map-grid-content">
                <el-card class="box-card">
                  <div class="clearfix header">
                    <span>Mental status exam</span>
                  </div>
                  <div style="padding-top: 2px;">
                    <el-tabs :tab-position="'left'" style="height: 300px;">
                      <el-tab-pane
                        v-for="eachMse in arMseData"
                        :key="eachMse.name"
                        :label="eachMse.label"
                      >
                        <div v-if="eachMse.selectedValues.length > 0">
                          <div v-for="(value, index) in eachMse.selectedValues" :key="index">
                            {{ value }}
                          </div>
                        </div>
                        <div v-else>
                          No data found
                        </div>
                      </el-tab-pane>
                    </el-tabs>
                  </div>
                </el-card>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
      <el-col :md="8">
        <div class="large-grid-content">
          <el-row>
            <el-col>
              <div class="map-grid-content">
                <el-card class="box-card">
                  <div class="clearfix header">
                    <span>Screening</span>
                  </div>
                  <div style="padding-top: 2px;">
                    <el-tabs :tab-position="'left'" style="height: 300px;">
                      <el-tab-pane
                        v-for="eachMse in arMseData"
                        :key="eachMse.name"
                        :label="eachMse.label"
                      >
                        <div v-if="eachMse.selectedValues.length > 0">
                          <div v-for="(value, index) in eachMse.selectedValues" :key="index">
                            {{ value }}
                          </div>
                        </div>
                        <div v-else>
                          No data found
                        </div>
                      </el-tab-pane>
                    </el-tabs>
                  </div>
                </el-card>
              </div>
            </el-col>
          </el-row>
        </div>
      </el-col>
    </el-row>
  </el-drawer>
</template>

<script>
export default {
  data() {
    return {
      arRecData: [
        { id: 1, label: 'Jaibhole baba' },
        { id: 2, label: 'Recommendation def' },
        { id: 3, label: 'This is a test case when recommendation text is very long' },
        { id: 4, label: 'Recommendation stu' },
        { id: 5, label: 'Some Recommendation' },
      ],
      arRemData: [
        { id: 1, label: 'Jaikalima' },
        { id: 2, label: 'My testing for new one' },
        { id: 3, label: 'Reminder 4' },
        { id: 4, label: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit' },
        { id: 5, label: 'reminder data' },
      ],
      arGData: [
        { id: 1, label: 'Meditate daily', rating: 0 },
        { id: 2, label: 'Sleep 8 hrs', rating: 10 },
        { id: 3, label: 'A long text goal to test realtime situation', rating: 50 },
        { id: 4, label: 'another goal', rating: 20 },
        { id: 5, label: 'dummy goal', rating: 20 },
      ],
      arDxData: [
        {
          id: 1,
          label: 'Acculturation difficulty',
          children: [
            {
              label: 'Some assessment',
            },
          ],
        },
        {
          id: 2,
          label: 'Some other dx',
          children: [
            {
              label: 'Some other assessment',
            },
          ],
        },
      ],
      obDxDataTreeProps: {
        children: 'children',
        label: 'label',
      },
      arBmData: [
        { id: 1, label: 'Weight', value: '80 kgs' },
        { id: 2, label: 'BMI', value: '27.3' },
        { id: 3, label: 'Waist', value: '38 inches' },
        { id: 4, label: 'Blood sugar', value: '135 mg/dL' },
        { id: 5, label: 'Height', value: '69.1 inches' },
        { id: 6, label: 'Blood pressure', value: '120/80 mmHg' },
        { id: 7, label: 'Oxygen saturation', value: '80%' },
        { id: 8, label: 'Pulse', value: '75 /min' },
        { id: 9, label: 'Temperature', value: '97.7 °F' },
      ],
      arMseData: [
        {
          label: 'Mood/Affect',
          name: 'mood-or-affect',
          selectedValues: [
            'Euthymic',
            'Dysphoric',
            'Irritable',
            'Angry',
            'Bright',
            'Euphoric',
            'Labile',
            'Stable',
            'Mood congruent',
            'Mood incongruent',
          ],
        },
        {
          label: 'Appearance',
          name: 'appearance',
          selectedValues: [
            'Good grooming and hygiene',
            'No apparent distress',
            'Well-developed, well-nourished',
            'Appears stated age',
            'Appears younger than stated age',
            'Appears older than stated age',
          ],
        },
        {
          label: 'Attitude',
          name: 'attitude',
          selectedValues: [
            'Pleasant and cooperative',
            'Uncooperative',
            'Hostile or defiant',
            'Guarded',
            'Evasive',
            'Apathetic',
            'Disorganized behavior',
          ],
        },
      ],
    }
  },
  methods: {
    handleClose(done) {
      // console.log('In the handle close function')
      this.cfMapDrawerVisibility = false
    },
  },
  computed: {
    cfMapDrawerVisibility: {
      get() {
        return this.$store.state.vstObjMapDrawer.vblIsMapDrawerVisible
      },
      set(value) {
        this.$store.commit('mtfSetMapDrawerVisibility', value)
      },
    },
  },
  mounted() {
    // console.log('Drawer ct mounted')
  },
}
</script>
<style>
#el-drawer__title > span {
  outline: none;
}
.even-row {
  background-color: #ffffff;
}
.odd-row {
  background-color: #ebeef5;
}
.map-grid-content .header {
  font-size: 12px;
  font-weight: bold;
  border-bottom: 1px solid #aaa;
}
.map-grid-content .map-item-row {
  font-size: 12px;
  padding: 3px;
  cursor: default;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.map-grid-content .map-item-row:hover {
  background-color: #e3e3f8;
}
.map-grid-content .map-tree-item .el-tree-node__label {
  font-size: 12px;
  padding: 2px;
}
</style>

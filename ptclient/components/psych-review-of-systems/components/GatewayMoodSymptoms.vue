<template>
  <div>
    <el-col>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>Gateway Mood Symptoms</span>
          <el-button style="float: right; padding: 3px 0" type="text">All normal</el-button>
        </div>
        <el-form
          :model="gatewayMoodSymptomsForm"
          ref="gatewayMoodSymptomsForm"
          class="demo-dynamic"
        >
          <el-form-item>
            <el-checkbox-group v-model="checkboxGatewayMoodSymptoms">
              <!--  When opened in multi change format size="small" 
                Ref: https://element.eleme.io/#/en-US/component/checkbox
              -->
              <el-checkbox-button
                v-for="app in gatewayMoodSymptoms"
                :label="app.label"
                :key="app.label"
              >
                {{app.label}}
                <el-select
                  v-model="checkboxGatewayMoodSymptoms.selected"
                  clearable
                  placeholder="Select"
                  size="mini"
                >
                  <el-option
                    v-for="item in app.options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </el-checkbox-button>
            </el-checkbox-group>
            <!--  When opened in multi change min-rows=1 -->
            <el-input
              type="textarea"
              :autosize="{ minRows: 4}"
              placeholder="Please input"
              v-model="textarea"
            ></el-input>
          </el-form-item>
          <el-form-item>
            <!-- When opened in multi change format the Save button will not be there.
            Since the whole form will be controlled by one Save button
            -->
            <el-button
              type="success"
              @click="submitForm('gatewayMoodSymptomsForm')"
              size="small"
            >Save</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </div>
</template>

<script>
const gatewayMoodSymptomsOptions = [
  {
    label:
      "Q. In the past 10 days, how many days have you felt depressed for most of the day?",
    options: [
      { label: "0", value: 0 },
      { label: "1", value: 1 },
      { label: "2", value: 2 },
      { label: "3", value: 3 },
      { label: "4", value: 4 },
      { label: "5", value: 5 },
      { label: "6", value: 6 },
      { label: "7", value: 7 },
      { label: "8", value: 8 },
      { label: "9", value: 9 },
      { label: "10", value: 10 }
    ]
  },
  {
    label:
      "Q. In the past 10 days, how many days have you felt low interest or motivation throughout most of the day?",
    options: [
      { label: "0", value: 0 },
      { label: "1", value: 1 },
      { label: "2", value: 2 },
      { label: "3", value: 3 },
      { label: "4", value: 4 },
      { label: "5", value: 5 },
      { label: "6", value: 6 },
      { label: "7", value: 7 },
      { label: "8", value: 8 },
      { label: "9", value: 9 },
      { label: "10", value: 10 }
    ]
  },
  {
    label:
      "Q. In the past 10 days, how many days have you been abnormally irritable throughout most of the day?",
    options: [
      { label: "0", value: 0 },
      { label: "1", value: 1 },
      { label: "2", value: 2 },
      { label: "3", value: 3 },
      { label: "4", value: 4 },
      { label: "5", value: 5 },
      { label: "6", value: 6 },
      { label: "7", value: 7 },
      { label: "8", value: 8 },
      { label: "9", value: 9 },
      { label: "10", value: 10 }
    ]
  },
  {
    label:
      "Q. In the past 10 days, how many days have you been abnormally energetic or high energy throughout most of the day?",
    options: [
      { label: "0", value: 0 },
      { label: "1", value: 1 },
      { label: "2", value: 2 },
      { label: "3", value: 3 },
      { label: "4", value: 4 },
      { label: "5", value: 5 },
      { label: "6", value: 6 },
      { label: "7", value: 7 },
      { label: "8", value: 8 },
      { label: "9", value: 9 },
      { label: "10", value: 10 }
    ]
  },
  {
    label:
      "Q. In the past 10 days, how many days have you felt abnormal mood elevation throughout most of the day?",
    options: [
      { label: "0", value: 0 },
      { label: "1", value: 1 },
      { label: "2", value: 2 },
      { label: "3", value: 3 },
      { label: "4", value: 4 },
      { label: "5", value: 5 },
      { label: "6", value: 6 },
      { label: "7", value: 7 },
      { label: "8", value: 8 },
      { label: "9", value: 9 },
      { label: "10", value: 10 }
    ]
  },
  {
    label: "Q. How difficult to the above symptoms make your day to day life?",
    options: [
      { label: "Not at all", value: 0 },
      { label: "Somewhat difficult", value: 1 },
      { label: "Very difficult", value: 2 },
      { label: "Extremely difficult", value: 3 },
      { label: "Incapacitating", value: 4 }
    ]
  }
];

export default {
  data() {
    return {
      gatewayMoodSymptomsForm: { recs: [{ description: "" }] },
      // When form loads this will have the currently selected values from the DB
      checkboxGatewayMoodSymptoms: [""],
      gatewayMoodSymptoms: gatewayMoodSymptomsOptions,
      textarea: ""
    };
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdateGatewayMoodSymptomsInSM", {
        data: rec,
        notify: this.$notify
      });
    }
  },
  computed: {},
  mounted() {},
  watch: {
    tabDialogVisibility() {}
  }
};
</script>

<style>
.box-card {
  width: 1000px;
}
</style>
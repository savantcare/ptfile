<template>
  <div>
    <el-col>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>Suicide Assessment</span>
          <el-button style="float: right; padding: 3px 0" type="text">All normal</el-button>
        </div>
        <el-form :model="suicideAssessmentForm" ref="suicideAssessmentForm" class="demo-dynamic">
          <el-form-item>
            <el-checkbox-group v-model="checkboxSuicideAssessment">
              <!--  When opened in multi change format size="small" 
                Ref: https://element.eleme.io/#/en-US/component/checkbox
              -->
              <el-checkbox-button
                v-for="app in suicideAssessment"
                :label="app.label"
                :key="app.label"
              >
                {{app.label}}
                <el-select
                  v-model="checkboxSuicideAssessment.selected"
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
            <el-button type="success" @click="submitForm('suicideAssessmentForm')" size="small">Save</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </div>
</template>

<script>
const suicideAssessmentOptions = [
  {
    label: "Does patient report suicidal ideations ?",
    options: [
      { label: "No", value: 0 },
      { label: "Yes", value: 1 }
    ]
  }
];

export default {
  data() {
    return {
      suicideAssessmentForm: { recs: [{ description: "" }] },
      // When form loads this will have the currently selected values from the DB
      checkboxSuicideAssessment: [""],
      suicideAssessment: suicideAssessmentOptions,
      textarea: ""
    };
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdateSuicideAssessmentInSM", {
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
  width: 700px;
}
</style>
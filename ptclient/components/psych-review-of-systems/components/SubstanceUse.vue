<template>
  <div>
    <el-col>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>Substance Use</span>
          <el-button style="float: right; padding: 3px 0" type="text">All normal</el-button>
        </div>
        <el-form :model="substanceUseForm" ref="substanceUseForm" class="demo-dynamic">
          <el-form-item>
            <el-checkbox-group v-model="checkboxSubstanceUse">
              <!--  When opened in multi change format size="small" 
                Ref: https://element.eleme.io/#/en-US/component/checkbox
              -->
              <el-checkbox-button v-for="app in substanceUse" :label="app" :key="app">{{app}}</el-checkbox-button>
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
            <el-button type="success" @click="submitForm('substanceUseForm')" size="small">Save</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </div>
</template>

<script>
const substanceUseOptions = [
  "Used in larger amounts or over longer period than intended",
  "A great deal of time spent in activities necessary to obtain substance, use substance or recover from its effects",
  "Continued use despite recurrent social or interpersonal problems due to use",
  "Tolerance (need increased amounts or diminished effect)",
  "Persistent desire or unsuccessful efforts to cut down or control use",
  "Craving",
  "Failure to fulfill major role obligations at work, school, or home due to use",
  "Recurrent use in situations in which physically hazardous",
  "Use despite knowledge of physical or psychological problems likely exacerbated by use",
  "Withdrawal"
];

export default {
  data() {
    return {
      substanceUseForm: { recs: [{ description: "" }] },
      // When form loads this will have the currently selected values from the DB
      checkboxSubstanceUse: [""],
      substanceUse: substanceUseOptions,
      textarea: ""
    };
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdateSubstanceUseInSM", {
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
<template>
  <div>
    <el-col>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>Anorexia</span>
          <el-button style="float: right; padding: 3px 0" type="text">All normal</el-button>
        </div>
        <el-form :model="anorexiaForm" ref="anorexiaForm" class="demo-dynamic">
          <el-form-item>
            <el-checkbox-group v-model="checkboxAnorexia">
              <!--  When opened in multi change format size="small" 
                Ref: https://element.eleme.io/#/en-US/component/checkbox
              -->
              <el-checkbox-button v-for="app in anorexia" :label="app.label" :key="app.label">
                {{app.label}}
                <el-select
                  v-model="checkboxAnorexia.selected"
                  clearable
                  placeholder="Select"
                  size="mini"
                  v-if="app.options"
                >
                  <el-option
                    v-for="item in app.options"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                  ></el-option>
                </el-select>
                <el-input
                  v-if="!app.options"
                  size="mini"
                  placeholder="Please input"
                  v-model="checkboxAnorexia.value"
                  style="width:100px"
                ></el-input>
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
            <el-button type="success" @click="submitForm('anorexiaForm')" size="small">Save</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </div>
</template>

<script>
const anorexiaOptions = [
  {
    label: "Food restriction leading to significantly low weight",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label:
      "Intense fear of gaining weight or behavior that interferes with wt gain",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label:
      "Body image disturbance, or excess influence of shape on self evaluation, or denial of seriousness of low body weight",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Latest BMI",
    value: ""
  }
];
/*
"Food restriction leading to significantly low weight",
"Intense fear of gaining weight or behavior that interferes with wt gain",
"Body image disturbance, or excess influence of shape on self evaluation, or denial of seriousness of low body weight",
"Latest BMI"
*/
export default {
  data() {
    return {
      anorexiaForm: { recs: [{ description: "" }] },
      // When form loads this will have the currently selected values from the DB
      checkboxAnorexia: [""],
      anorexia: anorexiaOptions,
      textarea: ""
    };
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdateAnorexiaInSM", {
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
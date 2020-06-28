<template>
  <div>
    <el-col>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>Mania / Hypo Mania</span>
          <el-button style="float: right; padding: 3px 0" type="text">All normal</el-button>
        </div>
        <el-form :model="maniaHypoManiaForm" ref="maniaHypoManiaForm" class="demo-dynamic">
          <el-form-item>
            <el-checkbox-group v-model="checkboxManiaHypoMania">
              <!--  When opened in multi change format size="small" 
                Ref: https://element.eleme.io/#/en-US/component/checkbox
              -->
              <el-checkbox-button v-for="app in maniaHypoMania" :label="app.label" :key="app.label">
                {{app.label}}
                <el-select
                  v-model="checkboxManiaHypoMania.selected"
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
            <el-button type="success" @click="submitForm('maniaHypoManiaForm')" size="small">Save</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </div>
</template>

<script>
const maniaHypoManiaOptions = [
  {
    label: "Mood elevation",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Irritable",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Energy/GDA/PMA",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Sleep need",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Talking",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Racing Thoughts/FOI",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Distractibility",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "High Risk Behaviour",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  }
];

export default {
  data() {
    return {
      maniaHypoManiaForm: { recs: [{ description: "" }] },
      // When form loads this will have the currently selected values from the DB
      checkboxManiaHypoMania: [""],
      maniaHypoMania: maniaHypoManiaOptions,
      textarea: ""
    };
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdateManiaHypoManiaInSM", {
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
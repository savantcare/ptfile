<template>
  <div>
    <el-col>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>ADHD</span>
          <el-button style="float: right; padding: 3px 0" type="text">All normal</el-button>
        </div>
        <el-form :model="adhdForm" ref="adhdForm" class="demo-dynamic">
          <el-form-item>
            <el-checkbox-group v-model="checkboxADHD">
              <!--  When opened in multi change format size="small" 
                Ref: https://element.eleme.io/#/en-US/component/checkbox
              -->
              <el-checkbox-button v-for="app in adhd" :label="app.label" :key="app.label">
                {{app.label}}
                <el-select
                  v-model="checkboxADHD.selected"
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
            <el-button type="success" @click="submitForm('adhdForm')" size="small">Save</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </div>
</template>

<script>
const adhdOptions = [
  {
    label: "INATTENTION",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "HYPERACTIVITY",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Careless mistakes or poor attention to detail",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Problem sustaining attention",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Poor listening",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Fails to finish tasks",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Difficulty organizing tasks",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Reluctant to engage in tasks that require sustained mental effort",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Loses things often",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Distracted by extraneous stimuli",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },

  {
    label: "Forgetful daily activities",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Fidgets often",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Leaves seat often when sitting is expected",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Feels restless",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Unable to engage in leisurely activities quietly",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: 'Seems "on the go" or "driven by motor"',
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Talks excessively",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Blurts out often",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Difficulty waiting turn",
    options: [
      { label: "Not present", value: 0 },
      { label: "Subsyndromal", value: 0.5 },
      { label: "Syndromal", value: 1 }
    ]
  },
  {
    label: "Interrupts or intrudes on others",
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
      adhdForm: { recs: [{ description: "" }] },
      // When form loads this will have the currently selected values from the DB
      checkboxADHD: [],
      adhd: adhdOptions,
      textarea: ""
    };
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdateADHDInSM", {
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
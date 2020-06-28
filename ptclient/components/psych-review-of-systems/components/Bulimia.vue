<template>
  <div>
    <el-col>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>Bulimia</span>
          <el-button style="float: right; padding: 3px 0" type="text">All normal</el-button>
        </div>
        <el-form :model="bulimiaForm" ref="bulimiaForm" class="demo-dynamic">
          <el-form-item>
            <el-checkbox-group v-model="checkboxBulimia">
              <!--  When opened in multi change format size="small" 
                Ref: https://element.eleme.io/#/en-US/component/checkbox
              -->
              <el-checkbox-button v-for="app in bulimia" :label="app.label" :key="app.label">
                {{app.label}}
                <el-select
                  v-model="checkboxBulimia.selected"
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
            <el-button type="success" @click="submitForm('bulimiaForm')" size="small">Save</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </div>
</template>

<script>
const bulimiaOptions = [
  {
    label: "Binge eating (large quantity and lack of control of eating)",
    options: [
      { label: "0", value: 0 },
      { label: "0.5", value: 0.5 },
      { label: "1", value: 1 }
    ]
  },
  {
    label: "Compensatory behaviors (vomiting, laxatives, fasting, exercise)",
    options: [
      { label: "0", value: 0 },
      { label: "0.5", value: 0.5 },
      { label: "1", value: 1 },
      { label: "2", value: 2 },
      { label: "3", value: 3 },
      { label: "4", value: 4 }
    ]
  },
  {
    label: "Self evaluation highly influenced by shape",
    options: [
      { label: "0", value: 0 },
      { label: "0.5", value: 0.5 },
      { label: "1", value: 1 }
    ]
  }
];

export default {
  data() {
    return {
      bulimiaForm: { recs: [{ description: "" }] },
      // When form loads this will have the currently selected values from the DB
      checkboxBulimia: [""],
      bulimia: bulimiaOptions,
      textarea: ""
    };
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdateBulimiaInSM", {
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
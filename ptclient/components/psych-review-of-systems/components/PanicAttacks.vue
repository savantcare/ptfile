<template>
  <div>
    <el-col>
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          <span>Panic Attacks</span>
          <el-button style="float: right; padding: 3px 0" type="text">All normal</el-button>
        </div>
        <el-form :model="panicAttacksForm" ref="panicAttacksForm" class="demo-dynamic">
          <el-form-item>
            <el-checkbox-group v-model="checkboxPanicAttacks">
              <!--  When opened in multi change format size="small" 
                Ref: https://element.eleme.io/#/en-US/component/checkbox
              -->
              <el-checkbox-button v-for="app in panicAttacks" :label="app.label" :key="app.label">
                {{app.label}}
                <el-input
                  size="mini"
                  placeholder="Please input"
                  v-model="checkboxPanicAttacks.value"
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
            <el-button type="success" @click="submitForm('panicAttacksForm')" size="small">Save</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </el-col>
  </div>
</template>

<script>
const panicAttacksOptions = [
  {
    label: "Panic Attacks Per Month",
    value: ""
  },
  {
    label: "Impairment Caused by Panic Attacks",
    value: ""
  },
  {
    label: "Intensity of Panic Attacks",
    value: ""
  }
];

export default {
  data() {
    return {
      panicAttacksForm: { recs: [{ description: "" }] },
      // When form loads this will have the currently selected values from the DB
      checkboxPanicAttacks: [""],
      panicAttacks: panicAttacksOptions,
      textarea: ""
    };
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdatePanicAttacksInSM", {
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
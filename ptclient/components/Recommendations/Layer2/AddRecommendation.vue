// Component type 2/2: Form
// -------------- Category 1/2: User interface of a form component ---------------------

<template>
  <div>
    <!-- <el-tab-pane> -->
    <el-row :gutter="12">
      <el-col :span="24">
        <el-card class="box-card">
          <el-form :model="recForm" ref="recForm" class="demo-dynamic">
            <el-form-item
              v-for="(domain, index) in recForm.recs"
              :key="index"
              :rules="{
                  required: true, message: 'Description can not be blank', trigger: 'blur'
              }"
              :prop="'recs.' + index + '.description'"
            >
              <el-card class="box-card" shadow="hover">
                <!-- <el-input
                  :span="8"
                  type="textarea"
                  v-model="domain.description"
                  placeholder="You may enter multi line text"
                  :autosize="{ minRows: 4}"
                  autofocus
                  ref="input_box"
                ></el-input>-->
                <text-area
                  v-model="domain.description"
                  field="description"
                  @updateValidateChanges="updateValidateChanges"
                  ref="description"
                ></text-area>
              </el-card>
            </el-form-item>
            <el-form-item>
              <el-button type="success" @click="submitForm('recForm')" size="small">Save</el-button>
              <el-button type="primary" @click="addDomain" size="small">Add one more</el-button>
            </el-form-item>
          </el-form>
          <RecommendationHistoryItem :rec="historyData" v-if="isEditDialog" />
        </el-card>
      </el-col>
    </el-row>
    <!-- </el-tab-pane> -->
  </div>
</template>

<script>
/**
 * Multi Add Recommendation form.
 * @displayName Add Recommendation
 */
import { CHANGE_RECOMMENDATION } from "@/const/others.js";
import RecommendationHistoryItem from "./RecommendationHistoryItem";
import TextArea from "@/components/common/TextArea";
export default {
  data() {
    return {
      id: this.$route.query.patient_id,
      recForm: { recs: [{ description: "" }] },
      historyData: {}
    };
  },
  methods: {
    addDomain() {
      this.recForm.recs.push({
        description: ""
      });
    },

    // -------------- Category 2/2: Managing form submission ---------------------

    submitForm(formName) {
      const today = new Date().toISOString().split(".")[0];

      const vm = this;
      this.$refs[formName].validate(async valid => {
        if (valid) {
          if (this.type == CHANGE_RECOMMENDATION) {
            this.updateData[
              "recommendationDescription"
            ] = this.recForm.recs[0].description;
            this.updateData["recordChangedByUUID"] = this.userId;
            this.$store.dispatch("dbUpdateRecommendationInSM", {
              data: this.updateData,
              notify: this.$notify
            });
          } else {
            // Add
            let recList = [];
            // Get the latest priority
            let recommendationList = this.$store.state.recommendation
              .yourRecommendationsList;
            let lastPriority = 0;
            recommendationList.forEach(rec => {
              if (rec.priority > lastPriority) {
                lastPriority = rec.priority;
              }
            });
            this.recForm.recs.forEach(item => {
              recList.push({
                uuidOfRecommendationMadeFor: vm.id,
                recommendationDescription: item.description,
                priority: ++lastPriority,
                recordChangedByUUID: this.userId,
                recordChangedOnDateTime: today
              });
            });

            await this.$store.dispatch("dbAddRecommendationInSM", {
              data: recList,
              notify: this.$notify,
              patientId: this.id
            });
            await this.$store.dispatch("dbGetMyRecommendationsInSM", {
              patientId: this.id,
              notify: this.$notify,
              userId: this.$store.state.userId
            });
            this.recForm = { recs: [{ description: "" }] };
          }

          this.$store.dispatch("updateCurrentStateDisplayAreaRow");

          // this.$refs.description[0].resetChanges();
          this.$refs.description.forEach(textArea => {
            textArea.resetChanges();
          });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    focusToTheInputBox() {
      // console.log("focus to inputbox");
      // this.$refs.description[0].$el.getElementsByTagName("textarea")[0].focus();
      // this.$refs.input_box[0].$el.getElementsByTagName("textarea")[0].focus();
    },
    updateValidateChanges() {}
  },
  computed: {
    type() {
      return this.$store.state.multiTabDialogLayer2.recommendationTabType;
    },
    updateData() {
      return this.$store.state.multiTabDialogLayer2.recommendationData;
    },
    userId() {
      return this.$store.state.userId;
    },
    isEditDialog() {
      return this.type == CHANGE_RECOMMENDATION;
    },
    tabDialogVisibility() {
      return this.$store.state.multiTabDialogLayer2.visibility;
    }
  },
  mounted() {
    if (this.type == CHANGE_RECOMMENDATION) {
      this.recForm = {
        recs: [{ description: this.updateData.recommendationDescription }]
      };
      this.historyData = this.updateData;
    }
    setTimeout(() => {
      this.focusToTheInputBox();
    }, 100);
  },
  watch: {
    updateData() {
      this.recForm = {
        recs: [{ description: this.updateData.recommendationDescription }]
      };
      this.historyData = this.updateData;
    },
    tabDialogVisibility() {
      if (this.tabDialogVisibility) {
        this.$refs.description[0].focusToTextArea();
      }
    }
  },
  components: {
    RecommendationHistoryItem,
    TextArea
  }
};
</script>

<style lang="scss">
.changed .el-input__inner,
.changed .el-textarea__inner {
  border-color: #e6a23c;
}
</style>

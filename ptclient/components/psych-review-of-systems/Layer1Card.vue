 <template>
  <el-card
    class="box-card"
    :id="`psychReviewOfSystems-${typeOfStateDisplayArea}`"
    :style="typeOfStateDisplayAreaSpecificStyleToApply"
  >
    <div slot="header" class="clearfix">
      <CardHeader
        ctName="Psych review of systems"
        actions="M,F,R"
        ref="card_header"
        keyId="psych_review_of_systems"
        :typeOfStateDisplayArea="typeOfStateDisplayArea"
        @handleClickOnMInCardHeader="handleClickOnMInCardHeader"
        @handleClickOnFInCardHeader="handleClickOnFInCardHeader"
        :typeOfStateDisplayAreaSpecificStyleToApply="
          typeOfStateDisplayAreaSpecificStyleToApply
        "
      />
    </div>
    <el-tabs tab-position="left">
      <el-tab-pane label="ADHD">
        Good grooming and heigine
        <div style="text-align: right;">
          <el-button type="text" size="mini" @click="handleADHDChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>
      <el-tab-pane label="Anorexia">
        Lniear, logical and goal directed
        <div style="text-align: right;">
          <el-button type="text" size="mini" @click="handleAnorexiaChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Bulimia">
        Attitude
        <div style="text-align: right;">
          <el-button type="text" size="mini" @click="handleBulimiaChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Dementia">
        Constitutional
        <div style="text-align: right;">
          <el-button type="text" size="mini" @click="handleDementiaChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Depression">
        Psychomotor
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handleDepressionChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="GAD">
        Cognition
        <div style="text-align: right;">
          <el-button type="text" size="mini" @click="handleGADChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="HomicideAssessment">
        Eye-contact
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handleHomicideAssessmentChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Mania/Hypo mania">
        Insight
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handleManiaHypomaniaChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="OCD">
        Speech
        <div style="text-align: right;">
          <el-button type="text" size="mini" @click="handleOCDChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Panic Attacks">
        Judgement
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handlePanicAttacksChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Psychosis">
        Mood / affect
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handlePsychosisChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="PTSD">
        Impulse control
        <div style="text-align: right;">
          <el-button type="text" size="mini" @click="handlePTSDChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Sleep">
        Thought content
        <div style="text-align: right;">
          <el-button type="text" size="mini" @click="handleSleepChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Social anxiety">
        SocialAnxiety
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handleSocialAnxietyChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Subjective">
        Subjective
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handleSubjectiveChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Substance Use">
        Substance Use
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handleSubstanceUseChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Suicide Assessment">
        Suicide Assessment
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handleSuicideAssessmentChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>

      <el-tab-pane label="Gateway mood symptoms">
        Gateway mood symptoms
        <div style="text-align: right;">
          <el-button
            type="text"
            size="mini"
            @click="handleGatewayMoodSymptomsChangeButton"
            >Change</el-button
          >
        </div>
      </el-tab-pane>
    </el-tabs>
  </el-card>
</template>

<script>
import CardHeader from "@/components/common/CardHeader";
import { RECOMMENDATION_API_URL } from "@/const/others.js";
export default {
  components: {
    CardHeader
  },
  props: {
    typeOfStateDisplayArea: {
      type: String,
      default: "CurrentStateDisplayArea" // Other possible value: MultiStateDisplayArea For logic:Top of CardHeader.vue
    }
  },
  data() {
    return {
      selectedRows: [],
      columns: [
        {
          label: "Descrition",
          field: "recommendationDescription",
          sortable: true
        }
      ],
      patientId: this.$route.query.patient_id,
      userId: this.$store.state.userId
    };
  },
  methods: {
    handleClickOnMInCardHeader() {
      this.$store.commit("showMultiChangePROSTabInLayer2");
    },
    handleClickChangeButton() {
      this.$store.commit("showChangePROSElementTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleADHDChangeButton() {
      this.$store.commit("showChangePROSADHDTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleAnorexiaChangeButton() {
      this.$store.commit("showChangePROSAnorexiaTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleBulimiaChangeButton() {
      this.$store.commit("showChangePROSBulimiaTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleDementiaChangeButton() {
      this.$store.commit("showChangePROSDementiaTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleDepressionChangeButton() {
      this.$store.commit("showChangePROSDepressionTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleGADChangeButton() {
      this.$store.commit("showChangePROSGADTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleHomicideAssessmentChangeButton() {
      this.$store.commit("showChangePROSHomicideAssessmentTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleManiaHypomaniaChangeButton() {
      this.$store.commit("showChangePROSManiaHypomaniaTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleOCDChangeButton() {
      this.$store.commit("showChangePROSOCDTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handlePanicAttacksChangeButton() {
      this.$store.commit("showChangePROSPanicAttacksTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handlePsychosisChangeButton() {
      this.$store.commit("showChangePROSPsychosisTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handlePTSDChangeButton() {
      this.$store.commit("showChangePROSPTSDTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleSleepChangeButton() {
      this.$store.commit("showChangePROSSleepTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleSocialAnxietyChangeButton() {
      this.$store.commit("showChangePROSSocialAnxietyTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleSubjectiveChangeButton() {
      this.$store.commit("showChangePROSSubjectiveTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleSubstanceUseChangeButton() {
      this.$store.commit("showChangePROSSubstanceUseTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleSuicideAssessmentChangeButton() {
      this.$store.commit("showChangePROSSuicideAssessmentTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleGatewayMoodSymptomsChangeButton() {
      this.$store.commit("showChangePROSGatewayMoodSymptomsTabInLayer2", {
        label: this.label,
        type: this.type
      });
    },
    handleClickOnFInCardHeader() {
      //multiStateDisplayArea
      var options = {
        container: "",
        easing: "ease-in",
        offset: -60,
        force: true,
        cancelable: true,
        x: false,
        y: true
      };
      let element = "";
      if (this.typeOfStateDisplayArea == "CurrentStateDisplayArea") {
        element = "#recommendation-multiStateDisplayArea";
        options["container"] = "#multiStateDisplayArea";
      } else {
        element = "#recommendation-currentStateDisplayArea";
        options["container"] = "#currentStateDisplayArea";
      }

      this.$scrollTo(element, 500, options);
    },

    // -------------- Category 3/4: Functions to manage UI changes from data row ---------------------

    handleSelectionChange(value) {
      this.$refs.card_header.selected = value;
      this.selectedRows = value;
    },

    updateTableList(tableList) {
      this.$store.commit("setRecommendationTableList", tableList);
    },

    //-------------- Category 4/4: Functions to manage DB changes -----------------------

    async updatePriority(changedDatas) {
      const TOKEN = localStorage.getItem("token");

      const response = await fetch(`${RECOMMENDATION_API_URL}/updatePriority`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json;charset=utf-8",
          Authorization: "Bearer " + TOKEN
        },
        body: JSON.stringify(changedDatas)
      });
      if (!response.ok) {
        this.$notify({
          title: "Error",
          message: "Failed to update recommendation data"
        });
      } else {
        this.$notify({
          title: "Title",
          message: "Updated!"
        });
      }
    }
  },
  mounted() {
    // This is a lifecycle hook. Other lifecycle hooks are created, updated etc. Ref: https://vuejs.org/v2/api/#Options-Lifecycle-Hooks
    this.$store.dispatch("dbGetMultiStateMyRecommendationsInSM", {
      date: this.timeOfStateSelectedInHeader,
      patientId: this.patientId,
      userId: this.userId
    });
  },
  computed: {
    typeOfStateDisplayAreaSpecificStyleToApply: {
      get() {
        const timeOfStateDate = new Date(this.timeOfStateSelectedInHeader);
        const today = new Date();
        let isToday = false;
        if (
          timeOfStateDate.getFullYear() == today.getFullYear() &&
          timeOfStateDate.getMonth() == today.getMonth() &&
          timeOfStateDate.getDate() == today.getDate()
        ) {
          isToday = true;
        }

        let val = "";
        if (
          this.typeOfStateDisplayArea == "multiStateDisplayArea" &&
          !isToday
        ) {
          val =
            "background-image : url(http://api.thumbr.it/whitenoise-361x370.png?background=ffffffff&noise=5c5c5c&density=13&opacity=62);";
        }

        return val;
      },
      set(newValue) {
        this.doSomethingWith(newValue);
      }
    },
    timeOfStateSelectedInHeader() {
      return this.$store.state.multiStateDisplayArea
        .timeOfStateSelectedInHeader;
    }
  },
  watch: {
    timeOfStateSelectedInHeader() {
      const timeOfStateSelectedInHeader = this.timeOfStateSelectedInHeader.split(
        " "
      )[0];
      if (
        this.$store.state.recommendation.multiStateYourRecommendationsList[
          timeOfStateSelectedInHeader
        ] == null
      ) {
        const params = {
          date: this.timeOfStateSelectedInHeader,
          patientId: this.patientId,
          userId: this.userId
        };

        this.$store.dispatch("dbGetMultiStateMyRecommendationsInSM", params);
        this.$store.dispatch("dbGetMultiStateOtherRecommendationsInSM", params);
      }
    }
  }
};
</script>
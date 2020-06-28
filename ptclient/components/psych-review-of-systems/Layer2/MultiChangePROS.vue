<template>
  <div>
    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <Subjective></Subjective>
      </el-col>
      <el-col :span="12">
        <Dementia></Dementia>
      </el-col>
    </el-row>
    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <ADHD></ADHD>
      </el-col>
      <el-col :span="12">
        <SocialAnxiety></SocialAnxiety>
      </el-col>
    </el-row>

    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <Bulimia></Bulimia>
      </el-col>
      <el-col :span="12">
        <Depression></Depression>
      </el-col>
    </el-row>

    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <PTSD></PTSD>
      </el-col>
      <el-col :span="12">
        <HomicideAssessment></HomicideAssessment>
      </el-col>
    </el-row>
    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <Sleep></Sleep>
      </el-col>
      <el-col :span="12">
        <ManiaHypoMania></ManiaHypoMania>
      </el-col>
    </el-row>
    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <GatewayMoodSymptoms></GatewayMoodSymptoms>
      </el-col>
      <el-col :span="12">
        <OCD></OCD>
      </el-col>
    </el-row>
    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <Anorexia></Anorexia>
      </el-col>
      <el-col :span="12">
        <PanicAttacks></PanicAttacks>
      </el-col>
    </el-row>
    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <GAD></GAD>
      </el-col>
      <el-col :span="12">
        <SubstanceUse></SubstanceUse>
      </el-col>
    </el-row>
    <el-row :gutter="24" style="margin-top:10px">
      <el-col :span="12">
        <Psychosis></Psychosis>
      </el-col>
      <el-col :span="12">
        <SuicideAssessment></SuicideAssessment>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import ADHD from "@/components/patient/PsychReviewOfSystems/components/ADHD";
import Anorexia from "@/components/patient/PsychReviewOfSystems/components/Anorexia";
import Bulimia from "@/components/patient/PsychReviewOfSystems/components/Bulimia";
import Dementia from "@/components/patient/PsychReviewOfSystems/components/Dementia";
import Depression from "@/components/patient/PsychReviewOfSystems/components/Depression";
import GAD from "@/components/patient/PsychReviewOfSystems/components/GAD";
import GatewayMoodSymptoms from "@/components/patient/PsychReviewOfSystems/components/GatewayMoodSymptoms";
import HomicideAssessment from "@/components/patient/PsychReviewOfSystems/components/HomicideAssessment";
import ManiaHypoMania from "@/components/patient/PsychReviewOfSystems/components/ManiaHypoMania";
import OCD from "@/components/patient/PsychReviewOfSystems/components/OCD";
import PanicAttacks from "@/components/patient/PsychReviewOfSystems/components/PanicAttacks";
import Psychosis from "@/components/patient/PsychReviewOfSystems/components/Psychosis";
import PTSD from "@/components/patient/PsychReviewOfSystems/components/PTSD";
import Sleep from "@/components/patient/PsychReviewOfSystems/components/Sleep";
import SocialAnxiety from "@/components/patient/PsychReviewOfSystems/components/SocialAnxiety";
import Subjective from "@/components/patient/PsychReviewOfSystems/components/Subjective";
import SubstanceUse from "@/components/patient/PsychReviewOfSystems/components/SubstanceUse";
import SuicideAssessment from "@/components/patient/PsychReviewOfSystems/components/SuicideAssessment";

export default {
  data() {
    return {
      checkboxGroup4: ["Shanghai"],
      textarea: ""
    };
  },
  components: {
    ADHD,
    Anorexia,
    Bulimia,
    Dementia,
    Depression,
    GAD,
    GatewayMoodSymptoms,
    HomicideAssessment,
    ManiaHypoMania,
    OCD,
    PanicAttacks,
    Psychosis,
    PTSD,
    Sleep,
    SocialAnxiety,
    Subjective,
    SubstanceUse,
    SuicideAssessment
  },
  methods: {
    onClickSave(rec) {
      // Actions are triggered with the store.dispatch method Ref: https://vuex.vuejs.org/guide/actions.html#dispatching-actions
      this.$store.dispatch("dbUpdateRecommendationInSM", {
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
  width: 500px;
  min-width: 500px;
  min-height: 300px;
}
</style>
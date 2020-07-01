import {
  ADD_RECOMMENDATION,
  MULTIPLE_CHANGE_RECOMMENDATION,
  CHANGE_RECOMMENDATION,
  ADD_REMINDER,
  MULTIPLE_CHANGE_REMINDER,
  CHANGE_REMINDER,
  ADD_DIAGNOSIS,
  MULTIPLE_CHANGE_ASSESSMENT,
  CHANGE_DIAGNOSIS,
  ADD_SERVICE_STATEMENTS,
  MULTIPLE_CHANGE_SERVICE_STATEMENTS,
  ADD_GOAL,
  MULTIPLE_RATE_GOAL,
  RATE_GOAL,
  ADD_SCREEN,
  TAKE_A_SCREEN,
  RECOMMENDATION_DISCONTINUE_HISTORY,
} from "@/const/others.js";
export default {
  state: {
    visibility: false,
    tabList: [], // Template has a for loop running on this.
    recommendationTabType: "",
    recommendationData: null,
    reminderTabType: "",
    reminderData: null,
    goalTabType: "",
    goalData: null,
    tabValue: "",
    bmElementType: "",
    bmElement: null,
  },
  mutations: {
    setTabDialogVisibility(state, value) {
      state.visibility = value;
    },
    setRecommendationTabType(state, value) {
      state.recommendationTabType = value;
    },
    setRecommendationData(state, value) {
      state.recommendationData = value;
    },
    addNewTab(state, newTab) {
      const { name } = newTab;
      const checkArray = state.tabList.filter((tab) => {
        return tab.name == name;
      });
      if (checkArray.length == 0) {
        state.tabList.push(newTab);
      }
      state.tabValue = name;
    },
    setTabValue(state, value) {
      state.tabValue = value;
    },
    setTabList(state, value) {
      state.tabList = value;
    },
    setReminderTabType(state, value) {
      state.reminderTabType = value;
    },
    setReminderData(state, value) {
      state.reminderData = value;
    },
    showAddReminderTabInLayer2(state) {
      const tab = {
        label: "Add Reminders",
        value: require("@/components/patient/reminder/layer2/AddReminder.vue")
          .default,
        name: "tab-add-reminder",
      };
      state.tabList = [tab];
      state.reminderTabType = ADD_REMINDER;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showMultiChangeReminderTabInLayer2(state) {
      const tab = {
        label: "Multi change Reminders",
        value: require("@/components/patient/reminder/layer2/MultiChangeReminder.vue")
          .default,
        name: "tab-multi-change-reminder",
      };
      state.tabList = [tab];
      state.reminderTabType = MULTIPLE_CHANGE_REMINDER;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeReminderTabInLayer2(state, data) {
      const tab = {
        label: "Change Reminder",
        value: require("@/components/patient/reminder/layer2/AddReminder.vue")
          .default,
        name: "tab-change-reminder",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.reminderTabType = CHANGE_REMINDER;
      state.reminderData = data;
      state.tabValue = tab.name;
    },
    showAddRecommendationTabInLayer2(state) {
      const tab = {
        label: "Add Recommendations",
        value: require("@/components/patient/Recommendations/Layer2/AddRecommendation.vue")
          .default,
        name: "tab-add-recommendation",
      };
      // Once tablist is updated since it is reactive the src/views/Layer2MultiTabDialog.vue gets activated.
      state.tabList = [tab];
      state.recommendationTabType = ADD_RECOMMENDATION;
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showMultiChangeSocialHistoryTabInLayer2(state) {
      const tab = {
        label: "Change social history",
        value: require("@/components/patient/social-history/show-change-form-in-layer2-tab")
          .default,
        name: "tab-change-shx",
      };
      // Once tablist is updated since it is reactive the src/views/Layer2MultiTabDialog.vue gets activated.
      state.tabList = [tab];
      state.recommendationTabType = ADD_RECOMMENDATION;
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showMultiChangeRecommendationTabInLayer2(state) {
      const tab = {
        label: "Multi change Recommendations",
        value: require("@/components/patient/Recommendations/Layer2/MultiChangeRecommendation.vue")
          .default,
        name: "tab-multi-change-recommendation",
      };
      state.tabList = [tab];
      state.recommendationTabType = MULTIPLE_CHANGE_RECOMMENDATION;
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showMultiChangeMSETabInLayer2(state) {
      const tab = {
        label: "Multi change MSE",
        value: require("@/components/patient/MentalStatusExam/Layer2/MultiChangeMSE.vue")
          .default,
        name: "tab-multi-change-mse",
      };
      state.tabList = [tab];
      state.recommendationTabType = MULTIPLE_CHANGE_RECOMMENDATION;
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showChangeMSEAppearenceTabInLayer2(state) {
      const tab = {
        label: "Change Appearence (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Appearance.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showChangeMSEAttitudeTabInLayer2(state) {
      const tab = {
        label: "Change Attitude (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Attitude.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showChangeMSECognitionTabInLayer2(state) {
      const tab = {
        label: "Change Cognition (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Cognition.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEConstitutionalTabInLayer2(state) {
      const tab = {
        label: "Change Constitutional (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Constitutional.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEEyeContactTabInLayer2(state) {
      const tab = {
        label: "Change Eye Contact (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/EyeContact.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEImpulseControlTabInLayer2(state) {
      const tab = {
        label: "Change Impulse Control (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/ImpulseControl.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEInsightTabInLayer2(state) {
      const tab = {
        label: "Change Insight (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Insight.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEJudgementTabInLayer2(state) {
      const tab = {
        label: "Change Judgement (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Judgement.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEMoodAffectTabInLayer2(state) {
      const tab = {
        label: "Change Mood Affect (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/MoodAffect.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSENeurologicalTabInLayer2(state) {
      const tab = {
        label: "Change Neurological (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Neurological.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEPerceptionTabInLayer2(state) {
      const tab = {
        label: "Change Perception (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Perception.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEPsychomotorTabInLayer2(state) {
      const tab = {
        label: "Change Psychomotor (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Psychomotor.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEThoughtContentTabInLayer2(state) {
      const tab = {
        label: "Change Thought Content (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/ThoughtContent.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSEThoughtProcessTabInLayer2(state) {
      const tab = {
        label: "Change Thought Process (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/ThoughtProcess.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSESpeechTabInLayer2(state) {
      const tab = {
        label: "Change Speech (MSE)",
        value: require("@/components/patient/MentalStatusExam/components/Speech.vue")
          .default,
        name: "tab-change-mse",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showMultiChangePROSTabInLayer2(state) {
      const tab = {
        label: "Multi change PROS",
        value: require("@/components/patient/PsychReviewOfSystems/Layer2/MultiChangePROS.vue")
          .default,
        name: "tab-multi-change-pros",
      };
      state.tabList = [tab];
      state.recommendationTabType = MULTIPLE_CHANGE_RECOMMENDATION;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSADHDTabInLayer2(state) {
      const tab = {
        label: "Change ADHD (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/ADHD.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSAnorexiaTabInLayer2(state) {
      const tab = {
        label: "Change Anorexia (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/Anorexia.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSBulimiaTabInLayer2(state) {
      const tab = {
        label: "Change Bulimia (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/Bulimia.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSDementiaTabInLayer2(state) {
      const tab = {
        label: "Change Dementia (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/Dementia.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSDepressionTabInLayer2(state) {
      const tab = {
        label: "Change Depression (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/Depression.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSGADTabInLayer2(state) {
      const tab = {
        label: "Change GAD (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/GAD.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSGatewayMoodSymptomsTabInLayer2(state) {
      const tab = {
        label: "Change Gateway Mood Symptoms (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/GatewayMoodSymptoms.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSHomicideAssessmentTabInLayer2(state) {
      const tab = {
        label: "Change Homicide Assessment (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/HomicideAssessment.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSSubstanceUseTabInLayer2(state) {
      const tab = {
        label: "Change Substance use (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/SubstanceUse.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSManiaHypomaniaTabInLayer2(state) {
      const tab = {
        label: "Change Mania/Hypo Mania (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/ManiaHypoMania.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSOCDTabInLayer2(state) {
      const tab = {
        label: "Change OCD (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/OCD.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSPanicAttacksTabInLayer2(state) {
      const tab = {
        label: "Change Panic Attacks (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/PanicAttacks.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSPsychosisTabInLayer2(state) {
      const tab = {
        label: "Change Psychosis (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/Psychosis.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSPTSDTabInLayer2(state) {
      const tab = {
        label: "Change PTSD (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/PTSD.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSSleepTabInLayer2(state) {
      const tab = {
        label: "Change Sleep (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/Sleep.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSSocialAnxietyTabInLayer2(state) {
      const tab = {
        label: "Change Social Anxiety (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/SocialAnxiety.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangePROSSubjectiveTabInLayer2(state) {
      const tab = {
        label: "Change Subjective (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/Subjective.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    }, //SuicideAssessment
    showChangePROSSuicideAssessmentTabInLayer2(state) {
      const tab = {
        label: "Change Suicide Assessment (PROS)",
        value: require("@/components/patient/PsychReviewOfSystems/components/SuicideAssessment.vue")
          .default,
        name: "tab-change-pros",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showRecommendationDiscontinueHistoryTabInLayer2(state) {
      const tab = {
        label: "Recommendation Discontinue History",
        value: require("@/components/patient/Recommendations/Layer2/RecommendationDiscontinueHistory.vue")
          .default,
        name: "tab-recommendation-discontinue-history",
      };
      state.tabList = [tab];
      state.recommendationTabType = RECOMMENDATION_DISCONTINUE_HISTORY;
      state.visibility = true;
      state.tabValue = tab.name;
    },

    showChangeRecommendationsTabInLayer2(state, data) {
      const tab = {
        label: "Change Recommendation",
        value: require("@/components/patient/Recommendations/Layer2/AddRecommendation.vue")
          .default,
        name: "tab-change-recommendation",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.recommendationTabType = CHANGE_RECOMMENDATION;
      console.log(CHANGE_RECOMMENDATION);
      state.recommendationData = data;
      //console.log("===3" + JSON.stringify(data, null, 4));
      state.tabValue = tab.name;
    },
    showAddDiagnosisTabInLayer2(state) {
      const tab = {
        label: "Add Diagnosis",
        value: require("@/components/patient/diagnosis/layer2/AddDiagnosis.vue")
          .default,
        name: "tab-add-diagnosis",
      };
      state.tabList = [tab];
      state.diagnosisTabType = ADD_DIAGNOSIS;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showMultiChangeAssessmentTabInLayer2(state) {
      const tab = {
        label: "Multi change assessment diagnosis",
        value: require("@/components/patient/diagnosis/layer2/MultiChangeAssessment.vue")
          .default,
        name: "tab-multi-change-assessment",
      };
      state.tabList = [tab];
      state.diagnosisTabType = MULTIPLE_CHANGE_ASSESSMENT;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeDiagnosisTabInLayer2(state, data) {
      const tab = {
        label: "Change Diagnosis",
        value: require("@/components/patient/diagnosis/layer2/AddDiagnosis.vue")
          .default,
        name: "tab-change-diagnosis",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.diagnosisTabType = CHANGE_DIAGNOSIS;
      state.diagnosisData = data;
      state.tabValue = tab.name;
    },
    showAddServiceStatementsTabInLayer2(state) {
      const tab = {
        label: "Add service statements",
        value: require("@/components/patient/service-statements/AddServiceStatements.vue")
          .default,
        name: "tab-service-statements",
      };
      state.tabList = [tab];
      state.serviceStatementsTabType = ADD_SERVICE_STATEMENTS;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showMultiChangeServiceStatementsTabInLayer2(state) {
      const tab = {
        label: "Multi change service statements",
        value: require("@/components/patient/service-statements/MultiChangeServiceStatements.vue")
          .default,
        name: "tab-multi-change-service-statements",
      };
      state.tabList = [tab];
      state.serviceStatementsTabType = MULTIPLE_CHANGE_SERVICE_STATEMENTS;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showAddGoalTabInLayer2(state) {
      const tab = {
        label: "Add goal",
        value: require("@/components/patient/goal/layer2/AddGoal.vue").default,
        name: "tab-add-goal",
      };
      state.tabList = [tab];
      state.goalTabType = ADD_GOAL;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showMultiChangeGoalTabInLayer2(state) {
      const tab = {
        label: "Multi rate goal",
        value: require("@/components/patient/goal/layer2/MultiChangeGoal.vue")
          .default,
        name: "tab-multi-change-goal",
      };
      state.tabList = [tab];
      state.goalTabType = MULTIPLE_RATE_GOAL;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeGoalsTabInLayer2(state, data) {
      const tab = {
        label: "Rate goal",
        value: require("@/components/patient/goal/layer2/RateGoal.vue").default,
        name: "tab-rate-goal",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.goalTabType = RATE_GOAL;
      state.goalData = data;
      state.tabValue = tab.name;
    },
    showAddScreenTabInLayer2(state) {
      const tab = {
        label: "Add screen",
        value: require("@/components/patient/Screening/Layer2/AddScreen.vue")
          .default,

        name: "tab-add-screen",
      };
      state.tabList = [tab];
      state.screeningTabType = ADD_SCREEN;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showTakeAScreenTabInLayer2(state, data) {
      let screenName = data.scientificName.toUpperCase();
      let componentName = "Take" + screenName + "Screen";
      const tab = {
        label: "Take " + screenName + " screen",
        value: require("@/components/patient/Screening/components/" +
          componentName +
          ".vue").default,
        name: "tab-take-a-s-screen",
      };
      state.tabList = [tab];
      state.screeningTabType = TAKE_A_SCREEN;
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showAddBMElementTabInLayer2(state, params) {
      const { type, label } = params;
      const tab = {
        label: `Change ${label}`,
        value: require("@/components/patient/BodyMeasurements/Layer2/UpdateBMElement.vue")
          .default,
        name: "tab-change-bm-element",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.bmElementType = type;
      state.tabValue = tab.name;
    },
    showGraphBMElementTabInLayer2(state, params) {
      state.bmElement = params;
      const tab = {
        label: `Graph of ${params.label}`,
        value: require("@/components/patient/BodyMeasurements/Layer2/GraphBMElement.vue")
          .default,
        name: "tab-graph-bm-element",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showGraphAllBMTabInLayer2(state) {
      const tab = {
        label: `Body Measurement Graph`,
        value: require("@/components/patient/BodyMeasurements/Layer2/GraphBMAll.vue")
          .default,
        name: "tab-graph-bm-all",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showUpdateAllBMElementTabInLayer2(state) {
      const tab = {
        label: `Change Body Measurement`,
        value: require("@/components/patient/BodyMeasurements/Layer2/ChangeAllBMElement.vue")
          .default,
        name: "tab-change-all-bm-element",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
    showChangeMSETabInLayer2(state) {
      const tab = {
        label: "Change Mental Status Exam",
        value: require("@/components/patient/MentalStatusExam/Layer2/ChangeMSE.vue")
          .default,
        name: "tab-change-mental-status-exam",
      };
      state.tabList = [tab];
      state.visibility = true;
      state.tabValue = tab.name;
    },
  },
};

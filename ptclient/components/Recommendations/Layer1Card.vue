// Component type 1/2: Card
// -------------- Category 1/4: User interface of card component ---------------------

<!-- For architrecture read core 3 at Home.vue -->
<template>
  <!-- typeOfStateDisplayArea is currentStateDisplayArea or multiStateDisplayArea Ref: patientFile.vue header -->

  <!-- 
       https://stackoverflow.com/questions/54366269/how-to-properly-apply-ternary-operator-in-v-model-in-vue-js  
       https://stackoverflow.com/questions/49493882/escaping-double-quotes-in-vue-js
  -->
  <el-card
    class="box-card"
    :id="`recommendation-${typeOfStateDisplayArea}`"
    :style="cfmultiStateDisplayAreaStyleToApplyForPastTime"
  >
    <div slot="header" class="clearfix">
      <CtCardHeader
        ctName="Recommendation"
        actions="A,M,F,D,X,R"
        ref="card_header"
        keyId="recommendation"
        :typeOfStateDisplayArea="typeOfStateDisplayArea"
        @handleClickOnAInCardHeader="handleClickOnAInCardHeader"
        @handleClickOnMInCardHeader="handleClickOnMInCardHeader"
        @handleClickOnFInCardHeader="handleClickOnFInCardHeader"
        @handleClickOnDInCardHeader="handleClickOnDInCardHeader"
        @handleClickOnXInCardHeader="handleClickOnXInCardHeader"
        :multiStateDisplayAreaStyleToApplyForPastTime="
          cfmultiStateDisplayAreaStyleToApplyForPastTime
        "
      />
    </div>
    <CtDataTableWithoutTab
      :tabData="cfTabData"
      ctName="Recommendation"
      keyId="recommendation"
      :typeOfStateDisplayArea="typeOfStateDisplayArea"
      @handleSelectionChange="handleSelectionChange"
      @handleClickOnCInDataRow="handleClickOnCInDataRow"
      @handleClickOnDInDataRow="handleClickOnDInDataRow"
      @updatePriority="updatePriority"
      @updateTableList="updateTableList"
      :selectedColumns="selectedColumns"
      :columns="columns"
      :multiStateDisplayAreaStyleToApplyForPastTime="
        cfmultiStateDisplayAreaStyleToApplyForPastTime
      "
    />
    <!-- TODO: Not clear what updateTableList does -->
  </el-card>
</template>

<script>
// 1. remove selected column feature
// 2. Need to send a better name for column to display

import CtCardHeader from "@/components/common/CardHeader";
import CtDataTableWithoutTab from "@/components/common/DataTableWithoutTab";
import { RECOMMENDATION_API_URL } from "@/const/others.js";
import ormRecommendation from "./vuex-orm-models/recommendation";

export default {
  components: {
    CtCardHeader,
    CtDataTableWithoutTab
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
      userId: this.$store.state.userId,
      selectedColumns: ["recommendationDescription"] // The user can select there own columns. The user selected columns are saved in the local storage.
    };
  },
  methods: {
    // -------------- Category 2/4: Functions to manage UI changes from Card Header ---------------------

    handleClickOnAInCardHeader() {
      /* 
          Ref: https://vuex.vuejs.org/guide/mutations.html
          The only way to actually change state in a Vuex store is by committing a mutation. 
          Vuex mutations are very similar to events: each mutation has a string type and a handler. 
          The handler function is 
            1. Where we perform actual state modifications, 
            2. Where we will receive the state as the first argument.

          The following line invokes the code in: vue-client/src/store/modules/Layer2MultiTabDialogState.js#L80  

          QUESTION: How is multiTabDialogLayer2 getting this event.

          Due to using a single state tree, all state of our application is contained inside one big object. However, as our application grows in scale, the store can get really bloated.
          To help with that, Vuex allows us to divide our store into modules. Each module can contain its own state, mutations, actions, getters, and even nested modules
          Ref: https://vuex.vuejs.org/guide/modules.html

          showAddRecommendationTabInLayer2 is a mutation inside module -> Layer2MultiTabDialogState.js but it can be called from here.

      */
      this.$store.commit("showAddRecommendationTabInLayer2");
    },

    handleClickOnMInCardHeader() {
      this.$store.commit("showMultiChangeRecommendationTabInLayer2");
    },

    handleClickOnXInCardHeader() {
      -this.$store.commit("showRecommendationDiscontinueHistoryTabInLayer2");
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

    handleClickOnCInDataRow(data) {
      this.$store.commit("showChangeRecommendationsTabInLayer2", data);
    },

    handleSelectionChange(value) {
      this.$refs.card_header.selected = value;
      this.selectedRows = value;
    },

    updateTableList(tableList) {
      this.$store.commit("setRecommendationTableList", tableList);
    },

    //-------------- Category 4/4: Functions to manage DB changes -----------------------

    handleClickOnDInCardHeader() {
      let selectedIds = [];
      this.selectedRows.forEach(item => {
        selectedIds.push(item.id);
      });
      this.$store.dispatch("dbMultiDiscontinueRecommendationsInSM", {
        selectedIds: selectedIds,
        notify: this.$notify,
        selectedDatas: this.selectedRows
      });
    },

    handleClickOnDInDataRow(data) {
      this.$store.dispatch("dbDiscontinueRecommendationInSM", {
        data: data,
        notify: this.$notify
      });
    },

    // TODO: Rename this to handleUpdatePriority()
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
    /* Get data for vuex-orm  */
    this.$store.dispatch("dbGetMyRecommendationsInSM", {
      date: this.$store.state.multiStateDisplayArea.timeOfStateSelectedInHeader,
      patientId: this.patientId,
      userId: this.userId
    });
  },

  computed: {
    cfTabData() {
      let timeStampOfStateInsideCt = null;
      if (
        this.$store.state.multiStateDisplayArea.timeOfStateSelectedInHeader ===
          "2038-01-19 03:14:07.999999" ||
        this.typeOfStateDisplayArea == "CurrentStateDisplayArea"
      ) {
        console.log("recasting to current time");
        timeStampOfStateInsideCt = Math.round(new Date().getTime() / 1000);
      } else
        timeStampOfStateInsideCt = Math.round(
          new Date(
            this.$store.state.multiStateDisplayArea.timeOfStateSelectedInHeader
          ).getTime() / 1000
        );

      const rexEvalList = ormRecommendation
        .query()
        .where("ROW_START", value => value < timeStampOfStateInsideCt)
        .where("ROW_END", value => value > timeStampOfStateInsideCt)
        .orderBy("uuid")
        .orderBy("ROW_START", "desc")
        .get();

      console.log(
        "length after order by === ",
        timeStampOfStateInsideCt,
        rexEvalList.length
      );
      return {
        label: "Yours",
        tableData: rexEvalList,
        rowActions: ["C", "D"],
        selectedColumn: ["recommendationDescription"]
      };
    },

    cfmultiStateDisplayAreaStyleToApplyForPastTime: {
      get() {
        let val = null;

        if (
          this.$store.state.multiStateDisplayArea
            .timeOfStateSelectedInHeader === "2038-01-19 03:14:07.999999" ||
          this.typeOfStateDisplayArea == "CurrentStateDisplayArea"
        ) {
          val = null;
        } else
          val =
            "background-image : url(http://api.thumbr.it/whitenoise-361x370.png?background=ffffffff&noise=5c5c5c&density=13&opacity=62);";

        return val;
      }
    }
  }
};
</script>
<template>
  <div v-if="histories.length > 0">
    <el-row>
      <span style="font-size: 14px;">History:</span>
    </el-row>
    <br />
    <el-row :gutter="12">
      <div class="block">
        <el-timeline>
          <el-timeline-item
            v-for="(history, index) in histories"
            :key="`history-${index}`"
            type="primary"
            size="large"
            :timestamp="new Date(history.ROW_START).toLocaleString()"
            >{{ history.recommendationDescription }}</el-timeline-item
          >
        </el-timeline>
        <el-pagination
          small
          layout="prev, pager, next"
          :page-size="5"
          :total="totalCount"
          v-if="totalCount > 5"
        ></el-pagination>
      </div>
    </el-row>
  </div>
</template>

<script>
import ormRecommendation from "../vuex-orm-models/recommendation";

export default {
  props: ["rec"],
  data() {
    return {
      histories: []
    };
  },
  mounted() {
    this.histories = ormRecommendation
      .query()
      .where("uuid", this.rec.uuid)
      .get();

    console.log(this.histories);
  },
  methods: {},
  watch: {
    rec() {
      if (this.rec.uuid != null) {
        this.getHistory();
      }
    }
  },
  computed: {
    totalCount() {
      return this.histories.length;
    }
  }
};
</script>

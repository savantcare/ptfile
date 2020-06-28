<template>
  <div v-if="history.length > 0">
    <el-row>
      <span style="font-size: 14px;">History:</span>
    </el-row>
    <br />
    <el-row :gutter="12">
      <div class="block">
        <el-timeline>
          <el-timeline-item
            v-for="(history, index) in pageHistory"
            :key="`history-${index}`"
            type="primary"
            size="large"
            :timestamp="history.detail"
            >{{ history.content }}</el-timeline-item
          >
        </el-timeline>
      </div>
    </el-row>
    <el-pagination
      small
      layout="prev, pager, next"
      :page-size="5"
      :total="history.length"
      :current-page.sync="currentPage"
      hide-on-single-page
    ></el-pagination>
  </div>
</template>

<script>
export default {
  props: ["rec"],
  data() {
    return {
      history: [],
      currentPage: 0
    };
  },
  computed: {
    pageHistory() {
      let result = [];
      for (var i = (this.currentPage - 1) * 5; i < this.currentPage * 5; i++) {
        if (this.history[i] != null) {
          result.push(this.history[i]);
        }
      }
      return result;
    }
  },
  mounted() {
    this.history = this.rec.history;
    // this.currentPage = this.rec.currentPage;
  }
};
</script>

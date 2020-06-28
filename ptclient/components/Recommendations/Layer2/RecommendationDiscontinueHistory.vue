<template>
  <el-row :gutter="12">
    <el-carousel :interval="5000" arrow="always" :autoplay="false">
      <el-carousel-item v-for="(recList, index) in carouselList" :key="`carouse-${index}`">
        <el-col :span="8" v-for="(rec, index) in recList" :key="`rec-${index}`">
          <el-card class="box-card" shadow="hover">
            <el-form label-position="top" ref="form">
              <el-form-item style="font-weight: bold" :label="rec.detail">
                <el-input
                  :span="8"
                  type="textarea"
                  v-model="rec.content"
                  :autosize="{minRows:4}"
                  autofocus
                  ref="input_box"
                  disabled
                ></el-input>
              </el-form-item>
            </el-form>
            <RecommendationDiscontinueHistoryItem :rec="rec" />
          </el-card>
        </el-col>
      </el-carousel-item>
    </el-carousel>
  </el-row>
</template>

<script>
import { RECOMMENDATION_API_URL } from "@/const/others.js";
import RecommendationDiscontinueHistoryItem from "./RecommendationDiscontinueHistoryItem";
export default {
  components: { RecommendationDiscontinueHistoryItem },
  data() {
    return {
      recList: []
    };
  },
  methods: {
    async getDiscontinueHistory() {
      const TOKEN = localStorage.getItem("token");
      const response = await fetch(
        `${RECOMMENDATION_API_URL}/discontinueHistory`,
        {
          headers: {
            Authorization: "Bearer " + TOKEN
          }
        }
      );
      if (response.ok) {
        const json = await response.json();
        this.recList = json;
      }
    }
  },
  computed: {
    carouselList() {
      let result = [];
      let temp = [];
      let idx = 0;
      this.recList.forEach(item => {
        let data = item;
        data["currentPage"] = 1;
        temp.push(data);
        idx += 1;
        if (idx == 3) {
          result.push(temp);
          idx = 0;
          temp = [];
        }
      });
      if (idx > 0) {
        result.push(temp);
      }
      console.log(result);
      return result;
    }
  },
  mounted() {
    this.getDiscontinueHistory();
  },
  watch: {}
};
</script>

<style>
.el-carousel__container {
  height: 500px !important;
}
.el-carousel__item {
  overflow-y: scroll !important;
}
</style>
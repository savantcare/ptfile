<template>
  <el-row :gutter="12">
    <el-carousel :interval="5000" arrow="always" :autoplay="false">
      <el-carousel-item
        v-for="(goalList, index) in carouselList"
        :key="`carouse-${index}`"
      >
        <el-col
          :span="8"
          v-for="(goal, index) in goalList"
          :key="`goal-${index}`"
        >
          <el-card class="box-card" shadow="hover">
            <el-form label-position="top" ref="form">
              <el-form-item style="font-weight: bold;" label="Description:">
                <el-input
                  :span="8"
                  v-model="goal.description"
                  type="textarea"
                  :disabled="true"
                ></el-input>
              </el-form-item>
              <el-form-item style="font-weight: bold;" label="Score:">
                <el-slider
                  :span="8"
                  v-model="goal.score"
                  :format-tooltip="formatTooltip"
                  show-input
                  :max="10"
                  show-stops
                ></el-slider>
              </el-form-item>
              <el-form-item style="font-weight: bold;" label="Date:">
                <el-date-picker
                  :span="8"
                  v-model="goal.startDate"
                  type="date"
                  placeholder="Pick a day"
                  :picker-options="pickerOptions"
                  style="width: 100%;"
                ></el-date-picker>
              </el-form-item>

              <el-form-item>
                <el-button
                  type="success"
                  @click="onClickSave(goal)"
                  size="small"
                  >Save</el-button
                >
                <el-button
                  type="danger"
                  @click="onClickDiscontinue(goal)"
                  size="small"
                  >Discontinue</el-button
                >
              </el-form-item>
            </el-form>
            <GoalHistoryItem :goal="goal" />
          </el-card>
        </el-col>
      </el-carousel-item>
    </el-carousel>
  </el-row>
</template>

<script>
import GoalHistoryItem from './GoalHistoryItem'
import { GOAL_API_URL } from '@/static/others.js'
import ormGoal from '@/models/Goal'
export default {
  components: {
    GoalHistoryItem,
  },
  data() {
    return {
      daGTableForL2: ormGoal.query().get(),
      pickerOptions: {
        shortcuts: [
          {
            text: 'Today',
            onClick(picker) {
              picker.$emit('pick', new Date())
            },
          },
          {
            text: 'Yesterday',
            onClick(picker) {
              const date = new Date()
              date.setTime(date.getTime() - 3600 * 1000 * 24)
              picker.$emit('pick', date)
            },
          },
          {
            text: 'A week ago',
            onClick(picker) {
              const date = new Date()
              date.setTime(date.getTime() - 3600 * 1000 * 24 * 7)
              picker.$emit('pick', date)
            },
          },
        ],
      },
    }
  },
  methods: {
    async onClickSave(goal) {
      try {
        const response = await fetch(`${GOAL_API_URL}/${goal.uuid}`, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            // "Authorization": "Bearer " + TOKEN
          },
          body: JSON.stringify(goal),
        })
        if (!response.ok) {
          console.log('Failed to update')
        } else {
          console.log('update success')
        }
      } catch (ex) {}
    },
    async onClickDiscontinue(goal) {
      try {
        goal['discontinue'] = true
        const response = await fetch(`${GOAL_API_URL}/${goal.uuid}`, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json;charset=utf-8',
            // Authorization: 'Bearer ' + TOKEN,
          },
          body: JSON.stringify(goal),
        })
        if (!response.ok) {
          console.log('Failed to discontinue')
        } else {
          console.log('Discontinued successfull')
        }
      } catch (ex) {}
    },
    formatTooltip(val) {
      return val
    },
  },
  computed: {
    carouselList() {
      const result = []
      let temp = []
      let idx = 0
      this.daGTableForL2.forEach((item) => {
        temp.push(item)
        idx += 1
        if (idx === 3) {
          result.push(temp)
          idx = 0
          temp = []
        }
      })
      if (idx > 0) {
        result.push(temp)
      }
      return result
    },
  },
}
</script>

<style>
.el-carousel__container {
  height: 500px !important;
}
.el-carousel__item {
  overflow-y: scroll !important;
}
label.el-form-item__label {
  line-height: 0;
}
</style>

<!--
The tree structure is:

Carausel                           |
  -- Carausel item                 |   These are the slides
    -- Cards                       |   Each card is a reminder

-->
<template>
  <div class="block">
    <el-carousel
      arrow="always"
      trigger="click"
      @change="slideChanged"
      autoplay="false"
    >
      <el-carousel-item v-for="slide in getNumOfCarouselSlides">
        <el-row type="flex">
          <el-card v-for="remID in getArrayOfRemIDsToShowInThisCard">
            <changeRem :firstParam="remID"></changeRem>{{ remID }}
          </el-card>
        </el-row>
      </el-carousel-item>
    </el-carousel>
  </div>
</template>
<script>
import ormRem from '@/cts/rem/vuex-orm/model.js'
import changeRem from '@/cts/rem/cl/c.vue'
export default {
  components: { changeRem },
  data() {
    return {
      daUniqueIDOfEachRowFromORM: [],
      diCurrentSlideNumber: 1,
    }
  },
  computed: {
    getArrayOfRemIDsToShowInThisCard() {
      const firstCard = (this.diCurrentSlideNumber - 1) * 3
      console.log('First rem card', firstCard)
      const arr = this.daUniqueIDOfEachRowFromORM.slice(
        firstCard,
        firstCard + 3
      )
      return arr
    },
    getNumOfCarouselSlides() {
      const count = this.daUniqueIDOfEachRowFromORM.length / 3
      const intValue = Math.floor(count)
      console.log('number of items in carousel are', count, intValue)
      if (count === 0) {
        return 1
      } else {
        return intValue
      }
    },
  },
  methods: {
    slideChanged(val) {
      console.log('slide changed', val)
      this.diCurrentSlideNumber = val
    },
  },
  mounted() {
    console.log('In mounted function')
    const resultArFromORM = ormRem.query().get()
    if (resultArFromORM.length) {
      for (let i = 0; i < resultArFromORM.length; i++) {
        this.daUniqueIDOfEachRowFromORM.push(resultArFromORM[i].$id)
      }
    }
    console.log(this.daUniqueIDOfEachRowFromORM)
  },
}
</script>
